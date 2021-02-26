defmodule Cauzzipay.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cauzzipay.Account
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age, :email, :password, :nickname]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true # Não será guardado no banco
    field :password_hash, :string
    field :nickname, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params) # Transforma os dados recebidos para o Schema acima
    |> validate_required(@required_params) # Verifica se todos os dados necessários estão presentes
    |> validate_length(:password, min: 6) # Password não pode ser menor que 6
    |> validate_number(:age, greater_than_or_equal_to: 18) # Age não pode ser menor ou igual a 18
    |> validate_format(:email, ~r/@/) # Email tem que ter um "@" com caracteres antes ou depois
    |> unique_constraint([:email]) # Email tem que ser único
    |> unique_constraint([:nickname]) # Nickname tem que ser único
    |> put_password_hash() # Transforma o password que nos foi dado em um Hash para guardarmos no banco
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
