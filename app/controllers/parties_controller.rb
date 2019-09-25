class PartiesController < InheritedResources::Base

  # GET /parties/:acronym/manifesto.json
  def manifesto
    # currently we only have 1 manifesto per party
    @manifesto = Party.find_by(acronym: params[:acronym].upcase).manifestos[1]
    # only first level sections
    @manifesto_sections = @manifesto.manifesto_sections.where(manifesto_section_id: nil).sort_by { |section| section.position }
  end

  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/:acronym.json
  def show
    @party = Party.find_by(acronym: params[:acronym].upcase)
    @candidates = @party.candidates.where(position: 1).sort_by { |cand| cand.district }
  end

  private

    def party_params
      params.require(:party).permit(:acronym, :logo, :name, :website, :email, :description, :description_source, :description_updated_at, :facebook, :twitter, :instagram)
    end

end
