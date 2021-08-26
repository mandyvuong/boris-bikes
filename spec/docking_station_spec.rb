require 'docking_station'

describe DockingStation do 
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'dock' do 
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
