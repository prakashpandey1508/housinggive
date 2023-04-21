class Api::V1::CommentsController < ActionController::API
  def index
    comments=Comment.all
    render json:comments, status:200 
  end

  def show
    comments=Comment.find_by(id: params[:id])
    if comments.present?
      render json:comments, status:200
    else
      render json:{error: "there is no comments"}
    end
  end

  def create
    comments=Comment.new(comment_params)
    debugger
    if comments.save
      render json:comments, status:200
    else
      render json:{error: "not saved"}
    end
  end
  def update
    comments=Comment.find_by(id: params[:id])
    if comments.update(comment_params)
      render json:comments, status:200
    else
      render json:{error:"comments is not updated"}
    end
  end

   def destroy
    comments=Comment.find_by(id: params[:id])
       comments.destroy
       render json:comments
   end
  private 
  def comment_params
    params.require(:comment).permit(:user_id, :commentable_id, :commentable_type, :content)
  end
end
