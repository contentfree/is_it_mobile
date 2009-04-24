class IsItMobile
  VERSION = '1.0.1'
  
  POPULAR_MOBILE_USER_AGENT_BEGINNINGS = ['w3c ','acs-','alav','alca','amoi','audi','avan','benq','bird','blac', 'blaz','brew','cell','cldc','cmd-','dang','doco','eric','hipt','inno','ipaq','java','jigs','kddi','keji','leno','lg-c','lg-d','lg-g','lge-', 'maui','maxo','midp','mits','mmef','mobi','mot-','moto','mwbp','nec-','newt','noki','oper','palm','pana','pant','phil','play','port','prox', 'qwap','sage','sams','sany','sch-','sec-','send','seri','sgh-','shar','sie-','siem','smal','smar','sony','sph-','symb','t-mo','teli','tim-', 'tosh','tsm-','upg1','upsi','vk-v','voda','wap-','wapa','wapi','wapp','wapr','webc','winw','winw','xda','xda-']
  
  # Performs a few lightweight checks on the user agent to determine if it's a mobile device. 
  def self.mobile?( user_agent, accepts )
    return !!( user_agent =~ /(mobile|up.browser|up.link|mmp|symbian|phone|midp|wap|mini|ppc;|playstation|palm|wii|nitro)/i || 
               accepts.index('application/vnd.wap.xhtml+xml') ||
               POPULAR_MOBILE_USER_AGENT_BEGINNINGS.include?(user_agent[0,4]))
  end
  
  module ForRails
    # When ForRails is included in a controller, a before filter is added that will reset the request format to the 
    # value of +base.mobile_format+ which defaults to :mobile. To change it to something else, simply add a line after 
    # the inclusion that says +self.mobile_format = :handheld+ or whatever you'd like it to be.
    #
    # It also exposes the +request_is_from_mobile?+ method to the views if you don't want to create multiple erb views
    # for every page (or want to keep a single layout file)
    def self.included(base)
      base.class_eval do
        class_inheritable_accessor :mobile_format
        self.mobile_format = :mobile
        
        before_filter :wrangle_format_if_request_is_mobile
        
        helper_method :request_is_from_mobile?
      end
    end
    
    protected
    # Checks if the request.format is *already* @@mobile_format (set by the query string or using an 
    # extension of 'mobile' with resourceful routes) and if not, uses IsItMobile.mobile? to
    # determine whether or not the request is from a mobile device 
    def request_is_from_mobile?
      @request_is_from_mobile ||= request.format.to_sym == self.class.mobile_format || IsItMobile.mobile?( request.env['HTTP_USER_AGENT'] || '', request.env['HTTP_ACCEPT'] || '' )
    end
    
    # Sets the request format to @@mobile_format when the request is from a mobile device
    def wrangle_format_if_request_is_mobile
      request.format = self.class.mobile_format if request_is_from_mobile?
    end
  end
end