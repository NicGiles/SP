# printer class for displaying number of times sites have been visited.
class Printer
  def site_count(sites)
    sites.each { |site, visits| puts "#{site} has #{visits.length} visits." }
  end

  def unique_visitor_count(ips)
    ips.each { |site, visitors| puts "#{site} has been visited by #{visitors.uniq.length} people or bots." }
  end
end
