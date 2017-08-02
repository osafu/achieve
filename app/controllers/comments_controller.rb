class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :destroy, :update]

  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @blog = @comment.blog
  end


  def update
    if @comment.update(comment_params)
      redirect_to blog_path(@comment.blog), notice: "コメントを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    render 'index'
  end


  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      #ブログのどのコメントの情報かを取得する
      @comment = Comment.find(params[:id])
    end
end
