def create_survey(slug, label)
  Survey.find_or_create_by(slug: slug, label: label)
end

def create_question(survey, slug, label)
  Question.find_or_create_by(survey: survey, slug: slug, label: label)
end

survey = create_survey("may-2017", "May 2017 Community Survey")

create_question(survey, "pro-tourism", "Tourism boost")
create_question(survey, "pro-property-values", "Increase property values")
create_question(survey, "pro-personal-use", "Personal Use")
create_question(survey, "pro-transportation", "Transportation")
create_question(survey, "pro-cleanup-land", "Cleanup Land")
create_question(survey, "pro-other", "Other")

create_question(survey, "con-property-value", "Decreased property value")
create_question(survey, "con-loss-of-land", "Loss of land")
create_question(survey, "con-privacy", "Privacy")
create_question(survey, "con-safety", "Safety and security")
create_question(survey, "con-building-costs", "Planning and building costs")
create_question(survey, "con-maintenance-costs", "Long-term maintenance costs")
create_question(survey, "con-other", "Other")
