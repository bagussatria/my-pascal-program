Program gajii_Tunjangan_dan_Pajak;
{Menghitung jumlah gajii berdasarkan golongan, tunjangan anak dan istri, total gajii setelah pajak}
Uses crt;
Var
  nama,jab, credit : String[50];                  {Bagus Satria - 201743501242}
  nip : String[10];
  golGaji,kelamin : Char;
  StsNikah, jmlanak, hari,l : Integer;
  gaji,TjIstri,TjAnak,Pph,jmlPph,JmlTtlGaji,TtlGaji,GajiBersih,utrans,umakan,TJab : Real;
Begin
  Clrscr;
  textcolor(15);Writeln ('==================================================================');
  Writeln ('PERHITUNGAN GAJI DAN TUNJANGAN DAN PAJAK GAJI PEGAWAI PT. MAKMUR ');
  Writeln ('==================================================================');
  Writeln;
  Writeln ('                 Isi Data sesuai ketentuan berikut                ');
  Writeln ('==================================================================');
  Writeln;
  Writeln ('     Golongan Gaji          |  Kelamin    |    Status Perkawinan |');
  writeln;
  Writeln ('[D].Direktur : Rp. 1 Juta   | [P].Pria    | [1]. Menikah         |');
  Writeln ('[S].Staff    : Rp.750 Ribu  | [W].Wanita  | [2]. Belum Menikah   |');
  Write   ('[K].Karyawan : Rp.645 Ribu  |');textbackground(red);write('   *perhatikan kode !   ');
  Writeln;textbackground(black);
  writeln;
  Write ('ID Karyawan              : ');Readln (nip);
  Write ('Nama anda                : ');Readln (nama);
  Write ('Jabatan                  : ');Readln (jab);
  Write ('Golongan gaji [D/S/K]    : ');Readln (golGaji);
  write ('Jumlah hari Kerja        : ');Readln(hari);
  writeln;
  Case golGaji Of
    'D' :
          Begin
            gaji := 1000000;
            TJab:= (3.0/100)*gaji;
            Pph := (2.5/100);
            umakan := 15000*hari;
            utrans := 12500*hari;
            Write ('Status Perkawinan anda [1/2] : ');
            Readln (StsNikah);
            Case StsNikah Of
              1 :
                  Begin
                    write('jenis kelamin [P/W]: ');readln(kelamin);
                    If kelamin = 'P' Then
                      Begin
                        TjIstri := (2.5/100)*gaji;
                        Write ('Jumlah anak : ');
                        Readln (jmlanak);
                        If jmlanak <= 2 Then
                          TjAnak := jmlanak*((2.5/100)*gaji)
                        Else
                          TjAnak := 2*((2.5/100)*gaji);
                      End
                      else if kelamin = 'W' then
                      Begin
                       TjIstri :=0;
                      end

                  End;
              2 :
                  Begin
                    TjIstri := 0;
                    TjAnak := 0;
                  End;
              Else
                Writeln;
              Writeln ('===================================================================');
              Writeln;
              Writeln ('Tunjangan tidak tersedia, apakah kamu sudah menginput dengan benar?');
            End;
          End;
    'S' :
          Begin
            gaji := 750000;
            TJab:= (2.0/100)*gaji;
            Pph := (2.5/100);
            umakan := 12500*hari;
            utrans := 10000*hari;
            Write ('Status Perkawinan anda [1/2] : ');
            Readln (StsNikah);
            Case StsNikah Of
              1 :
                  Begin
                    write('jenis kelamin [P/W] : ');readln(kelamin);
                    If kelamin = 'P' Then
                      Begin
                        TjIstri := (2.5/100)*gaji;
                        Write ('Jumlah anak : ');
                        Readln (jmlanak);
                        If jmlanak <= 2 Then
                          TjAnak := jmlanak*((2.5/100)*gaji)
                        Else
                          TjAnak := 2*((2.5/100)*gaji);
                      End
                      else if kelamin = 'W' then
                      Begin
                       TjIstri :=0;
                      end
                  End;
              2 :
                  Begin
                    TjIstri := 0;
                    TjAnak := 0;
                  End;
              Else
                Writeln;
              Writeln ('===================================================================');
              Writeln;
              Writeln ('Tunjangan tidak tersedia, apakah kamu sudah menginput dengan benar?');
            End;
          End;
    'K' :
         Begin
            gaji := 645000;
            TJab:= (1.0/100)*gaji;
            Pph := (2.5/100);
            umakan := 10000*hari;
            utrans := 7500*hari;
            Write ('Status Perkawinan [1/2] : ');
            Readln (StsNikah);
            Case StsNikah Of
              1 :
                  Begin
                    write('jenis kelamin [P/W] : ');readln(kelamin);
                    If kelamin = 'P' Then
                      Begin
                        TjIstri := (2.5/100)*gaji;
                        Write ('Jumlah anak : ');
                        Readln (jmlanak);
                        If jmlanak <= 2 Then
                          TjAnak := jmlanak*((2.5/100)*gaji)
                        Else
                          TjAnak := 2*((2.5/100)*gaji);
                      End
                      else if kelamin = 'W' then
                      Begin
                       TjIstri := 0;
                      end
                  End;
              2 :
                  Begin
                    TjIstri := 0;
                    TjAnak := 0;
                  End;
              Else
                Writeln;
              Writeln ('================================================================');
              Writeln;
              Writeln ('Tunjangan tidak tersedia, apakah kamu sudah menginput dengan benar?');
            End;
          End;
    Else
      Writeln;
    Writeln ('==========================================');
    Writeln;
    Writeln ('Maaf, Golongan gaji tidak sesuai ketentuan');
    Writeln;
  End;
  JmlTtlGaji := TjIstri+TjAnak+TJab+umakan+utrans;
  TtlGaji := gaji+JmlTtlGaji;
  jmlPph := TtlGaji*Pph;
  GajiBersih := TtlGaji-jmlPph;
  credit := 'Written by, Bagus - 1242';
  Writeln;
  Writeln ('>>>> SLIP GAJI BULANAN <<<< ');
  Writeln;
  Writeln ('Nama           : ',nama);
  Writeln ('No Karyawan    : ',nip);
  Writeln ('Jabatan        : ',jab);
  Writeln ('Bekerja Selama : ',hari,' Hari');
  writeln;

  Writeln ('+=====================================================+');
  Writeln ('| Rincian Jumlah                                      |');
  Writeln ('+=====================================================+');
  Writeln ('| Gaji Pokok        : | Rp.',gaji:8:0,   '             ');
  Writeln ('| Tunjangan Istri   : | Rp.',TjIstri:8:0,'             ');
  Writeln ('| Tunjangan anak    : | Rp.',TjAnak:8:0, '             ');
  Writeln ('| Total Gaji        : | Rp.',TtlGaji:8:0,'             ');
  Writeln ('| Pajak Penghasilan : | Rp.',jmlPph:8:0, '             ');
  Writeln ('| Uang Makan        : | Rp.',umakan:8:0, '             ');
  Writeln ('| Uang Transport    : | Rp.',utrans:8:0, '             ');
  Writeln ('+-----------------------------------------------------+');
  Writeln ('| Total gaji setelah pajak : | Rp.',GajiBersih:8:0,'  |');
  Writeln ('+-----------------------------------------------------+');
   for l := 1 to length(credit) do
    Begin
      write(credit[l]);
      Delay(100);
      end;
  Readln;
End.
