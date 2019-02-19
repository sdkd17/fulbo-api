class Reservation < ApplicationRecord
  belongs_to :player
  belongs_to :court

  #validations
  validates :player_id, presence: true, uniqueness: { scope: [:court_id, :date] }
  validates :court_id, presence: true, uniqueness: {scope: :date }
  validates :date, presence: true

end
