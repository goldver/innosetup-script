;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Program Name:        Installer    
;; Description:         Installation system
;; Created by:          Michael Vershinin
;; Created date:        08/04/2015
;; Last Modifyer:       Michael Vershinin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; version
; 1. For the versioning to work correctly, vbuild must constantly increase for every release.
; 2. vbuild starts out at 1000 and will increment every build for the life of the program.
; 3. For example, it would go v1.5.1001, then v1.6.1002, then v1.7.1004, etc.
; 4. This behaviour can be altered to suit other versioning schemes by changing the functions below.
#define vmajor 2
#define vminor 0
#define vbuild 0

#define MyAppId "iGreenFromIosight"
#define myappname "iGreen"
#define url "http://www.iosight.com"
#define company "iGreen"
#define outputdir "."
#define setupicon "Resources\_images\IOSight.ico"
#define license "Resources\_licenses\IOsAgreement.txt"

[Setup]
AppName={#myappname} v{#vmajor}.{#vminor}.{#vbuild}
AppVersion={#vmajor}.{#vminor}.{#vbuild}
AppCopyright={#company}
AppVerName={#myappname} v{#vmajor}.{#vminor}.{#vbuild}
AppPublisher={#url}
AppPublisherURL={#url}
AppSupportURL={#url}
AppUpdatesURL={#url}
DefaultDirName={pf}\{#myappname}
DefaultGroupName={#company}
VersionInfoVersion={#vmajor}.{#vminor}.{#vbuild}
VersionInfoCompany={#company}
VersionInfoProductName={#company}
VersionInfoProductVersion={#vmajor}.{#vminor}.{#vbuild}
UninstallDisplayName={#company}
OutputBaseFilename={#myappname} v{#vmajor}.{#vminor}.{#vbuild}
OutputDir={#outputdir}
UninstallDisplayIcon={uninstallexe}
SetupIconFile={#setupicon}
LicenseFile ={#license}
AppId=  iGreenFromIosight
AppComments=by Mishka
Compression = lzma
SolidCompression=yes
PrivilegesRequired=none
TimeStampsInUTC=True
AllowRootDirectory=True
DirExistsWarning=yes
UsePreviousLanguage=No

#include "uninshs.iss"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "he"; MessagesFile: "compiler:Languages\Hebrew.isl"

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Dirs]
Name: "{app}\_Log"
Name: "{app}\_Log\IO_Values"
Name: "{app}"; Permissions: users-modify
Name: "C:\inetpub\wwwroot"; Permissions: users-modify 

[Icons]
Name: "{userdesktop}\iGreen Win Client"; Filename: "{app}\iGreenWinClient\IOSIGHT.Win.Client.exe"; WorkingDir: "{app}"; Components: iGreenWinClient
Name: "{userdesktop}\iGreen ETL OPC"; Filename: "{app}\iGreenETLOPC\IOSIGHT.Agent.exe"; WorkingDir: "{app}"; Components: iGreenETLOPC
Name: "{userdesktop}\iGreen Analyzer"; Filename: "{app}\iGreenAnalyzer\IOSight.ReportScheduler.ReportSchedulerApp.exe"; WorkingDir: "{app}"; Components: iGreenAnalyzer 
Name: "{userdesktop}\iGreen ETL Files"; Filename: "{app}\iGreenETLFiles\ETL_Agent.exe"; WorkingDir: "{app}"; Components: iGreenETLFiles

[Components]
Name: "Server"; Description: "iGreen Analytic Server"; Types: full compact; Flags: DisableNoUninstallWarning;
Name: "iGreenWinClient"; Description: "iGreen Win Client"; Types: full compact; Flags: DisableNoUninstallWarning;
Name: "iGreenETLFiles"; Description: "iGreen ETL Files"; Types: full compact;  Flags: DisableNoUninstallWarning;
Name: "iGreenETLOPC"; Description: "iGreen ETL OPC"; Types: full; Flags: DisableNoUninstallWarning;
Name: "iGreenETLDB"; Description: "iGreen ETL Database"; Types: full; Flags: DisableNoUninstallWarning; 
Name: "iGreenAnalyzer"; Description: "iGreen Analyzer"; Types: full; Flags: DisableNoUninstallWarning;
Name: "Dashboard"; Description: "iGreen Web Dashboard"; Types: full; Flags: DisableNoUninstallWarning;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Name: "ReleaseNote"; Description: "Release Note"; Types: full; Flags: DisableNoUninstallWarning;

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: files; Name: "{userdesktop}\iGreen Win Client"
Type: files; Name: "{userdesktop}\iGreen ETL OPC"
Type: files; Name: "{userdesktop}\iGreen ETL Files"
Type: files; Name: "{userdesktop}\iGreen Analyzer"

[InstallDelete]
Type: filesandordirs; Name:  "C:\inetpub\wwwroot\IOSightWS"
Type: filesandordirs; Name:  "C:\inetpub\wwwroot\Dashboard"
Type: filesandordirs; Name:  "{app}\iGreenWinClient"
Type: filesandordirs; Name:  "{app}\iGreenETLOPC"
Type: filesandordirs; Name:  "{app}\iGreenETLFiles"
Type: filesandordirs; Name:  "{app}\iGreenAnalyzer"
Type: filesandordirs; Name:  "{app}\iGreenScheduler"

[CustomMessages]
; SQL Page area
CustomForm_Caption=Connect to Database Server
CustomForm_Description=Enter the information required to connect to the database server
CustomForm_lblServer_Caption0=Server name:
CustomForm_lblAuthType_Caption0=Log on credentials
CustomForm_lblUser_Caption0=User name:
CustomForm_lblPassword_Caption0=Password:
CustomForm_lblDatabase_Caption0=Existing Database:
CustomForm_lblVersion_Caption0=SQL Version:
CustomForm_chkSQLAuth_Caption0=Use SQL Server Authentication
CustomForm_chkWindowsAuth_Caption0=Use Windows Authentication
CustomForm_lstVersion_Line0=2008 R2
CustomForm_lstVersion_Line1=2012
CustomForm_chkNewDatabase=New Database
CustomForm_lblDatabase_Caption1=New Database:
CustomForm_lblCaptionDatabase_Caption0=Select Database:

[Files]
; Resources ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Logs
Source: "Resources\_logs\log4net_config.config"; DestDir: "{app}\_Log"
Source: "Resources\_logs\nlog_config.config"; DestDir: "{app}\_Log"
; Images
Source: "Resources\_images\LogoIgreen.bmp"; DestDir: "{tmp}"; Flags: dontcopy
; Files
Source: "ReleaseNotes.txt"; DestDir: "{app}"; Flags: isreadme; Components: ReleaseNote
; Utils
Source: "Resources\_utils\HashEncription.exe"; DestDir: "{tmp}"; Flags: dontcopy
Source: "Resources\_utils\asp.bat"; DestDir: "{app}"; Flags: deleteafterinstall; 
; Licenses
Source: "Resources\_licenses\License.lic"; DestDir: "C:\inetpub\wwwroot\IOSightWS\Bin"; Components: Server
Source: "Resources\_licenses\License.dll"; DestDir: "C:\inetpub\wwwroot\IOSightWS\Bin"; Components: Server
Source: "Resources\_licenses\LicenseProvider.dll"; DestDir: "C:\inetpub\wwwroot\IOSightWS\Bin"; Components: Server
Source: "Resources\_licenses\jdash.lic"; DestDir: "C:\inetpub\wwwroot\Dashboard\Bin"; Components: Dashboard
; SQL Scripts
;Source: "Resources\_sql\Base.sql"; DestDir: "{app}"; Flags: deleteafterinstall; Components: Server; AfterInstall: RunScript('Base.sql')  -- only this component initialises script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; iGreenAnalyticServer (Server) area
Source: "..\WS\_PublishedWebsites\WS\ErrorPage.aspx"; DestDir: "C:\inetpub\wwwroot\IOSightWS"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\Global.asax"; DestDir: "C:\inetpub\wwwroot\IOSightWS"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\IOSightWS.asmx"; DestDir: "C:\inetpub\wwwroot\IOSightWS"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\xmlLayout.xml"; DestDir: "C:\inetpub\wwwroot\IOSightWS"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\bin\*"; DestDir: "C:\inetpub\wwwroot\IOSightWS\Bin"; Flags: createallsubdirs recursesubdirs; Components: Server
Source: "..\WS\_PublishedWebsites\WS\Web.config"; DestDir: "C:\inetpub\wwwroot\IOSightWS"; Components: Server; AfterInstall: ConvertConfig('C:\inetpub\wwwroot\IOSightWS', 'Web.config', False)

; This is for WCF service, mostly duplicated copies from asmx sites bianries and resources
Source: "..\WS\_PublishedWebsites\WS\ErrorPage.aspx"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\Global.asax"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\IOSightWS.asmx"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF\App_Code"; Flags: createallsubdirs recursesubdirs; Components: Server
Source: "..\WS\_PublishedWebsites\WS\xmlLayout.xml"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF"; Components: Server
Source: "..\WS\_PublishedWebsites\WS\bin\*"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF\bin\"; Flags: createallsubdirs recursesubdirs; Components: Server
Source: "..\WS\_PublishedWebsites\WS\Web.config"; DestDir: "C:\inetpub\wwwroot\IOSightWS\WCF"; Components: Server; AfterInstall: ConvertConfig('C:\inetpub\wwwroot\IOSightWS\WCF', 'Web.config', False)

; AnalyticServer  (Dal) area
Source: "..\AnalyticServer\*"; DestDir: "{app}\iGreenAnalyticServer"; Flags: createallsubdirs recursesubdirs; Components: Server
Source: "..\AnalyticServer\AnalyticServer.exe.config"; DestDir: "{app}\iGreenAnalyticServer"; Components: Server; AfterInstall: ConvertConfig('{app}\iGreenAnalyticServer', 'AnalyticServer.exe.config', False)

; iGreenWinClient (Client) area
Source: "..\WinClient\*"; DestDir: "{app}\iGreenWinClient"; Flags: createallsubdirs recursesubdirs; Components: iGreenWinClient
Source: "..\WinClient\IOSIGHT.Win.Client.exe.config"; DestDir: "{app}\iGreenWinClient"; Components: iGreenWinClient; AfterInstall: ConvertConfig('iGreenWinClient', 'IOSIGHT.Win.Client.exe.config', True)

; iGreenETLOPC (Agent) area
Source: "..\EtlOpc\*"; DestDir: "{app}\iGreenETLOPC"; Flags: createallsubdirs recursesubdirs; Components: iGreenETLOPC
Source: "..\EtlOpc\IOSIGHT.Agent.exe.config"; DestDir: "{app}\iGreenETLOPC"; Components: iGreenETLOPC; AfterInstall: ConvertConfig('iGreenETLOPC', 'IOSIGHT.Agent.exe.config', True)

; iGreenETLFiles (ETL) area
Source: "..\EtlFiles\*"; DestDir: "{app}\iGreenETLFiles"; Flags: createallsubdirs recursesubdirs; Components: iGreenETLFiles
Source: "..\EtlFiles\ETL_Agent.exe.config"; DestDir: "{app}\iGreenETLFiles"; Flags: createallsubdirs recursesubdirs; Components: iGreenETLFiles; AfterInstall: ConvertConfig('iGreenETLFiles', 'ETL_Agent.exe.config', True)

; iGreenETLDB area
Source: "..\EtlDatabase\*"; DestDir: "{app}\iGreenETLDB"; Flags: createallsubdirs recursesubdirs; Components: iGreenETLDB
Source: "..\EtlDatabase\ETL.DB.exe.config"; DestDir: "{app}\iGreenETLDB"; Flags: createallsubdirs recursesubdirs; Components: iGreenETLDB; AfterInstall: ConvertConfig('iGreenETLFiles', 'ETL_Agent.exe.config', True)

; iGreenAnalyzer (Report Scheduler) area
Source: "..\ReportScheduler\*"; DestDir: "{app}\iGreenAnalyzer"; Flags: createallsubdirs recursesubdirs; Components: iGreenAnalyzer
Source: "..\ReportScheduler\IOSight.ReportScheduler.ReportSchedulerApp.exe.config"; DestDir: "{app}\iGreenAnalyzer"; Components: iGreenAnalyzer; AfterInstall: ConvertConfig('iGreenAnalyzer', 'IOSight.ReportScheduler.ReportSchedulerApp.exe.config', True)

; iGreenWebDashboard (Dashboard) area
Source: "..\DashboardClient\*"; DestDir: "C:\inetpub\wwwroot\Dashboard"; Flags: createallsubdirs recursesubdirs; Components: Dashboard
Source: "..\DashboardClient\Web.config"; DestDir: "C:\inetpub\wwwroot\Dashboard"; Flags: createallsubdirs recursesubdirs; Components: Dashboard; AfterInstall: ConvertConfig('C:\inetpub\wwwroot\Dashboard', 'Web.config', False)

[Registry]
; Root: HKCU; Subkey: "Software\DesignREM\FirmwareShieldGui\Settings"; Flags: deletekey;
; ---start autoupdate code; see http://www.microchipc.com/innosetup/innosetup_auto_versioning_upgrade.php--
Root: HKLM; Subkey: Software\{#myappname}; ValueType: string; ValueName: CurrentVersion; ValueData: {code:GetAppCurrentVersion|''}; Flags: uninsdeletekey
; ---end autoupdate code---

[Run]
; AnalyticServer  (Dal) area
Filename: "{app}\iGreenAnalyticServer\AnalyticServer.exe"; Parameters: "--install"; Components: "Server"
; ETL DB area
Filename: "{app}\iGreenETLDB\ETL.DB.exe"; Parameters: "--install"; Components: "iGreenETLDB"

; iGreenAnalyzer (Report Scheduler) area
Filename: "regsvr32.exe"; Parameters: "/s ""{cf}\secman.dll"""; StatusMsg: "Registering Security Manager"
; ETL OPC (Agent) area
Filename: "regsvr32.exe"; Parameters: "/s ""{app}\iGreenETLOPC\OpcClientX15.dll"""; StatusMsg: "Registering OPC"

; ASP.NET installation
Filename: "{cmd}"; Parameters: "/C ""{app}\asp.bat"""; Flags: runhidden

[UninstallRun]
; AnalyticServer  (DAL) area
Filename: "{app}\iGreenAnalyticServer\AnalyticServer.exe"; Parameters: "--uninstall"; Components: "Server"
; ETL DB area
Filename: "{app}\iGreenETLDB\ETL.DB.exe"; Parameters: "--uninstall"; Components: "iGreenETLDB"

[Code]
var
/////////////////////////////////////////////////////////          Pages        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	IISPage, IISDashboardPage, PathPage: TInputQueryWizardPage;

/////////////////////////////////////////////////////////    SQL Page area    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var
	SQLPage: TWizardPage;

const
	adCmdUnspecified = $FFFFFFFF;
	adCmdUnknown = $00000008;
	adCmdText = $00000001;
	adCmdTable = $00000002;
	adCmdStoredProc = $00000004;
	adCmdFile = $00000100;
	adCmdTableDirect = $00000200;
	adOptionUnspecified = $FFFFFFFF;
	adAsyncExecute = $00000010;
	adAsyncFetch = $00000020;
	adAsyncFetchNonBlocking = $00000040;
	adExecuteNoRecords = $00000080;
	adExecuteStream = $00000400;
	adExecuteRecord = $00000800;
var
	lblVersion: TLabel;
	lstVersion: TComboBox;
	lblServer: TLabel;
	lblUser: TLabel;
	lblPassword: TLabel;
	ExistingDatabase: TRadioButton;
	txtServer: TEdit;
	NewDatabase: TRadioButton;
	txtUsername: TEdit;
	txtPassword: TPasswordEdit;
	lstDatabase: TComboBox;
	bIsNextEnabled: Boolean;
	connectionString:String;
	txtNewDatabase: TEdit;
    lblCaptionDatabase: TLabel;

/////////////////////////////////////               Server & Dashboard area            //////////////////////////////////////////////////////////////////////////////////////////////////////////
const
	IISServerNumber = '1';
	IISDEFAULTURL = 'http://localhost/IOSightWS/';
	IISDEFAULTDASHBOARDURL = 'http://localhost/';
    //IISDEFAULTDASHBOARDURL = 'http://localhost/Dashboard/';
    IISDEFAULTROOT  = 'C:/inetpub/wwwroot/';
    DASHBOARDDEFAULTNAME = 'Dashboard/';
	IISRootDir = 'Root';
	IISApplicationPoolName = 'iGreenAppPool';
	IISWCFDir = 'WCF';
var
	IISURL, InstallDir: String;
	IISPageID, IISDashboardPageID, DBPageID: Integer;
	IIS, WebSite, WebServer, WebRoot: Variant;

	global_AppCmdExitCode :Integer;
	global_AppCmdFilePath :String;
///////////////////////////////////////////////           Path Page              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const
    WSURL = 'localhost';
    AnalyzerURL = 'localhost';
    LicensePath = 'C:\inetpub\wwwroot\IOSightWS\Bin';
    LogPath = 'C:\Program Files (x86)\iGreen\_Log';

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////               Common Functions            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure CreateButton(ALeft, ATop: Integer; ACaption: String; ANotifyEvent: TNotifyEvent);
begin

with TButton.Create(WizardForm) do begin
		Left := ALeft;
		Top := ATop;
		Width := WizardForm.CancelButton.Width;
		Height := WizardForm.CancelButton.Height;
		Caption := ACaption;
		OnClick := ANotifyEvent;
		Parent := WizardForm.WelcomePage;
	end;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////               Color Welcome Page         /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure InheritBoundsRect(ASource, ATarget: TControl);

begin
        ATarget.Left := ASource.Left;
        ATarget.Top := ASource.Top;
        ATarget.Width := ASource.Width;
        ATarget.Height := ASource.Height;
end;

procedure CreateColorWelcomePage() ;
var
	TopWelcomeLabel: TLabel;
	BottomWelcomeLabel: TLabel;
    iGreenLogo: String;
begin

	WizardForm.WizardBitmapImage.Align := alClient;

    ExtractTemporaryFile('LogoIgreen.bmp');
    iGreenLogo:=ExpandConstant('{tmp}')+'\LogoIgreen.bmp';

    WizardForm.WizardBitmapImage.Bitmap.LoadFromFile(iGreenLogo);

	TopWelcomeLabel := TLabel.Create(WizardForm);
	TopWelcomeLabel.Parent := WizardForm.WelcomeLabel1.Parent;
	TopWelcomeLabel.Font := WizardForm.WelcomeLabel1.Font;
	TopWelcomeLabel.Caption := WizardForm.WelcomeLabel1.Caption;
	TopWelcomeLabel.WordWrap := WizardForm.WelcomeLabel1.WordWrap;
	InheritBoundsRect(WizardForm.WelcomeLabel1, TopWelcomeLabel);
	WizardForm.WelcomeLabel1.Visible := False;

	BottomWelcomeLabel := TLabel.Create(WizardForm);
	BottomWelcomeLabel.Parent := WizardForm.WelcomeLabel2.Parent;
	BottomWelcomeLabel.Font := WizardForm.WelcomeLabel2.Font;
	BottomWelcomeLabel.Caption := WizardForm.WelcomeLabel2.Caption;
	BottomWelcomeLabel.WordWrap := WizardForm.WelcomeLabel2.WordWrap;
	InheritBoundsRect(WizardForm.WelcomeLabel2, BottomWelcomeLabel);
	WizardForm.WelcomeLabel2.Visible := False;
end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////           Update Version            ////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function GetAppMajorVersion(param: String): String;
begin
  Result:='{#vmajor}';
end;

function GetAppMinorVersion(param: String): String;
begin
    Result:='{#vminor}';
end;

function GetAppCurrentVersion(param: String): String;
begin
    Result:='{#vbuild}';
end;

function GetAppID(param: String): String;
begin
    Result := '{#MyAppId}';
end;

function GetPathInstalled(AppID: String): String;
	var
		PrevPath: String;
	begin
		PrevPath := '';
		if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\'+AppID + '_is1', 'Inno Setup: App Path', PrevPath) then begin
			RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\'+AppID + '_is1', 'Inno Setup: App Path', PrevPath);
		end;
		Result := PrevPath;
	end;

function GetInstalledVersion(): String;
	var
		InstalledVersion: String;
	begin
		InstalledVersion := '';
		RegQueryStringValue(HKLM, 'Software\{#myappname}', 'Version', InstalledVersion);
		Result := InstalledVersion;
	end;

function GetInstalledCurrentVersion(): String;
	var
		InstalledCurrentVersion: String;
	begin
		InstalledCurrentVersion := '';
		RegQueryStringValue(HKLM, 'Software\{#myappname}', 'CurrentVersion', InstalledCurrentVersion);
		Result := InstalledCurrentVersion;
	end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////               Server & Dashboard area            ////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Opens cmd 
function ExecAppCmd(params :String) :Boolean;
var
  execSuccessfully :Boolean;
  resultCode :Integer;
begin
  global_AppCmdFilePath := ExpandConstant('{sys}\inetsrv\appcmd.exe');

  execSuccessfully := Exec(global_AppCmdFilePath, params, '', SW_HIDE, ewWaitUntilTerminated, resultCode);
  Result := execSuccessfully and (resultCode = 0);
end;

// Name of IIS server
function GetIISServerName(FullPath: String; IncludePort: Boolean): String;
var
	i: Integer;
	HTTP, ResultString: String;
	ConditionForResult: Boolean;
begin
		HTTP := 'http://';
	for i := Length(HTTP)+1 to Length(FullPath)-1 do
	begin
    if (IncludePort = true) then
		ConditionForResult := (FullPath[i] <> '/')
    else
		ConditionForResult := (FullPath[i] <> '/') and (FullPath[i] <> ':');
    if (ConditionForResult = true) then
		ResultString := ResultString + FullPath[i]
    else
		break;
	end;
	Result := ResultString;
end;

// Creates Virtual directory
function GetServerVirtualDir(FullPath: String): String;
var
	i: Integer;
	HTTP, ResultString: String;
begin
	HTTP := 'http://' + GetIISServerName(FullPath, true) + '/';
	for i := Length(HTTP)+1 to Length(FullPath)-1 do
		if (FullPath[i] <> '/') then
			ResultString := ResultString + FullPath[i]
		else
			break;
	Result := ResultString;
end;

// Installing IIS
procedure IISInstall(IISUserURL: String; virtualDirPath: String);
var
	VDir: Variant;
	ErrorCode: Integer;
	ServerVirtDir: String;
begin
	
	{ Create the main IIS COM Automation object }
	try
		IIS := CreateOleObject('IISNamespace');
	except
		RaiseException('Please install Microsoft IIS first.'#13#13'(Error ''' + GetExceptionMessage + ''' occurred)');
    end;
	{ Connect to the IIS server }
	WebSite := IIS.GetObject('IIsWebService', GetIISServerName(IISUserURL, false) + '/w3svc');
	WebServer := WebSite.GetObject('IIsWebServer', IISServerNumber);
	WebRoot := WebServer.GetObject('IIsWebVirtualDir', IISRootDir);
	{ (Re)create a virtual dir }
		try
			WebRoot.Delete('IIsWebVirtualDir', GetServerVirtualDir(IISUserURL));
			WebRoot.SetInfo();
		except
        end;

    VDir := WebRoot.Create('IIsWebVirtualDir', GetServerVirtualDir(IISUserURL));
    VDir.AccessRead := True;
    VDir.AccessScript := True;
    VDir.AppFriendlyName := 'IOSight Server';
    VDir.Path :=virtualDirPath;
    VDir.AppPoolId  := IISApplicationPoolName;
    VDir.AppCreate(True);
    VDir.SetInfo();
  
  // WCF Directory
	if virtualDirPath = 'C:\inetpub\wwwroot\IOSightWS' then
	begin
		WebRoot := WebServer.GetObject('IIsWebVirtualDir', IISRootDir + '/IOSightWS');
		VDir := WebRoot.Create('IIsWebVirtualDir', IISWCFDir);
		VDir.AccessRead := True;
		VDir.AccessScript := True;
		VDir.AppFriendlyName := 'IOSight WCF Service';
		VDir.Path := virtualDirPath+ '\' + IISWCFDir;
		VDir.AppPoolId  := IISApplicationPoolName;
		VDir.AppCreate(True);
		VDir.SetInfo();
	end;
    
    //Adding Application Pool
    if not ExecAppCmd(Format('add apppool /name:"%s" /managedRuntimeVersion:v4.0 /enable32BitAppOnWin64:true', [IISApplicationPoolName])) then
    begin
    end;
end;

// Creates IIS pages (IOSightWS and Dashboard)
procedure CreateIISPages();
begin

	// Dashboard page
	IISDashboardPage := CreateInputQueryPage(wpSelectComponents,
	'Dashboard Installation', 'IIS URL',' ');

	IISDashboardPage.Add('Server URL:', False);
	IISDashboardPage.Values[0] := ExpandConstant(IISDEFAULTDASHBOARDURL);
    IISDashboardPage.Edits[0].Enabled := False; 

    IISDashboardPage.Add('IIS Root Directory:', False);
	IISDashboardPage.Values[1] := ExpandConstant(IISDEFAULTROOT);
    IISDashboardPage.Edits[1].Enabled := False; 

    IISDashboardPage.Add('Dashboard Name:', False);
	IISDashboardPage.Values[2] := ExpandConstant(DASHBOARDDEFAULTNAME);
    IISDashboardPage.Edits[2].Enabled := False;
      
	IISDashboardPageID := IISDashboardPage.ID;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 //  Creates IIS IOSightWS and Dashboard
function NextButtonClick(CurPageID: Integer): Boolean;
begin
	//r
	Result := UninsHs_NextButtonClick(CurPageID);

	if (CurPageID = wpinstalling) then
	begin
        if (IsComponentSelected('Server')) then
        begin
            IISInstall('http://'+ WSURL + '/IOSightWS/', 'C:\inetpub\wwwroot\IOSightWS');
        end;

        if (IsComponentSelected('Dashboard')) then      
        begin
            IISInstall(IISDashboardPage.Values[0] + IISDashboardPage.Values[2], IISDashboardPage.Values[1] + IISDashboardPage.Values[2]);
        end;
    end;
end;

//Remove
procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
	UninsHs_CancelButtonClick(CurPageID, Cancel, Confirm);
end;

 // Do not show  pages if they are not selected
function ShouldSkipPage(CurPageID: Integer): Boolean;

var
    PrevDir : string; 
begin

	//Remove
	Result := UninsHs_ShouldSkipPage(CurPageId);

	if CurPageID = IISDashboardPageID then
	begin
		if not IsComponentSelected('Dashboard')  then
		begin
			Result := True;
		end; 
	end;

    if CurPageID = DBPageID then
	begin
		if not IsComponentSelected('iGreenETLOPC') and not IsComponentSelected('Server') and not IsComponentSelected('Dashboard') then
		begin
			Result := True;
		end; 
	end;

    //Update
    if not Result then
    begin
        //Update version
        PrevDir := GetPathInstalled(getAppID(''));
        if length(Prevdir) > 0 then begin
              // skip selectdir if It's an upgrade
              if (CurPageId = wpSelectDir) then begin
                 Result := true;
              end else if (CurPageId = wpSelectProgramGroup) then begin
                  Result := true;
              end else if (CurPageId = wpSelectTasks) then begin
                  Result := true;
              end else begin
                Result := false;
              end;
         end;
    end;
end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Loading config file ? 
function LoadConfigFile(): Variant;
var
	XMLDoc, RootNode: Variant;
	ConfigFilename: String;
begin
	ConfigFilename := 'C:\inetpub\wwwroot\IOSightWS\Web.config';
	try
		XMLDoc := CreateOleObject('MSXML2.DOMDocument');
	except
		RaiseException('MSXML is required to complete the post-installation process.'#13#13'(Error ''' + GetExceptionMessage + ''' occurred)');
	end;  

	XMLDoc.async := False;
	XMLDoc.resolveExternals := False;
	XMLDoc.load(ConfigFilename);
	if XMLDoc.parseError.errorCode <> 0 then
		RaiseException('Error on line ' + IntToStr(XMLDoc.parseError.line) + ', position ' + IntToStr(XMLDoc.parseError.linepos) + ': ' + XMLDoc.parseError.reason);
		Result := XMLDoc;
	end;

// Getting confil file ?
function GetConfigValue(Section, Key: String): String;
var
	RootNode, XMLDoc, Nodes, Node: Variant;
	ExistingKey: String;
	i: integer;
	found: Boolean;
begin
	found := false;
	XMLDoc := LoadConfigFile;
	RootNode := XMLDoc.documentElement;
	Nodes := RootNode.selectNodes('//configuration/' + Section + '/add');
	if Nodes.Length = 0 then
		RaiseException('No such section ' + Section);
	for i := 0 to Nodes.length - 1 do
	begin
		Node := Nodes.Item[i];
		if Node.NodeType = 1 then
		begin
			ExistingKey := Node.getAttribute('key');
			if ExistingKey = Key then
			begin
				Result := Node.getAttribute('value');
				found := true;
			break;
			end;
		end;
	end;
		if found = false then
			RaiseException('Key ' + Key + ' not found!');
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////               Uninstalling area            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Uninstalling components (Modefy/Remove)
function InitializeUninstall(): Boolean;
begin
    Result := UninsHs_InitializeUninstall();
end;
// Unistalling Dashboard and IOSightWS including WebSites (only 'Remove' mode)
procedure RemoveIISWhenUninstall();
var
	WebRootDir: String;
begin
	//Remove
	
     if (IsRemove()) then
     begin 	
            try
                IIS := CreateOleObject('IISNamespace');
            except
                RaiseException('Please install Microsoft IIS first.'#13#13'(Error ''' + GetExceptionMessage + ''' occurred)');
            end;

            WebRootDir := GetConfigValue('appSettings', 'WebRoot');
            WebSite := IIS.GetObject('IIsWebService', GetIISServerName(WebRootDir, false) + '/w3svc');
            WebServer := WebSite.GetObject('IIsWebServer', IISServerNumber);
            WebRoot := WebServer.GetObject('IIsWebVirtualDir', IISRootDir);

            try
                WebRoot.Delete('IIsWebVirtualDir', GetServerVirtualDir(WebRootDir));
                WebRoot.SetInfo();
            except
            end;

            try
                WebRoot.Delete('IIsWebVirtualDir', 'Dashboard');
                WebRoot.SetInfo();
            except
            end;

            try
                ExecAppCmd(Format('delete apppool /apppool.name:"%s" ', [IISApplicationPoolName])) 
            except
            end;
            DelTree('C:\inetpub\wwwroot\Dashboard', True, True, True);
            DelTree('C:\inetpub\wwwroot\IOSightWS', True, True, True); 
    end;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////                   SQL page area           ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Used to generate error code by sql script errors
procedure ExitProcess(exitCode:integer);
	external 'ExitProcess@kernel32.dll stdcall';

// Version drop down defaults to blank. Enable server textbox once a version is selected. This forces user to select the version first.
Procedure VersionOnChange (Sender: TObject);
begin                            
	lblServer.Enabled := True;
	txtServer.Enabled := True;
end;

////////////////////////// Data Base deployment ///////////////////////////////////////////////////////////////////////////////////////

function LoadScriptFromFile(const FileName: string; out CommandList: TStrings): Integer;
var
	I: Integer;
	SQLCommand: string;
	ScriptFile: TStringList;
begin
	Result := 0;
	ScriptFile := TStringList.Create;
  try
    SQLCommand := '';
    ScriptFile.LoadFromFile(FileName);

    for I := 0 to ScriptFile.Count - 1 do
    begin
		if Pos('go', LowerCase(Trim(ScriptFile[I]))) = 1 then
			begin
				Result := Result + 1;
				CommandList.Add(SQLCommand);
				SQLCommand := '';
			end
		else
        SQLCommand := SQLCommand + ScriptFile[I] + #13#10;
    end;

    //EDIT: If there is no GO syntax present int the file AND
    //To add the script after the last GO - Govs
    CommandList.Add(SQLCommand);
    Result:= Result + 1;
	finally
		ScriptFile.Free;
	end;
end;

procedure RunScript(const FileName: string);
var
	I: Integer;
	CommandList: TStrings;
	ADOCommand: Variant;
	ADOConnection: Variant; 
	fullFileName :String; 
	command:String;

begin
if    NewDatabase.Checked then
	begin
	fullFileName := ExpandConstant('{app}') + '\'  + FileName;
	try
		ADOConnection := CreateOleObject('ADODB.Connection'); 
		ADOConnection.ConnectionString :=   connectionString;
		ADOConnection.Open;
		ADOCommand := CreateOleObject('ADODB.Command');
		ADOCommand.ActiveConnection := ADOConnection;
		// here is already established connection
		CommandList := TStringList.Create;
	if LoadScriptFromFile(fullFileName, CommandList) > 0 then
		for I := 0 to CommandList.Count - 1 do
		begin            
		// execute each command 
			command:=   CommandList[I];
		if command <>'' then 
			begin
				ADOCommand.CommandText := command;
				ADOCommand.Execute(NULL, NULL, adCmdText or adExecuteNoRecords);
			end;
		end;
	finally
		CommandList.Free;
	end;
	end;
end;

 // Enable next button once a database name has been entered.
Procedure DatabaseOnChange (Sender: TObject);
begin
	if ((Length(lstDatabase.Text) > 0) and (ExistingDatabase.Checked)) or
       ((Length(txtNewDatabase.Text) > 0) and (NewDatabase.Checked) )
     then
	begin
		bIsNextEnabled := True;
		WizardForm.NextButton.Enabled := bIsNextEnabled;  
	end
	else
	begin
		bIsNextEnabled := False;
		WizardForm.NextButton.Enabled := bIsNextEnabled;  
	end
end;

// Switches databases between new and existing 
procedure DBNameOnChange(Sender: TObject);
begin
	if ExistingDatabase.Checked then
	begin
		lstDatabase.Enabled := True;
		txtNewDatabase.Enabled := False;
        DatabaseOnChange(Sender);
	end
	Else
	begin
		lstDatabase.Enabled := False;
		txtNewDatabase.Enabled := True;
        DatabaseOnChange(Sender);        
	end
end;

// enable/disable child text boxes & functions when text has been entered into Server textbox. Makes no sense to populate child items unless a value exists for server.
Procedure ServerOnChange (Sender: TObject);
begin                            
	lstDatabase.Items.Clear;
	lstDatabase.Text := '';
	bIsNextEnabled := False;
	WizardForm.NextButton.Enabled := bIsNextEnabled;
	if Length(txtServer.Text) > 0 then
	begin
		ExistingDatabase.Enabled := True;
        NewDatabase.Enabled := True;
		lblUser.Enabled := True;
		lblPassword.Enabled := True;
		txtUsername.Enabled := True;
		txtPassword.Enabled := True;	
        lblCaptionDatabase.Enabled := True;
        DBNameOnChange(Sender);
	end
	else
	begin
		ExistingDatabase.Enabled := False;
        NewDatabase.Enabled := False;
        txtNewDatabase.Enabled := False;
		lblUser.Enabled := False;
		lblPassword.Enabled := False;
		txtUsername.Enabled := False;
		txtPassword.Enabled := False;
        DBNameOnChange(Sender);
	end
end;

// Retrieve a list of databases accessible on the server with the credentials specified.
// This list is shown in the database dropdown list
procedure RetrieveDatabaseList(Sender: TObject);
var  
	ADOCommand: Variant;
	ADORecordset: Variant;
	ADOConnection: Variant;   
	SQLQuery: AnsiString;
begin
  lstDatabase.Items.Clear;
  try
    // create the ADO connection object
    ADOConnection := CreateOleObject('ADODB.Connection');
    // build a connection string; for more information, search for ADO
    // connection string on the Internet 
     connectionString := 
	'Provider=SQLOLEDB;' +               // provider
	'Data Source=' + txtServer.Text + ';' +   // server name
	'Application Name=' + '{#SetupSetting("AppName")}' + ' DB List;'
 
    
	connectionString := connectionString +
	'User Id=' + txtUsername.Text + ';' +              // user name
	//txtUsername.Text := ExpandConstant('sa');
	'Password=' + txtPassword.Text + ';';                   // password  

    // Open the connection by the assigned ConnectionString
	ADOConnection.ConnectionString :=connectionString;

    ADOConnection.Open;
    try
		// create the ADO command object
		ADOCommand := CreateOleObject('ADODB.Command');
		// assign the currently opened connection to ADO command object
		ADOCommand.ActiveConnection := ADOConnection;
		// assign text of a command to be issued against a provider
		ADOCommand.CommandText := 'SELECT name FROM master.dbo.sysdatabases WHERE HAS_DBACCESS(name) = 1 ORDER BY name';
		// this property setting means, that you're going to execute the 
		// CommandText text command; it does the same, like if you would
		// use only adCmdText flag in the Execute statement
		ADOCommand.CommandType := adCmdText;
		// this will execute the command and return dataset
		ADORecordset := ADOCommand.Execute;
		// get values from a dataset using 0 based indexed field access;
		// notice, that you can't directly concatenate constant strings 
		// with Variant data values

		while not ADORecordset.eof do 
		begin
			lstDatabase.Items.Add(ADORecordset.Fields(0));
			ADORecordset.MoveNext;
		end ;

    finally
		ADOConnection.Close;
    end;
	except
		MsgBox(GetExceptionMessage, mbError, MB_OK);
	end;
end;

{ CustomForm_NextkButtonClick }
// try to connect to supplied db. Dont need to catch errors/close conn on error because a failed connection is never opened.
function CustomForm_NextButtonClick(SQLPage: TWizardPage): Boolean;
var  
	ADOConnection: Variant;  
begin
	//try
    // create the ADO connection object
    ADOConnection := CreateOleObject('ADODB.Connection');
    // build a connection string; for more information, search for ADO
    // connection string on the Internet 
   connectionString := 
		'Provider=SQLOLEDB;' +               // provider
		'Data Source=' + txtServer.Text + ';' +   // server name
	// 'Initial Catalog=' + lstDatabase.Text + ';' +   // server name
		'Application Name=' + '{#SetupSetting("AppName")}' + ' Execute SQL;' ;     

	connectionString := connectionString +
		'User Id=' + txtUsername.Text + ';' +              // user name
		'Password=' + txtPassword.Text + ';';                   // password

     ADOConnection.ConnectionString := connectionString;

		// open the connection by the assigned ConnectionString
    ADOConnection.Open;
    Result := True;
end;

{ CustomForm_CreatePage }
function CustomForm_CreatePage(PreviousPageId: Integer): Integer;
begin

	SQLPage := CreateCustomPage(
		PreviousPageId,
		ExpandConstant('{cm:CustomForm_Caption}'),
		ExpandConstant('{cm:CustomForm_Description}')
	);

  { lblVersion }
	lblVersion := TLabel.Create(SQLPage);
	with lblVersion do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblVersion_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(8);
		Width := ScaleX(61);
		Height := ScaleY(13);
	end;

	{lstVersion}
	lstVersion := TComboBox.Create(SQLPage);
	with lstVersion do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(112);
		Top := ScaleY(8);
		Width := ScaleX(145);
		Height := ScaleY(21);
		Style := csDropDownList;
		DropDownCount := 2;
		TabOrder := 0;
		Items.Add(ExpandConstant('{cm:CustomForm_lstVersion_Line0} '));
		Items.Add(ExpandConstant('{cm:CustomForm_lstVersion_Line1}'));
		OnChange:= @VersionOnChange;
  end;      

  { lblServer }
	lblServer := TLabel.Create(SQLPage);
	with lblServer do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblServer_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(32);
		Width := ScaleX(68);
		Height := ScaleY(13);
		Enabled := False;
	end;

  { txtServer }
	txtServer := TEdit.Create(SQLPage);
	with txtServer do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(112);
		Top := ScaleY(32);
		Width := ScaleX(241);
		Height := ScaleY(21);
		TabOrder := 1;
		Enabled := False;
		OnChange := @ServerOnChange;
	end;

	{lblUser }
	lblUser := TLabel.Create(SQLPage);
	with lblUser do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblUser_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(76);
		Width := ScaleX(58);
		Height := ScaleY(13);
		Enabled := False;
	end;

	{ lblPassword }
	lblPassword := TLabel.Create(SQLPage);
	with lblPassword do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblPassword_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(100);
		Width := ScaleX(53);
		Height := ScaleY(13);
		Enabled := False;
	end;

	{ txtUsername }
	txtUsername := TEdit.Create(SQLPage);
	with txtUsername do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(112);
		Top := ScaleY(76);
		Width := ScaleX(241);
		Height := ScaleY(21);
		Enabled := False;
		TabOrder := 2;
        Text:= 'sa';
	end;

	{ txtPassword }
	txtPassword := TPasswordEdit.Create(SQLPage);
	with txtPassword do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(112);
		Top := ScaleY(100);
		Width := ScaleX(241);
		Height := ScaleY(21);
		Enabled := False;
		TabOrder := 3;
	end;

    { lblCaptionDatabase }
	lblCaptionDatabase := TLabel.Create(SQLPage);
	with lblCaptionDatabase do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblCaptionDatabase_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(148);
		Width := ScaleX(280);
		Height := ScaleY(13);
		Enabled := False;
	end;

	{ ExistingDatabase }
	ExistingDatabase := TRadioButton.Create(SQLPage);
	with ExistingDatabase do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblDatabase_Caption0}');
		Left := ScaleX(24);
		Top := ScaleY(172);
		Width := ScaleX(120);
		Height := ScaleY(13);
		Enabled := False;
		Checked := True;
		TabOrder := 4;
		OnClick := @DBNameOnChange;
	end;

	{ lstExistingDatabase }
	lstDatabase := TComboBox.Create(SQLPage);
	with lstDatabase do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(164);
		Top := ScaleY(172);
		Width := ScaleX(140);
		Height := ScaleY(21);
		Enabled := False;
		TabOrder := 5;    
		OnDropDown:= @RetrieveDatabaseList;
		OnChange:= @DatabaseOnChange;
	end;

    { NewDatabase }
	NewDatabase := TRadioButton.Create(SQLPage);
	with NewDatabase do
	begin
		Parent := SQLPage.Surface;
		Caption := ExpandConstant('{cm:CustomForm_lblDatabase_Caption1}');
		Left := ScaleX(24);
		Top := ScaleY(196);
		Width := ScaleX(100);
		Height := ScaleY(13);
		Enabled := False;
		Checked := false;
		TabOrder := 6;
		OnClick := @DBNameOnChange;
	end;

    { txtNewDatabase }
	txtNewDatabase := TEdit.Create(SQLPage);
	with txtNewDatabase do
	begin
		Parent := SQLPage.Surface;
		Left := ScaleX(164);
		Top := ScaleY(196);
		Width := ScaleX(140);
		Height := ScaleY(21);
		TabOrder := 7;
		Enabled := False;
        OnChange:= @DatabaseOnChange;
	end;

	with SQLPage do
	begin
		OnNextButtonClick := @CustomForm_NextButtonClick;
	end;

	Result := SQLPage.ID;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
	//Remove
	UninsHs_CurPageChanged(CurPageID);

	//Set initial status of next button. Should be disabled when page is first loaded, but should be enabled if user clicked back.
	if CurPageID = SQLPage.ID then
		WizardForm.NextButton.Enabled := bIsNextEnabled;  
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////                Prerequisites                  ///////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var
Left, LeftInc, Top, TopInc: Integer;

{--- Excel ---}

procedure ExcelButtonOnClick(Sender: TObject);
var
	CurVer: Cardinal;
	key: string;
begin
//if RegQueryDWordValue(HKCR, 'Excel.Application\\CurVer\\','', CurVer) then
if RegQueryStringValue(HKCR, 'Excel.Application\CurVer\','', key) then
	begin
		// Successfully read the value
		MsgBox('Excel Version: ' + key, mbInformation, MB_OK);
		end else begin
		MsgBox('Excel Not installed', mbInformation, MB_OK);
	end;
end;

{--- Windows Firewall ---}

const
   NET_FW_IP_VERSION_ANY = 2;
   NET_FW_SCOPE_ALL = 0;

procedure FirewallButtonOnClick(Sender: TObject);
var
	Firewall, Application: Variant;
begin
	if MsgBox('Setup will now add itself to Windows Firewall as an authorized application for the current profile (' + GetUserNameString + '). Do you want to continue?', mbInformation, mb_YesNo) = idNo then
		Exit;

	{ Create the main Windows Firewall COM Automation object }

	try
		Firewall := CreateOleObject('HNetCfg.FwMgr');
	except
		RaiseException('Please install Windows Firewall first.'#13#13'(Error ''' + GetExceptionMessage + ''' occurred)');
	end;

	{ Add the authorization }

	Application := CreateOleObject('HNetCfg.FwAuthorizedApplication');
	Application.Name := 'Setup';
	Application.IPVersion := NET_FW_IP_VERSION_ANY;
	Application.ProcessImageFileName := ExpandConstant('{srcexe}');
	Application.Scope := NET_FW_SCOPE_ALL;
	Application.Enabled := True;

	Firewall.LocalPolicy.CurrentProfile.AuthorizedApplications.Add(Application);

	MsgBox('Setup is now an authorized application for the current profile', mbInformation, mb_Ok);
end;

procedure CreatePrerequisites();
begin
	Left := WizardForm.WelcomeLabel2.Left;
	LeftInc := WizardForm.CancelButton.Width + ScaleX(8);
	TopInc := WizardForm.CancelButton.Height + ScaleY(8);
	Top := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height - 4*TopInc + 1;

	CreateButton(Left , Top, '&Firewall', @FirewallButtonOnClick);

	Left := left + LeftInc;
	CreateButton(Left, Top, '&Excel', @ExcelButtonOnClick);
	end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////         about      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure AboutButtonOnClick(Sender: TObject);
begin
	MsgBox('IOSight is an innovator and a market leader in the field of infrastructure facility management, thanks for http://www.han-soft.com/', mbInformation, mb_Ok);
end;

procedure URLLabelOnClick(Sender: TObject);
var
	ErrorCode: Integer;
begin
	ShellExec('open', 'http://www.iosight.com', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure CreateAboutButtonAndURLLabel(ParentForm: TSetupForm; CancelButton: TNewButton);
var
	AboutButton: TNewButton;
	URLLabel: TNewStaticText;
begin
	AboutButton := TNewButton.Create(ParentForm);
	AboutButton.Left := ParentForm.ClientWidth - CancelButton.Left - CancelButton.Width;
	AboutButton.Top := CancelButton.Top;
	AboutButton.Width := CancelButton.Width;
	AboutButton.Height := CancelButton.Height;
	AboutButton.Caption := '&About...';
	AboutButton.OnClick := @AboutButtonOnClick;
	AboutButton.Parent := ParentForm;

	URLLabel := TNewStaticText.Create(ParentForm);
	URLLabel.Caption := 'www.iosight.com';
	URLLabel.Cursor := crHand;
	URLLabel.OnClick := @URLLabelOnClick;
	URLLabel.Parent := ParentForm;
	{ Alter Font *after* setting Parent so the correct defaults are inherited first }
	URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderline];
	URLLabel.Font.Color := clBlue;
	URLLabel.Top := AboutButton.Top + AboutButton.Height - URLLabel.Height - 2;
	URLLabel.Left := AboutButton.Left + AboutButton.Width + ScaleX(20);
end;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////    Path page   ///////////////////////////////////////////////////////////////////////////                            
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function CreatePathPage(): Integer;

begin
	PathPage := CreateInputQueryPage(wpLicense, 'Common Configurations Properties', ' ', ' ');

	PathPage.Add('iGreen Analytic Server IP:', False);
	PathPage.Values[0] := ExpandConstant(WSURL);

    PathPage.Add('iGreen Analyzer IP:', False);
	PathPage.Values[1] := ExpandConstant(AnalyzerURL); 

	PathPage.Add('iGreen License Path:', False);
	PathPage.Values[2] := ExpandConstant(LicensePath); 

	PathPage.Add('iGreen Log Path:', False);
	PathPage.Values[3] := ExpandConstant(LogPath);
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////    Encrypt Password   ////////////////////////////////////////////////////////////////                             
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function EncryptPassword(clearPassword:String): String ;
var
    HashEncriptionPath: String;
    passArray: TArrayOfString;
    passwordTmpFile: String;
    params: String; 
    resultCode: Integer;

begin
    if Length(clearPassword) = 0 then
    begin
        Result:= '';
    end
    else
    begin
        ExtractTemporaryFile('HashEncription.exe');
        HashEncriptionPath:=ExpandConstant('{tmp}')+'\HashEncription.exe';
        passwordTmpFile :=  ExpandConstant('{tmp}')+'password.txt';
        params:= clearPassword + ' ' + passwordTmpFile;
        Exec(HashEncriptionPath, params, '', SW_HIDE, ewWaitUntilTerminated, resultCode); 
        LoadStringsFromFile(passwordTmpFile, passArray )
     
        Result:= passArray[0];
        DeleteFile(passwordTmpFile);
    end;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////   Change config     ////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure ConvertConfig(appPath, xmlFileName: String; isAppPath:boolean);
    var
        xmlFile: String;
        xmlInhalt: TArrayOfString;
        strName: String;
        strKey: String;
        tmpConfigFile: String;
        k: Integer;

        lang:String;
        langStr:String;

    begin
            if isAppPath =True then begin
				xmlFile := ExpandConstant('{app}') + '\' + appPath + '\' + xmlFileName;
            end else begin
				xmlFile :=  appPath + '\' + xmlFileName;
            end;

			tmpConfigFile:= ExpandConstant('{app}') + '\config.tmp';
           
			if (FileExists(xmlFile)) then begin
				LoadStringsFromFile(xmlFile, xmlInhalt);
				for k:=0 to GetArrayLength(xmlInhalt)-1 do
				begin
					strKey := xmlInhalt[k];

					if (Pos('SERVERPLACEHOLDER', strKey) <> 0 ) then
					begin
						StringChangeEx(strKey, 'SERVERPLACEHOLDER', PathPage.Values[0], True);
					end;

                    if (Pos('ANALYZERPLACEHOLDER', strKey) <> 0 ) then
					begin
						StringChangeEx(strKey, 'ANALYZERPLACEHOLDER', PathPage.Values[1], True);
					end;

                    if (Pos('LICENSEPATHPLACEHOLDER', strKey) <> 0 ) then
					begin
						StringChangeEx(strKey, 'LICENSEPATHPLACEHOLDER', PathPage.Values[2], True);
					end;

					if (Pos('LOGPATHPLACEHOLDER', strKey) <> 0 ) then
					begin
						StringChangeEx(strKey, 'LOGPATHPLACEHOLDER', PathPage.Values[3], True);
					end;

/////////////////////////////////////////  Connection string ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    if (Pos('DATASOURCEPLACEHOLDER', strKey) <> 0 ) then
					begin
						StringChangeEx(strKey, 'DATASOURCEPLACEHOLDER', txtServer.Text, True);
					end;

                    if (Pos('USERPLACEHOLDER', strKey) <> 0 ) then         
					begin
						StringChangeEx(strKey, 'USERPLACEHOLDER', (txtUsername.Text), True);
					end;

					if (Pos('DBPLACEHOLDER', strKey) <> 0 ) then         
					begin
						if ExistingDatabase.Checked then
                        begin
							StringChangeEx(strKey, 'DBPLACEHOLDER', lstDatabase.Text, True);
                        end
						else
                        begin
							StringChangeEx(strKey, 'DBPLACEHOLDER', txtNewDatabase.Text, True);
                        end;

					end;

                    if (Pos('PASSPLACEHOLDER', strKey) <> 0 ) then         
					begin
						StringChangeEx(strKey, 'PASSPLACEHOLDER', EncryptPassword (txtPassword.Text), True);
					end;
/////////////////////////////////////////  Language  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    lang := ActiveLanguage();
                        if (lang = 'he') then begin
                    langStr := 'he-IL';
                        end else begin
                    langStr := 'en-Us';
                        end;

                    if (Pos('LANGHOLDER', strKey) <> 0 ) then
                    begin
                        StringChangeEx(strKey, 'LANGHOLDER', langStr, True);
                    end;

                    xmlInhalt[k]:=  strKey;
                
              //SaveStringToFile(tmpConfigFile, strKey + #13#10,  True);
				end;
				SaveStringsToUTF8File(tmpConfigFile, xmlInhalt,  True);
				DeleteFile(xmlFile); //delete the old exe.config
				RenameFile(tmpConfigFile,xmlFile);
		end;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////                     MAIN                          ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure InitializeWizard();

begin
    // UnInstalling
	UninsHs_InitializeWizard();

	// Create IIS Pages
	CreateIISPages();
	// Remove IIS Pages (Only 'Remove' mode)
    RemoveIISWhenUninstall();

	// Color Welcome page
	CreateColorWelcomePage();

	// SQL page area
	bIsNextEnabled := False;
	DBPageID := CustomForm_CreatePage(wpSelectComponents);

	// Prerequisites
	CreatePrerequisites();

	// About
	CreateAboutButtonAndURLLabel(WizardForm, WizardForm.CancelButton);

	// Paths page
	CreatePathPage();
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function InitializeSetup(): Boolean;
var
	Response: Integer;
	PrevDir: String;
	InstalledVersion: String;
	InstalledCurrentVersion: String;
	IsUninstallFlag:Boolean;
	//VersionError: String;
begin
	Result := true;
	
	IsUninstallFlag := False;

	// read the installation folder
	PrevDir := GetPathInstalled(getAppID(''));

	if length(Prevdir) > 0 then begin
		// I found the folder so it's an upgrade.
		
		// compare versions
		InstalledCurrentVersion := GetInstalledCurrentVersion();
		InstalledVersion := GetAppCurrentVersion('');
		if (InstalledCurrentVersion < InstalledVersion) then begin
			Result := True;
		end else if (InstalledCurrentVersion = InstalledVersion)  then begin

			Result := True; //(Response = IDYES);
			//end;
		end else begin
			Response := MsgBox(
				'It appears that the existing {#myappname} installation is newer than this update.' + #13#13 +
				'The existing installation is v'+ GetAppMajorVersion('') + '.' + GetAppMinorVersion('')+'.'+InstalledCurrentVersion +'.  This update will change the installation to v'+ GetAppMajorVersion('') + '.' + GetAppMinorVersion('')+'.'+ GetAppCurrentVersion('') + '.' + #13#13 +
				'Do you want to continue with the update installation?', mbError, MB_YESNO
			);
			Result := (Response = IDYES);
		end;
	end else begin
		// Didn't find the folder so its a fresh installation.
		Result:=true;
	end;
end;

[_End]





