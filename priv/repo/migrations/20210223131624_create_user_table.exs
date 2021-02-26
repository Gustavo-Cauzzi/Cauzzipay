defmodule Cauzzipay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps() #Cria automaticamente o Create_at e Updated_at
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
