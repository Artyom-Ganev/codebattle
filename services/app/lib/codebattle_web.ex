defmodule CodebattleWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use CodebattleWeb, :controller
      use CodebattleWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: CodebattleWeb

      alias Codebattle.Repo

      import Ecto
      import Ecto.Query
      import CodebattleWeb.Router.Helpers
      import CodebattleWeb.Gettext
      import Phoenix.LiveView.Controller, only: [live_render: 3]
      alias CodebattleWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/codebattle_web/templates",
        namespace: CodebattleWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import CodebattleWeb.Router.Helpers
      import CodebattleWeb.ErrorHelpers
      import CodebattleWeb.Gettext
      import Phoenix.LiveView, only: [live_render: 2, live_render: 3, live_link: 1, live_link: 2]
      alias CodebattleWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      # alias Codebattle.Repo
      # import Ecto
      # import Ecto.Query
      import CodebattleWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
