-- PROCEDURE
-- Procedure menampilkan seluruh data paket beserta hasil perhitungan biayanya
DELIMITER //

CREATE PROCEDURE TampilSemuaBiayaPaket()
BEGIN

    SELECT
        p.id_paket,
        p.nomor_resi,
        p.berat_barang,
        t.tarif_per_kg,
        t.biaya_dasar,
        jl.biaya_tambahan,

        (p.berat_barang * t.tarif_per_kg)
        + t.biaya_dasar
        + jl.biaya_tambahan
        AS total_perhitungan,

        p.total_biaya AS total_di_database

    FROM Paket p
    JOIN Tarif t
        ON p.id_tarif = t.id_tarif
    JOIN Jenis_Layanan jl
        ON p.id_layanan = jl.id_layanan;

END //

DELIMITER ;

CALL TampilSemuaBiayaPaket();