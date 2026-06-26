CREATE DATABASE project_basdat;
USE project_basdat;

-- Tabel Pengirim
CREATE TABLE Pengirim (
    id_pengirim VARCHAR(10) PRIMARY KEY,
    nama_pengirim VARCHAR(100) NOT NULL,
    alamat_pengirim VARCHAR(255) NOT NULL,
    no_telepon_pengirim VARCHAR(15) NOT NULL UNIQUE
);

-- Tabel Penerima
CREATE TABLE Penerima (
    id_penerima VARCHAR(10) PRIMARY KEY,
    nama_penerima VARCHAR(100) NOT NULL,
    alamat_penerima VARCHAR(255) NOT NULL,
    no_telepon_penerima VARCHAR(15) NOT NULL UNIQUE
);

-- Tabel Kurir
CREATE TABLE Kurir (
    id_kurir VARCHAR(10) PRIMARY KEY,
    nama_kurir VARCHAR(100) NOT NULL,
    no_telepon_kurir VARCHAR(15) NOT NULL UNIQUE,
    jenis_kendaraan VARCHAR(30) NOT NULL,
    plat_nomor VARCHAR(15) NOT NULL UNIQUE,
    status_kurir VARCHAR(20) NOT NULL CHECK (status_kurir IN ('Tersedia', 'Bertugas', 'Tidak Tersedia'))
);

-- Tabel Rute
CREATE TABLE Rute (
    id_rute VARCHAR(10) PRIMARY KEY,
    kota_asal VARCHAR(50) NOT NULL,
    kota_tujuan VARCHAR(50) NOT NULL,
    jarak_km DECIMAL(8,2) NOT NULL CHECK (jarak_km > 0),
    estimasi_hari_rute INT NOT NULL CHECK (estimasi_hari_rute > 0)
);

-- Tabel Jenis Layanan
CREATE TABLE Jenis_Layanan (
    id_layanan VARCHAR(10) PRIMARY KEY,
    nama_layanan VARCHAR(50) NOT NULL,
    estimasi_hari_layanan INT NOT NULL,
    biaya_tambahan DECIMAL(12,2) NOT NULL DEFAULT 0
);

-- Tabel Tarif
CREATE TABLE Tarif (
    id_tarif VARCHAR(10) PRIMARY KEY,
    id_rute VARCHAR(10) NOT NULL,
    id_layanan VARCHAR(10) NOT NULL,
    tarif_per_kg DECIMAL(10,2) NOT NULL CHECK (tarif_per_kg >= 0),
    biaya_dasar DECIMAL(10,2) NOT NULL CHECK (biaya_dasar >= 0),
    FOREIGN KEY (id_rute) REFERENCES Rute(id_rute),
    FOREIGN KEY (id_layanan) REFERENCES Jenis_Layanan(id_layanan),
    UNIQUE (id_rute, id_layanan)
);

-- Tabel Status Pengiriman
CREATE TABLE Status_Pengiriman (
    id_status VARCHAR(10) PRIMARY KEY,
    nama_status VARCHAR(50) NOT NULL UNIQUE
);

-- Tabel Paket
CREATE TABLE Paket (
    id_paket VARCHAR(10) PRIMARY KEY,
    nomor_resi VARCHAR(20) NOT NULL UNIQUE,
    id_pengirim VARCHAR(10) NOT NULL,
    id_penerima VARCHAR(10) NOT NULL,
    id_kurir VARCHAR(10) NOT NULL,
    id_rute VARCHAR(10) NOT NULL,
    id_tarif VARCHAR(10) NOT NULL,
    id_layanan VARCHAR(10) NOT NULL,
    id_status VARCHAR(10) NOT NULL,
    tanggal_pengiriman DATE NOT NULL,
    jenis_barang VARCHAR(100) NOT NULL,
    nilai_barang DECIMAL(15,2) CHECK (nilai_barang >= 0),
    total_biaya DECIMAL(12,2) CHECK (total_biaya >= 0),
    berat_barang DECIMAL(8,2) CHECK (berat_barang >= 0),
    FOREIGN KEY (id_pengirim) REFERENCES Pengirim(id_pengirim),
    FOREIGN KEY (id_penerima) REFERENCES Penerima(id_penerima),
    FOREIGN KEY (id_kurir) REFERENCES Kurir(id_kurir),
    FOREIGN KEY (id_rute) REFERENCES Rute(id_rute),
    FOREIGN KEY (id_tarif) REFERENCES Tarif(id_tarif),
    FOREIGN KEY (id_layanan) REFERENCES Jenis_Layanan(id_layanan),
    FOREIGN KEY (id_status) REFERENCES Status_Pengiriman(id_status)
);

-- Tabel Pembayaran
CREATE TABLE Pembayaran (
    id_pembayaran VARCHAR(10) PRIMARY KEY,
    id_paket VARCHAR(10) NOT NULL,
    jumlah_dibayar DECIMAL(15,2) NOT NULL CHECK (jumlah_dibayar >= 0),
    metode_pembayaran VARCHAR(50) NOT NULL,
    tgl_pembayaran DATE NOT NULL,
    status_pembayaran VARCHAR(20) NOT NULL CHECK (status_pembayaran IN ('Lunas', 'Belum Lunas', 'Gagal')),
    FOREIGN KEY (id_paket) REFERENCES Paket(id_paket)
);

-- Tabel Riwayat Tracking
CREATE TABLE Riwayat_Tracking (
    id_tracking VARCHAR(10) PRIMARY KEY,
    id_paket VARCHAR(10) NOT NULL,
    id_status VARCHAR(10) NOT NULL,
    waktu DATETIME NOT NULL,
    FOREIGN KEY (id_paket) REFERENCES Paket(id_paket),
    FOREIGN KEY (id_status) REFERENCES Status_Pengiriman(id_status)
);

-- ============================================================
-- Index untuk performa
-- ============================================================
CREATE INDEX idx_riwayat_paket ON Riwayat_Tracking(id_paket);
CREATE INDEX idx_riwayat_waktu ON Riwayat_Tracking(waktu);
CREATE INDEX idx_paket_status ON Paket(id_status);
CREATE INDEX idx_paket_tanggal ON Paket(tanggal_pengiriman);
CREATE INDEX idx_paket_kurir ON Paket(id_kurir);