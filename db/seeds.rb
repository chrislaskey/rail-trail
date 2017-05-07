def create_survey(slug, label)
  Survey.find_or_create_by(slug: slug, label: label)
end

def create_question(survey, slug, label, type = "multiple_choice")
  Question.find_or_create_by(survey: survey, slug: slug, label: label, response_type: type)
end

survey = create_survey("may-2017", "May 2017 Community Survey")

create_question(survey, "pro_tourism", "Tourism boost")
create_question(survey, "pro_property_values", "Increase property values")
create_question(survey, "pro_personal_use", "Personal Use")
create_question(survey, "pro_transportation", "Transportation")
create_question(survey, "pro_cleanup_land", "Cleanup Land")
create_question(survey, "pro_other", "Other")
create_question(survey, "pro_top", "Top Pro")

create_question(survey, "con_property_value", "Decreased property value")
create_question(survey, "con_loss_of_land", "Loss of land")
create_question(survey, "con_privacy", "Privacy")
create_question(survey, "con_safety", "Safety and security")
create_question(survey, "con_building_costs", "Planning and building costs")
create_question(survey, "con_maintenance_costs", "Long-term maintenance costs")
create_question(survey, "con_other", "Other")
create_question(survey, "con_top", "Top Concern")

create_question(survey, "support", "Support the idea of Rail Trail")
create_question(survey, "selectmen_vote", "Vote on Article 18")
create_question(survey, "town_action", "Town Action", "open_ended")
create_question(survey, "survey_feedback", "Survey Feedback", "open_ended")
