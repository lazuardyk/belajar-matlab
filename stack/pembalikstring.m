fprintf('Program Pembalik String\n\n')

main = 'y';
while main == 'y'
    tumpukan = Stack(100);
    sebelum = input('Silahkan masukkan string:\n','s');
    panjang = length(sebelum);
    for i = panjang:-1:1
        tumpukan.push(sebelum(i)) % push tumpukan dari huruf belakang
    end
    hasil = tumpukan.display();
    hasil = char(hasil);
    fprintf('Hasil: %s\n', hasil);
    tanya = input('Apakah anda ingin melakukannya lagi? (y/t)','s');
    if (tanya == 't')
        main = 't';
        disp('Good bye!')
    end
end