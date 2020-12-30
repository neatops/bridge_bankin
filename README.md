<p align="center">
  <img width="500" src="https://user-images.githubusercontent.com/112219/103307983-5fe04500-49df-11eb-9618-1f9704b2f460.png" alt="Bankin Bridge Logo">
</p>

<p align="center">
  <a href="https://badge.fury.io/rb/bridge_bankin">
    <img src="https://badge.fury.io/rb/bridge_bankin.svg" alt="Gem Version">
  </a>
  <a href="https://github.com/neatops/bridge_bankin/actions?query=workflow%3ACI">
    <img src="https://github.com/neatops/bridge_bankin/workflows/CI/badge.svg" alt="CI Status">
  </a>
  <a href="https://github.com/neatops/bridge_bankin/actions?query=workflow%3ARuboCop">
    <img src="https://github.com/neatops/bridge_bankin/workflows/RuboCop/badge.svg" alt="Rubocop Status">
  </a>
  <a href="https://rubydoc.info/github/neatops/bridge_bankin/main">
    <img src="https://img.shields.io/badge/yard-docs-blue.svg" alt="RubyDoc Link">
  </a>
</p>

<br />

This gem is an **unofficial Ruby client** that consumes the [Bridge by Bankin’ API](https://bridgeapi.io/).

Thanks to a safe and automated access to bank data, Bridge powered by Bankin’ provides
competitive and smart solutions to build conversion-driver financial services.

You'll find more information about Bridge API in the [official documentations](https://docs.bridgeapi.io/).

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'bridge_bankin'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bridge_bankin

## Usage

### Requirements

To begin using the API with this gem, you need to create an account to the dashboard on the [Bridge website](https://dashboard.bridgeapi.io/signup).
Then you’ll have to create a new `application` and generate the required API credentials: a `client_id` and `client_secret`.
You can find more information about this process by visiting the [Bridge API Dashboard documentation](https://docs.bridgeapi.io/docs/dashboard).

### Getting started

One you have your valid API credential you can now create an initializer in your app like this:

```ruby
BridgeBankin.configure do |config|
  config.api_client_id = ENV["BRIDGE_API_CLIENT_ID"]
  config.api_client_secret = ENV["BRIDGE_API_CLIENT_SECRET"]
end
```

Feel free to replace those environment variables by whatever values that work for you.

Some resources are public (banks and categories) meaning that only provided the `client_id` and `client_secret` are required.
Here is an example on how you can use this gem to fetch the banks:

```ruby
BridgeBankin::Bank.list
=> [#<BridgeBankin::BridgeObject:0x00007fbb0727c620
  @country_code="DE",
  @parent_banks=
   [#<BridgeBankin::BridgeObject:0x00007fbb0727c148
     @banks=
      [#<BridgeBankin::Bank:0x00007fbad702f6b8
        @authentication_type="INTERNAL_CREDS",
        @automatic_refresh=true,
        @capabilities=["ais"],
        @country_code="DE",
        @deeplink_android=nil,
        @deeplink_ios=nil,
        @form=[#<BridgeBankin::BridgeObject:0x00007fbad702cf30 @isNum="0", @label="Email", @maxLength=nil, @type="USER">, #<BridgeBankin::BridgeObject:0x00007fbad702c648 @isNum="0", @label="Password", @maxLength=nil, @type="PWD">],
        @id=457,
        @logo_url="https://web.bankin.com/img/banks-logo/neo/04N26@2x.png",
        @name="N26 (Number 26) DE",
        @payment_enabled=false,
        @primary_color=nil,
        @secondary_color=nil,
        @transfer_enabled=false>],
     @display_order=0,
     @is_highlighted=false,
     @logo_url="https://web.bankin.com/img/banks-logo/neo/04N26@2x.png",
     @name="N26 (Number 26) DE">,
     ...]
   ...]
 ...]
```

But the majority of the resources need a logged in user. Here is how to create one using the gem:

```ruby
BridgeBankin::User.create(email: "john.doe@email.com", password: "password123!")
=> #<BridgeBankin::User:0x00007fbb07c5e990 @email="john.doe@email.com", @uuid="f974389d-1442-48bb-bb5e-ac62d1a96984">
```

Then you can generate an `access_token` for this user by using the `Authorization` class:

```ruby
BridgeBankin::Authorization.generate_token(email: "john.doe@email.com", password: "password123!")
=> #<BridgeBankin::Authorization:0x00007fbb07967f48 @access_token="58b0195d943f9a3e8433cda7dea48a70339eafc6-5fe7c375-873b-4b0d-bcff-4541c1e19488", @expires_at=2020-12-29 21:35:28.97 UTC>
```

Since the majority of endpoints are private, you’ll need to pass a valid `access_token` each time you request them.
Here is how it works with the user we previously created:

```ruby
BridgeBankin::Transaction.list(access_token: auth.access_token)
=> [#<BridgeBankin::Transaction:0x00007fbb0002d948
  @account=#<BridgeBankin::Account:0x00007fbb0002c250 @id=22271302>,
  @amount=-676.0,
  @category=#<BridgeBankin::Category:0x00007fbb0002c520 @id=79>,
  @currency_code="EUR",
  @date=#<Date: 2021-01-02 ((2459217j,0s,0n),+0s,2299161j)>,
  @description="Achat De Titres",
  @id=38000214608599,
  @is_deleted=false,
  @is_future=true,
  @raw_description="ACHAT DE TITRES - 020121",
  @show_client_side=true,
  @updated_at=2020-12-29 19:40:50.942 UTC>,
 #<BridgeBankin::Transaction:0x00007fbb00023da8
  @account=#<BridgeBankin::Account:0x00007fbb000229f8 @id=22271298>,
  @amount=170.0,
  @category=#<BridgeBankin::Category:0x00007fbb00022c50 @id=289>,
  @currency_code="EUR",
  @date=#<Date: 2021-01-02 ((2459217j,0s,0n),+0s,2299161j)>,
  @description="Economies",
  @id=38000214608462,
  @is_deleted=false,
  @is_future=true,
  @raw_description="Economies - 020121",
  @show_client_side=true,
  @updated_at=2020-12-29 19:40:49.564 UTC>,
  ...
]
```

If you need more information on how the API works or which parameters you can use for a specific query, we really encourage you to consult the great [official guides](https://docs.bridgeapi.io/docs).

### Parameters

##### Mandatory parameters

In some case you'll need to specify some parameters to complete your request.
For instance, in order to retrieve a specific `user`, it requires you to pass the user's `UUID`:

```ruby
BridgeBankin::User.find(uuid: "f974389d-1442-48bb-bb5e-ac62d1a96984")
=> #<BridgeBankin::User:0x00007fbb07febf90 @email="john.doe@email.com", @uuid="f974389d-1442-48bb-bb5e-ac62d1a96984">
```

Note that in some case, the API uses basic sequential `IDs` instead of `UUIDs`. In that case just replace `uuid` key by `id`:

```ruby
BridgeBankin::Bank.find(id: 457)
=> #<BridgeBankin::Bank:0x00007fbb07ec64d0
 @authentication_type="INTERNAL_CREDS",
 @automatic_refresh=true,
 @capabilities=["ais"],
 @country_code="DE",
 @deeplink_android=nil,
 @deeplink_ios=nil,
 @form=[#<BridgeBankin::BridgeObject:0x00007fbb07ec5968 @isNum="0", @label="Email", @maxLength=nil, @type="USER">, #<BridgeBankin::BridgeObject:0x00007fbb07ec54b8 @isNum="0", @label="Password", @maxLength=nil, @type="PWD">],
 @id=457,
 @logo_url="https://web.bankin.com/img/banks-logo/neo/04N26@2x.png",
 @name="N26 (Number 26) DE",
 @payment_enabled=false,
 @primary_color=nil,
 @secondary_color=nil,
 @transfer_enabled=false>
```

##### Optional parameters

The gem resources also allows you to pass any optional parameters supported by the API (see [Official Documentation](https://docs.bridgeapi.io/docs/overview)).
To do so, just pass them as `named parameters` in corresponding resource class method:

```ruby
BridgeBankin::Bank.list(limit: 1)
=> [#<BridgeBankin::BridgeObject:0x00007fbb07b4c228
  @country_code="FR",
  @parent_banks=
   [#<BridgeBankin::BridgeObject:0x00007fbb07b4c070
     @banks=
      [#<BridgeBankin::Bank:0x00007fbb07b27d38
        @authentication_type="INTERNAL_CREDS",
        @automatic_refresh=true,
        @capabilities=["ais"],
        @country_code="FR",
        @deeplink_android=nil,
        @deeplink_ios=nil,
        @form=[#<BridgeBankin::BridgeObject:0x00007fbb07b271a8 @isNum="1", @label="Identifiant", @maxLength=nil, @type="USER">, #<BridgeBankin::BridgeObject:0x00007fbb07b26cd0 @isNum="0", @label="Mot de passe", @maxLength=nil, @type="PWD">],
        @id=486,
        @logo_url="https://web.bankin.com/img/banks-logo/france/themis.png",
        @name="Themis Banque",
        @payment_enabled=false,
        @primary_color=nil,
        @secondary_color=nil,
        @transfer_enabled=false>],
     @display_order=0,
     @is_highlighted=false,
     @logo_url="https://web.bankin.com/img/banks-logo/france/themis.png",
     @name="Themis Banque">]>]
```

## Development

If you need more detailed informations regarding the gem source code you can find more in the official [RubyDoc](https://rubydoc.info/github/neatops/bridge_bankin/main).

## Contributing

We're convinced this gem could be improved a lot or simply not cover every needs you have. That's why contributions of any kind is very encouraged.
Bug reports and pull requests are welcome on GitHub at https://github.com/neatops/bridge_bankin. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
