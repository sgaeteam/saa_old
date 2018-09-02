<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Convite</title>
        <link href="{{ asset("css/convite.css") }}" rel="stylesheet" type="text/css" />
        
    </head>
    <body>
        <div class="convite">
            <img src="{{asset('images/convite-moldura.png') }}" class="img-back-convite" alt="Convite de sócios" align="middle">
            <div class="conteudo-convite text-center">
                <h1 class="titulo-convite">CONVITE</h1>
                    <br>
                    <h2 class="detalhes-convite">
                        Com muita alegria, que nosso clube emite este convite a seu sócio para que seja cedido a um convidado.<br>
                    </h2>
                    <div>
                     <ul>
                            <li><b>Número do convite:  {{$id}}</b></li>
                            <li><b>Emitido para o sócio:  {{$user_id}}</b></li>
                            <li><b>Evento: </b></li>
                            <li><b>Data da emissão: {{$created_at}}</b></li>
                            <li><b>Válido até: {{Carbon\Carbon::parse($data_expiracao)->format('d/m/Y')}}</b></li>
                        </ul>
                    </div>
                    <h3 class="mais-detalhes-convite">
                        A autenticidade deste convite poderá ser verificada com o código de validação número <b>{{$codigo_validacao}}</b>
                        Consulte em: sgaeteam.sgc.com.br/verificar-convite ou leia o código de barrass abaixo.
                    </h3>
            </div>
        </div>
    </body>
</html>