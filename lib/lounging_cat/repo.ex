defmodule LoungingCat.Repo do
  use Ecto.Repo,
    otp_app: :lounging_cat,
    adapter: Ecto.Adapters.Postgres
end
