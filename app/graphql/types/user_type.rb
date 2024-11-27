# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :password, String
    field :get_only_part_email, String
    field :custom_field, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :post_count, Integer, null: false
    field :posts, [ Types::PostType ], null: false

    def post_count
      object.posts.size
    end

    def get_only_part_email
      object.email.split("@")[0]
    end

    def custom_field
      object.name
    end
  end
end
