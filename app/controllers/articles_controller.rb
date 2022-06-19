class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]

    def index
        get_articles
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article] #render a html page with the article info passed
        @article = Article.new(article_params)
        # @article.save #require validations
        respond_to do |format|
            if @article.save
                format.html {redirect_to article_url(@article), notice: "Article was successfully created!"}
                #format.json { render :show, status: :created, location: @article }
            else
                format.html { render :new, status: :unprocessable_entity }
                #format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
                format.json { render :show, status: :ok, location: @article }
              else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
              end
        end
    end

    def destroy
        @article.destroy
    
        respond_to do |format|
            format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    def get_articles
        @articles = Article.all
    end

    #Use callbacks to share common setup or constraint between actions
    def set_article
        @article = Article.find(params[:id])
    end

    #Only allow a list of trusted parameters through
    def article_params
        params.required(:article).permit(:title, :description)
    end
end