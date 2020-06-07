<?php
$this->load->view('template/head');
$this->load->view('template/navbar');
$this->load->view('template/navbarmahasiswa');
?>
 <div class="page-container">

        <!-- Page content -->
        <div class="page-content">

            <!-- Main content -->
            <div class="content-wrapper">

        <h2 style="margin-top:0px">Data Kartu Rencana Studi</h2>
        <div class="row" style="margin-bottom: 10px">
            <div class="col-md-6">
             <a href="<?php echo site_url('mahasiswa/krs/create'); ?>" class="btn btn-success"><i class=" icon-compose" ></i> Pengajuan KRS</a></li>
            </div>
                    
            <div class="col-md-6 text-right">
                <form action="<?php echo site_url('admin/entry_khs'); ?>" class="form-inline" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="q" value="<?php echo $q; ?>">
                        <span class="input-group-btn">
                            <?php
                                if ($q <> '')
                                {
                                    ?>
                                    <a href="<?php echo site_url('mahasiswa/krs/entry_krs'); ?>" class="btn btn-default">Reset</a>
                                    <?php
                                }
                            ?>
                          <button class="btn btn-success" type="submit"><i class="icon-search4" ></i></button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <?php echo $this->session->userdata('message') <> '' ? $this->session->userdata('message') : ''; ?>
        <div class="panel panel-flat">
        <div class="table-responsive">
        <table class="table table table-xxs">
        <tr class="border-solid">
        <th>No</th>
		<th>Nim</th>
		<th>Nama Mahasiswa</th>
		<th>Semester</th>
		<th style="text-align:center" width="200px">Action</th>
            </tr><?php
            foreach ($krs_data as $krs)
            {
                ?>
                <tr>
			<td width="80px"><?php echo ++$start ?></td>
			<td><?php echo $krs->nim ?></td>
			<td><?php echo $krs->nama_mahasiswa ?></td>
			<td><?php echo $krs->nama_semester ?></td>
			<td style="text-align:center" width="200px">
				<ul class="icons-list ">
                    <li><a href="<?php echo site_url() ?>admin/entry_khs/read/<?php echo $krs->id_krs;?>" class="btn btn-info btn-xs" data-popup="tooltip" title="Detail"><i class="icon-detail text-white" ></i></a></li>
                    <li><a href="<?php echo site_url() ?>admin/entry_khs/delete/<?php echo $krs->id_krs;?>" class="btn btn-danger btn-xs" data-popup="tooltip" title="Hapus"   onClick='return confirm("Anda yakin ingin menghapus data ini?")'><i class="icon-bin text-white" ></i></a></li>
                </ul>
			</td>
		</tr>
                <?php
            }
            ?>
        </table>
 </div>
 </div>
        <div class="row">
         
            <div class="col-md-6">
                <a href="#" class="btn btn-success">Total Record : <?php echo $total_rows ?></a>
           </div>
            <div class="col-md-6 text-right">
                <?php echo $pagination ?>
            </div>
        </div>
<?php
$this->load->view('template/foot');
?>
<?php
$this->load->view('template/js');
?>
