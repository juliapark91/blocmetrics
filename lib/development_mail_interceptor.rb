class DevelopmentMailInterceptor
  
  def self.delivering_email( message )
    message.subject = "#{message.to} #{message.subject}"
    message.to = ENV['DEFAULT_EMAIL'] || "juliabloctest@gmail.com"
    message.cc = nil
    message.bcc = nil
  end
  
end
