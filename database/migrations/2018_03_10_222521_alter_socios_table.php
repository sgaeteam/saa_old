<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterSociosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
   {
        Schema::table('socios', function (Blueprint $table) {
            $table->string('sexo', 10)->nullable()->change();
            $table->string('estado_civil', 20)->nullable()->change();
            $table->integer('areacompetencia_id')->change();
            $table->integer('categoria_id')->change();
            $table->integer('cobranca_id')->change();         
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
