class ManifestoSectionsController < ApplicationController
  before_action :set_manifesto_section, only: [:show, :edit, :update, :destroy]

  # GET /manifesto_sections
  # GET /manifesto_sections.json
  def index
    @manifesto_sections = ManifestoSection.all
  end

  # GET /manifesto_sections/1
  # GET /manifesto_sections/1.json
  def show
  end

  # GET /manifesto_sections/new
  def new
    @manifesto_section = ManifestoSection.new
  end

  # GET /manifesto_sections/1/edit
  def edit
  end

  # POST /manifesto_sections
  # POST /manifesto_sections.json
  def create
    @manifesto_section = ManifestoSection.new(manifesto_section_params)

    respond_to do |format|
      if @manifesto_section.save
        format.html { redirect_to @manifesto_section, notice: 'Manifesto section was successfully created.' }
        format.json { render :show, status: :created, location: @manifesto_section }
      else
        format.html { render :new }
        format.json { render json: @manifesto_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manifesto_sections/1
  # PATCH/PUT /manifesto_sections/1.json
  def update
    respond_to do |format|
      if @manifesto_section.update(manifesto_section_params)
        format.html { redirect_to @manifesto_section, notice: 'Manifesto section was successfully updated.' }
        format.json { render :show, status: :ok, location: @manifesto_section }
      else
        format.html { render :edit }
        format.json { render json: @manifesto_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manifesto_sections/1
  # DELETE /manifesto_sections/1.json
  def destroy
    @manifesto_section.destroy
    respond_to do |format|
      format.html { redirect_to manifesto_sections_url, notice: 'Manifesto section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manifesto_section
      @manifesto_section = ManifestoSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manifesto_section_params
      params.require(:manifesto_section).permit(:manifesto_id, :manifesto_section_id, :kind, :position, :text)
    end
end
