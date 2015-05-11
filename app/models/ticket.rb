class Ticket
  include Mongoid::Document
  field :name, type: String
  embeds_many :categories, as: :categorizable
  belongs_to :company
  belongs_to :developer

  index({ 'categories.name': 1 }, unique: true, sparse: true)
  index({ name: 1 }, unique: false)
end
