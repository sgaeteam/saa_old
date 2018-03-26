<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableAtividades extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('atividades', function (Blueprint $table) {
            $table->increments('id');
            $table->string('titulo',50);
            $table->string('sigla',10);
            $table->string('descricao',256);
            $table->date('data_inicio');
            $table->date('data_fim');
            $table->date('data_cancelamento')->nullable();
            $table->time('duracao');
            $table->boolean('seg')->nullable();
            $table->datetime('hora_inicio_seg')->nullable();        
            $table->boolean('ter')->nullable();
            $table->datetime('hora_inicio_ter')->nullable();        
            $table->boolean('qua')->nullable();
            $table->datetime('hora_inicio_qua')->nullable();        
            $table->boolean('qui')->nullable();
            $table->datetime('hora_inicio_qui')->nullable();        
            $table->boolean('sex')->nullable();
            $table->datetime('hora_inicio_sex')->nullable();        
            $table->boolean('sab')->nullable();
            $table->datetime('hora_inicio_sab')->nullable();        
            $table->boolean('dom')->nullable();
            $table->datetime('hora_inicio_dom')->nullable();        
            $table->integer('tipoatividade_id');
            $table->integer('professor_id');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atividades');
    }
}
