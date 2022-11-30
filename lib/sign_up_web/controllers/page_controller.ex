defmodule SignUpWeb.PageController do
  use SignUpWeb, :controller

  def index(conn, _params) do
    changeset = SignUp.User.changeset(%SignUp.User{},%{username: "", password: "", terms_and_conditions: false} )
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, params) do
    case SignUp.User.new(params["user"]) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "This is how we do it!")
        |> redirect(to: "/")

      {:error, changeset} ->
        conn
        |> put_flash(:error, "No way, José!")
        |> render("index.html", changeset: changeset)
    end
  end
end
