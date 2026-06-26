-- VIEW
-- View Detail Pengiriman
CREATE VIEW vw_detail_pengiriman AS
SELECT
    p.nomor_resi,
    pg.nama_pengirim,
    pn.nama_penerima,
    k.nama_kurir,
    sp.nama_status
FROM Paket p
JOIN Pengirim pg ON p.id_pengirim = pg.id_pengirim
JOIN Penerima pn ON p.id_penerima = pn.id_penerima
JOIN Kurir k ON p.id_kurir = k.id_kurir
JOIN Status_Pengiriman sp ON p.id_status = sp.id_status;

SELECT * FROM vw_detail_pengiriman;

-- View Rekap Pembayaran
CREATE VIEW vw_rekap_pembayaran AS
SELECT
    p.nomor_resi,
    pb.metode_pembayaran,
    pb.jumlah_dibayar,
    pb.status_pembayaran
FROM Paket p
JOIN Pembayaran pb
ON p.id_paket = pb.id_paket;

SELECT * FROM vw_rekap_pembayaran;
