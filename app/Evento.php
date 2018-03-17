<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
//use MaddHatter\LaravelFullcalendar\Event;
use MaddHatter\LaravelFullcalendar\IdentifiableEvent;

class Evento extends Model implements IdentifiableEvent // Event
{
    protected $dates = ['start_date', 'end_date'];

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
     * Optional FullCalendar.io settings for this event
     *
     * @return array
     */
    public function getEventOptions()
    {
        return [
            'color' => $this->background_color,
        ];
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