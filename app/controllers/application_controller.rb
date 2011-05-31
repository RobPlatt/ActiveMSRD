class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def wikify(input)
    references = ""
    input.scan(/\[(\w+):(.+)\]/) {|x, y|
      
      begin
        p = eval(x.camelize + '.from_wiki_link("' + y + '")')
        if p
          link = send(x + "_path", p)
        end
      rescue
        link = nil
      end
      
      if link
        references = references + "\n\n[" + x + ':' + y + ']: ' + link + ' "' + y + '"'
      end  
    }
    return Markdown::Document.new(input + references).to_html
  end
end
