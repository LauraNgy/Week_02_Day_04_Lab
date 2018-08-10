class StarSystem
  attr_reader :name, :planets

    def initialize(name, planets)
      @name = name
      @planets =  planets

    end

    def planet_names
      return @planets.map{|planet| planet.name}
    end

    def get_planet_by_name(name)
      @planets.find{|planet| planet.name == name}
    end

    def get_largest_planet
      return @planets.max_by{|planet| planet.diameter}
    end

    def get_smallest_planet
      return @planets.min_by{|planet| planet.diameter}
    end

    def get_planets_with_no_moons
      return @planets.find_all{|planet| planet.number_of_moons == 0}
    end

    def get_planets_with_more_moons(num)
      more_moons = @planets.select{|planet| planet.number_of_moons > num}
      return more_moons.map{|planet| planet.name}
    end

    def get_number_of_planets_closer_than(dist)
      return @planets.count{|planet| planet.distance_from_sun < dist}
    end

    def get_total_number_of_moons
      total = @planets.reduce(0) {|total, planet| total + planet.number_of_moons}
      return total
    end

#not good practice, but just to know it's working
    def get_planet_names_sorted_by_increasing_distance_from_sun
      return @planets.sort_by{|planet| planet.distance_from_sun}.map{|planet| planet.name}
    end

    def get_planet_names_sorted_by_size_decreasing
      planets_by_size = []
      while @planets != []
        planets_by_size.push(get_largest_planet)
        @planets.delete(get_largest_planet)
      end
      return planets_by_size.map{|planet| planet.name}
      #same result as above
      # planets_by_size = {|planet1, planet2| planet2.diameter <=> planet1.diameter}
      # return planets_by_size.map{|planet| planet.name}
    end



end
