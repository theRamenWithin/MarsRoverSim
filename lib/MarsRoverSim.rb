require_relative "MarsRoverSim/version"

module MarsRoverSim
  class Error < StandardError; end
  
  class Command
    def initialize
      # Make an 8 by 8 grid map
      @map = (1..8).to_a.product((1..8).to_a)
      @coordinatesPair_destination = ARGV[0].split(",").map(&:to_i)
      @coordinatesPair_mcrCurrent = ARGV[1].split(",").map(&:to_i)
    end

    def explore
      dest = @map.find_index(@coordinatesPair_destination)
      loc = @map.find_index(@coordinatesPair_mcrCurrent)
      puts "Destination coordinates receieved. Mars rover heading out from sector (#{@map[loc].to_s.delete("[]")})!"

      until dest == loc
        # Travel the X axis
        until @map[loc][0] == @map[dest][0]
          if loc - dest < 0
            loc += 8
            puts "Down (#{@map[loc].to_s.delete("[]")})"
          else
            loc -= 8
            puts "Up (#{@map[loc].to_s.delete("[]")})"
          end
        end
        # Travel the Y axis
        until @map[loc][1] == @map[dest][1]
          if loc - dest < 0
            loc += 1
            puts "Right (#{@map[loc].to_s.delete("[]")})"
          else
            loc -= 1
            puts "Left (#{@map[loc].to_s.delete("[]")})"
          end
        end
      end
      puts "Arrived at destination sector (#{@map[dest].to_s.delete("[]")})!"
    end
  end
end

if ARGV.any?("-h") || ARGV.any?("--help")
  puts "This program accepts two arguements in the form of two pairs of comma deliminated integers; destination first, starting location second. For example, 'MarsRoverSim.rb 1,1 3,4'"
elsif ARGV.length != 2
  puts "Unexpected number of coordinates provided."
else
  MarsRoverSim::Command.new.explore
end
