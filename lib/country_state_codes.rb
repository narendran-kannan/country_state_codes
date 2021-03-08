require 'country_state_codes/version'
require 'csv'
module CountryStateCodes

  class Country
    COUNTRY_FILE = './data/country_codes.csv'.freeze

    def self.codes
      begin
        CSV.read(COUNTRY_FILE, encoding: 'UTF-8:UTF-8')
      rescue StandardError
        []
      end
    end
  end

  class State
    STATES_FOLDER = './data/states/'.freeze
    def self.codes(country_code)
      begin
        CSV.read("#{STATES_FOLDER}#{country_code.upcase}.csv", encoding: 'UTF-8:UTF-8')
      rescue StandardError
        []
      end
    end
  end
end
