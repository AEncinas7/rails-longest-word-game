require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    # display a a new random grip and a form
    @letters = 10.times.map{ ("A".."Z").to_a.sample }
  end

  def score
    @input = params[:input]
    @grid = params[:grid].delete(" ").chars
    url = "https://wagon-dictionary.herokuapp.com/#{@input}"
    word_serialized = open(url).read
    @word = JSON.parse(word_serialized)
    @word_array = @word["word"].upcase.chars
  end
end
