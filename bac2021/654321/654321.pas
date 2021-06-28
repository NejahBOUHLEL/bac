program cryptage;
uses wincrt;
Type
 	image = record
 		hex : string[2];
		Num : Integer;
		Dec : Integer ;
	end;
TAB = Array [1..26] of image ;

var
Tf1,Tf2 : Text ;
t:TAB;
n:integer;
function HexToDec(ch:string):longint;
	var
		i,z,p:integer ;
	Begin
		for i:=length(ch) downto 1 do
			begin
				if (ch[i] in ['0'..'9']) then
					begin
						z:= z+(ord(ch[i])-48 ) * p ;
					end
				Else
					Begin
						z:= z+(ord(ch[i]) - 55) * p ;
						p:= p * 16;
					end;
					
			end ;
		HexToDec := z ;
	end;
procedure remplir( var Tf: text ; var t:tab;var n:integer);
	var
		ch:string;
		k:image;
	//	i:integer;

	begin
		reset(tf);
		n:=0;
		while not eof(tf) do
			begin
				n:=n+1;
				k.num := N;
				readln(tf,ch);
				k.hex := ch ;
				k.dec := HexToDec(ch);
				t[n] := k ;
			end;
		close (tf);
			
		
	end;


function Genere ( nb : longint) : string ;
	var
		Mot: string;
		R : longint ;
		y : string; 
	begin
		Mot := '';
		repeat
			R := nb mod 3 ;
			case R of
				0 : y:= 'Ma';
				1 : y:= 'Des';
				2 : y:= 'Son';
			end ;
			Mot := y + Mot ;
			nb := nb div 3 ;
		until( nb =0);
		genere := Mot ;
	end;
procedure trier ( var t:tab ; n :integer ); // tri à bulles
	var
		test : Boolean ;
		i : integer ;
		aux : image ;
	begin
		repeat
			test := True ;
			for i:=1 to n-1 do
				begin
					if ( t[i].dec > t[i+1].dec ) then
						begin
							aux := t[i];
							t[i] := t[i+1];
							t[i+1] := aux ;
							test := false ;
						end;


				end ;

		until ( test ) ;


	end ;
procedure RempRes (var tf2:text;var t:tab ; n :integer  ) ;
	var
		 i:integer; 
	Begin
		rewrite(tf2);
		for i:= 1 to n do
			begin
				writeln(tf2,genere(t[i].dec),' ',t[i].num );
			end;
		close (tf2);

	end ;
begin // prog. princ.
assign(Tf1,'C:\bac2021\654321\imghexa.txt');
assign(Tf2,'C:\bac2021\654321\resultat.txt');
remplir (tf1,t,n);
trier (t,n);
RempRes(tf2,t,n);
end.