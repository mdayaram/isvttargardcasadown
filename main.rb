require "sinatra"
require "http"

get "/" do
  body = ""
  begin
    response = HTTP.head("https://vtt.asgard.casa/")
    if response.code < 400
      body = "VTT Asgard Casa is UP"
    else
      body = "VTT Asgard Casa is DOWN"
    end
  rescue
    body = "VTT Asgard Casa is DOWN"
  end

  body += "\n\n<br/><br/>Source: https://github.com/mdayaram/isvttasgardcasadown"
  return body
end
