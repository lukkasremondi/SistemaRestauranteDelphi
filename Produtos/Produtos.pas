unit Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TFrmProdutos = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    EdtNome: TEdit;
    EdtValor: TEdit;
    cbFornecedor: TComboBox;
    grid: TDBGrid;
    edtCodigo: TEdit;
    EdtBuscarNome: TEdit;
    EdtDescricao: TEdit;
    EdtQuantidade: TEdit;
    Label4: TLabel;
    imagem: TImage;
    btnAddImg: TButton;
    dialog: TOpenPictureDialog;
    procedure btnAddImgClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;
  caminhoImg: String;
implementation

{$R *.dfm}

procedure CarregarImagemPadrao();
begin
    caminhoImg  := ExtractFileDir(GetCurrentDir) + '\Debug\img\sem-foto.jpg';
    FrmProdutos.imagem.Picture.LoadFromFile(caminhoImg);

end;



procedure LimparCampos();
begin

    CarregarImagemPadrao();
    With FrmProdutos do

    begin

    EdtNome.Text := '';
    EdtDescricao.Text := '';
    EdtValor.Text := '';


    end
end;


procedure HabilitarCampos();
begin
    With FrmProdutos do

    begin
    EdtNome.Enabled := True;
    EdtDescricao.Enabled := True;
    EdtValor.Enabled := True;

    cbFornecedor.Enabled := True;
    btnAddImg.Enabled := True;
    end
end;


procedure DesabilitarCampos();
begin
    With FrmProdutos do

    begin
    LimparCampos;
   EdtNome.Enabled := False;
    EdtDescricao.Enabled := False;
    EdtValor.Enabled := False;

    cbFornecedor.Enabled := False;
    btnAddImg.Enabled := False;
    end
end;




procedure TFrmProdutos.btnAddImgClick(Sender: TObject);
begin
dialog.Execute();
imagem.Picture.LoadFromFile(dialog.FileName);
end;

procedure TFrmProdutos.btnDeletarClick(Sender: TObject);
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

procedure TFrmProdutos.btnEditarClick(Sender: TObject);
begin
if (edtNome.Text <> '') and (EdtDescricao.Text <> '   .   .   -  ') then

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

procedure TFrmProdutos.btnNovoClick(Sender: TObject);
begin

HabilitarCampos();
LimparCampos();
btnSalvar.Enabled := True;
edtNome.SetFocus;
end;

procedure TFrmProdutos.btnSalvarClick(Sender: TObject);
begin
if (edtNome.Text <> '') and (EdtDescricao.Text <> '   .   .   -  ') then

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

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
    CarregarImagemPadrao();
end;

end.
