require 'ruby-debug'
class Racer < Sequel::Model
  one_to_many :categorizations
  many_to_many :categories, :join_table => :categorizations
  def to_s
    name
  end

  def best_time
    serious_races = self.db[:races].filter(:for_fun => false).select(:id)
    best = self.db[:race_participations].filter(:racer_id => self.pk, :race_id => serious_races).order(:finish_time).select(:finish_time).first
    best[:finish_time] if best
  end
end
