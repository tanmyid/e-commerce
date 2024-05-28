<style type="text/css">
    .button.big span.currency:before {
        content: 'Rp.';
        font-size: 18px;
        position: relative;
        top: -4px;
        left: -1px;
    }
</style>

<?php
if(isset($_GET['alert'])){
    if($_GET['alert'] == 'overqty'){
        echo "<script>alert('Qty tidak boleh melebihi stok yang ada!');</script>";
    }
}
?>

<!-- SECTION HEADLINE -->
<div class="section-headline-wrap">
    <div class="section-headline">
        <h2><?= $produk->produk_nama ?></h2>
        <p>Beranda<span class="separator">/</span>Produk<span class="separator">/</span><span class="current-section"><?= $produk->produk_nama ?></span></p>
    </div>
</div>
<!-- /SECTION HEADLINE -->
<!-- SECTION -->
<div class="section-wrap">
    <div class="section">
        <!-- SIDEBAR -->
        <div class="sidebar right">
            <!-- SIDEBAR ITEM -->
            <div class="sidebar-item void buttons">
                <?php if ($this->session->userdata('login_pelanggan') != 'login') : ?>
                    <a href="#" onclick="alert('Silahkan Login Untuk Memesan !')" class="button big dark purchase">
                        <span class="primary">Pesan !</span>
                    </a>
                    <a href="<?= base_url('login') ?>" class="button big primary ">
                        Masuk / Login
                    </a>
                    <a href="<?= base_url('register') ?>" class="button big secondary ">
                        Daftar / Register
                    </a>
                <?php else : ?>
                    <a href="#" class="button big dark purchase" id="btn-pesan">
                        <span class="currency"><?= number_format($produk->produk_harga, 0, '', '.') ?></span>
                        <span class="primary">Pesan !</span>
                    </a>
                <?php endif ?>
            </div>
            <!-- /SIDEBAR ITEM -->

            <!-- SIDEBAR ITEM -->
            <div class="sidebar-item product-info" id="form-pesanan" style="display: none">
                <h4>Detail Pesanan :</h4>
                <hr class="line-separator">
                <!-- INFORMATION LAYOUT -->
                <div class="information-layout v2">
                    <form method="post" action="<?= base_url('keranjang/tambahDigital/') . $produk->produkid ?>" enctype="multipart/form-data">
                        <input type="hidden" name="sisa_stok" value="<?= $produk->produk_stok ?>">
                        <div class="form-row information-layout-item">
                            <div class="form-group col-md-6">
                                <p class="text-header">Jumlah / Qty :</p>
                                <input min="<?= $produk->min_order ?>" type="number" name="qty" id="qty" value="0" required>
                                <input type="hidden" id="harga" value="<?= $produk->min_order ?>">
                            </div>
                            <div class="form-group col-md-6">
                                <p class="text-header">Satuan :</p>
                                <input type="text" name="satuan" id="satuan" value="<?= $produk->satuan_qty ?>" required readonly>
                                <input type="hidden" id="harga" value="<?= $produk->satuan_qty ?>">
                            </div>
                        </div>

                        <div class="information-layout-item">
                            <p class="text-header">Lokasi :</p>
                            <select id="destination_provice" name="destination_provice" class="form-control" id="exampleFormControlSelect1" onchange="updateProvinceText()">
                                <option>Pilih Provinsi Tujuan</option>
                                <?php foreach ($province->rajaongkir->results as $prov) { ?>
                                    <option value="<?php echo $prov->province_id ?>"><?php echo $prov->province ?></option>
                                <?php } ?>
                            </select>
                            <input type="hidden" name="destination_provice_text" id="destination_provice_text">
                            <script>
                                function updateProvinceText() {
                                    var select = document.getElementById("destination_provice");
                                    var text = select.options[select.selectedIndex].text;
                                    document.getElementById("destination_provice_text").value = text;
                                }
                            </script>
                        </div>

                        <div class="information-layout-item">
                            <p class="text-header">Kota :</p>
                            <select id="destination_city" name="destination_city" class="form-control" id="exampleFormControlSelect1" onchange="updateCityText()"></select>

                            <input type="hidden" name="destination_city_text" id="destination_city_text">
                            <script>
                                function updateCityText() {
                                    var select = document.getElementById("destination_city");
                                    var text = select.options[select.selectedIndex].text;
                                    document.getElementById("destination_city_text").value = text;
                                }
                            </script>
                        </div>

                        <div class="information-layout-item">
                            <p class="text-header">Berat : </p>
                            <input min="0" type="number" name="produk_berat" id="produk_berat" value="<?= $produk->produk_berat ?>" required readonly>
                            <!-- <input min="0" type="number" name="weight" id="weight" value="" required readonly> -->
                        </div>
                        <div class="information-layout-item">
                            <p class="text-header">Opsi Pengiriman :</p>
                            <select class="form-control" id="opKirim" name="opKirim">
                                <option>Opsi Pengiriman</option>
                                <option value="jne">JNE</option>
                                <option value="pos">POS</option>
                                <option value="tiki">TIKI</option>
                            </select>
                        </div>

                        <div class="information-layout-item">
                            <p class="text-header">Opsi Layanan : </p>
                            <select id="ongkos" name="ongkos" class="form-control"></select>
                        </div>
                        <div class="information-layout-item">
                            <p class="text-header">Deskripsi / Pesan :</p>
                            <textarea name="isi_pesan" required></textarea>
                        </div>

                        <div class="information-layout-item">
                            <p class="text-header">Sub Total :</p>
                            <h3>Rp. <span id="subtotal"></span></h3>
                        </div>

                        <button class="button primary">Pesan</button>
                    </form>
                </div>
                <!-- INFORMATION LAYOUT -->
            </div>
            <!-- /SIDEBAR ITEM -->

            <!-- SIDEBAR ITEM -->
            <div class="sidebar-item product-info">
                <h4>Informasi Produk Beli Ecer</h4>
                <hr class="line-separator">
                <!-- INFORMATION LAYOUT -->
                <div class="information-layout v2">
                    <div class="information-layout-item">
                        <p class="text-header">Nama Produk:</p>
                        <p><?= $produk->produk_nama ?></p>
                    </div>

                    <div class="information-layout-item">
                        <p class="text-header">Kategori :</p>
                        <p><?= $produk->kategori_nama ?></p>
                    </div>

                    <div class="information-layout-item">
                        <p class="text-header">Harga :</p>
                        <p>Rp.<?= number_format($produk->produk_harga, 0, '', '.') ?></p>
                    </div>
                </div>
                <!-- INFORMATION LAYOUT -->
            </div>
            <!-- /SIDEBAR ITEM -->
        </div>
        <!-- /SIDEBAR -->

        <!-- CONTENT -->
        <div class="content left">
            <!-- POST -->
            <article class="post">
                <!-- POST IMAGE -->
                <div class="post-image">
                    <figure class="product-preview-image large liquid">
                        <img style="height: 484px;" src="<?php echo base_url('assets/img/produk/') ?><?= $produk->produk_gambar ?>" alt="">
                    </figure>
                </div>
                <!-- /POST IMAGE -->

                <hr class="line-separator">

                <!-- POST CONTENT -->
                <div class="post-content">
                    <!-- POST PARAGRAPH -->
                    <div class="post-paragraph">
                        <h3 class="post-title">Deskripsi : </h3>
                        <p><?= $produk->produk_deskripsi ?></p>
                        <h3 class="post-title">Stok : <?= $produk->produk_stok ?></h3>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <!-- /POST CONTENT -->

                <hr class="line-separator">
            </article>
            <!-- /POST -->
        </div>
        <!-- CONTENT -->
    </div>
</div>
<!-- /SECTION -->

<script>
    $(document).ready(function() {
        $('#destination_provice').change(function() {
            var province_id = $(this).val();
            $.get('<?php echo site_url('Produk/get_city_by_province/') ?>' + province_id, function(resp) {
                $('#destination_city').html(resp);
            });
        });

        $('#opKirim').change(function() {
            var opKirim = $(this).val();
            var province = $('#destination_provice').val(); // Ubah id menjadi destination_provice
            var city = $('#destination_city').val();
            var weight = $('#produk_berat').val(); // Mengambil berat produk

            // Pastikan variabel city dan weight memiliki nilai yang benar sebelum melakukan pemanggilan Ajax
            if (city && weight) {
                $.get('<?php echo site_url('Produk/get_ongkos/') ?>' + city + '/' + weight + '/' + opKirim, function(resp) {
                    $('#ongkos').html(resp);
                });
            } else {
                // Handle error here
                console.error('Error: City or weight is missing');
            }
        });

        $('#btn-pesan').click(function(e) {
            e.preventDefault();
            $('#form-pesanan').show();
        });
    });
</script>