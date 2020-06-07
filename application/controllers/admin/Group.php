<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Group extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
         if (!$this->ion_auth->logged_in()) {//cek login ga?
            redirect('login','refresh');
        }else{
            if (!$this->ion_auth->in_group('admin')) {//cek admin ga?
                redirect('login','refresh');
            }
        }
        $this->load->model('Modelsemester');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 'admin/semester/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'admin/semester/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'admin/semester/index.html';
            $config['first_url'] = base_url() . 'admin/semester/index.html';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->Modelsemester->total_rows($q);
        $semester = $this->Modelsemester->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'semester_data' => $semester,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->load->view('semester/table_semester_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Modelsemester->get_by_id($id);
        if ($row) {
            $data = array(
		'id_semester' => $row->id_semester,
		'nama_semester' => $row->nama_semester,
	    );
            $this->load->view('semester/table_semester_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/semester'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('admin/semester/create_action'),
	    'id_semester' => set_value('id_semester'),
	    'nama_semester' => set_value('nama_semester'),
	);
        $this->load->view('semester/table_semester_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'nama_semester' => $this->input->post('nama_semester',TRUE)
	    );

            $this->Modelsemester->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/semester'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Modelsemester->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('admin/semester/update_action'),
		'id_semester' => set_value('id_semester', $row->id_semester),
		'nama_semester' => set_value('nama_semester', $row->nama_semester),
	    );
            $this->load->view('semester/table_semester_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/semester'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_semester', TRUE));
        } else {
            $data = array(
		'nama_semester' => $this->input->post('nama_semester',TRUE),
	    );

            $this->Modelsemester->update($this->input->post('id_semester', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('admin/semester'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Modelsemester->get_by_id($id);

        if ($row) {
            $this->Modelsemester->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/semester'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/semester'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('nama_semester', 'nama semester', 'trim|required');

	$this->form_validation->set_rules('id_semester', 'id_semester', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "table_semester.xls";
        $judul = "table_semester";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Nama Semester");

	foreach ($this->Modelsemester->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->nama_semester);
	    xlsWriteLabel($tablebody, $kolombody++, $data->tahun_ajaran);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}
