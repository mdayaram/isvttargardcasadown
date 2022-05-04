require "sinatra"
require "http"

get "/" do
  body = "VTT Asgard Casa is..."
  begin
    response = HTTP.head("https://vtt.asgard.casa/")
    if response.status.redirect?
      location = response.headers["Location"]
      if location.start_with?("/auth")
        body += "UP...but it's showing the Administrator screen."
      elsif location.start_with?("/join") or location.start_with?("/game")
        body += "UP!"
      else
        body += "DOWN"
      end
    else
      body += "DOWN"
    end
  rescue
    body += "DOWN"
  end

  body += "\n\n<br/><br/>Source: https://github.com/mdayaram/isvttasgardcasadown"
  return body
end
