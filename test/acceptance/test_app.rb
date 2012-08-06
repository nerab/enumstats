require 'helper'
require 'open3'

#
# End-to-end application test
#
class TestEnumerableStatsApp < MiniTest::Unit::TestCase
  include EnumStatsTest
  APP_SCRIPT = 'ruby bin/stats'

  def test_happy_day
    status = Open3.popen3("cat #{fixture_name('example.data')} | #{APP_SCRIPT}") do |stdin, stdout, stderr|
      stdout.read.each_line do |line|
        assert_match(/^(.*): (.*)$/, line)
      end
    end

    refute_equal(0, status)
  end
end
