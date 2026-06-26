USE project_basdat;
-- Query Sederhana
-- 1. Tampilkan 5 paket dengan total biaya tertinggi
SELECT id_paket, nomor_resi, total_biaya
FROM Paket
ORDER BY total_biaya DESC
LIMIT 5;

-- 2. Tampilkan kurir yang tersedia
SELECT nama_kurir, jenis_kendaraan, plat_nomor 
FROM Kurir 
WHERE status_kurir = 'Tersedia';

-- 3. Tampilkan paket dengan berat lebih dari 3 kg
SELECT nomor_resi, jenis_barang, berat_barang
FROM Paket
WHERE berat_barang > 3;

-- Query Dengan Join
-- 4. Detail paket (nomor resi, pengirim, penerima, kurir, total biaya, status)
SELECT 
    p.nomor_resi,
    pg.nama_pengirim,
    pe.nama_penerima,
    k.nama_kurir,
    p.total_biaya,
    s.nama_status
FROM Paket p
JOIN Pengirim pg ON p.id_pengirim = pg.id_pengirim
JOIN Penerima pe ON p.id_penerima = pe.id_penerima
JOIN Kurir k ON p.id_kurir = k.id_kurir
JOIN Status_Pengiriman s ON p.id_status = s.id_status;

-- 5. Data Pembayaran Paket
SELECT
    p.nomor_resi,
    pg.nama_pengirim,
    pb.metode_pembayaran,
    pb.jumlah_dibayar
FROM Paket p
JOIN Pengirim pg ON p.id_pengirim = pg.id_pengirim
JOIN Pembayaran pb ON p.id_paket = pb.id_paket;

-- 6. Paket dengan rute, layanan, dan tarif
SELECT 
    p.nomor_resi,
    r.kota_asal,
    r.kota_tujuan,
    jl.nama_layanan,
    t.tarif_per_kg,
    p.total_biaya
FROM Paket p
JOIN Rute r ON p.id_rute = r.id_rute
JOIN Jenis_Layanan jl ON p.id_layanan = jl.id_layanan
JOIN Tarif t ON p.id_tarif = t.id_tarif;

-- 7. Pembayaran paket dengan nama pengirim
SELECT 
    pb.id_pembayaran,
    p.nomor_resi,
    pg.nama_pengirim,
    pb.jumlah_dibayar,
    pb.metode_pembayaran,
    pb.status_pembayaran
FROM Pembayaran pb
JOIN Paket p ON pb.id_paket = p.id_paket
JOIN Pengirim pg ON p.id_pengirim = pg.id_pengirim;

--  Query dengan subquery atau CTE
-- 8. Paket dengan total biaya di atas rata-rata (subquery)
SELECT nomor_resi, total_biaya
FROM Paket
WHERE total_biaya > (SELECT AVG(total_biaya) FROM Paket);

-- 9. Menampilkan total pendapatan berdasarkan metode pembayaran
WITH TotalPendapatan AS
(
    SELECT
        metode_pembayaran,
        SUM(jumlah_dibayar) AS total_pendapatan
    FROM Pembayaran
    GROUP BY metode_pembayaran
)
SELECT *
FROM TotalPendapatan
ORDER BY total_pendapatan DESC;

-- Query dengan fungsi agregat & GROUP BY + HAVING
-- 10. Menampilkan kota tujuan yang menerima lebih dari 1 paket
SELECT
    r.kota_tujuan,
    COUNT(p.id_paket) AS jumlah_paket
FROM Paket p
JOIN Rute r
    ON p.id_rute = r.id_rute
GROUP BY r.kota_tujuan
HAVING COUNT(p.id_paket) > 1;