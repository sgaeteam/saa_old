<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dependente extends Model
{
    public function socio()
    {
        return $this->belongsTo('App\Socio');
    }
}
