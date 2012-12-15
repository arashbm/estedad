Rails.configuration.default_filledforms_states = [ :not_reviewed, :reviewed, :review_failed, :process_failed, :processing, :successful ]

Rails.configuration.field_types = YAML.load_file("#{Rails.root}/config/types.yml")
