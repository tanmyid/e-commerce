<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1><?= $title ?></h1>
            </div>
         </div>
      </div>
      <!-- /.container-fluid -->
   </section>
   <!-- Main content -->
   <section class="content">
      <!-- Default box -->
      <a href="<?= base_url('admin/') . $controller . '/tambah' ?>"><button class="btn btn-success mb-2"><i class="fa fa-plus"></i> Tambah Data</button></a>
      <?php if ($this->session->flashdata('simpan')) : ?>
         <div class="alert alert-success alert-dismissible" style="width: 400px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h6><i class="icon fas fa-check"></i> <?= $this->session->flashdata('simpan') ?></h6>
         </div>
      <?php endif ?>

      <?php if ($this->session->flashdata('update')) : ?>
         <div class="alert alert-warning alert-dismissible" style="width: 400px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h6><i class="icon fas fa-check"></i> <?= $this->session->flashdata('update') ?></h6>
         </div>
      <?php endif ?>

      <?php if ($this->session->flashdata('hapus')) : ?>
         <div class="alert alert-danger alert-dismissible" style="width: 400px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h6><i class="icon fas fa-trash"></i> <?= $this->session->flashdata('hapus') ?></h6>
         </div>
      <?php endif ?>
      <div class="card card-outline card-primary">
         <div class="card-header">
            <h3 class="card-title"><?= $sub_title ?></h3>
            <div class="card-tools">
               <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i></button>
               <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                  <i class="fas fa-times"></i></button>
            </div>
         </div>
         <div class="card-body">
            <div class="table-responsive">
               <table id="data-tables" class="table table-bordered table-striped">
                  <thead>
                     <tr>
                        <th>No</th>
                        <th>Gambar</th>
                        <th>Kode Produk</th>
                        <th>Kategori</th>
                        <th>Nama Produk</th>
                        <th>Harga</th>
                        <th>Stok</th>
                        <th>Berat (Gram)</th>
                        <th>Status</th>
                        <th>Tanggal Dibuat</th>
                        <th>Aksi</th>
                     </tr>
                  </thead>
                  <tbody>
                     <?php $no = 1;
                     foreach ($data_produk as $produk) : ?>
                        <tr>
                           <td><?= $no++ ?></td>
                           <td width="1%"><img class="" src="<?= base_url('assets/img/produk/') ?><?= $produk->produk_gambar ?>" width="100"></td>
                           <td><?= $produk->produk_kode ?></td>
                           <td><?= $produk->kategori_nama ?></td>
                           <td><?= $produk->produk_nama ?></td>
                           <td>Rp.<?= number_format($produk->produk_harga, 0, ',', '.') ?></td>
                           <td><?= $produk->produk_stok; ?></td>
                           <td><?= $produk->produk_berat; ?></td>
                           <td><?= $produk->produk_status == '1' ? 'Aktif' : 'Tidak Aktif'; ?></td>
                           <td><?= $produk->produk_tanggal_dibuat ?></td>
                           <td width="15%">
                              <a href="<?= base_url('admin/') . $controller . '/edit/' . $produk->produkid ?>"><button class="btn btn-warning btn-sm"><i class="fa fa-edit"></i> Edit</button></a>
                              <a href="<?= base_url('admin/') . $controller . '/hapus/' . $produk->produkid ?>" onclick="return confirm('Yakin Ingin Hapus data ?');"><button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Hapus</button></a>
                           </td>
                        </tr>

                     <?php endforeach ?>

                  </tbody>

               </table>
            </div>
         </div>
         <!-- /.card-body -->
         <div class="card-footer">
            Footer
         </div>
         <!-- /.card-footer-->
      </div>
      <!-- /.card -->
   </section>
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php $this->load->view('admin/layouts/js'); ?>