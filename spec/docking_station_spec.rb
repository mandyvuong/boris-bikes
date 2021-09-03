require 'docking_station'

describe DockingStation do 
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bike' do
      bike = double(:bike)
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when bike is broken' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'No bikes available - broken bike'
    end
  end

  describe 'dock' do 
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when dock is full' do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double :bike }.to raise_error 'Docking station full'
    end
  end
end
