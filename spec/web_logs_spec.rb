require 'web_logs'
require 'spec_helper'

describe Web_logs do
  subject(:logs) { described_class.new }


    describe '#create_sites_hash' do
      it 'Takes a log of files and saves them into a hash.' do
        subject.create_sites_hash("./spec/test_log.log")
        expect(subject.sitelist).to eq ({"contact"=>["184"], "home"=>["184", "235", "185"], "/about/2"=>["444", "444"], "page1"=>["929", "722", "646", "126"], "/index"=>["444", "445", "446", "447"], "/about"=>["061"]})
      end
    end
  end
