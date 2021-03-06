require_relative 'printer'
# web_logs class for storing log into a hash.
class WebLogs

  attr_reader :sitelist, :ordered_sites, :ordered_ips

  def initialize(printer = Printer.new)
    @sitelist = {}
    @ordered_sites = []
    @ordered_ips = []
    @printer = printer
  end

  def create_sites_hash(filename)
    raise 'File does not exist.' unless File.file?(filename)
    File.open(filename).each do |ip_site_logs|
      sites = ip_site_logs.split(' ')
      @sitelist.key?(sites[0]) ?
      @sitelist[sites[0]] << (sites[1]) : @sitelist[sites[0]] = [sites[1]]
    end
  end

  def order_sites
    fail "Log file empty. Try creating new sites hash." if @sitelist.empty?
    @ordered_sites = @sitelist.sort_by { |_site, visits| visits.length }.reverse
  end

  def order_ips
    fail "Log file empty. Try creating new sites hash." if @sitelist.empty?
    @ordered_ips = @sitelist.sort_by { |_site, visitors| visitors.uniq.length }.reverse
  end

  def site_count
    @printer.site_count(@ordered_sites)
  end

  def ips_count
    @printer.unique_visitor_count(@ordered_ips)
  end
end
