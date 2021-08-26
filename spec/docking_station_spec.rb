require 'docking_station'

describe DockingStation do 
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do 
    bike = subject.release_bike
    expect(bike).to be_working # Predicate matchers - passes if bike.working?
  end

  # dock bike at station
  it { is_expected.to respond_to(:dock).with(1).argument }

  # bike that's been docked
  it { is_expected.to respond_to :bike }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike # return bike to dock
  end

end
