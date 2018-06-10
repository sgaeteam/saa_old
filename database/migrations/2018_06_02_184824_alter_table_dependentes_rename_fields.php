<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableDependentesRenameFields extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('dependentes', function($table) {
            $table->dropColumn('nome');
            $table->dropColumn('sexo');
            $table->dropColumn('data_nascimento');
            $table->dropColumn('grau');
            $table->string('dependente_nome', 256);
            $table->string('dependente_sexo', 1)->nullable();
            $table->date('dependente_dtnasc')->nullable();
            $table->string('dependente_grau', 50)->nullable();
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
