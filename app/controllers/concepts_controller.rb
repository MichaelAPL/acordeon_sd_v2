class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]

  def index
    @concept = Concept.all
  end

  def show
  end

  def new
    @subject = Subject.find(params[:id])
    @concept = Concept.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    current_user_id = User.find_by_id(session[:current_user_id])
    concept_params[:created_by_user_id] = current_user_id
    @concept = Concept.new(concept_params)

    respond_to do |format|
      if @concept.save
        format.html { redirect_to '/subjects', notice: 'El concepto fue correctamente agregado.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to subjects_path, notice: 'El concepto fue correctamente actualizado.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to subjects_path, notice: 'El concepto fue eliminado exitosamente' }
      format.json { head :no_content }
      end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_concept
    @concept = Concept.find(params[:id_concept])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def concept_params
    params.require(:concept).permit(:name, :definition, :subject_id)
  end
end
