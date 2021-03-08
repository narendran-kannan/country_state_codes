require 'test_helper'

class CountryStateCodesTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CountryStateCodes::VERSION
  end

  def test_country_codes
    assert(CountryStateCodes::Country.codes.length == 249)
  end

  def test_state_code_with_valid_name
    assert(CountryStateCodes::State.codes('IN').length == 36)
  end

  def test_state_code_with_invalid_name
    assert(CountryStateCodes::State.codes("II").empty?)
  end
end
