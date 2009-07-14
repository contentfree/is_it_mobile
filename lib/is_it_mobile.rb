class IsItMobile
  MOBILE_USER_AGENT_FRAGMENTS = %r{^(1207|3gso|4thp|501i|502i|503i|504i|505i|506i|6310|6590|770s|802s|a wa|acer|acs-|airn|alav|asus|attw|au-m|aur |aus |abac|acoo|aiko|alco|alca|amoi|anex|anny|anyw|aptu|arch|argo|bell|bird|bw-n|bw-u|beck|benq|bilb|blac|c55/|cdm-|chtm|capi|comp|cond|craw|dall|dbte|dc-s|dica|ds-d|ds12|dait|devi|dmob|doco|dopo|el49|erk0|esl8|ez40|ez60|ez70|ezos|ezze|elai|emul|eric|ezwa|fake|fly-|fly_|g-mo|g1 u|g560|gf-5|grun|gene|go.w|good|grad|hcit|hd-m|hd-p|hd-t|hei-|hp i|hpip|hs-c|htc |htc-|htca|htcg|htcp|htcs|htct|htc_|haie|hita|huaw|hutc|i-20|i-go|i-ma|i230|iac|iac-|iac/|ig01|im1k|inno|iris|jata|java|kddi|kgt|kgt/|kpt |kwc-|klon|lexi|lg g|lg-a|lg-b|lg-c|lg-d|lg-f|lg-g|lg-k|lg-l|lg-m|lg-o|lg-p|lg-s|lg-t|lg-u|lg-w|lg/k|lg/l|lg/u|lg50|lg54|lge-|lge/|lynx|leno|m1-w|m3ga|m50/|maui|mc01|mc21|mcca|medi|meri|mio8|mioa|mo01|mo02|mode|modo|mot |mot-|mt50|mtp1|mtv |mate|maxo|merc|mits|mobi|motv|mozz|n100|n101|n102|n202|n203|n300|n302|n500|n502|n505|n700|n701|n710|nec-|nem-|newg|neon|netf|noki|nzph|o2 x|o2-x|opwv|owg1|opti|oran|p800|pand|pg-1|pg-2|pg-3|pg-6|pg-8|pg-c|pg13|phil|pn-2|pt-g|palm|pana|pire|pock|pose|psio|qa-a|qc-2|qc-3|qc-5|qc-7|qc07|qc12|qc21|qc32|qc60|qci-|qwap|qtek|r380|r600|raks|rim9|rove|s55/|sage|sams|sc01|sch-|scp-|sdk/|se47|sec-|sec0|sec1|semc|sgh-|shar|sie-|sk-0|sl45|slid|smb3|smt5|sp01|sph-|spv |spv-|sy01|samm|sany|sava|scoo|send|siem|smar|smit|soft|sony|t-mo|t218|t250|t600|t610|t618|tcl-|tdg-|telm|tim-|ts70|tsm-|tsm3|tsm5|tx-9|tagt|talk|teli|topl|tosh|up.b|upg1|utst|v400|v750|veri|vk-v|vk40|vk50|vk52|vk53|vm40|vx98|virg|vite|voda|vulc|w3c |w3c-|wapj|wapp|wapu|wapm|wig |wapi|wapr|wapv|wapy|wapa|waps|wapt|winc|winw|wonu|x700|xda2|xdag|yas-|your|zte-|zeto|acs-|alav|alca|amoi|aste|audi|avan|benq|bird|blac|blaz|brew|brvw|bumb|ccwa|cell|cldc|cmd-|dang|doco|eml2|eric|fetc|hipt|http|ibro|idea|ikom|inno|ipaq|jbro|jemu|java|jigs|kddi|keji|kyoc|kyok|leno|lg-c|lg-d|lg-g|lge-|libw|m-cr|maui|maxo|midp|mits|mmef|mobi|mot-|moto|mwbp|mywa|nec-|newt|nok6|noki|o2im|opwv|palm|pana|pant|pdxg|phil|play|pluc|port|prox|qtek|qwap|rozo|sage|sama|sams|sany|sch-|sec-|send|seri|sgh-|shar|sie-|siem|smal|smar|sony|sph-|symb|t-mo|teli|tim-|tosh|treo|tsm-|upg1|upsi|vk-v|voda|vx52|vx53|vx60|vx61|vx70|vx80|vx81|vx83|vx85|wap-|wapa|wapi|wapp|wapr|webc|whit|winw|wmlb|xda-)}i
  
  MOBILE_USER_AGENTS = {
    :iphone         => 'i(phone|pod)',
    :android        => 'android',
    :opera_mini     => 'opera mini',
    :blackberry     => 'blackberry',
    :palm           => 'palm os|palm|hiptop|avantgo|plucker|xiino|blazer|elaine',
    :zune           => 'zune',
    :windows_mobile => 'windows ce; ppc;|windows ce; smartphone;|windows ce; iemobile',
    :symbian        => 'symbian',
    :wii            => 'wii',
    :playstation    => 'playstation',
    :other          => 'up.browser|up.link|mmp|smartphone|midp|wap|vodafone|o2|pocket|kindle|mobile|pda|psp|treo'
  }
  POPULAR_MOBILE_USER_AGENT_REGEX = %r{(#{MOBILE_USER_AGENTS.collect{|category,regex| regex}.join('|')})}i
  POPULAR_DEVICES = MOBILE_USER_AGENTS.keys.reject{ |key| key == :other }
  
  MOBILE_ACCEPTS_HEADERS = %r{(text/vnd\.wap\.wml|application/vnd\.wap\.xhtml\+xml)}i
  
  # Performs a few lightweight checks on the user agent to determine if it's a mobile device. 
  def self.mobile?( user_agent, accepts = '' )
    !!( user_agent.to_s =~ POPULAR_MOBILE_USER_AGENT_REGEX || 
        accepts.to_s    =~ MOBILE_ACCEPTS_HEADERS ||
        user_agent.to_s =~ MOBILE_USER_AGENT_FRAGMENTS )
  end
  
  # Create some methods to check for some popular mobile device types
  POPULAR_DEVICES.each do |type|
    class_eval <<-EOE
      def self.#{type}?( user_agent )
        !!(user_agent =~ %r{\#{MOBILE_USER_AGENTS[:#{type}]}}i)
      end
    EOE
  end
end