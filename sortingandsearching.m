% Kelompok 8
% Lazuardy Khatulistiwa
% Puti Andini
% Fajar Nurrahman

clc
clear
main = 'y';
while main == 'y'
    clc
    fprintf('Program Sorting dan Searching\n\n')
    tanya = input('Masukkan data angka (pisahkan dengan spasi):\n', 's');
    pilih = menu();   
    stop = 'n';
    while stop == 'n'
        if pilih == 1
            clc
            disp(bubbleSort(tanya))
        elseif pilih == 2
            clc
            disp(insertionSort(tanya))
        elseif pilih == 3
            clc
            disp(selectionSort(tanya))
        elseif pilih == 4
            clc
            disp(inplaceSort(tanya))
        elseif pilih == 5
            clc
            disp(shellSort(tanya))
        elseif pilih == 6
            clc
            disp("Proses Merge Sort:");
            disp(tanya);
            disp(mergeSort(tanya))
        elseif pilih == 7
            clc
            disp("Proses Quick Sort:");
            disp(tanya);
            disp(quickSort(str2num(tanya)));
        elseif pilih == 8
            clc
            fprintf("Linear Search\n");
            fprintf("Data: \n");
            disp(tanya);
            fprintf('\b');
            x = input('\nKetik angka yang ingin dicari:\n');
            disp(linearSearch(tanya, x));
        elseif pilih == 9
            clc
            fprintf("Binary Search\n");
            fprintf("Data: \n");
            disp(tanya);
            fprintf('\b');
            x = input('\nKetik angka yang ingin dicari:\n');
            disp(binarySearch(str2num(tanya), numel(str2num(tanya)), x));
        end
        lagi = menu2();
        if lagi == 1
            stop = 'y';
        elseif lagi == 2
            clc
            fprintf("Data: \n");
            disp(tanya);
            fprintf('\b');
            pilih = menu();
        elseif lagi == 3
            stop = 'y';
            main = 't';
            clc
        end
    end
end

function pilihan = menu()
    fprintf('\n1. Bubble Sort\n2. Insertion Sort\n3. Selection Sort\n4. In Place Sort\n5. Shell Sort\n6. Merge Sort\n7. Quick Sort\n8. Linear Search\n9. Binary Search\n')
    pilihan = input('Masukkan angka pilihan program:\n');
end

function lagi = menu2()
    fprintf('1. Ketik angka ulang dan mulai dari awal\n2. Kembali ke menu dengan angka yang sama\n3. Keluar dari program\n')
    lagi = input('Masukkan angka pilihan program:\n');
end

function hasil = bubbleSort(inp)
    
    arr = str2num(inp);
    n = length(arr);
    disp("Banyaknya data:")
    fprintf("%d\n\nProses Bubble Sort:\n",n)
    for i = 1:n
        for j = 1:n-i
           disp(arr);
           fprintf('\b');
           fprintf("%d dibandingkan dengan %d\n",arr(j),arr(j+1));
           if (arr(j) > arr(j+1))
                temp = arr(j);
                arr(j) = arr(j+1);
                arr(j+1) = temp;
            end
        end
    end
    hasil = arr;
end

function hasil = insertionSort(inp)
    arr = str2num(inp);
    n = length(arr);
    disp("Banyaknya data:")
    fprintf("%d\n\nProses Insertion Sort:\n",n)
    for i = 2:n
        key = arr(i);
        disp(arr)
        fprintf('\b');
        fprintf("%d dibandingkan dengan sisi kiri\n", key);
        j = i-1;
        while (j >=1 && key < arr(j))
            arr(j+1) = arr(j);
            j = j - 1;
        end
        arr(j+1) = key;
    end
    hasil = arr;
end

function hasil = selectionSort(inp)
    arr = str2num(inp);
    n = length(arr);
    disp("Banyaknya data:")
    fprintf("%d\n\nProses Selection Sort:\n",n);
    for i = 1:n
        min_idx = i;
        disp(arr);
        fprintf('\b');
        fprintf("pos = %d\n", arr(min_idx))
        for j = i:n
           if (arr(min_idx) > arr(j))
                min_idx = j;
           end
        end
        temp = arr(i);
        arr(i) =  arr(min_idx);
        arr(min_idx) = temp;
    end
    hasil = arr;
end

function hasil = inplaceSort(inp)
    arr = str2num(inp);
    n = length(arr);
    fprintf("Banyaknya data: %d\n", n);
    fprintf("Proses In Place Sort:\n\n", n);
    for i = n:-1:1
        index = i;
        disp(arr);
        fprintf('\b');
        fprintf("Pos awal index ke-: %d\n", index)
        for j = 1:i
            disp(arr);
            fprintf('\b');
            fprintf("%d dibandingkan dengan %d\n", arr(j), arr(index))
            if ( arr(j) > arr(index) )
                index = j;
            end
        end
