<?php 
namespace App\Http\Controllers;

use DB;
use Session;
use Request;
use CRUDBooster;
use App\Dependente;

class CBHook extends Controller {

	/*
	| --------------------------------------
	| Please note that you should re-login to see the session work
	| --------------------------------------
	|
	*/
	public function afterLogin() {

		/*-----------------------------------------------------------------
		| Gerar notificações aos usuários sobre Dependentes com pendências.
		| ----------------------------------------------------------------*/	

		$ultNotifDependenteRealizada = DB::table('cms_notifications')->where('url', 'like', '%dependentes%')->whereNull('deleted_at')->latest()->first();

		if ( date('Y-m-d',strtotime($ultNotifDependenteRealizada->created_at)) < date("Y-m-d") )
		{
			$destinatario = (array) CRUDBooster::myId();
			$notificacoesPendentes = DB::table('cms_notifications')->where('id_cms_users',$destinatario)->where('url', 'like', '%dependentes%')->whereNull('deleted_at')->where('is_read',0)->get();
			
			if (isset($notificacoesPendentes)) 
			{
				global $ignorarIds;
				$ignorarIds = array();
				
				foreach ($notificacoesPendentes as $pendencia) 
				{
					$array = explode("/",$pendencia->url);
					array_push($ignorarIds,$array[6]);
				}
			}
			
			if (isset($ignorarIds))
			{
				$dependentes = Dependente::where('dependente_grau','Filho(a)')->whereNull('deleted_at')->whereNotIn('id',$ignorarIds)->get();
			}
			else 
			{
				$dependentes = Dependente::where('dependente_grau','Filho(a)')->whereNull('deleted_at')->get();
			}
			
			foreach ($dependentes as $dependente) 
			{
			   $msg = $dependente->verificaPendencia();
	
			   if (isset($msg)) 
			   {
					$config['content'] = $msg;
					$config['to'] = CRUDBooster::adminPath().'/dependentes/edit/'.$dependente->id;
					$config['id_cms_users'] = $destinatario;
					CRUDBooster::sendNotification($config);	
			   }
			   
			   $msg = null;
			}
		}
		
		/*-----------------------------------------------------------------
		| Gerar notificações aos usuários sobre Pagamentos com pendências.
		| ----------------------------------------------------------------*/	
		
	}
}