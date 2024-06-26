<?php
defined('BASEPATH') or exit('NO Direct Script Access Allowed');

class Data_produk extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Model_app');
		if ($this->session->userdata('adminstatus') != 'login') {
			$this->session->set_flashdata('pesan', 'Anda Harus Login !');
			redirect(base_url() . 'admin/login');
		}
		date_default_timezone_set("Asia/Jakarta");
	}

	private $view = 'data_produk';
	private $table = 'produk';
	private $pk = 'produkid';
	private $controller = 'data-produk';

	function index()
	{
		$data['title'] = 'Manajamen Produk';
		$data['sub_title'] = 'Data Produk';
		$data['controller'] = $this->controller;
		$data['data_produk'] = $this->Model_app->get_produk_admin()->result();

		$this->load->view('admin/layouts/header', $data);
		$this->load->view('admin/layouts/navbar', $data);
		$this->load->view('admin/layouts/sidebar', $data);
		$this->load->view('admin/' . $this->view . '/' . $this->view . '_index', $data);
		$this->load->view('admin/layouts/footer', $data);
	}


	function tambah()
	{
		$data['title'] = 'Manajamen Produk';
		$data['sub_title'] = 'Tambah Data Produk';
		$data['controller'] = $this->controller;
		// $data['produk_kode'] = $this->generate_kode_produk();
		$data['data_kategori'] = $this->Model_app->get_data('kategori', 'kategori_id', 'desc')->result();


		$this->load->view('admin/layouts/header', $data);
		$this->load->view('admin/layouts/navbar', $data);
		$this->load->view('admin/layouts/sidebar', $data);
		$this->load->view('admin/' . $this->view . '/' . $this->view . '_tambah', $data);
		$this->load->view('admin/layouts/footer', $data);
	}

	function edit($pk)
	{
		$data['title'] = 'Manajamen Produk';
		$data['sub_title'] = 'Edit Data Produk';
		$data['controller'] = $this->controller;
		$data['data_kategori'] = $this->Model_app->get_data('kategori', 'kategori_id', 'desc')->result();
		$data['data_edit'] = $this->Model_app->edit_data($this->table, array($this->pk => $pk))->row();

		$this->load->view('admin/layouts/header', $data);
		$this->load->view('admin/layouts/navbar', $data);
		$this->load->view('admin/layouts/sidebar', $data);
		$this->load->view('admin/' . $this->view . '/' . $this->view . '_edit', $data);
		$this->load->view('admin/layouts/footer', $data);
	}


	function simpan()
	{
		// $produk_kode		 		= $this->input->post('produk_kode');
		$kategori_id		 		= $this->input->post('kategori_id');
		$produk_nama		 		= $this->input->post('produk_nama');
		$produk_harga		 		= $this->input->post('produk_harga');
		// $harga_digital		 		= $this->input->post('harga_digital');
		// $harga_offset		 		= $this->input->post('harga_offset');
		$min_order		 			= $this->input->post('min_order');
		$produk_stok 				= $this->input->post('produk_stok');
		$satuan_qty		 			= $this->input->post('satuan_qty');
		// $harga_bahan		 		= $this->input->post('harga_bahan');
		// $jenis_bahan		 		= $this->input->post('jenis_bahan');
		$produk_berat		 		= $this->input->post('produk_berat');
		$produk_deskripsi		 	= $this->input->post('produk_deskripsi');
		$produk_status		 		= $this->input->post('produk_status');


		$as_produk = strtoupper(substr($produk_nama, 0, 3));

		$produk_tanggal_dibuat 	= date('Y-m-d H:i:s');


		$data = array(
			'produk_kode' 			=> $this->generate_kode_produk($as_produk),
			'produk_nama' 			=> $produk_nama,
			'kategori_id'			=> $kategori_id,
			'produk_status'	 		=> $produk_status,
			'produk_deskripsi'	 	=> $produk_deskripsi,
			'produk_harga'	 		=> $produk_harga,
			'produk_stok'			=> $produk_stok,
			// 'harga_digital'	 		=> $harga_digital,
			// 'harga_offset'	 		=> $harga_offset,
			'min_order'	 			=> $min_order,
			'satuan_qty'	 		=> $satuan_qty,
			// 'harga_bahan'	 		=> $harga_bahan,
			// 'jenis_bahan'	 		=> $jenis_bahan,
			'produk_berat'	 		=> $produk_berat,
			'produk_tanggal_dibuat'	=> $produk_tanggal_dibuat
		);

		$config['upload_path'] = './assets/img/produk/';
		$config['allowed_types'] = 'jpg|png|jpeg';
		$config['file_name'] = 'produk' . time();
		$config['max_size'] = '2048';

		$this->load->library('upload', $config);

		if ($_FILES['produk_gambar']['name']) {
			if ($this->upload->do_upload('produk_gambar')) {
				$image = $this->upload->data();
				$data['produk_gambar'] = $image['file_name'];
			}
		}
		// print_r($data);
		// die();



		$insert = $this->Model_app->insert_data($this->table, $data);
		$this->session->set_flashdata('simpan', 'Data Berhasil di Simpan !');
		redirect(base_url('admin/') . $this->controller);
	}

	function update($pk)
	{
		$produk_kode		 		= $this->input->post('produk_kode');
		$kategori_id		 		= $this->input->post('kategori_id');
		$produk_nama		 		= $this->input->post('produk_nama');
		$produk_harga		 		= $this->input->post('produk_harga');
		// $harga_digital		 	= $this->input->post('harga_digital');
		// $harga_offset		 	= $this->input->post('harga_offset');
		$min_order		 			= $this->input->post('min_order');
		$satuan_qty		 			= $this->input->post('satuan_qty');
		$produk_stok 				= $this->input->post('produk_stok');
		// $harga_bahan		 		= $this->input->post('harga_bahan');
		// $jenis_bahan		 		= $this->input->post('jenis_bahan');
		$produk_berat		 		= $this->input->post('produk_berat');
		$produk_deskripsi		 	= $this->input->post('produk_deskripsi');
		$produk_status		 		= $this->input->post('produk_status');

		$produk_tanggal_dibuat 	= date('Y-m-d H:i:s');

		$data_edit = $this->Model_app->edit_data($this->table, array($this->pk => $pk))->row();
		$data = array(
			'produk_nama' 			=> $produk_nama,
			'kategori_id'			=> $kategori_id,
			'produk_status'	 		=> $produk_status,
			'produk_deskripsi'	 	=> $produk_deskripsi,
			'produk_harga'	 		=> $produk_harga,
			'produk_stok'			=> $produk_stok,
			// 'harga_digital'	 		=> $harga_digital,
			// 'harga_offset'	 		=> $harga_offset,
			'min_order'	 		=> $min_order,
			'satuan_qty'	 		=> $satuan_qty,
			// 'harga_bahan'	 		=> $harga_bahan,
			// 'jenis_bahan'	 		=> $jenis_bahan,
			'produk_berat'	 		=> $produk_berat,
		);






		$config['upload_path'] = './assets/img/produk/';
		$config['allowed_types'] = 'jpg|png|jpeg';
		$config['file_name'] = 'produk' . time();
		$config['max_size'] = '2048';

		$this->load->library('upload', $config);

		if ($_FILES['produk_gambar']['name']) {
			if ($this->upload->do_upload('produk_gambar')) {
				$image = $this->upload->data();
				$data['produk_gambar']    = $image['file_name'];
				unlink('assets/img/produk/' . $data_edit->produk_gambar);
			}
		}


		$insert = $this->Model_app->update_data($this->table, array($this->pk => $pk), $data);
		$this->session->set_flashdata('update', 'Data Berhasil di Update !');
		redirect(base_url('admin/') . $this->controller);
	}

	function hapus($id)
	{
		$data_edit = $this->Model_app->edit_data($this->table, array($this->pk => $id))->row();

		if ($data_edit->produk_gambar) {
			unlink('assets/img/produk/' . $data_edit->produk_gambar);
		}

		$delete = $this->Model_app->delete_data($this->table, array($this->pk => $id));
		$this->session->set_flashdata('hapus', 'Data berhasil di Hapus ! ');
		redirect(base_url('admin/') . $this->controller);
	}



	function generate_kode_produk($as_produk)
	{
		return $this->Model_app->get_kode_produk($as_produk);
	}
}
