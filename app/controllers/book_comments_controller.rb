class BookCommentsController < ApplicationController
  before_action :baria_user, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def baria_user
    comment = BookComment.find(params[:book_id])
    unless comment.user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
