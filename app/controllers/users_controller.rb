class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        require_logged_in
        @user = User.find(params[:id])
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to(
                controller: 'experiences',
                action: 'index'
            )
        else
            redirect_to(
                controller: 'users',
                action: 'new'
            )
            @user.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.update(user_params)
        if @user.save
            redirect_to(
                controller: 'experiences',
                action: 'index'
            )
        else
            redirect_to(
                controller: 'users',
                action: 'edit'
            )
            @user.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def destroy
        User.find_by(id: session[:user_id]).destroy
        redirect_to('/')
    end

private

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

end