# web_logs class for storing log into a hash.
class WebLogs
  attr_reader :sitelist, :ordered_sites, :ordered_ips

  def initialize
    @sitelist = {}
    @ordered_sites = []
    @ordered_ips = []
  end

  def create_sites_hash(filename)
    File.open(filename).each do |ip_site_logs|
      sites = ip_site_logs.split(' ')
      @sitelist.key?(sites[0]) ?
      @sitelist[sites[0]] << (sites[1]) : @sitelist[sites[0]] = [sites[1]]
    end
  end

  def order_sites
    @ordered_sites = @sitelist.sort_by { |_site, visits| visits.length }.reverse
  end

  def order_ips
    @ordered_ips = @sitelist.sort_by { |_site, visitors| visitors.uniq.length }.reverse
  end
end
