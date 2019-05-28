require 'printer'
require 'spec_helper'

sites = { 'Site_1' => ['1'], 'Site_2' => %w[1 2 1], 'Site_3' => %w[1 2 3 4] }

describe Printer do
  subject(:printer) { described_class.new }

  describe '#site_count' do
    it 'Returns number of times each site has been visited.' do
      expect { subject.site_count(sites) }.to output("Site_1 has 1 visits.\nSite_2 has 3 visits.\nSite_3 has 4 visits.\n").to_stdout
    end
  end
end
