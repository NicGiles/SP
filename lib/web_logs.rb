# web_logs class for storing log into a hash.
class WebLogs
  attr_reader :sitelist

  def initialize
    @sitelist = {}
  end

  def create_sites_hash(filename)
    File.open(filename).each do |ip_site_logs|
      sites = ip_site_logs.split(' ')
      @sitelist.key?(sites[0]) ?
      @sitelist[sites[0]] << (sites[1]) : @sitelist[sites[0]] = [sites[1]]
    end
  end
end
