clc
clear

main = 'y';
while main == 'y'
    clc
    fprintf('Program Pengkonversi Desimal\n\n')
    bilangan = input('Silahkan masukkan angka:\n');
    if bilangan < 0
        disp('Masukkan angka positif!');
        pause(1);
        continue
    end
    tujuan = 'y';
    while tujuan == 'y'
        fprintf('\nPilih nomor untuk tujuan konversi\n1.Biner\n2.Oktal\n3.Heksadesimal\n')
        pilihan = input('Silahkan masukkan pilihan(1-3):\n');
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
                batas = 10;
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
            hasil = transpose(char(hasil));
            fprintf('Hasil (biner): %s\n', hasil);
            pembuktian(1,hasil);

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
                batas = 10;
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
            hasil = transpose(char(hasil));
            fprintf('Hasil (oktal): %s\n', hasil);
            pembuktian(2,hasil);

        elseif pilihan == 3
            bilangan = num2str(bilangan);
            tumpukansisa = Stack(100);
            tumpukanhasil = "";
            panjangfrac = 0;
            if strfind(bilangan,'.')
                pisah = strsplit(bilangan, '.');
                strfrac = char(pisah(2));
                panjangfrac = 10;
            end
            integer = floor(str2num(char(bilangan)));
            strint = num2str(integer);
            hasilkali = Stack(100);
            panjangint = length(num2str(integer));
            while integer > 0 % proses bil bulat
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
                if isstring(sisa)
                    tumpukansisa.push(sisa);
                else
                    tumpukansisa.push(num2str(sisa));
                end
                hasilbagi = integer/16;
                integer = floor(hasilbagi);
            end
            while tumpukansisa.length > 0
                a = tumpukansisa.pop();
                tumpukanhasil = strcat(tumpukanhasil,a);
            end
            if panjangfrac > 0
                tumpukanhasil = strcat(tumpukanhasil,'.');
                fraction = str2num(strfrac);
                for i = 1:panjangfrac
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
                    if isstring(fract_sisa)
                        tumpukanhasil = strcat(tumpukanhasil, fract_sisa);
                    else
                        tumpukanhasil = strcat(tumpukanhasil, int2str(fract_sisa));
                    end
                    fraction = fraction - fract_sisa;
                end
            end
            fprintf('Hasil (heksadesimal): %s\n', tumpukanhasil);
            pembuktian(3,tumpukanhasil)
        end
        tanya = input('Apakah anda ingin mengkonversi angka ini ke yang lainnya?(y/t)','s');
        if (tanya == 't')
            tujuan = 't';
        end
    end
    tanyalagi = input('Apakah anda ingin melakukannya lagi? (y/t)','s');
    if (tanyalagi == 't')
        main = 't';
        disp('Good bye!')
    end
end

