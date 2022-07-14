class PostImagesController < ApplicationController
    def new
      @post_image = PostImage.new
    end
    # 投稿データの保存
    def create
      @post_image = PostImage.new(post_image_params)
      @post_image.user_id = current_user.id 
      @post_image.save
      redirect_to post_images_path
    end
    
    def show
      @post_image = PostImage.find(params[:id]) 
      @post_comment = PostComment.new
    end
    
    # アクション名
    # @でindex.html.erbで使えるようになる
    # @なしではファイル内のみでの使用
    def index
      @post_images = PostImage.all
    end
    
    def destroy
      @post_image = PostImage.find(params[:id])
      @post_image.destroy
      redirect_to '/post_images'
    end

   private
   
    def post_image_params
      params.require(:post_image).permit(:shop_name, :caption, :image)
    end
end
