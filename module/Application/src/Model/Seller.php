<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Application\Model;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="seller")
 */
class Seller {

    /**
     * @ORM\OneToMany(targetEntity="Vehicle", mappedBy="seller")
     * @ORM\JoinColumn(name="vehicle_id", referencedColumnName="id")
     */
    protected $vehicles;

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;

    /**
     * @ORM\Column(name="name");
     */
    protected $name;

    /**
     * @ORM\Column(name="type")
     */
    protected $type;

    /**
     * @ORM\Column(name="address")
     */
    protected $address;

    /**
     * @ORM\Column(name="phone")
     */
    protected $phone;

    /**
     * @ORM\Column(name="email")
     */
    protected $email;

    /**
     * @ORM\Column(name="website")
     */
    protected $website;

    function __construct() {
        $this->vehicles = new ArrayCollection();
    }

    function getVehicles() {
        return $this->vehicles;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getType() {
        return $this->type;
    }

    function getAddress() {
        return $this->address;
    }

    function getPhone() {
        return $this->phone;
    }

    function getEmail() {
        return $this->email;
    }

    function getWebsite() {
        return $this->website;
    }

    function addVehicle($vehicle) {
        $this->vehicles[] = $vehicle;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setType($type) {
        $this->type = $type;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setPhone($phone) {
        $this->phone = $phone;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setWebsite($website) {
        $this->website = $website;
    }

}
