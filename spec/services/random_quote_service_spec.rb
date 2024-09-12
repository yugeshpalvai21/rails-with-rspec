require 'rails_helper'

RSpec.describe RandomQuoteService, type: :service do
  it 'fetches random quote from api', :vcr do
    random_quote = RandomQuoteService.call

    puts random_quote

    expect(random_quote).to be_a(Hash)
    expect(random_quote.key?('setup')).to be true
  end
end 