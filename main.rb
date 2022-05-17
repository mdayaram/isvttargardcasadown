require "sinatra"
require "http"

get "/" do
  header_start = "<html><head><title>"
  header_end = "</title></head>"
  body_start = "<body>"
  body_end = "\n\n<br/><br/>"
  body_end += "Source: <a href=\"https://github.com/mdayaram/isvttasgardcasadown\">"
  body_end += "https://github.com/mdayaram/isvttasgardcasadown</a>"

  status = "VTT Asgard Case is..."
  begin
    response = HTTP.head("https://vtt.asgard.casa/")
    if response.status.redirect?
      location = response.headers["Location"]
      if location.start_with?("/auth")
        status += "UP...but it's showing the Administrator screen."
      elsif location.start_with?("/join") or location.start_with?("/game")
        status += "UP!"
      else
        status += "DOWN"
      end
    else
      status += "DOWN"
    end
  rescue
    status += "DOWN"
  end

  return header_start + status + header_end + body_start + status + body_end
end
