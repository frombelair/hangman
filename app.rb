require 'sinatra'
require 'rubygems'
require_relative 'hangman_class.rb'

enable :sessions



get '/' do
    erb :enter_word
end

post '/word' do
    session[:word] = params[:word]
    session[:blank_word] = Hangman.new(session[:word])
    session[:guessed_letters] = params[:letter_guess]
    redirect '/play_game'
end

get '/play_game' do
    session[:blank_word] = session[:play].blank_word
    erb :play_game, :locals => {:word => session[:word]}
end

