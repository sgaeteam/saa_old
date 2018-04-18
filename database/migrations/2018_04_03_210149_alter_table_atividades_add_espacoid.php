<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableAtividadesAddEspacoid extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('atividades', function($table) {
            $table->dropColumn('seg');
            $table->dropColumn('ter');
            $table->dropColumn('qua');
            $table->dropColumn('qui');
            $table->dropColumn('sex');
            $table->dropColumn('sab');
            $table->dropColumn('dom');
            $table->integer('espaco_id')->after('professor_id');            
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
