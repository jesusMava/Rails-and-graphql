class Mutations::CreateUser < Mutations::BaseMutation
  # lo que vamos q vamos a recibir
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  #lo que se va a retornar
  field :user, Types::UserType, null: false
  field :count, Integer, null: false
  field :errors, [String], null: false

  def resolve(name:, email:, password:)
    new_user = User.new(name:, email:, password:)

    if new_user.save
      { user: new_user, errors: [], count: User.count }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end
