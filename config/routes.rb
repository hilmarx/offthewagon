Rails.application.routes.draw do

  devise_for :users
  # Home page should be pages#home
  root to: 'pages#home'

  # As a user, I want to see all available teachers, see indivudal profiles and create a new teacher profile for me
  # As a teacher, I want to edit my teacher profile
  resources 'bookings', only:[:new, :create, :index, :show, :edit, :update, :destroy]

  resources 'teachers', only:[:index, :show, :edit, :update, :new, :create] do
    # As a user, I want to see all my bookings create a new booking and delete it if I no longer want the session
    # As a teacher, I want to see all my bookings, edit their status and delete them
    resources 'bookings', only:[:destroy]
    # As a teacher, I want to show all my skills, add new skills and delete skills I no longer possess
    resources 'teacher_skills', only:[:index, :new, :create, :delete]
  end

end
