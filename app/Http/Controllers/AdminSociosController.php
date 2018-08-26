<?php namespace App\Http\Controllers;

	use Illuminate\Support\Facades\Route;
	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminSociosController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "socios";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Nome","name"=>"nome"];
			$this->col[] = ["label"=>"Matrícula","name"=>"matricula"];
			$this->col[] = ["label"=>"Função","name"=>"funcao"];
			$this->col[] = ["label"=>"CPF","name"=>"cpf"];
			$this->col[] = ["label"=>"Área de Competência","name"=>"areacompetencia_id","join"=>"area__competencias,descricao"];
			$this->col[] = ["label"=>"Categoria","name"=>"categoria_id","join"=>"categorias,descricao"];
			$this->col[] = ["label"=>"Cobrança","name"=>"cobranca_id","join"=>"cobrancas,descricao"];
			$this->col[] = ["label"=>"Foto","name"=>"foto","image"=>true];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Nome','name'=>'nome','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Matrícula','name'=>'matricula','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Função','name'=>'funcao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'CPF','name'=>'cpf','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'RG','name'=>'rg','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Nascimento','name'=>'data_nascimento','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Endereço','name'=>'endereco','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Bairro','name'=>'bairro','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Cidade','name'=>'cidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Estado','name'=>'estado','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'AC;AL;AP;AM;BA;CE;DF;ES;GO;MA;MT;MS;MG;PA;PB;PR;PE;PI;RJ;RN;RS;RO;RR;SC;SP;SE;TO'];
			$this->form[] = ['label'=>'CEP','name'=>'cep','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Telefone','name'=>'telefone','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Celular','name'=>'celular','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Email','name'=>'email','type'=>'email','validation'=>'min:1|max:255|email|unique:socios','width'=>'col-sm-10','placeholder'=>'Por favor digite um endereço de e-mail válido'];
			$this->form[] = ['label'=>'Ramal','name'=>'ramal','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Sexo','name'=>'sexo','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'Masculino;Feminino'];
			$this->form[] = ['label'=>'Estado Civil','name'=>'estado_civil','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'Solteiro(a);Casado(a);União Estável;Divorciado(a);Separado(a);Viúvo(a)'];
			$this->form[] = ['label'=>'Nacionalidade','name'=>'nacionalidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Naturalidade','name'=>'naturalidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Lotação','name'=>'lotacao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Unidade','name'=>'unidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Profissão','name'=>'profissao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Área de Competência','name'=>'areacompetencia_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'area__competencias,descricao','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Categoria','name'=>'categoria_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'categorias,descricao','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Cobrança','name'=>'cobranca_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'cobrancas,descricao','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Outra Matrícula','name'=>'outra_matricula','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Adesão','name'=>'data_adesao','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'OBS','name'=>'obs','type'=>'textarea','validation'=>'string|min:5|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Foto','name'=>'foto','type'=>'upload','validation'=>'image|max:1000','width'=>'col-sm-10','help'=>'A resolu&ccedil;&atilde;o recomendada &eacute; 200x200 px'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Nome','name'=>'nome','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Matrícula','name'=>'matricula','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Função','name'=>'funcao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'CPF','name'=>'cpf','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'RG','name'=>'rg','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Data Nascimento','name'=>'data_nascimento','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Endereço','name'=>'endereco','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Bairro','name'=>'bairro','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Cidade','name'=>'cidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Estado','name'=>'estado','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'AC;AL;AP;AM;BA;CE;DF;ES;GO;MA;MT;MS;MG;PA;PB;PR;PE;PI;RJ;RN;RS;RO;RR;SC;SP;SE;TO'];
			//$this->form[] = ['label'=>'CEP','name'=>'cep','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Telefone','name'=>'telefone','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Celular','name'=>'celular','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Email','name'=>'email','type'=>'email','validation'=>'min:1|max:255|email|unique:socios','width'=>'col-sm-10','placeholder'=>'Por favor digite um endereço de e-mail válido'];
			//$this->form[] = ['label'=>'Ramal','name'=>'ramal','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Sexo','name'=>'sexo','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'Masculino;Feminino'];
			//$this->form[] = ['label'=>'Estado Civil','name'=>'estado_civil','type'=>'select','validation'=>'min:1|max:255','width'=>'col-sm-10','dataenum'=>'Solteiro(a);Casado(a);União Estável;Divorciado(a);Separado(a);Viúvo(a)'];
			//$this->form[] = ['label'=>'Nacionalidade','name'=>'nacionalidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Naturalidade','name'=>'naturalidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Lotação','name'=>'lotacao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Unidade','name'=>'unidade','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Profissão','name'=>'profissao','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Área de Competência','name'=>'areacompetencia_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'area__competencias,descricao','datatable_where'=>'`deleted_at` is null'];
			//$this->form[] = ['label'=>'Categoria','name'=>'categoria_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'categorias,descricao','datatable_where'=>'`deleted_at` is null'];
			//$this->form[] = ['label'=>'Cobrança','name'=>'cobranca_id','type'=>'select2','validation'=>'integer|min:0|required','width'=>'col-sm-10','datatable'=>'cobrancas,descricao','datatable_where'=>'`deleted_at` is null'];
			//$this->form[] = ['label'=>'Outra Matrícula','name'=>'outra_matricula','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Data Adesão','name'=>'data_adesao','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'OBS','name'=>'obs','type'=>'textarea','validation'=>'string|min:5|max:5000','width'=>'col-sm-10'];
			# OLD END FORM
	    }
	}		