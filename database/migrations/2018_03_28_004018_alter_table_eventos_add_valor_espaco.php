<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableEventosAddValorEspaco extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('eventos', function (Blueprint $table) {
            $table->double('espaco_valor');  
            $table->double('espaco_desconto')->default(0);   
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
            $table->dropColumn('espaco_valor');
            $table->dropColumn('espaco_desconto');
        }); 
    }
}
