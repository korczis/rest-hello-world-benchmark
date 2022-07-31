defmodule HelloWorldPhoenixWeb.PageController do
  use HelloWorldPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
