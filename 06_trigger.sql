-- TRIGGER
-- Trigger Otomatis menghitung total biaya paket
DELIMITER //

CREATE TRIGGER trg_hitung_total_biaya
BEFORE INSERT ON Paket
FOR EACH ROW
BEGIN

    DECLARE v_tarif DECIMAL(10,2);
    DECLARE v_dasar DECIMAL(10,2);
    DECLARE v_tambahan DECIMAL(10,2);

    SELECT tarif_per_kg, biaya_dasar
    INTO v_tarif, v_dasar
    FROM Tarif
    WHERE id_tarif = NEW.id_tarif;

    SELECT biaya_tambahan
    INTO v_tambahan
    FROM Jenis_Layanan
    WHERE id_layanan = NEW.id_layanan;

    SET NEW.total_biaya =
        (NEW.berat_barang * v_tarif)
        + v_dasar
        + v_tambahan;

END //

DELIMITER ;

-- Contoh
INSERT INTO Paket
(id_paket, nomor_resi, id_pengirim, id_penerima,
 id_kurir, id_rute, id_tarif, id_layanan,
 id_status, tanggal_pengiriman,
 jenis_barang, nilai_barang, total_biaya, berat_barang)

VALUES
('PK021','LGT260021','R001','P001',
 'K001','RT001','T001','LY001',
 'ST001','2026-08-01',
 'Keyboard',300000,NULL,2);
 
 SELECT id_paket, berat_barang, total_biaya
FROM Paket
WHERE id_paket = 'PK021';