<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterEventosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('eventos', function (Blueprint $table) {
            $table->integer('socio_id')->nullable();
            $table->integer('professor_id')->nullable();
            $table->integer('espaco_id');
            $table->integer('atividade_id')->nullable();     
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('eventos', function($table) {
            $table->dropColumn('socio_id');
            $table->dropColumn('espaco_id');
            $table->dropColumn('atividade_id');
            $table->dropColumn('cliente_id');
        }); 
    }
}
