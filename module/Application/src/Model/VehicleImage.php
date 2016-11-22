<?php

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Application\Model\Vehicle;

/**
 * @ORM\Entity
 * @ORM\Table(name="vehicleimage")
 */
class VehicleImage {

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;
    
    /**
     * @ORM\Column(name="imagepath");
     */
    protected $imagepath;


    function getId() {
        return $this->id;
    }

    function getVehicleId() {
        return $this->vehicleId;
    }

    function getImagepath() {
        return $this->imagepath;
    }

    function getVehicle() {
        return $this->vehicle;
    }

    function setVehicleId($vehicleId) {
        $this->vehicleId = $vehicleId;
    }

    function setImagepath($imagepath) {
        $this->imagepath = $imagepath;
    }

    function setVehicle($vehicle) {
        $this->vehicle = $vehicle;
    }
    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\Vehicle" , inversedBy="images")
     * @ORM\JoinColumn(name="vehicle_id", referencedColumnName="id")
     */
    protected $vehicle;

}
