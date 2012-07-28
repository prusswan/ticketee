require 'nokogiri'
class LinkJumbler

  def initialize(app, letters)
    @app = app
    @letters = letters
  end

  def call(env)
    status, headers, response = @app.call(env)

    if response.class.to_s == "ActionDispatch::Response"
      body = Nokogiri::HTML(response.body)
      body.css("a").each do |a|
        @letters.each do |find, replace|
          a.content = a.content.gsub(find.to_s, replace.to_s)
        end
      end
      response.body = body.to_s
    end

    [status, headers, response]
  end
end
