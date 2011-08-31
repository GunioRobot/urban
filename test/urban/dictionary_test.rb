require 'test_helper'

class DictionaryTest < MiniTest::Unit::TestCase

  def setup
    @web_service = MiniTest::Mock.new
    @dictionary = Urban::Dictionary.new
  end

  def test_dictionary_calls_random
    @dictionary.web_service = @web_service.expect(:query, load_file('impromptu.html') ,[:random])
    assert_equal(TEST_PHRASE, @dictionary.random)
    @web_service.verify
  end

  def test_dictionary_calls_define
    @dictionary.web_service = @web_service.expect(:query, load_file('impromptu.html'), [:define, 'impromptu'])
    assert_equal(TEST_PHRASE, @dictionary.search('impromptu'))
    @web_service.verify
  end
end