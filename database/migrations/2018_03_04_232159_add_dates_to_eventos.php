<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDatesToEventos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('eventos', function($table) {
            $table->string('titulo');
            $table->date('start_date');
            $table->date('end_date');
            $table->integer('all_day');
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
            $table->dropColumn('titulo');
            $table->dropColumn('start_date');
            $table->dropColumn('end_date');
            $table->dropColumn('all_day');
        });    
    }
}
