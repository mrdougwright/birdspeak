class Utility
  def self.format_date(date)
    d = date.is_a?(Time) ? date : Time.zone.parse(date)
    d.to_s(:short)
  end
end
