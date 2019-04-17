clc
clear
main = 'y';
while main == 'y'
    clc
    fprintf('Program Pengevaluasi Ekspresi Aritmatika\n\n')
    tanya = input('Masukkan ekspresi matematika (pisahkan dengan spasi):\n', 's');
    p = strsplit(tanya,' ');
    f = 0;
    for i = 1:length(p)
        if isdigit(char(p(i)))
            if (str2num(char(p(i))) < 0)
                hasil = hitung2(tanya);
                f = 1;
                break
            end
        end
    end
    ekspresi = Stack(100);
    if f == 0
        hasil = hitung(tanya);
    end
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

        elseif isdigit(ekspresi(i)) %jika angka, push angka ke stack
            val = 0;
            while (i < length(ekspresi) + 1 && isdigit(ekspresi(i)))
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

function hasil = isdigit(eks)
    if str2num(eks)
        hasil = 1;
    else
        hasil = 0;
    end
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
    if op == '^'
        hasil = 3;
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
    if op == '^'
        hasil2 = a ^ b;
        return;
    end
end

function hasil2 = hitung2(eks)
    hasil2 = str2num(eks);
end