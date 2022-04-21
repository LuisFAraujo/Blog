class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :edit, :destroy]

    def index 
        @todos = Todo.all
    end
    def create 
        @todo = Todo.new(todo_params)            
        respond_to do |format|  
            if @todo.save
                format.html {redirect_to todo_path(@todo), notice: "Todo was created successfully"}              
            else
                format.html { render :new, status: :unprocessable_entity}              
            end  
        end
    end

    def new
        @todo = Todo.new
    end

    def show
    end

    def update

        respond_to do |format|  
            if @todo.update(todo_params)
                format.html {redirect_to todo_path(@todo), notice: "Todo was updated successfully"}                
            else
                format.html { render :edit, status: :unprocessable_entity}                
            end  
        end

    end

    def edit
    end
    
    def destroy 
        @todo.destroy
        respond_to do |format|
            format.html {redirect_to todos_path, notice: "Todo was deleted successfully", status: :see_other}
        end
    end
    
    
    
    private
        def set_todo
            @todo = Todo.find(params[:id])
        end
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end