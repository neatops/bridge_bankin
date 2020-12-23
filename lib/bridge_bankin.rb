# frozen_string_literal: true

# Configurations
require "bridge_bankin/configuration"
require "bridge_bankin/version"

# API
require "bridge_bankin/api/client"
require "bridge_bankin/api/resource"

require "bridge_bankin/bridge_object"
require "bridge_bankin/object_types"

# Resources
require "bridge_bankin/authorization"
require "bridge_bankin/account"
require "bridge_bankin/category"
require "bridge_bankin/stock"
require "bridge_bankin/bank"
require "bridge_bankin/user"
require "bridge_bankin/connect"
require "bridge_bankin/item"
require "bridge_bankin/transaction"
require "bridge_bankin/transfer"
require "bridge_bankin/insight"

module BridgeBankin
end
