defmodule PhoenixCsvWeb.PageController do
  use PhoenixCsvWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
