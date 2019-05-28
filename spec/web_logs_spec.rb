require 'web_logs'
require 'spec_helper'

describe WebLogs do
  subject(:logs) { described_class.new(printer) }
  let(:printer) { double :printer }

  context 'Incorrect file path provided.' do
    it 'Warns user if incorrect file path.' do
      expect{ subject.create_sites_hash("./spec/fake_log.log") }.to raise_error "File does not exist."
    end
  end

  context 'Working file uploaded.' do
    before do
      subject.create_sites_hash('./spec/test_log.log')
    end

    describe '#create_sites_hash' do
      it 'Takes a log of files and saves them into a hash.' do
        expect(subject.sitelist).to eq ({ 'contact' => ['184'], 'home' => %w[184 235 185], '/about/2' => %w[444 444], 'page1' => %w[929 722 646 126], '/index' => %w[444 445 446 447], '/about' => ['061'] })
      end
    end

    describe '#order_sites' do
      it 'Orders sites by number of visits.' do
        expect(subject.order_sites).to eq([['/index', %w[444 445 446 447]], ['page1', %w[929 722 646 126]], ['home', %w[184 235 185]], ['/about/2', %w[444 444]], ['/about', ['061']], ['contact', ['184']]])
      end
    end

    describe '#order_ips' do
      it 'Orders sites by number of visitors.' do
        expect(subject.order_ips).to eq([['/index', %w[444 445 446 447]], ['page1', %w[929 722 646 126]], ['home', %w[184 235 185]], ['/about', ['061']], ['/about/2', %w[444 444]], ['contact', ['184']]])
      end
    end

    describe '#site_count' do
      it 'calls site_count on printer' do
        expect(printer).to receive(:site_count).with(subject.ordered_sites)
        subject.site_count
      end
    end

    describe '#ips_count' do
      it 'calls unique_visitor_count on printer' do
        expect(printer).to receive(:unique_visitor_count).with(subject.ordered_ips)
        subject.ips_count
      end
    end
  end
end
