% Metode Euler
% Kelompok Metode Numerik
% Lazuardy Khatulistiwa (1313618008)
% Zaidan Pratama (1313618013)
% Muhammad Ardani (1313618014)

clc;
clear;
fungsi = input('Selamat datang di Program Metode Euler\n\nNote: \n- Untuk perkalian gunakan simbol *, pangkat gunakan simbol ^, koma gunakan titik (.)\n- Jika error setelah memasukkan fungsi differensial, silahkan dicek ulang inputan fungsinya.\n- Maksud dari permintaan input (y/t) adalah "y" untuk ya, "t" untuk tidak.\n\nMasukkan fungsi differensial (contoh: 5*x^2 + y^2 + 8.5):\n','s');
F = str2func(['@(x,y)',fungsi]);
x = input('Masukkan x awal (x0) (jika tidak diketahui ketik 0):\n');
y = input('Masukkan y awal (y0):\n');
h = input('Masukkan h:\n');
bena = input('Apakah jumlah iterasi diketahui? (y/t):','s');
if strcmp(bena,'y')
    n = input('Masukkan jumlah iterasi:\n');
else
    xakhir = input('Masukkan x akhir (contoh: 0<x<0.5 maka 0.5 = x akhir, atau ditanya y(0.5) maka 0.5 = x akhir):\n');
    n = (xakhir-x)/h;
end

hasil=[x y];

for r=1:n+1
    s = F(x,y);
    y=y+h*s;
    x=x+h;
    hasil=[hasil; x y];
end

disp("hasil (x,y):");
disp(hasil);
