class Meta
  include Singleton
  def initialize
    @meta = {}
  end

  def method_missing(method_id, *args, &block)
    Rails.logger.debug "[META##{self.object_id}] called_with #{method_id}/#{args}"
    if method_id.to_s =~ /_append=$/
      self.class.send(:define_method, method_id) do |args|
        real_key = method_id.to_s.gsub(/_append=$/,"").to_sym
        to_append = ""
        sep = " | "
        case args
        when String
          to_append = args
        else
          to_append = args.first
          sep = args.last
        end
        if !@meta[real_key].blank?
          @meta[real_key] << "#{sep}#{to_append}"
        else
          @meta[real_key] = to_append
        end
      end
    elsif method_id.to_s =~ /=$/
      self.class.send(:define_method, method_id) { |value|
        Rails.logger.debug "[META##{self.object_id}] called_with #{value}"
        @meta[method_id.to_s.gsub(/=$/,"").to_sym] = value
      }
    elsif method_id.to_s =~ /\?$/
      self.class.send(:define_method, method_id) { !@meta[method_id.to_s.gsub(/\?$/,"").to_sym].blank? }
    else
      self.class.send(:define_method, method_id) { @meta[method_id] }
    end
    self.send(method_id, *args)
  end

  def update_with(metahash)
    @meta.merge!(metahash)
  end
end
