<?php

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Application\Model\User;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
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
     * @ORM\ManyToOne(targetEntity="\Application\Model\User" , inversedBy="reviews")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    protected $user;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Model\Vehicle" , inversedBy="reviews")
     * @ORM\JoinColumn(name="vehicle_id", referencedColumnName="id")
     */
    protected $vehicle;

    /**
     * @ORM\Column(name="body");
     */
    protected $body;

    function getUser() {
        return $this->user;
    }

    function getVehicle() {
        return $this->vehicle;
    }

    function getUserId() {
        return $this->userId;
    }

    function getBody() {
        return $this->body;
    }

    function getId() {
        return $this->id;
    }

    function setUserId($userId) {
        $this->userId = $userId;
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
