<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableDependentesAddMatricula extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('dependentes', function($table) {
            $table->string('matricula',20)->nullable();
            $table->date('data_comprovante')->nullable();            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('dependentes', function($table) {
            $table->dropColumn('matricula');
            $table->dropColumn('data_comprovante');
        });
    }
}
