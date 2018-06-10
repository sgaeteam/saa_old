<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dependente extends Model
{
    
    protected $fillable = ['dependente_nome','dependente_sexo','dependente_dtnasc','dependente_grau'];
    
    public function socio()
    {
        return $this->belongsTo('App\Socio');
    }
}

