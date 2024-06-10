module Mutations
  class UpdateItem < BaseMutation
    argument :id, Int, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    field :item, Types::ItemType, null: true
    field :errors, [String], null: true

    def resolve(id:, title: nil, description: nil)
      item = Item.find_by(id: id)

      if item
        updates = {}
        updates[:title] = title if title
        updates[:description] = description if description

        if item.update(updates)
          { item: item, errors: [] }
        else
          { item: nil, errors: item.errors.full_messages }
        end
      else
        { item: nil, errors: ["Item not found"] }
      end
    end
  end
end