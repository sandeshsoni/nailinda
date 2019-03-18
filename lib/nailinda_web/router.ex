defmodule NailindaWeb.Router do
  use NailindaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NailindaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/patient", PatientController
    resources "/receptionist", ReceptionistController
    resources "/doctor", DoctorController
    get "/hospital/new", HospitalController, :new
    post "/hospital", HospitalController, :create
    get "/hospital/:id", HospitalController, :show
    get "/hospitals", HospitalController, :index
    get "/hospital/:id/edit", HospitalController, :edit
    put "/hospital/:id", HospitalController, :update
    delete "/hospital/:id", HospitalController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", NailindaWeb do
  #   pipe_through :api
  # end
end
