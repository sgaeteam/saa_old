<?php

use Illuminate\Database\Seeder;
use App\Cobranca;

class CobrancasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $cobrancas = array (
            [
                'descricao' => 'Secretaria',
            ],
            [
                'descricao' => 'BANEB - Ag. Centro',
            ],
            [
                'descricao' => 'Folha de Pagamento',
            ],
            [
                'descricao' => 'Isento de Pagamento', 
            ],  
            [
                'descricao' => 'Sócio Afim',
            ]               
        );
        
        foreach ($cobrancas as $cobranca) {

            Cobranca::create($cobranca);
        }      
    }
}
