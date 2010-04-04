# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rock_paper_scissors_session',
  :secret      => '15017c9868c7912f1c1064284328872bb938db6cd5e6019b459121529bb8d371b7a8d7fb381747ced06a37910fb6a89a39b931cc50af4cbdd5a15ca15da411d2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
