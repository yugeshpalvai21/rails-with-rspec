class RandomQuoteService
  def self.call
    url = "https://official-joke-api.appspot.com/random_joke"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
end