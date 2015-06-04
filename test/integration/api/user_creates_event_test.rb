require 'test_helper'

module API

  class UserCreatesEventTest < ActionDispatch::IntegrationTest    
    test "user creates a event successfully" do
      registered_application = registered_applications(:valid)
      
      assert_difference('Event.count') do
        post '/api/events', 
          { event:
            { name: 'foobar' }
          }.to_json,
          { 'Accept': Mime::JSON, 'Content-Type': Mime::JSON.to_s, "Origin": registered_application.url }
      end
      
      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type
    end
  
    test "user creates an event unsuccessfully" do
      registered_application = registered_applications(:invalid)
      
      assert_difference('Event.count') do
        post '/api/events', 
          { event:
            { name: nil }
          }.to_json,
          { 'Accept': Mime::JSON, 'Content-Type': Mime::JSON.to_s, "Origin": registered_application.url }
      end
        
      assert_equal 422, response.status
      assert_equal Mime::JSON, response.content_type
    end
  end

end