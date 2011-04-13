class ShippingManifest
  attr_accessor :mass, :package_count

  def initialize(mass, package_count)
    @mass          = mass
    @package_count = package_count
  end
  
  def +(other)
    self.dup.tap do |neu|
      neu.mass          = self.mass + other.mass
      neu.package_count = self.package_count + other.package_count
    end
  end
end


# Addition:
shipping_manifest_one = ShippingManifest.new(5, 10)
shipping_manifest_two = ShippingManifest.new(1, 1)
shipping_manifest_sum = shipping_manifest_one + shipping_manifest_two

shipping_manifest_sum.package_count # => 11
shipping_manifest_sum.mass          # => 6

puts "shipping_manifest_sum: #{shipping_manifest_sum.inspect}"

# Injection:
manifests = [
  ShippingManifest.new(5, 10),
  ShippingManifest.new(1, 1),
  ShippingManifest.new(35, 50),  
]

manifests.inject { |sum, m| sum + m } # => #<ShippingManifest:0x100164c38 @package_count=61, @mass=41>
