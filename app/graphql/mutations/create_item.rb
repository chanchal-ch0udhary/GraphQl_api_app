module Mutations
  class CreateItem < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :artist_id, Int, required: true

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(title:, description:, artist_id:)
      item = Item.new(title: title, description: description, artist_id: artist_id)

      if item.save
        { item: item, errors: [] }
      else
        { item: nil, errors: item.errors.full_messages }
      end
    end
  end
end