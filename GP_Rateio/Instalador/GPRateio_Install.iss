
#define PastaArquivos "D:\Documentos\Gigatron\GigaProjetosXE8\GP_Rateio\Win32\Release\app"
#define OutPutDir "D:\Documentos\Gigatron\GigaProjetosXE8\GP_Rateio\Instalador"
#define MyAppName "GPRateio"
#define MyAppExeName "GP_Rateio.exe"
#define MyAppVersion GetFileVersion(PastaArquivos+'\'+MyAppExeName)
#define MyAppPublisher "GP Informática"
#define MyAppURL "http://gigatronbirigui.com.br/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A574BC54-A014-413D-8F83-7DF412C05ADB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Gigatron\GP\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
OutputDir={#OutPutDir}
OutputBaseFilename=GPRateio_Install_{#MyAppVersion}
Compression=lzma
SolidCompression=true
DisableDirPage=false
CloseApplications=force
MinVersion=0,6.0.6000
AppCopyright=Gigatron Birigui
;AppMutex=GPSync
AlwaysRestart=false
AppVerName={#MyAppName} {#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany=GP Informática
VersionInfoDescription=Tela de entrada manual para divisão em porcentagem
VersionInfoCopyright=Todos os direitos reservados

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Files]
Source: {#PastaArquivos}\base\GP_RATEIO.FDB; DestDir: {app}\Base; Flags: onlyifdoesntexist
Source: {#PastaArquivos}\GP_Rateio.exe; DestDir: {app}; Flags: ignoreversion
Source: {#PastaArquivos}\thema.tmh; DestDir: {app}
Source: {#PastaArquivos}\fbclient.dll; DestDir: {app}

[Code]
var
pagConf: TinputQueryWizardPage;

procedure InitializeWizard;
begin

pagConf := CreateInputQueryPage(wpWelcome, 'GP_Rateio',
           'Arquivo INI', 'Informe os parâmetros');
PagConf.Add('Informe o caminho da pasta app do GigaERP',False)
PagConf.Add('CNPJ do dono da licença (Sem pontos)',False)
PagConf.Add('Código da empresa padrão.',False)
PagConf.Add('Código da tabela de preços padrão.',False)

PagConf.Values[0] := 'C:\gigatron\GigaERP\app';
PagConf.Values[1] := '';
PagConf.Values[2] := '1';
PagConf.Values[3] := '1';

end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  Silent: Boolean;
  I: Integer;
begin
  Result:=True;

  Silent := False;
  For I:=1 to ParamCount do
  begin
    if UpperCase(ParamStr(I))='/SILENT' then
      Exit;
  end;
  if CurPageID = 1 then
    Exit;

  if Trim(PagConf.Values[0]) = '' then
  begin
    MsgBox('Informe o caminho da pasta app do GigaERP',mbError,mb_ok);
    Result:=False;
  end else
  begin
    if not FileExists(PagConf.Values[0]+'\GigaERP.ini') then
    begin
      MsgBox('A pasta app passda não é uma pasta de instalação do GigaERP.',mbError,mb_ok);
      Result:=False;
    end;
  end;
  if Trim(PagConf.Values[1]) = '' then
  begin
    MsgBox('Informe o CNPJ do dono da licença.',mbError,mb_ok);
    Result:=False;
  end else
  begin
    if Length(Trim(PagConf.Values[1])) < 14 then
    begin
      MsgBox('Informe um CNPJ com 14 caracteres.',mbError,mb_ok);
      Result:=False;
    end
  end
  if Trim(PagConf.Values[2]) = '' then
  begin
    MsgBox('Informe o ódigo da empresa padrão',mbError,mb_ok);
    Result:=False;
  end;
  if Trim(PagConf.Values[3]) = '' then
  begin
    MsgBox('Informe o código da tabela de preços padrão',mbError,mb_ok);
    Result:=False;
  end;

end;

function GigaPath(param: String): String;
begin
  Result := PagConf.Values[0];
end;
function CNPJ(param: String): String;
begin
  Result := PagConf.Values[1];
end;
function empresapadrao(param: String): String;
begin
  Result := PagConf.Values[2];
end;
function tabelapreco(param: String): String;
begin
  Result := PagConf.Values[3];
end;

[INI]
Filename: {app}\GP_Rateio.ini; Section: LIC_CONF; Key: CNPJ; String: {code:CNPJ}; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: CONFIG; Key: empresapadrao; String: {code:empresapadrao}; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: CONFIG; Key: GigaPath; String: {code:GigaPath}; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: CONFIG; Key: tabelapreco; String: {code:tabelapreco}; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: DB_CONF; Key: DataBase; String: LOCALHOST/3060:{app}\base\GP_RATEIO.FDB; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: DB_CONF; Key: Password; String: lib1503; Flags: createkeyifdoesntexist
Filename: {app}\GP_Rateio.ini; Section: DB_CONF; Key: User_Name; String: SYSDBA; Flags: createkeyifdoesntexist
[Run]
Filename: {app}\GP_Rateio.exe; WorkingDir: {app}; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Name: {app}; Type: filesandordirs
