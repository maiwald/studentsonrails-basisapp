class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /comments/new
  def new
    @post = Post.find(params['post_id'])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @post = @comment.post
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params['post_id'])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(params['post_id']), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(params['post_id']), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(params['post_id'])}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :title, :content)
    end
end
