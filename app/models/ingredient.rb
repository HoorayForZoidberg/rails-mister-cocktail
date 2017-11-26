class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  before_destroy :check_for_cocktails

  validates :name, presence: true, uniqueness: true

  private

  def check_for_cocktails
    unless self.cocktails.nil?
      self.errors[:base] << "Cannot delete ingredient while it is used in cocktails."
      return false
    end
  end
end
