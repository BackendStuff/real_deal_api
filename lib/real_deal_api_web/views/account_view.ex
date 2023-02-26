defmodule RealDealApiWeb.AccountView do
  use RealDealApiWeb, :view
  alias RealDealApiWeb.{AccountView, UserView}

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{
      email: account.email
    }
  end

  def render("full_account.json", %{account: account}) do
    %{
      email: account.email,
      user: render_one(account.user, UserView, "user.json")
    }
  end

  def render("account_token.json", %{account: account, token: token}) do
    %{
      email: account.email,
      token: token
    }
  end
end
