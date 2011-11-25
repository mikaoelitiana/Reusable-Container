module ReusableContainers
  module Content
    # extension pour tous les contenus pour qu'ils aient au moins une entrée.
    #  - création automatique de l'entrée dans le bon parent
    #  - mise à jour automatique de l'entrée en cas de modification

    extend ActiveSupport::Concern
    @@contents = []

    def self.register(model)
      @@contents << model
      @@contents.uniq!
    end

    def self.registered_contents
      @@contents
    end

    module ClassMethods
      EntryOptionProcs = {
        :name => Proc.new { |content, method| "[#{content.class.model_name.human}] #{content.send(method)}" },
        :parent => Proc.new { |content, method| method ? content.send(method) : nil },
        :title => Proc.new { |content, method| content.send(method) },
        :text => Proc.new { |content, method| content.send(method) },
        :keywords => Proc.new { |content, method| content.send(method) },
        :description => Proc.new { |content, method| content.send(method) }
      }.freeze

      @@entry_attributes = {
        :name => :name,
        :parent => nil,
        :title => :title,
        :text => :title,
        :keywords => nil,
        :description => nil
      }
      def entry_attributes(values = {})
        @@entry_attributes.merge!(values)
      end

      def entry_attributes_for(content)
        result = {}
        @@entry_attributes.each do |key, value|
          case value
          when NilClass
            result[key] = nil
          when Symbol
            result[key] = EntryOptionProcs[key].call(content, value)
          else
            result[key] = value
          end
        end
        result
      end
    end

    module InstanceMethods
      def entry_attributes
        self.class.entry_attributes_for(self)
      end

      def update_entry
        self.entry.update_attributes(entry_attributes)
      end

      def create_entry
        e = self.build_entry(entry_attributes)
        e.save
      end
    end

    included do
      has_one :entry, :as => :destination_object
      after_create :create_entry
      after_update :update_entry
    end
  end
end
