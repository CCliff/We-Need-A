class UsersController < ApplicationController

  get '/' do
    content_type :json
    User.sport(params['sport']).location(params['locations']).to_json
  end

  get '/new' do

  end

  post '/new' do
    user = User.new(username: params[:username])
    user.password = params[:password]
    user.save!
  end

  post '/image/new' do
    user = User.find_by(current_user)
    s3 = AWS::S3.new
    # file =
    key = File.basename(file)

    s3.buckets['weneedauserpicture'].objects[key].write(:file => file)

    user.image = "https://s3-us-west-2.amazonaws.com/weneedauserpicture/#{key}"
  end

  get '/:id' do
    content_type:json
    User.find(params[:id]).to_json
  end

  get '/:id/edit' do
    content_type:json
    User.find(params[:id]).to_json
  end

  patch '/:id/edit' do
    user = User.find(params[:id])
    user.update(params[:user])
  end

  delete '/:id' do
    user = User.find(params[:id])
    user.destroy
  end

end

# s3 = AWS::S3.new


# key = File.basename('/home/ccliff/Downloads/538581_10151221673158413_985166129_n.jpg')

# s3.buckets['weneedauserpicture'].objects[key].write(:file => '/home/ccliff/Downloads/538581_10151221673158413_985166129_n.jpg')
