defmodule App1.Repo do
  use Ecto.Repo,
    otp_app: :app1,
    adapter: Ecto.Adapters.Postgres
end
