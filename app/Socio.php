<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Socio extends Model
{
    public function area_Scompetencia()
    {
        return $this->hasOne('App\Area_Competencia');
    }
    
    public function categoria()
    {
        return $this->hasOne('App\Categoria');
    }
    
    public function cobranca()
    {
        return $this->hasOne('App\Cobranca');
    }
    
    public function dependentes()
    {
        return $this->hasMany('App\Dependente');
    }     
}
