-- FUNCTION
-- Function menghitung Ongkir Berdasarkan Berat dan Tarif
DELIMITER //

CREATE FUNCTION HitungOngkir(
    p_berat DECIMAL(8,2),
    p_tarif_per_kg DECIMAL(10,2),
    p_biaya_dasar DECIMAL(10,2),
    p_biaya_tambahan DECIMAL(12,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    DECLARE v_total DECIMAL(12,2);

    SET v_total =
        (p_berat * p_tarif_per_kg)
        + p_biaya_dasar
        + p_biaya_tambahan;

    RETURN v_total;

END //

DELIMITER ;

-- Contoh
SELECT HitungOngkir(2,5000,10000,0) AS total_ongkir;