require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  # https://www.culttt.com/2015/06/03/the-difference-between-public-protected-and-private-methods-in-ruby/
  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end