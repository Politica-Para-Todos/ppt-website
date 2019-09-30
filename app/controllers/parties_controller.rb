class PartiesController < InheritedResources::Base

  # GET /parties/:acronym/manifesto.json
  def manifesto
    # currently we only have 1 manifesto per party
    @manifesto = Party.find_by(acronym: params[:acronym].upcase).manifestos[0]
    # only first level sections
    @manifesto_sections = @manifesto.manifesto_sections.where(manifesto_section_id: nil).sort_by { |section| section.position }
  end

  # GET /parties.json
  def index
    @parties = Party.all.where.not(name: nil)
  end

  # GET /parties/:acronym.json
  def show
    if ["PCP", "PEV"].include?(params[:acronym])
      acronym = "PCP-PEV"
    else
      acronym = params[:acronym]
    end

    @party = Party.find_by(acronym: acronym.upcase)
    # cand.district has downcase and unicode_normalize filters so that the sort is accent insensitive.
    # e.g. Évora was showing up as last
    @candidates = @party.candidates.where(is_lead_candidate: true).sort_by { |cand| cand.district.downcase.unicode_normalize(:nfd) }

    if acronym == "PCP-PEV"
      @manifestos = ["PCP", "PEV"]
    else
      @manifestos = [@party.acronym]
    end
  end

  # GET /parties/:acronym/candidates/:district.json
  def district
    @party = Party.find_by(acronym: params[:acronym].upcase)
    @candidates = @party.candidates.where(district: params[:district])
    @lead_candidate = @candidates.where(is_lead_candidate: true)[0]
  end

  private

    def party_params
      params.require(:party).permit(:acronym, :logo, :name, :website, :email, :description, :description_source, :description_updated_at, :facebook, :twitter, :instagram)
    end

end
