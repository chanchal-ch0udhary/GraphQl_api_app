module Mutations
  class DeleteItem < BaseMutation
    argument :id, ID, required: true
    
    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      item = Item.find_by(id: id)

      if item
        if item.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: item.errors.full_messages }
        end
      else
        { success: false, errors: ["Couldn't find Item with 'id'=#{id}"] }
      end    
    end  
  end  
end