<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTablePagamentosSocios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('pagamentos_socios');
        
        Schema::create('pagamentos_socios', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->softDeletes();
            $table->integer('socio_id');
            $table->integer('cobranca_id');  
            $table->integer('user_id');
            $table->double('mensalidade');          
            $table->double('acrescimo')->default(0);             
            $table->double('desconto')->default(0); 
            $table->double('valor_pago');  
            $table->string('recibo',25);
            $table->string('tipo_pagamento',25);            
            $table->date('data_pagamento');
            $table->date('data_referencia');
            $table->text('obs')->nullable();
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
