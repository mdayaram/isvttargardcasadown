require "sinatra"
require "http"

get "/" do
  begin
    response = HTTP.head("https://vtt.asgard.casa/")
    if response.code < 400
      return "VTT Asgard Casa is UP"
    else
      return "VTT Asgard Casa is DOWN"
    end
  rescue
    return "VTT Asgard Casa is DOWN"
  end
end
