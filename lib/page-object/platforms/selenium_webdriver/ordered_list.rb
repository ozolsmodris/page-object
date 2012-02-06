module PageObject
  module Platforms
    module SeleniumWebDriver
      module OrderedList

        #
        # Return the PageObject::Elements::ListItem for the index provided.  Index
        # is zero based.
        #
        # @return [PageObject::Elements::ListItem]
        #
        def [](idx)
          items = list_items.map do |item|
            ::PageObject::Elements::ListItem.new(item, :platform => :selenium_webdriver)
          end
          children = items.find_all { |item| item.parent.element == element }
          children[idx]
        end

        #
        # Return the number of items contained in the ordered list
        #
        def items
          list_items.size
        end

        private

        def list_items
          element.find_elements(:xpath, child_xpath)
        end

      end
    end
  end
end
