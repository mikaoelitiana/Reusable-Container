module ReusableContainers
  module Element
    extend ActiveSupport::Concern

    module ClassMethods
      @@element_layouts = [ :default ]
      def define_layouts(*layouts)
        @@element_layouts += layouts
        @@element_layouts.flatten!
      end

      def available_layouts
        @@element_layouts
      end
    end

    module InstanceMethods
      def layouts
        self.class.available_layouts
      end
    end

    included do
      has_many :content_group_elements, :as => :element
      has_many :content_groups, :through => :content_group_elements
    end
  end
end
