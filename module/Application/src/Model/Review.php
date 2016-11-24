<?php

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Application\Model\User;
use Doctrine\Common\Collections\ArrayCollection;
use Application\Model\Vehicle;

/**
 * @ORM\Entity(repositoryClass="\Application\Repository\ReviewRepository")
 * @ORM\Table(name="review")
 */
class Review {

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;
    
    /**
     * @ORM\Column(name="title" , nullable=true);
     */
    protected $title;
    /**
     * @ORM\Column(name="body");
     */
    protected $body;
    
    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\User" , inversedBy="reviews")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    protected $user;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\Vehicle" , inversedBy="reviews")
     * @ORM\JoinColumn(name="vehicle_id", referencedColumnName="id")
     */
    protected $vehicle;
    
    function getId() {
        return $this->id;
    }
    
    function getTitle() {
        return $this->title;
    }
    
    function getBody() {
        return $this->body;
    }
    
    function getUser() {
        return $this->user;
    }
    
    function getVehicle() {
        return $this->vehicle;
    }

    function setTitle($title) {
        $this->title = $title;
    }

    function setBody($body) {
        $this->body = $body;
    }

    function setUser($user) {
        $this->user = $user;
    }

    function setVehicle($vehicle) {
        $this->vehicle = $vehicle;
    }

}
