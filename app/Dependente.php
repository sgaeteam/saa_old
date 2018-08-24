<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Dependente extends Model
{
    
    protected $fillable = ['dependente_nome','dependente_sexo','dependente_dtnasc','dependente_grau','matricula','data_comprovante'];
    
    public function socio()
    {
        return $this->belongsTo('App\Socio');
    }
    
    public function getIdade() 
    {
        return Carbon::parse($this->dependente_dtnasc)->diffInYears(Carbon::now());  
    }
    
    public function verificaPendencia() 
    {
        $nome        = $this->dependente_nome;
        $grau        = $this->dependente_grau;
        $comprovante = $this->data_comprovante;
        $idade       = $this->getIdade();

        $msg         = null;

        if ($idade >= 24 && $grau == "Filho(a)") 
        {
          $msg = trans("crudbooster.alert_dependente_maior_23",['name'=>$nome]);
        }
        elseif ((($idade >= 18 && $idade < 24) && $grau == "Filho(a)") && (int)$comprovante <> date("Y")) 
        {
          $msg = trans("crudbooster.alert_dependente_maior_18",['name'=>$nome]);
        }

        return $msg;
    }    
}

