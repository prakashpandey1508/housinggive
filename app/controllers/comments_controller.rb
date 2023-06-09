class CommentsController < ApplicationController
  before_action :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment  = @commentable.comments.create(params.require(:comment).permit!)
    @comment.user_id=current_user.id

    if @comment.save
      redirect_to @commentable, notice: "Comment created."
      
    else
      render :new
    end
  end



  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: "Comment deleted."
  end




private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # alternative option:
  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end