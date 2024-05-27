<!-- FOOTER -->
<footer>
	<!-- FOOTER TOP -->
	<!--  -->
	<!-- /FOOTER TOP -->

	<!-- FOOTER BOTTOM -->
	<div id="footer-bottom-wrap">
		<div id="footer-bottom">
			<p>Telp : 081235492179</p>
			<p>Jl raya tegowanu kulon - tanggung harjo, ruko pasar, Kec. Tegowanu, Purwodadi, Jawa Tengah 58165</p>
			<p>Waktu : Senin – Sabtu l 06.00 – 16.30</p>

		</div>
	</div>
	<!-- /FOOTER BOTTOM -->
</footer>
<!-- /FOOTER -->

<div class="shadow-film closed"></div>

<!-- SVG ARROW -->
<svg style="display: none;">
	<symbol id="svg-arrow" viewBox="0 0 3.923 6.64014" preserveAspectRatio="xMinYMin meet">
		<path d="M3.711,2.92L0.994,0.202c-0.215-0.213-0.562-0.213-0.776,0c-0.215,0.215-0.215,0.562,0,0.777l2.329,2.329
				L0.217,5.638c-0.215,0.215-0.214,0.562,0,0.776c0.214,0.214,0.562,0.215,0.776,0l2.717-2.718C3.925,3.482,3.925,3.135,3.711,2.92z" />
	</symbol>
</svg>
<!-- /SVG ARROW -->

<!-- SVG STAR -->
<svg style="display: none;">
	<symbol id="svg-star" viewBox="0 0 10 10" preserveAspectRatio="xMinYMin meet">
		<polygon points="4.994,0.249 6.538,3.376 9.99,3.878 7.492,6.313 8.082,9.751 4.994,8.129 1.907,9.751 
		2.495,6.313 -0.002,3.878 3.45,3.376 " />
	</symbol>
</svg>
<!-- /SVG STAR -->

<!-- SVG PLUS -->
<svg style="display: none;">
	<symbol id="svg-plus" viewBox="0 0 13 13" preserveAspectRatio="xMinYMin meet">
		<rect x="5" width="3" height="13" />
		<rect y="5" width="13" height="3" />
	</symbol>
</svg>
<!-- /SVG PLUS -->

<!-- jQuery -->
<!-- <script src="<?php echo base_url('assets/') ?>js/vendor/jquery-3.1.0.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script> -->
<!-- Tooltipster -->
<script src="<?php echo base_url('assets/') ?>js/vendor/jquery.tooltipster.min.js"></script>
<!-- Owl Carousel -->
<script src="<?php echo base_url('assets/') ?>js/vendor/owl.carousel.min.js"></script>
<!-- Tweet -->
<!-- <script src="<?php echo base_url('assets/') ?>js/vendor/twitter/jquery.tweet.min.js"></script> -->
<!-- xmAlerts -->
<!-- <script src="<?php echo base_url('assets/') ?>js/vendor/jquery.xmalert.min.js"></script> -->
<!-- Side Menu -->
<script src="<?php echo base_url('assets/') ?>js/side-menu.js"></script>
<!-- Home -->
<script src="<?php echo base_url('assets/') ?>js/home.js"></script>
<!-- Tooltip -->
<script src="<?php echo base_url('assets/') ?>js/tooltip.js"></script>
<!-- User Quickview Dropdown -->
<script src="<?php echo base_url('assets/') ?>js/user-board.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<!-- Home Alerts -->
<!-- <script src="<?php echo base_url('assets/') ?>js/home-alerts.js"></script> -->
<!-- Footer -->
<!-- <script src="<?php echo base_url('assets/') ?>js/footer.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
    // Inisialisasi DataTable
    $('#example').DataTable();

    // Toggle form pesanan saat tombol di klik
    $("#tmbl-pesan").click(function(e) {
        $("#form-pesanan").slideToggle('slow');
        e.preventDefault();
    });

    // Ajax untuk mendapatkan kota berdasarkan provinsi yang dipilih
    $("#province").on('change', function() {
        var province = $(this).val();
        $.get("<?= base_url(); ?>produk/city?province=" + province, function(hasil) {
            $("#destination_city").html(hasil);
        });
    });

    // Perubahan qty
$("#qty").on('change', function() {
    var harga = <?= $produk->produk_harga ?>; // Mengambil harga dari kolom produk_harga
    var qty = $(this).val();
    var subtotal = harga * qty; // Hitung subtotal berdasarkan harga dan jumlah
    $("#subtotal").text(formatNumber(subtotal)); // Tampilkan subtotal
});

// Perubahan opsi pengiriman
$("#ongkos").on('change', function() {
    var ongkos = $(this).val();
    var harga = <?= $produk->produk_harga ?>; // Mengambil harga dari kolom produk_harga
    var qty = $('#qty').val();
    var subtotal = (harga * qty) + parseInt(ongkos); // Hitung subtotal dengan menambahkan biaya pengiriman
    $("#subtotal").text(formatNumber(subtotal)); // Tampilkan subtotal
});


    // Fungsi untuk memformat angka menjadi format mata uang
    function formatNumber(num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
    }
});
</script>


</script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>