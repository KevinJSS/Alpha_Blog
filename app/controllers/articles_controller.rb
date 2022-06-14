class ArticlesController < ApplicationController

    def index
        get_articles
    end

    def show
        set_article
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