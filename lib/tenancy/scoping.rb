module Tenancy
  class Scoping
    autoload :ActiveRecord, "tenancy/scoping/active_record"
    autoload :Mongoid,      "tenancy/scoping/mongoid"

    attr_reader :klass, :scoped_resources

    def initialize(klass)
      @klass            = klass
      @scoped_resources = []
    end
  end
end