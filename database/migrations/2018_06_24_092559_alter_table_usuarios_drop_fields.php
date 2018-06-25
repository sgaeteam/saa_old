<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableUsuariosDropFields extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('usuarios', function($table) {
            $table->dropColumn('sexo');
            $table->dropColumn('ramal');
            $table->dropColumn('estado_civil');
            $table->dropColumn('naturalidade');
            $table->dropColumn('lotacao');
            $table->dropColumn('unidade');
            $table->dropColumn('profissao');
        });         
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
