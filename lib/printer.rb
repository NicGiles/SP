# printer class for displaying number of times sites have been visited.
class Printer
  def site_count(sites)
    sites.each { |site, visits| puts "#{site} has #{visits.length} visits." }
  end
end
