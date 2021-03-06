class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was succexsfully created"
            redirect_to article_path(@article)
        else
            render :new
        end
        
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was succexfully updated"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
      @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "article was succexfully deleted"
        redirect_to articles_path
    end

    private 
    def article_params
        params.require(:article).permit(:title, :description)
    end

end