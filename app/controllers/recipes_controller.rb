class RecipesController < ApplicationController
    before_action :authenticate_user!, except: %i[public show]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        @recipe.user = current_user
        if @recipe.valid?
            @recipe.save
            redirect_to recipes_path
        else
            render 'new'
        end
    end

    def public
        @recipes = Recipe.where(public: true)
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        if @recipe.user.id == current_user.id
          @recipe.destroy
          redirect_to recipes_path
        end
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
    end
end
