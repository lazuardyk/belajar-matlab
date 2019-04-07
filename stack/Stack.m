classdef Stack < handle
    properties (Access = private) % deklarasi properti
        stack
        panjang
        kapasitas
    end
    methods
        function objek = Stack(ukuran) % konstruktor
            objek.stack = cell(ukuran,1);
            objek.kapasitas = ukuran;
            objek.panjang = 0;
        end
        function push(objek, sesuatu) % menambahkan sesuatu
            objek.panjang = objek.panjang + 1;
            objek.stack{objek.panjang} = sesuatu;
        end
        function hasil = pop(objek) % mengeluarkan sesuatu
            hasil = objek.stack{objek.panjang};
            objek.panjang = objek.panjang - 1;
        end
        function hasil = peek(objek) % menampilkan paling panjang
            hasil = objek.stack{objek.panjang};
        end
        function hasil = display(objek) % menampilkan stack
            hasil = objek.stack(1:objek.panjang);
%             konversi = cell2mat(konten);
%             hasil = konversi;
        end
        function hasil = isempty(objek)
            hasil = ~logical(objek.panjang);
        end
        function hasil = length(objek)
            hasil = objek.panjang;
        end
    end
end
            
    