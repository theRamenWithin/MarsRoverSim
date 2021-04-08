RSpec.describe MarsRoverSim do
  it "has a version number" do
    expect(MarsRoverSim::VERSION).not_to be nil
  end

  context "correct coordinates are provided" do
    ARGV = ["1,2", "1,1"]

    it "should return a success message in three lines of output" do
      expect { MarsRoverSim::Command.new.explore }.to output("Destination coordinates receieved. Mars rover heading out from sector (1, 1)!\nRight (1, 2)\nArrived at destination sector (1, 2)!\n").to_stdout
    end
  end

end
