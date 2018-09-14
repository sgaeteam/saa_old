<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableConvitesAddNomeDatavisita extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('convites', function($table) {
            $table->string('nome', 256)->default(null)->nullable();
            $table->string('sexo', 10)->default(null)->nullable();
            $table->string('cpf', 11)->default(null)->nullable();
            $table->date('data_prevista')->default(null)->nullable();
            $table->date('data_impressao')->default(null)->after('data_prevista');   
            $table->date('data_utilizada')->default(null)->nullable()->after('data_impressao');
            $table->dropColumn('impresso');
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
