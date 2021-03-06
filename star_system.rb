class StarSystem
  attr_reader :name, :planets

    def initialize(name, planet_array = [])
      @name = name
      @planets = planet_array
    end

    def get_names_of_planets(planets)
      return planets.map{ |planet| planet.name }
    end

    def planet_names
      return get_names_of_planets(@planets)
    end

    def get_planet_by_name(name)
      return @planets.find{ |planet| planet.name == name }
    end

    def get_planets_with_no_moons()
      return @planets.find_all { |planet| planet.number_of_moons.zero?} 
    end

    def get_planets_with_more_moons(moon_count)
      planets_with_more_moons_than_specified = @planets.find_all { |planet| planet.number_of_moons > moon_count} 
      return get_names_of_planets(planets_with_more_moons_than_specified)
    end

    def get_number_of_planets_closer_than(distance)
      return @planets.count { |planet| planet.distance_from_sun() < distance}
    end

    def get_largest_planet
      return @planets.max_by { |planet| planet.diameter}
    end

    def get_smallest_planet
      return @planets.min_by { |planet| planet.diameter}
    end


    def get_total_number_of_moons
      return @planets.sum { |planet| planet.number_of_moons }
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      sorted_planets_by_distance_close_to_distant = @planets.sort_by{ |planet| planet.distance_from_sun }
      return get_names_of_planets(sorted_planets_by_distance_close_to_distant)
    end

    def get_planet_names_sorted_by_size_decreasing
      sorted_planets_by_decreasing_size = @planets.sort_by{ |planet| -planet.diameter }
      return get_names_of_planets(sorted_planets_by_decreasing_size)
    end
end
