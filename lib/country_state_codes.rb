# frozen_string_literal: true

require 'country_state_codes/version'
require 'csv'
module CountryStateCodes
  # Country Class to get Country Codes.
  class Country
    COUNTRY_FILE = File.expand_path('data/country_codes.csv', __dir__)

    def self.codes
      begin
        CSV.read(COUNTRY_FILE, encoding: 'UTF-8:UTF-8')
      rescue StandardError
        []
      end
    end
  end
  # Country Class to get corresponding State Codes.
  class State
    STATES_FOLDER = File.expand_path('data/states', __dir__)
    def self.codes(country_code)
      begin
        CSV.read("#{STATES_FOLDER}/#{country_code.upcase}.csv", encoding: 'UTF-8:UTF-8')
      rescue StandardError
        []
      end
    end
  end
end

module ActionView
  module Helpers
    module FormOptionsHelper
      include CountryStateCodes
      def select_country(object, method, options = {}, html_options = {}, &block)
        select(object, method, CountryStateCodes::Country.codes, options, html_options, &block)
      end
    end
  end
end
