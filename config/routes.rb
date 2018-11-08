Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  devise_for :users
  # Home page should be pages#home
  root to: 'pages#home'

  # As a user, I want to see all available teachers, see indivudal profiles and create a new teacher profile for me
  # As a teacher, I want to edit my teacher profile
  resources 'teachers', only:[:index, :show, :edit, :update, :new, :create] do
    # As a user, I want to see all my bookings create a new booking and delete it if I no longer want the session
    # As a teacher, I want to see all my bookings, edit their status and delete them
    resources 'bookings', only:[:index, :show, :new, :create, :edit, :update, :delete]
    # As a teacher, I want to show all my skills, add new skills and delete skills I no longer possess
    resources 'teacher_skills', only:[:index, :new, :create, :delete]
  end

end
