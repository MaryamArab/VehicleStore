<?php

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Application\Model\Vehicle;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 * @ORM\Table(name="vehicletype")
 */
class VehicleType {

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;

    /**
     * @ORM\Column(name="title");
     */
    protected $title;
    
     /**
     * @ORM\OneToMany(targetEntity="\Application\Model\Vehicle", mappedBy="vehicleType")
     * @ORM\JoinColumn(name="vehicle_id", referencedColumnName="id")
     */
    protected $vehicles;
    
    function __construct() {
        $this->vehicles = new ArrayCollection();
    }
    function getVehicles() {
        return $this->vehicles;
    }

    function addVehicles($vehicles) {
        $this->vehicles[] = $vehicles;
    }

            function getId() {
        return $this->id;
    }

    function getTitle() {
        return $this->title;
    }

    function setTitle($title) {
        $this->title = $title;
    }

}
