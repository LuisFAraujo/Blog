class TodosController < ApplicationController
    
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
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        respond_to do |format|  
            if @todo.update(todo_params)
                format.html {redirect_to todo_path(@todo), notice: "Todo was updated successfully"}
                
            else
                format.html { render :edit, status: :unprocessable_entity}
                  
            end  
        end

    end

    def edit
        @todo = Todo.find(params[:id])
    end
    
    def destroy 
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = "Todo was succesfully deleted"
        redirect_to todos_path
    end
    
    
    
    private

        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end