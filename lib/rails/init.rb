require 'is_it_mobile'

Mime::Type.register_alias( "text/html", :mobile ) if defined?(Mime) && defined?(Mime::Type)

# When IsItMobile::ForRails is included in a controller, a before filter is
# added that will reset the request format to the value of
# +base.mobile_format+ which defaults to :mobile. To change it to
# something else, simply add a line after the inclusion that says
# +self.mobile_format = :handheld+ or whatever you'd like it to be.
# 
# It also exposes the +request_is_from_mobile?+ method to the views if
# you don't want to create multiple erb views for every page

module IsItMobile::ForRails
  def self.included(base)
    base.class_eval do
      include ::IsItMobile::ForRails::InstanceMethods
      
      class_attribute :mobile_format
      self.mobile_format = :mobile

      before_filter :change_request_format_to_mobile, :if => :request_is_from_mobile?

      helper_method :request_is_from_mobile?, :mobile?
      IsItMobile::POPULAR_DEVICES.each do |device|
        helper_method "request_is_from_#{device}?".to_sym, "#{device}?".to_sym
      end
    end
  end
  
  module InstanceMethods
    protected
    # Checks if the request.format is *already* @@mobile_format (set by the
    # query string or using an extension of 'mobile' with resourceful routes)
    # and if not, uses IsItMobile.mobile? to determine whether or not the
    # request is from a mobile device
    def request_is_from_mobile?
      @request_is_from_mobile ||= 
        request.format.to_sym == self.class.mobile_format || 
        IsItMobile.mobile?( request.env['HTTP_USER_AGENT'].to_s, request.env['HTTP_ACCEPT'].to_s )
    end
    alias :mobile? :request_is_from_mobile?
  
    # Sets the request format to @@mobile_format when the request is from a mobile device
    def change_request_format_to_mobile
      request.format = self.class.mobile_format
    end
    
    # Some helpers for popular devices - these don't (yet) wrangle the request format
    # This will create methods named "request_is_from_(device)?" which are also aliased to 
    # just "(device)?"
    IsItMobile::POPULAR_DEVICES.each do |device|
      module_eval <<-EOD
        def request_is_from_#{device}?
          @request_is_from_#{device} ||= IsItMobile.#{device}?( request.env['HTTP_USER_AGENT'] )
        end
        alias :#{device}? :request_is_from_#{device}?
      EOD
    end    
  end
end

class ActionController::Base
  include ::IsItMobile::ForRails
end
