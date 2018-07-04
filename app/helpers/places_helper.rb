module PlacesHelper
  def self.determine_pleasantness(current_temp)
    if current_temp >= 80
      "outdoor"
    elsif current_temp < 80 && current_temp >= 70
      "warm"
    elsif current_temp < 60
      "cold"
    else
      "meh"
    end
  end
end
