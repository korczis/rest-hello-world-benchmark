defmodule HelloWorldPhoenixWeb.Router do
  use HelloWorldPhoenixWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {HelloWorldPhoenixWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWorldPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index

    live_dashboard "/dashboard", metrics: HelloWorldPhoenixWeb.Telemetry
  end

  scope "/api", HelloWorldPhoenixWeb do
    pipe_through :api

    get "/hello-world", ApiController, :hello_world
  end
end
