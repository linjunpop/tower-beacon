class TodosController < ApplicationController
  before_action :set_project
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :mark_as_done, :assign]

  # GET /todos
  # GET /todos.json
  def index
    @filter = params[:status] ||= :pending

    @todos =
      scoped
      .order(created_at: :desc)
      .where(status: params[:status])
      .normal
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = TodoService.create_todo(todo_params)
    respond_to do |format|
      if @todo.persisted?
        format.html { redirect_to project_todos_path(@project), notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if TodoService.update_todo(@todo, todo_params)
        format.html { redirect_to project_todos_path(@project), notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    TodoService.destroy_todo(@todo)
    respond_to do |format|
      format.html { redirect_to project_todos_url(@project), notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_done
    respond_to do |format|
      if TodoService.mark_todo_as_done(@todo)
        format.html { redirect_to project_todos_path(@project), notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def assign
    respond_to do |format|
      if TodoService.assign_todo(@todo, assign_params[:assignee_id])
        format.html { redirect_to project_todos_path(@project), notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_project
      # TODO should be current_user.projects.find(...)
      @project = Project.find(params[:project_id])
    end

    def scoped
      @project.todos
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:content, :status, :project_id, :creator_id)
    end

    def assign_params
      params.require(:todo).permit(:assignee_id)
    end
end
