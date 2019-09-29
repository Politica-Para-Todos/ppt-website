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
    # cand.district has downcase and unicode_normalize filters so that the sort is accent insensitive.
    # e.g. Évora was showing up as last
    @candidates = @party.candidates.where(is_lead_candidate: true).sort_by { |cand| cand.district.downcase.unicode_normalize(:nfd) }
  end

  # GET /parties/:acronym/candidates/:district.json
  def district
    @party = Party.find_by(acronym: params[:acronym].upcase)
    @candidates = @party.candidates.where(district: params[:district])
    @lead_candidate = @candidates.where(is_lead_candidate: true)[0]
  end

  # GET /partiesdistrict/:district.json
  def partiesdistrict
    if params[:district] === "all"
      @parties = Party.all
    else 
      @parties = Party.joins(:candidates).where(candidates: {district: params[:district], is_lead_candidate: true})
    end

    User.joins(:tags).where.not(tags: { value: 'single' })
    # @lead_candidate = @candidates.where(is_lead_candidate: true)[0]
  end

  private

    def party_params
      params.require(:party).permit(:acronym, :logo, :name, :website, :email, :description, :description_source, :description_updated_at, :facebook, :twitter, :instagram)
    end

end
