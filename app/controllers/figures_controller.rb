class FiguresController < ApplicationController

  #INDEX ACTION
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  #NEW ACTION
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  #CREATE ACTION - takes in the data & in the controlller we edit the data to how you want to it to be
  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @landmarks = params[:figure][:landmark_ids]
    @titles = params[:figure][:title_ids]
    @landmarks.each do |landmark|
      land_mark = Landmark.find(landmark.to_i)
      @figure.landmarks << land_mark #we're making the association btwn an instance of landmark and the landmark figure
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    @titles.each do |title|
      ti_tle = Title.find(title)
      @figure.titles << ti_tle
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  #SHOW ACTION
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/show'
  end

  #EDIT ACTION
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  #UPDATE ACTION
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    redirect to "figures/#{@figure.id}"
  end

  #DESTROY ACTION

  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.destroy
    redirect '/figures'
  end

end
