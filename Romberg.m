% Metode Romberg
% Kelompok Analisis Numerik
% Lazuardy Khatulistiwa (1313618008)
% Zaidan Pratama (1313618013)
% Muhammad Ardani (1313618014)

clc;
clear;
fungsi = input('Selamat datang di Program Metode Romberg\n\nNote: \n- Untuk perkalian gunakan simbol *, pangkat gunakan simbol ^, koma gunakan titik (.)\n- Jika error setelah memasukkan fungsi, silahkan dicek ulang inputan fungsinya.\n- Maksud dari permintaan input (y/t) adalah "y" untuk ya, "t" untuk tidak.\n\nMasukkan fungsi 1 variabel( contoh: x^2*cos(x^2) ):\n','s');
F = str2func(['@(x)',fungsi]);
a = input('Masukkan batas bawah:\n');
b = input('Masukkan batas atas:\n');
tanya = input('Apakah h diketahui? (y/t):\n', 's');
if strcmp(tanya,'y')
    h = input('Masukkan h:\n');
    n = (b-a)/h;
else
    n = input('Masukkan n:\n');
    h = (b-a)/n;
end
arr_xr = zeros([1 n+1]);
arr_fxr = zeros([1 n+1]);
for i=1:n+1
    if (i == 1)
        arr_xr(i) = a;
    else
        arr_xr(i) = arr_xr(i-1)+h;
    end
    arr_fxr(i) = F(arr_xr(i));
end
fprintf('Tabel Xr:\n');
disp(arr_xr);
fprintf('Tabel F(Xr):\n');
disp(arr_fxr);
A_tabel = zeros([1 4]);
B_tabel = zeros([1 3]);
C_tabel = zeros([1 2]);
D_tabel = zeros([1 1]);

A_tabel(1) = 1/2*(arr_fxr(1) + arr_fxr(n+1));
A_tabel(2) = 0.5/2*(arr_fxr(1) + 2*arr_fxr(n/2+1) + arr_fxr(n+1));
result = 0;
init = 1;
for j=1:n/2-1
    init = init + 2;
    result = result + 2*arr_fxr(init);
end
A_tabel(3) = 0.25/2*(arr_fxr(1) + result + arr_fxr(n+1));
init2 = 1;
result2 = 0;
for j=1:n-2+1
    init2 = init2 + 1;
    result2 = result2 + 2*arr_fxr(init2);
end
A_tabel(4) = 0.125/2*(arr_fxr(1) + result2 + arr_fxr(n+1));
fprintf('Tabel A:\n');
disp(A_tabel);

B_tabel(1) = A_tabel(2) + ((A_tabel(2) - A_tabel(1))/(2^2-1));
B_tabel(2) = A_tabel(3) + ((A_tabel(3) - A_tabel(2))/(2^2-1));
B_tabel(3) = A_tabel(4) + ((A_tabel(4) - A_tabel(3))/(2^2-1));
fprintf('Tabel B:\n');
disp(B_tabel);

C_tabel(1) = B_tabel(2) + ((B_tabel(2) - B_tabel(1))/(2^4-1));
C_tabel(2) = B_tabel(3) + ((B_tabel(3) - B_tabel(2))/(2^4-1));
fprintf('Tabel C:\n');
disp(C_tabel);

D_tabel(1) = C_tabel(2) + ((C_tabel(2) - C_tabel(1))/(2^6-1));
fprintf('Tabel D (Hasil):\n');
disp(D_tabel)