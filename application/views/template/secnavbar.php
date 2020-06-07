	<div class="navbar navbar-inverse bg-primary">
	<!-- Second navbar -->

		<ul class="nav navbar-nav no-border visible-xs-block">
			<li><a class="text-center collapsed" data-toggle="collapse" data-target="#navbar-second-toggle"><i class="icon-menu7"></i></a></li>
		</ul>

		<div class="navbar-collapse collapse" id="navbar-second-toggle">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<?php echo site_url() ?>administrator/mahasiswa"><i class="icon-home4 position-left"></i> Dashboard</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class=" icon-graduation2 position-left"></i> Data Master <span class="caret"></span>
					</a>

					<ul class="dropdown-menu width-250">
						<li class="dropdown-header">Data</li>
						<li><a href="<?php echo site_url() ?>administrator/mahasiswa"><i class="icon-users4"></i>Data Mahasiswa</a></li>
						<li><a href="<?php echo site_url() ?>administrator/dosen"><i class="icon-graduation"></i> Data Dosen</a></li>
						
						<li class="dropdown-header">Akademik</li>
						<li><a href="<?php echo site_url() ?>administrator/Matakuliah"><i class="icon-book"></i> Data Matakuliah</a></li>
						<li><a href="<?php echo site_url() ?>administrator/qnilai"><i class="icon-certificate"></i> Data Nilai</a></li>
						<li><a href="<?php echo site_url() ?>administrator/entry_khs"><i class="icon-archive"></i> Data KHS</a></li>
						<li><a href="starters/layout_boxed.html"><i class="icon-newspaper"></i> Data KRS</a></li>

					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-cog4 position-left"></i> Pengaturan <span class="caret"></span>
					</a>

					<ul class="dropdown-menu width-200">
						<li class="dropdown-header">Pengaturan</li>
						<li><a href="<?php echo site_url() ?>administrator/Semester"><i class=" icon-stack2"></i> Semester</a></li>
						<li><a href="<?php echo site_url() ?>administrator/Kurikulum"><i class=" icon-price-tags2"></i> Kurikulum</a></li>
						<li><a href="<?php echo site_url() ?>administrator/tahun_ajaran"><i class=" icon-calendar22"></i> Tahun Ajaran</a></li>
					</ul>
				</li>
				<li><a href="<?php echo site_url() ?>administrator/user"><i class="icon-user position-left"></i> Pengguna</a></li>
			</ul>
			<p class="navbar-text"><span class="label"><?php echo $this->session->userdata('level'); ?></span></p>
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown dropdown-user">
					<a class="dropdown-toggle" data-toggle="dropdown">
					<img src="<?php echo base_url('assets/images/users/users.gif')?>" /> 
						<?php echo $this->session->userdata('username'); ?>
						<i class="caret"></i>
					</a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="<?php echo site_url() ?>auth/change_password"><i class="icon-key"></i> Ganti Password</a></li>
						<li><a href="<?php echo site_url() ?>auth/logout"><i class="icon-exit3"></i> Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	<!-- /second navbar -->
