module BartApiHelper
    def bart_api_request
     request = api_url + api_cmd + bart_api_key
    end

    def api_url
     @api_url = "http://api.bart.gov/api/route.aspx?"
    end

    def api_cmd
     @api_cmd = "cmd=routes&"
    end

    def bart_api_key
     @bart_api_key = "key="+Rails.application.secrets.bart_api_key
    end
end
