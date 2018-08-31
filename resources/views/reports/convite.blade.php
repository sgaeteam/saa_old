<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Convite</title>

        <!--Custon CSS-->
        <link rel="stylesheet" href="https://academy.especializati.com.br/assets/site/css/certificate.css">

        <!--Favicon-->
        <link rel="icon" type="image/png" href="https://academy.especializati.com.br/assets/site/imgs/favicon.png">
    </head>
    <body>

        <div class="certificado">
            <img src="https://academy.especializati.com.br/assets/site/imgs/img-back-certificado-especializati.png" class="img-back-cert" alt="Certificado Digital EspecializaTi">

            <div class="conteudo-certificado text-center">
                <h1 class="titulo-certificado">CONVITE</h1>
                    <h2 class="detalhes-certificado">
                        Certificamos que o sócio <span class="nome-aluno">Carlos Ferreira</span> entregou o <br>
                        este convite para o <span class="curso">Evento tal </span> no dia dd/mm/yyyy às hh24:mi:ss horas.
                    </h2>
    
                    <h3 class="mais-detalhes-certificado">
                        Convite nº <b>{{$convite->codigo_validacao}}</b> para verificar se é um convite válido: sgaeteam.sgc.com.br/verificar-convite
                    </h3>
                <h4 class="data-certificado">
                    Válido de dd/mm/yyy até dd/mm/yyyy
                </h4>
            </div>

        </div><!--Convite-->

    </body>
</html>