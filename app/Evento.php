<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use CRUDBooster;
use MaddHatter\LaravelFullcalendar\IdentifiableEvent;

class Evento extends Model implements IdentifiableEvent
{
    protected $dates = ['start_date', 'end_date'];
    protected $fillable = ['start_date', 'end_date', 'atividade_id','professor_id', 'espaco_id', 'titulo', 'created_at', 'updated_at'];

    /**
     * Get the event's id number
     *
     * @return int
     */
    public function getId() {
		return $this->id;
	}

    /**
     * Get the event's title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->titulo;
    }

    /**
     * Is it an all day event?
     *
     * @return bool
     */
    public function isAllDay()
    {
        return (bool)$this->all_day;
    }

    /**
     * Get the start time
     *
     * @return DateTime
     */
    public function getStart()
    {
        return $this->start_date;
    }

    /**
     * Get the end time
     *
     * @return DateTime
     */
    public function getEnd()
    {
        return $this->end_date;
    }
    
    /**
     * Get the end time
     *
     * @return DateTime
     */
    public function getAtividadeId()
    {
        return $this->atividade_id;
    }    

    /**
     * Optional FullCalendar.io settings for this event
     *
     * @return array
     */
    public function getEventOptions()
    {
        if (is_null($this->getAtividadeId())) {
            return [
                'color' => '#F00000',
                'url'   => CRUDBooster::adminPath().'/eventos/detail/'.$this->getId().'?return_url='.CRUDBooster::adminPath().'/eventos?m=3',
            ];
        }
        else {
            return [
                'color' => $this->background_color,
                'url'   => CRUDBooster::adminPath().'/eventos/detail/'.$this->getId().'?return_url='.CRUDBooster::adminPath().'/eventos?m=3',
            ];        
        }
    }
    
    public function atividade()
    {
        return $this->hasOne('App\Atividade');
    }
    
    public function espaco()
    {
        return $this->hasOne('App\Espaco');
    }    
    
}