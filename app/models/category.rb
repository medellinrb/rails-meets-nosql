class Category
  include Mongoid::Document
  field :name, type: String
  embedded_in :categorizable, polymorphic: true

  CATEGORIES = %w(front-end back-end server).freeze
  validates :name, inclusion: { in: CATEGORIES }
end
