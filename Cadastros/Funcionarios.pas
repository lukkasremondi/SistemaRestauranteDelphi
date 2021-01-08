unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFrmFuncionarios = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    rbNome: TRadioButton;
    rbCPF: TRadioButton;
    EdtBuscarNome: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtEndereco: TEdit;
    Label6: TLabel;
    cbCargo: TComboBox;
    grid: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    EdtCPF: TMaskEdit;
    EdtTel: TMaskEdit;
    EdtBuscarCPF: TMaskEdit;
    edtCodigo: TEdit;
    procedure rbCPFClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;

implementation

{$R *.dfm}


procedure LimparCampos();
begin
    With FrmFuncionarios do

    begin
    EdtNome.Text := '';
    EdtCPF.Text := '';
    EdtTel.Text := '';
    EdtEndereco.Text := '';

    end
end;


procedure HabilitarCampos();
begin
    With FrmFuncionarios do

    begin
    EdtNome.Enabled := True;
    EdtCPF.Enabled := True;
    EdtTel.Enabled := True;
    EdtEndereco.Enabled := True;
    cbCargo.Enabled := True;
    end
end;


procedure DesabilitarCampos();
begin
    With FrmFuncionarios do

    begin
    LimparCampos;
    EdtNome.Enabled := False;
    EdtCPF.Enabled := False;
    EdtTel.Enabled := False;
    EdtEndereco.Enabled := False;
    cbCargo.Enabled := False;
    end
end;

procedure TFrmFuncionarios.btnDeletarClick(Sender: TObject);
begin

        if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then

        begin
             if edtCodigo.Text <> '' then

                begin
               {SALVANDO OS DADOS}
                MessageDlg('Excluído com Sucesso', mtInformation, mbOKCancel, 0);
                DesabilitarCampos();
                btnEditar.Enabled := False;
                btnDeletar.Enabled := False;
                end
                else
                begin
                   MessageDlg('Selecione um Registro para Exclusão', mtInformation, mbOKCancel, 0);
                   edtNome.SetFocus;
                 end;



        end;





end;

procedure TFrmFuncionarios.btnEditarClick(Sender: TObject);
begin
     if (edtNome.Text <> '') and (edtCPF.Text <> '   .   .   -  ') then

         begin
             {SALVANDO OS DADOS}
              MessageDlg('Alterado com Sucesso', mtInformation, mbOKCancel, 0);

              DesabilitarCampos();
              btnEditar.Enabled := False;
              btnDeletar.Enabled := False;
        end
        else
        begin
           MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
           edtNome.SetFocus;
        end;

end;

procedure TFrmFuncionarios.btnNovoClick(Sender: TObject);
begin

HabilitarCampos();
LimparCampos();
btnSalvar.Enabled := True;
edtNome.SetFocus;
end;

procedure TFrmFuncionarios.btnSalvarClick(Sender: TObject);
begin
       if (edtNome.Text <> '') and (edtCPF.Text <> '   .   .   -  ') then

         begin
             {SALVANDO OS DADOS}
              MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel, 0);

              DesabilitarCampos();
              btnSalvar.Enabled := False;
        end
        else
        begin
           MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
           edtNome.SetFocus;
        end;



end;

procedure TFrmFuncionarios.gridCellClick(Column: TColumn);
begin
HabilitarCampos();
btnEditar.Enabled := True;
btnDeletar.Enabled := True;
end;

procedure TFrmFuncionarios.rbCPFClick(Sender: TObject);
begin
if rbCPF.Checked = True then
    EdtBuscarNome.Text := '';
     EdtBuscarNome.Visible := False;
      EdtBuscarCPF.Text := '';
     EdtBuscarCPF.Visible := True;
end;

procedure TFrmFuncionarios.rbNomeClick(Sender: TObject);
begin
      if rbCPF.Checked = True then
    EdtBuscarNome.Text := '';
     EdtBuscarNome.Visible := True;
      EdtBuscarCPF.Text := '';
     EdtBuscarCPF.Visible := False;
end;

end.
