module MWS
  module API

    class Product < Base
      def_request :get_competitive_pricing_for_SKU, #[:get_competitive_pricing_for_sku, :list_orders_by_next_token],
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :seller_skus => "SellerSKUList.SellerSKU"
        },
        :mods => [
          lambda {|r| r.products = r.products.product if r.products}
        ]

      def_request :get_my_price_for_SKU,
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :seller_skus => "SellerSKUList.SellerSKU"
        },
        :mods => [
          lambda {|r| r.products = r.products.product if r.products}
        ]
        
      def_request :get_lowest_offer_listings_for_SKU,
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :seller_skus => "SellerSKUList.SellerSKU"
        },
        :mods => [
          lambda {|r| r.products = r.products.product if r.products}
        ]

      def_request :get_matching_product_for_id,
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :seller_skus => "IdList.Id"
        },
        :mods => [
          lambda {|r| r.products = [r.products.product].flatten}
        ]
    end

  end
end