defmodule Cauzzipay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cauzzipay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params) # Transforma os dados recebidos para o Schema acima
    |> validate_required(@required_params) # Verifica se todos os dados necessários estão presentes
    |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)
  end
end
