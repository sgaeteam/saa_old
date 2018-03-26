<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterAtividadesTableName extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {   
        Schema::rename('atividades', 'tipo_atividades');
    }   

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {   
        Schema::rename('tipo_atividades', 'atividades');
    } 
}
