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
    if !@concept.user_editing_id.nil?
      respond_to do |format|
        format.html {redirect_to subjects_url, notice: 'Concepto en edición, no puedes editarlo'}
        format.json { head :no_content }
      end
    else
      current_user = User.find_by_id(session[:user_id])
      @concept.user_editing_id = current_user.id
      @concept.save
      @subject = Subject.find(params[:id])
    end
  end

  def create
    current_user = User.find_by_id(session[:user_id])

    @concept = Concept.new(concept_params)
    @concept = current_user.concepts.create(concept_params)

    respond_to do |format|
      if @concept.save
        record = Record.new
        record.action = Record::ACTION_CREATE
        record.input = Record::CONCEPT
        record.name_input = @concept.name
        record.user_name = current_user.name
        record.save
        format.html { redirect_to '/subjects', notice: 'El concepto fue correctamente agregado.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @concept.user_editing_id = nil
    @concept.save
    respond_to do |format|
      if @concept.update(concept_params)
        record = Record.new
        record.action = Record::ACTION_UPDATE
        record.input = Record::CONCEPT
        record.name_input = @concept.name
        record.user_name = current_user.name
        record.save
        format.html { redirect_to subjects_path, notice: 'El concepto fue correctamente actualizado.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user = User.find_by_id(session[:user_id])
    if @concept.user_id == current_user.id
      @concept.destroy
      record = Record.new
      record.action = Record::ACTION_DELETE
      record.input = Record::CONCEPT
      record.name_input = @concept.name
      record.user_name = current_user.name
      record.save
      respond_to do |format|
        format.html { redirect_to subjects_path, notice: 'El concepto fue eliminado exitosamente' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {redirect_to subjects_url, notice: 'No puedes eliminar este concepto debido a que no eres el autor'}
        format.json { head :no_content }
      end
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
