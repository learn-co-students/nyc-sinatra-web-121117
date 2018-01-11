class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @figure = Figure.find_or_create_by(name: params[:landmark][:figure])
    @title = Title.find_or_create_by(name: params[:landmark][:title])
    @landmark.figure =  @figure
    @figure.titles << @title
    @figure.save
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @landmark_figure = @landmark.figure
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.destroy
    redirect "/landmarks"
  end
end
