clc
clear

main = 'y';
while main == 'y'
    clc
    fprintf('Program Tumpukan dengan Array\n\n')
    lanjut = 1;
    tumpukan = Stack(100);
    while lanjut == 1
        minta = input('Silahkan masukkan nama untuk menambahkan, atau ketik "selesai" untuk selesai menambahkan\n','s');
        if strcmp(minta,'selesai')
            hasil = transpose(tumpukan.display());
            disp('Hasil Tumpukan:')
            for i = 1:length(hasil)
                fprintf('%i. %s\n',i,hasil{i})
            end
            break
        else
            tumpukan.push(minta)
        end
    end
    tanya = input('Apakah anda ingin membuat tumpukan lagi? (y/t)','s');
    if (tanya == 't')
        main = 't';
        disp('Good bye!')
    end
end
        
