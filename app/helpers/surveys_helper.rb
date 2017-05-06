module SurveysHelper
  def element(type, name, label, current: nil)
    render partial: "surveys/elements/#{type}", locals: { name: name, label: label, current: current }
  end
end
