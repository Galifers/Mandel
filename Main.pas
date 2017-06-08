unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  n,iy,ix:LongInt;
  z:TComplex;
  Start, Finish :Cardinal;
  x:integer;
  x2:integer;
  x4:integer;

begin
  Start:=GetTickCount;
  x:=Image1.Height - 1;
  x2:=Image1.Height div 2;
  x4:=Image1.Height div 4;
  for iy:=0 to x do begin
    for ix:=0 to x do begin

      z.re:=(ix - x2) / x4;
      z.im:=(iy - x2) / x4;

      n := fractal_mandelbrot(@z);

      {if(n > 254)then begin
        Image1.Canvas.Pixels[ix,iy]:=0;
      end else} begin
        Image1.Canvas.Pixels[ix,iy]:=rgb(n * 6 mod 255, 0, 0);
      end;
    end;
  end;
  Finish := GetTickCount;
  ShowMessage(IntToStr(Finish - Start));
end;

end.
