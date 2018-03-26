<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableUsuarios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nome', 256);
            $table->string('cpf', 11)->nullable();
            $table->string('rg', 20)->nullable();
            $table->date('data_nascimento')->nullable();
            $table->string('endereco', 256)->nullable();
            $table->string('bairro', 50)->nullable();
            $table->string('cidade', 100)->nullable();
            $table->string('estado', 2)->nullable();
            $table->string('cep', 8)->nullable();
            $table->string('telefone', 20)->nullable();
            $table->string('celular', 20)->nullable();
            $table->string('email', 20)->nullable();
            $table->string('ramal', 20)->nullable();
            $table->string('sexo', 1)->nullable();
            $table->string('estado_civil', 1)->nullable();
            $table->string('nacionalidade', 20)->nullable();
            $table->string('naturalidade', 20)->nullable();
            $table->string('lotacao', 50)->nullable();
            $table->string('unidade', 50)->nullable();
            $table->string('profissao', 50)->nullable();
            $table->integer('cobranca_id')->nullable();
            $table->text('obs')->nullable();    
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}
