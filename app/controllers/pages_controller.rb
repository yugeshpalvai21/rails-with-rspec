class PagesController < ApplicationController
  def home
    @random_quote = RandomQuoteService.call
  end
end
