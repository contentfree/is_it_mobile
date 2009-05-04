class IsItMobile
  POPULAR_MOBILE_USER_AGENT_BEGINNINGS = %w(
    w3c  acs- alav alca amoi audi avan benq bird blac blaz 
    brew cell cldc cmd- dang doco eric hipt inno ipaq java 
    jigs kddi keji leno lg-c lg-d lg-g lge- maui maxo midp 
    mits mmef mobi mot- moto mwbp nec- newt noki oper palm 
    pana pant phil play port prox qwap sage sams sany sch- 
    sec- send seri sgh- shar sie- siem smal smar sony sph- 
    symb t-mo teli tim- tosh tsm- upg1 upsi vk-v voda wap- 
    wapa wapi wapp wapr webc winw winw xda xda-
  )
  
  POPULAR_MOBILE_USER_AGENT_REGEX = /(mobile|up.browser|up.link|mmp|symbian|phone|midp|wap|mini|ppc;|playstation|palm|wii|nitro)/i
  
  # Performs a few lightweight checks on the user agent to determine if it's a mobile device. 
  def self.mobile?( user_agent, accepts = '' )
    !!( user_agent =~ POPULAR_MOBILE_USER_AGENT_REGEX || 
        accepts.index('application/vnd.wap.xhtml+xml') ||
        POPULAR_MOBILE_USER_AGENT_BEGINNINGS.include?(user_agent[0,4]))
  end
  
  # Some checks for some specific, popular mobile devices
  def self.iphone?( user_agent )
    !!(user_agent =~ /(mobile\/.+safari)/i)
  end
  
  def self.android?( user_agent )
    !!(user_agent =~ /android/i)
  end
  
  def self.blackberry?( user_agent )
    !!(user_agent =~ /blackberry/i)
  end
  
  def self.windows_mobile?( user_agent )
    !!(user_agent =~ /windows ce/i)
  end
  
  def self.symbian?( user_agent )
    !!(user_agent =~ /symbian/i)
  end
end