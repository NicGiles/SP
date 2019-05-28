require 'web_logs'
require 'spec_helper'

describe WebLogs do
  subject(:logs) { described_class.new }

  context 'Working file uploaded.' do
    before do
      subject.create_sites_hash("./spec/test_log.log")
    end

  describe '#create_sites_hash' do
    it 'Takes a log of files and saves them into a hash.' do
      expect(subject.sitelist).to eq ({ 'contact' => ['184'], 'home' => %w[184 235 185], '/about/2' => %w[444 444], 'page1' => %w[929 722 646 126], '/index' => %w[444 445 446 447], '/about' => ['061'] })
    end
  end

  describe '#order_sites' do
      it 'Orders sites by number of visits.' do
        expect(subject.order_sites).to eq([['/index', ['444', '445', '446', '447']], ['page1', ['929', '722', '646', '126']], ['home', ['184', '235', '185']], ['/about/2', ['444', '444']], ['/about', ['061']], ['contact', ['184']]])
      end
    end
  end
end
