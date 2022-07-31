defmodule HelloWorldPhoenixWeb.ApiController do
  use HelloWorldPhoenixWeb, :controller

  def hello_world(conn, _params) do
    res = %{
      message: "Hello World!"
    }

    json(conn, res)
  end
end
