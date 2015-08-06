class Postoffice < ActionMailer::Base
  
  # Taken From <http://www.jonathansng.com/ruby-on-rails/rails-send-email-tutorial/>
  
  # located in models/postoffice.rb
  # make note of the headers, content type, and time sent
  # these help prevent your email from being flagged as spam
  
  # These are temp vals

    def comment_posted(name, comment, ip)
      @recipients   = "mark@ctremail.com"
      @from         = "noreply@sitewebbing.com"
      headers         "Reply-to" => "#{comment}"
      @subject      = "Comment Posted"
      @sent_on      = Time.now
      @content_type = "text/html"

      body[:name]  = name
      body[:email] = comment
      body[:ip] = ip     
    end  
  
end
