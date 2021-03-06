class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year.to_i}, if: :released
  validates :artist_name, presence: true
end
