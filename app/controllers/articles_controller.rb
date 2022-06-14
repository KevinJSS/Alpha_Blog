class ArticlesController < ApplicationController
    def show
        set_article
    end

    private
    #Use callbacks to share common setup or constraint between actions
    def set_article
        @article = Article.find(params[:id])
    end

    #Only allow a list of trusted parameters through
    def article_params
        params.required(:article).permit(:title, :description)
    end
end