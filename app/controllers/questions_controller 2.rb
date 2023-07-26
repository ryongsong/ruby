class QuestionsController < ApplicationController

  # 質問一覧表示
  def index
    @questions = Question.all

  end

  # 質問詳細ページ表示
  def show
     @question = Question.find(params[:id])
  end

  # 質問の作成フォーム表示
  def new
    @question = Question.new
  end

  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)

    # Questionをdbへ保存
    if @question.save
      # showへリダイレクト
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end


  # 質問の編集フォーム表示
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    # ここに質問を削除するためのコードを追加
  end


  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end


end
