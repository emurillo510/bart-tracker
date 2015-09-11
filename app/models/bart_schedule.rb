class BartSchedule < ActiveRecord::Base
  after_initialize :default_values

  $DELIMITER="&"
  $base_url = "http://api.bart.gov/"
  $key = "key=" << Rails.application.secrets.bart_api_key
  
  def self.get_schedule(cmd,orig,dest)
    api = "api/sched.aspx?"
    cmd = "cmd=" + cmd + $DELIMITER
    params = "orig=" + orig + $DELIMITER + "dest=" + dest + $DELIMITER + "date=now" + $DELIMITER + "b=0" + $DELIMITER + "a=4" + $DELIMITER
    
    api_request = URI($base_url+api+cmd+params+$key)
    bart_api_request(api_request)
  end

  def self.get_stations(cmd)
    api = "api/stn.aspx?"
    cmd = "cmd=" + cmd + $DELIMITER

    api_request = URI($base_url+api+cmd+$key)
    bart_api_request(api_request)
  end

  private
  def self.bart_api_request(url)
    api_response = Net::HTTP.get(url)

    @xml = Nokogiri::XML(api_response)
    response = characters = @xml.css('root').to_xml
    json_response = Hash.from_xml(response).to_json
  end
end
