# frozen_string_literal: true

module BridgeBankin
  class BridgeObject
    HIDDEN_ATTRIBUTES = %i[resource_type resource_uri].freeze

    def initialize(**attrs)
      define_instance_variables(attrs)
    end

    class << self
      def convert_to_bridge_object(**data)
        if data[:resources]
          data[:resources].map { |resource| convert_to_bridge_object(resource) }
        elsif data.is_a?(Array)
          data.map { |val| convert_to_bridge_object(val) }
        else
          object_from_resource_type(data)
        end
      end

      private

      def object_classes
        @object_classes ||= ObjectTypes.resource_types_to_classes
      end

      def object_from_resource_type(data)
        object_classes.fetch(data[:resource_type], BridgeObject).new(data)
      end
    end

    def to_hash
      instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete("@")] =
          case instance_variable_get(var)
          when BridgeObject
            instance_variable_get(var).to_hash
          when Array
            instance_variable_get(var).map { |val| val.is_a?(BridgeObject) ? val.to_hash : val }
          else
            instance_variable_get(var)
          end
      end.transform_keys!(&:to_sym)
    end

    def to_json(*_args)
      to_hash.to_json
    end

    def ==(other)
      other.is_a?(BridgeObject) && to_hash == other.to_hash
    end

    private

    def define_instance_variables(attrs)
      attrs.each do |key, value|
        next if HIDDEN_ATTRIBUTES.include?(key)

        handle_values_types(key, value) do |parsed_value|
          instance_variable_set("@#{key}".to_sym, parsed_value)
          self.class.class_eval { attr_reader key }
        end
      end
    end

    def handle_values_types(key, value)
      yield(
        case value
        when Array
          handle_array_values(value)
        when Hash
          handle_hash_values(value)
        when String
          handle_time_values(key, value)
        else
          value
        end
      )
    end

    def handle_array_values(array)
      array.map do |value|
        next value unless value.is_a?(Hash)

        handle_hash_values(value)
      end
    end

    def handle_hash_values(hash)
      self.class.convert_to_bridge_object(hash)
    end

    def handle_time_values(key, value)
      if key == :date
        Date.parse(value)
      elsif key.to_s.match?(/_at$/)
        Time.parse(value)
      else
        value
      end
    end
  end
end
