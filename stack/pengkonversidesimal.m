fprintf('Program Pengkonversi Desimal\n\n')

main = 'y';
while main == 'y'
    bilangan = input('Silahkan masukkan angka:\n');
    if bilangan < 0
        disp('Masukkan angka positif!');
        continue
    end
    fprintf('Pilih nomor untuk tujuan konversi\n1.Biner\n2.Oktal\n3.Heksadesimal\n')
    pilihan = input('Silahkan masukkan angka:\n');
    if pilihan == 1
        tumpukansisa = Stack(100);
        tumpukanhasil = Stack(100);
        integer = floor(bilangan);
        if integer < 1 % jika bil bulat 0 
            tumpukanhasil.push('0');
        end
        fraction = bilangan - integer; % setelah koma (pecahan)
        batas = 0;
        if fraction > 0
            konversi = num2str(bilangan);
            pisah = strsplit(konversi, '.');
            kanan = char(pisah(2));
            batas = batas + length(kanan);
        end
        while integer > 0 % proses bilangan bulat
            sisa = mod(integer,2);
            tumpukansisa.push(int2str(sisa));
            hasilbagi = integer/2;
            integer = floor(hasilbagi);
        end
        
        while tumpukansisa.length > 0
            tumpukanhasil.push(tumpukansisa.pop());
        end
        if batas > 0
            tumpukanhasil.push('.')
        end
        while batas > 0 % proses pecahan
            fraction = fraction * 2;
            fract_sisa = floor(fraction);
            if fract_sisa == 1
                fraction = fraction - fract_sisa;
                tumpukanhasil.push(int2str(1))
                batas = batas - 1;
            else
                tumpukanhasil.push(int2str(0))
                batas = batas - 1;
            end
        end
        hasil = tumpukanhasil.display();
        hasil = char(hasil);
        fprintf('Hasil: %s\n', hasil);
        
    elseif pilihan == 2
        tumpukansisa = Stack(100);
        tumpukanhasil = Stack(100);
        integer = floor(bilangan);
        if integer < 1
            tumpukanhasil.push('0');
        end
        fraction = bilangan - integer;
        batas = 0;
        if fraction > 0
            konversi = num2str(bilangan);
            pisah = strsplit(konversi, '.');
            kanan = char(pisah(2));
            batas = batas + length(kanan);
        end
        while integer > 0
            sisa = mod(integer,8);
            tumpukansisa.push(int2str(sisa));
            hasilbagi = integer/8;
            integer = floor(hasilbagi);
        end
        
        while tumpukansisa.length > 0
            tumpukanhasil.push(tumpukansisa.pop());
        end
        if batas > 0
            tumpukanhasil.push('.')
        end
        while batas > 0
            fraction = fraction * 8;
            fract_sisa = floor(fraction);
            tumpukanhasil.push(int2str(fract_sisa));
            fraction = fraction - fract_sisa;
            batas = batas - 1;
        end
        hasil = tumpukanhasil.display();
        hasil = char(hasil);
        fprintf('Hasil: %s\n', hasil);
    elseif pilihan == 3
        tumpukansisa = Stack(100);
        tumpukanhasil = Stack(100);
        integer = floor(bilangan);
        if integer < 1
            tumpukanhasil.push('0');
        end
        fraction = bilangan - integer;
        batas = 0;
        if fraction > 0
            konversi = num2str(bilangan);
            pisah = strsplit(konversi, '.');
            kanan = char(pisah(2));
            batas = batas + length(kanan);
        end
        while integer > 0
            sisa = mod(integer,16);
            if sisa == 10
                sisa = 'A';
            elseif sisa == 11
                sisa = 'B';
            elseif sisa == 12
                sisa = 'C';
            elseif sisa == 13
                sisa = 'D';
            elseif sisa == 14
                sisa = 'E';
            elseif sisa == 15
                sisa = 'F';
            end
            if ischar(sisa)
                tumpukansisa.push(sisa);
            else
                tumpukansisa.push(int2str(sisa));
            end
            hasilbagi = integer/16;
            integer = floor(hasilbagi);
        end
        while tumpukansisa.length > 0
            tumpukanhasil.push(tumpukansisa.pop());
        end
        if batas > 0
            tumpukanhasil.push('.')
        end
        while batas > 0
            fraction = fraction * 16;
            fract_sisa = floor(fraction);
            if fract_sisa == 10
                fract_sisa = 'A';
            elseif fract_sisa == 11
                fract_sisa = 'B';
            elseif fract_sisa == 12
                fract_sisa = 'C';
            elseif fract_sisa == 13
                fract_sisa = 'D';
            elseif fract_sisa == 14
                fract_sisa = 'E';
            elseif fract_sisa == 15
                fract_sisa = 'F';
            end
            if ischar(fract_sisa)
                tumpukanhasil.push(fract_sisa);
            else
                tumpukanhasil.push(int2str(fract_sisa));
            end
            fraction = fraction - fract_sisa;
            batas = batas - 1;
        end
        hasil = tumpukanhasil.display();
        hasil = char(hasil);
        fprintf('Hasil: %s\n', hasil);
    end
    tanya = input('Apakah anda ingin melakukannya lagi? (y/t)','s');
    if (tanya == 't')
        main = 't';
        disp('Good bye!')
    end
end