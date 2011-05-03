require 'thor'
require 'scissors'

module Scissors
  class CLI < Thor
    desc "test", "Does stuff"
    def test
      puts "Muh yah Help motherfucker"
    end
  end
end

