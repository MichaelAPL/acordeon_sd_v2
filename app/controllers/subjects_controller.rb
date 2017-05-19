class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    current_user = User.find_by_id(session[:user_id])
    @concept = Concept.find_by_user_editing_id(current_user.id)
    if !@concept.nil? && (current_user.id == @concept.user_editing_id)
      @concept.user_editing_id = nil
      @concept.save
    end
    @concepts = Concept.all
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        record = Record.new
        record.action = Record::ACTION_CREATE
        record.input = Record::SUBJECT
        record.user_name = current_user.name
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        record = Record.new
        record.action = Record::ACTION_UPDATE
        record.input = Record::SUBJECT
        record.user_name = current_user.name
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    if isAssociatedWithConcept(@subject.id)
      respond_to do |format|
        format.html { redirect_to subjects_url, notice: 'No es posible eliminar un tema que tiene conceptos relacionados'}
        format.json { head :no_content}
      end
    else
      @subject.destroy
      record = Record.new
      record.action = Record::ACTION_DELETE
      record.input = Record::SUBJECT
      record.user_name = current_user.name
      respond_to do |format|
        format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def isAssociatedWithConcept(subject_id)
    concepts = Concept.all

    concepts.each do |concept|

      if concept.subject.id == subject_id
        return true
      end
    end
    return false
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subject_params
    params.require(:subject).permit(:name)
  end
end
