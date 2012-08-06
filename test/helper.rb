require 'minitest/autorun'
require 'enumstats'

module EnumStatsTest
  def fixture_name(name)
    File.join(File.dirname(__FILE__), 'fixtures', name)
  end
end
