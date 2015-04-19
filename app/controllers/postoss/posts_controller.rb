require_dependency "postoss/application_controller"

module Postoss
  class PostsController < ApplicationController
    before_action :set_post!, only: [:edit, :update, :destroy]

    def index
      @posts = Post
        .preload(:category)
        .order(:id)
        .page(params[:page])
        .per(params[:per] || Global.kaminari.per)
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to posts_path
      else
        binding.pry
        render :new
      end
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

    def set_post!
      @post = Post.find(params[:id])
    end

    def post_params
      self.params
          .require(:post)
          .permit(:id, :category_id, :status_id, :title, :body, :thumbnail, :thumbnail_cache)
    end
  end
end
