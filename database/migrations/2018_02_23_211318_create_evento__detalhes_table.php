<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventoDetalhesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evento__detalhes', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('evento_id')->nullable();
            $table->integer('produto_id')->nullable();            
            $table->double('produto_valor');              
            $table->integer('quantidade')->default(0);            
            $table->double('sub_total');              
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('evento__detalhes');
    }
}
