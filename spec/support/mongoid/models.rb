module Mongo
  class Portal
    include Mongoid::Document
    include Tenancy::Resource

    field :domain_name, type: String
  end

  class Listing
    include Mongoid::Document
    include Tenancy::Resource
    include Tenancy::ResourceScope

    default_scope -> { where(is_active: true) }
    scope_to      :portal, class_name: "Mongo::Portal"
    validates_uniqueness_in_scope :name, case_sensitive: false

    field :name, type: String
  end

  class Communication
    include Mongoid::Document
    include Tenancy::ResourceScope

    default_scope -> { where(is_active: true) }
    scope_to      :portal, class_name: "Mongo::Portal"
    scope_to      :listing, class_name: "Mongo::Listing"
    validates_uniqueness_in_scope :value
  end

  class ExtraCommunication
    include Mongoid::Document
    include Tenancy::ResourceScope

    scope_to :portal, class_name: "Mongo::Portal"
    scope_to :listing, class_name: "Mongo::Listing"
  end
end