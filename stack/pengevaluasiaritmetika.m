fprintf('Program Pengevaluasi Ekspresi Aritmatika\n\n')

main = 'y';
while main == 'y'
    tanya = input('Masukkan ekspresi matematika (pisahkan dengan spasi):\n', 's');
    ekspresi = Stack(100);
    hasil = hitung(tanya);
    a = sprintf('%f', hasil);
    fprintf('Hasil: %s\n', a);
    tanya = input('Apakah anda ingin melakukannya lagi? (y/t)','s');
    if (tanya == 't')
        main = 't';
        disp('Good bye!')
    end
end

function final = hitung(ekspresi)
    angka = Stack(100);
    operator = Stack(100);
    i = 1;
    while i < length(ekspresi) + 1
        % fprintf("Iterasi ke : %i\n", i);
        if strcmp(ekspresi(i),' ') % jika spasi, lanjut ke iterasi selanjutnya
            i = i + 1;
            continue
            
        elseif ekspresi(i) == '('
            operator.push(ekspresi(i))
            
        elseif isstrprop(ekspresi(i),'digit') %jika angka, push angka ke stack
            val = 0;
            while (i < length(ekspresi) + 1 && isstrprop(ekspresi(i),'digit'))
                val = (val * 10) + str2num(ekspresi(i));
                i = i + 1;
            end
            angka.push(val)

        elseif ekspresi(i) == ')' % jika penutup kurung, selesaikan perhitungan yang didalam kurung
            while operator.length() ~= 0 && operator.peek() ~= '('
                val2 = angka.pop();
                val1 = angka.pop();
                op = operator.pop();
                angka.push(perhitungan(val1, val2, op)) 
            end
            operator.pop(); 
        else
            while (operator.length() ~= 0 && hakoperator(operator.peek()) >= hakoperator(ekspresi(i)))
                val2 = angka.pop();
                val1 = angka.pop();
                op = operator.pop();
                angka.push(perhitungan(val1, val2, op))
            end
            operator.push(ekspresi(i))
        end
        i = i + 1;
    end
    while operator.length() ~= 0
        val2 = angka.pop();
        val1 = angka.pop();
        op = operator.pop();
        angka.push(perhitungan(val1, val2, op)) 
    end
    final = angka.peek();
    return;
end


function hasil = hakoperator(op)
    if op == '+' || op == '-'
        hasil = 1;
        return;
    end
    if op == '*' || op == '/'
        hasil = 2;
        return;
    end
    hasil = 0;
    return;
end

function hasil2 = perhitungan(a,b,op)
    if op == '+'
        hasil2 = a + b;
        return;
    end
    if op == '-'
        hasil2 = a - b;
        return;
    end
    if op == '*'
        hasil2 = a * b;
        return;
    end
    if op == '/'
        hasil2 = a / b;
        return;
    end
end