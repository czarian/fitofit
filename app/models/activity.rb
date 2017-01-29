class Activity < ApplicationRecord

  belongs_to :user

  validates :start, :destination, presence: :true, length: {minimum: 10},
            format: { :with => /\A([a-zA-ZąćęłóńśźżĄĆĘŁÓŚŹŻ\s])+([a-zA-ZĄĆĘŁÓŚŹŻ0-9\s])+(,\s)+([a-zA-ZĄĆĘŁÓŚŹŻ])+(,\s)+([a-zA-ZĄĆĘŁÓŚŹŻ0-9\s])+\Z/ }

  validate :check_if_exists

  after_validation :geocode_endpoints

  before_save :set_distance

  scope :this_week, -> {  where("created_at >= ?", Time.zone.now.beginning_of_week) }

  scope :this_month, -> { where("created_at >= ?", Time.zone.now.beginning_of_month) }

  scope :by_user, ->(user){ where(user_id: user)}


  private

  def geocode_endpoints
    if start_changed?
      geocoded = Geocoder.search(start).first
      if geocoded
        self.start_lat = geocoded.latitude
        self.start_lon = geocoded.longitude
      end
    end
    if destination_changed?
      geocoded = Geocoder.search(destination).first
      if geocoded
        self.dest_lat = geocoded.latitude
        self.dest_lon = geocoded.longitude
      end
    end
  end

  def set_distance
    self.distance = Geocoder::Calculations.distance_between [self.start_lat, self.start_lon],
                                                            [self.dest_lat, self.dest_lon]
  end

  def check_if_exists
    self.errors.add :start, "address not found" unless Geocoder.search(start).first
    self.errors.add :destination, "address not found" unless Geocoder.search(destination).first
  end

end