function pembuktian(pilihan,bilangan)
    if pilihan == 1
        fprintf("\nPembuktian untuk bilangan biner: %s\n",bilangan);
        panjangfrac = 0;
        if strfind(bilangan,'.')
            pisah = strsplit(bilangan, '.');
            strfrac = char(pisah(2));
            panjangfrac = length(strfrac);
        end
        integer = floor(str2num(bilangan));
        strint = num2str(integer);
        hasilkali = Stack(100);
        panjangint = length(num2str(integer));
        pangkatint = 0;
        while panjangint > 0 % proses bil bulat
            a = str2num(strint(panjangint));
            kali = (2 ^ pangkatint) * a;
            disp("2^"+num2str(pangkatint)+" * "+num2str(a)+" = "+num2str(kali))
            hasilkali.push(kali);
            panjangint = panjangint - 1;
            pangkatint = pangkatint + 1;
        end
        pangkatfrac = 1;
        if panjangfrac > 0
            for i = 1:panjangfrac
                a = str2num(strfrac(i));
                kali = (1/2 ^ pangkatfrac) * a;
                disp("1/2^"+num2str(pangkatfrac)+" * "+num2str(a)+" = "+num2str(kali))
                hasilkali.push(kali);
                pangkatfrac = pangkatfrac + 1;
            end
        end
        hasilawal = 0; 
        for i = 1:hasilkali.length()
            hasilawal = hasilawal + hasilkali.pop();
        end
        hasil = hasilawal;
        hasil = num2str(hasil);
        fprintf("Hasil penjumlahan (desimal): %s\n\n",hasil);
      elseif pilihan == 2
        fprintf("\nPembuktian untuk bilangan oktal: %s\n",bilangan);
        panjangfrac = 0;
        if strfind(bilangan,'.')
            pisah = strsplit(bilangan, '.');
            strfrac = char(pisah(2));
            panjangfrac = length(strfrac);
        end
        integer = floor(str2num(bilangan));
        strint = num2str(integer);
        hasilkali = Stack(100);
        panjangint = length(num2str(integer));
        pangkatint = 0;
        while panjangint > 0 % proses bil bulat
            a = str2num(strint(panjangint));
            kali = (8 ^ pangkatint) * a;
            disp("8^"+num2str(pangkatint)+" * "+num2str(a)+" = "+num2str(kali))
            hasilkali.push(kali);
            panjangint = panjangint - 1;
            pangkatint = pangkatint + 1;
        end
        pangkatfrac = 1;
        if panjangfrac > 0
            for i = 1:panjangfrac
                a = str2num(strfrac(i));
                kali = (1/8 ^ pangkatfrac) * a;
                disp("1/8^"+num2str(pangkatfrac)+" * "+num2str(a)+" = "+num2str(kali))
                hasilkali.push(kali);
                pangkatfrac = pangkatfrac + 1;
            end
        end
        hasilawal = 0; 
        for i = 1:hasilkali.length()
            hasilawal = hasilawal + hasilkali.pop();
        end
        hasil = hasilawal;
        hasil = num2str(hasil);
        fprintf("Hasil penjumlahan (desimal): %s\n\n",hasil);
    elseif pilihan == 3
        fprintf("\nPembuktian untuk bilangan heksadesimal: %s\n",bilangan);
        heksaint = Stack(100);
        heksafrac = Stack(100);
        panjangkiri = length(char(bilangan));
        panjangfrac = 0;
        if strfind(bilangan,'.')
            pisah = strsplit(bilangan, '.');
            kiri = char(pisah(1));
            kanan = char(pisah(2));
            panjangkiri = length(kiri);
            panjangfrac = length(kanan);
            for i = 1:panjangfrac
            if kanan(i) == 'A'
                heksafrac.push(10)
            elseif kanan(i) == 'B'
                heksafrac.push(11)
            elseif kanan(i) == 'C'
                heksafrac.push(12)
            elseif kanan(i) == 'D'
                heksafrac.push(13)
            elseif kanan(i) == 'E'
                heksafrac.push(14)
            elseif kanan(i) == 'F'
                heksafrac.push(15)
            else
                konv = str2num(kanan(i));
                heksafrac.push(konv)
            end
        end
        end
        for i = 1:panjangkiri
            if bilangan{1}(i) == 'A'
                heksaint.push(10)
            elseif bilangan{1}(i) == 'B'
                heksaint.push(11)
            elseif bilangan{1}(i) == 'C'
                heksaint.push(12)
            elseif bilangan{1}(i) == 'D'
                heksaint.push(13)
            elseif bilangan{1}(i) == 'E'
                heksaint.push(14)
            elseif bilangan{1}(i) == 'F'
                heksaint.push(15)
            else
                konv = str2num(bilangan{1}(i));
                heksaint.push(konv)
            end
        end
        bilanganfrac = transpose(cell2mat(heksafrac.display()));
        bilanganint = transpose(cell2mat(heksaint.display()));
        hasilkali = Stack(100);
        pangkatint = 0;
        panjangint = length(bilanganint);
        while panjangint > 0
            kali = (16 ^ pangkatint) * bilanganint(panjangint);
            disp("16^"+num2str(pangkatint)+" * "+bilanganint(panjangint)+" = "+num2str(kali))
            hasilkali.push(kali);
            pangkatint = pangkatint + 1;
            panjangint = panjangint - 1;
        end
        pangkatfrac = 1;
        if panjangfrac > 0
            for i = 1:panjangfrac
                a = bilanganfrac(i);
                kali = (1/16 ^ pangkatfrac) * a;
                disp("1/16^"+num2str(pangkatfrac)+" * "+num2str(a)+" = "+num2str(kali))
                hasilkali.push(kali);
                pangkatfrac = pangkatfrac + 1;
            end
        end
        hasilawal = 0; 
        for i = 1:hasilkali.length()
            hasilawal = hasilawal + hasilkali.pop();
        end
        hasil = hasilawal;
        hasil = num2str(hasil);
        fprintf("Hasil penjumlahan (desimal): %s\n\n",hasil);
    end
end