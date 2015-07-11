class BartSchedule < ActiveRecord::Base
  after_initialize :default_values

  @@DELIMITER="&"
  
  def default_values
    @base_url = "http://api.bart.gov/"
    @api = "api/sched.aspx?"
    @cmd = "cmd="
    @params = ""
    @key = "key=" << Rails.application.secrets.bart_api_key
  end

  def get_departures(orig,dest)
    @cmd += "depart" + @@DELIMITER
    @params += "orig=" + orig + @@DELIMITER + "dest=" + dest + @@DELIMITER + "date=now" + @@DELIMITER + "b=0" + @@DELIMITER + "a=4" + @@DELIMITER

    url= URI(@base_url+@api+@cmd+@params+@key)
    response = Net::HTTP.get(url)
    Hash.from_xml(response).to_json
  end

  def get_arrivals(orig,dest)
    @cmd += "arrive" + @@DELIMITER
    @params += "orig=" + orig + @@DELIMITER + "dest=" + dest + @@DELIMITER + "date=now" + @@DELIMITER + "b=4" + @@DELIMITER + "a=1" + @@DELIMITER

    url= URI(@base_url+@api+@cmd+@params+@key)
    response = Net::HTTP.get(url)
    Hash.from_xml(response).to_json
  end
end