%         fprintf("Pos berubah index ke-: %d\n", index)
        temp = arr(i);
        arr(i) = arr(index);
        arr(index) = temp;
    end
    hasil = arr;
end

function hasil = shellSort(inp)
    arr = str2num(inp);
    n = length(arr);
    fprintf("Banyaknya data: %d\n",n);
    h = 1;
    iterasi = 1;
    
    while (h < n/3)
        h = h*3 + 1;
    end
    
    while (h > 1)
        fprintf("Gap yang dipakai: %d\n",h);
        for luar = h + 1:n
            fprintf("%d dibandingkan dengan %d\n",arr(luar),arr(luar-h));
            disp(arr);
            if arr(luar) < arr(luar - h)
                temp = arr(luar);
                arr(luar) = arr(luar - h);
                arr(luar - h) = temp;
            end

        end
        h = (h - 1) / 3;
        iterasi = iterasi + 1;
    end
    
    if (h == 1)
        fprintf("Gap yang dipakai: %d\n",h);
        for i = 2:n
        key = arr(i);
        fprintf("%d dibandingkan dengan sisi kiri\n", key);
        disp(arr)
        j = i-1;
            while (j >=1 && key < arr(j))
                arr(j+1) = arr(j);
                j = j - 1;
            end
        arr(j+1) = key;
        end
    end
    hasil = arr;
    
end

function outList = mergeSort(inpList)
            memorize = NaN;
            outList = [];
             disp("Input");
             disp(inpList);
            if (length(inpList) == 1)
                outList = inpList;
            elseif(length(inpList) == 2)
                if (inpList(1) > inpList(2))
                    memorize = inpList(2);
                    inpList(2) = inpList(1);
                    inpList(1) = memorize;
                end
                outList = inpList;
            else
                mid = floor(length(inpList) / 2);
                list1 = mergeSort(inpList(1:mid));
                list2 = mergeSort(inpList(mid+1:length(inpList)));
                i1 = 1;
                i2 = 1;
%                  disp(list1);
%                  disp(list2);
                repeat = length(inpList);
                while(repeat >= 0)
                    if (i1 > length(list1) && i2 <= length(list2))
                        outList = [outList list2(i2:length(list2))];
                        break;
                    elseif (i2 > length(list2) && i1 <= length(list1))
                        outList = [outList list1(i1:length(list1))];
                        break;
                    elseif (list1(i1) <= list2(i2))
                        outList = [outList list1(i1)];
                        i1 = i1 +1;
                    elseif (list1(i1) > list2(i2))
                        outList = [outList list2(i2)];
                        i2 = i2 +1;
                    end
                    repeat = repeat - 1;
                end
                disp("Output");
                disp(outList);
            end
end

function hasil = quickSort(arr)
    n = length(arr);
    if n < 2
        hasil = arr;
        return
    end
    disp(arr)
    fprintf('\b');
    kecil = "";
    besar = "";
    pivot = arr(1);
    disp("pivot = ");
    disp(pivot);
    fprintf('\b');
    for i = 2:n
        if (pivot > arr(i))
            kecil = strcat(kecil," ",num2str(arr(i))," ");
        else
            besar = strcat(besar," ",num2str(arr(i))," ");
        end
    end
    kecil = [str2num(char(kecil))];
    disp("kecil =");
    disp(kecil);
    fprintf('\n\b');
    besar = [str2num(char(besar))];
    disp("besar =");
    disp(besar);
    fprintf('\n\b');
    part = [kecil pivot besar];
    disp("gabung =");
    disp(part);
    fprintf('\n\b');
    
%     while (length(kecil) > 1 || length(besar) > 1)
    hasil = [quickSort(kecil) pivot quickSort(besar)];
%     end
end

function hasil = linearSearch(inp, x)
    arr = str2num(inp);
    n = length(arr);
    posisi = -1;
    ind = 1;
    while ind < n+1
        fprintf("index ke-%d bernilai %d\n", ind, arr(ind));
        if (arr(ind) == x)
            posisi = ind;
        end
        ind = ind + 1;
    hasil = posisi;
    end
end

function [index] = binarySearch(A, n, num)

left = 1;
right = n;
flag = 0;

while left <= right
    mid = ceil((left + right) / 2);
    disp(A);
    fprintf('\b');
    fprintf("tengah = %d\n", mid);
    fprintf("kanan = %d\n", right);
    fprintf("kiri = %d\n", left);
    
    if A(mid) == num
        index = mid;
        flag = 1;
        break;
    else if A(mid) > num
        right = mid - 1;
        else
            left = mid + 1;
        end
    end
end

if flag == 0
    index = -1;
end

end