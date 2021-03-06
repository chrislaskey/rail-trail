module SurveysHelper
  def element(type, name, label, current = nil)
    update_call_count
    render  partial: "surveys/elements/#{type}",
            locals: {
              name: name,
              label: label,
              current: current,
              classes: classes
            }
  end

  def get_answer(key)
    records = @answers.fetch(key, nil)
    return nil unless records.present?
    records.first.answer.to_s
  end

  private

  def update_call_count
    @call_count = 0 unless @call_count.present?
    @call_count += 1
  end

  def classes
    @call_count.even? ? "even" : "odd"
  end
end
