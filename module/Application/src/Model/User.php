<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Application\Model;

use Doctrine\ORM\Mapping as ORM;
use Application\Model\Review;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 */
class User {

    /**
     * @ORM\OneToMany(targetEntity="\Application\Model\Review", mappedBy="user")
     * @ORM\JoinColumn(name="review_id", referencedColumnName="id")
     */
    protected $reviews;

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(name="id", type="integer")   
     */
    protected $id;

    /**
     * @ORM\Column(name="username");
     */
    protected $username;
    
     /**
     * @ORM\Column(name="email");
     */
    protected $email;


    function __construct() {
        $this->reviews = new ArrayCollection();
    }

    function getId() {
        return $this->id;
    }

    function getUsername() {
        return $this->username;
    }
    function getEmail() {
        return $this->email;
    }

        function setUsername($username) {
        $this->username = $username;
    }
    function setEmail($email) {
        $this->email = $email;
    }

    
    public function getReviews() {
        return $this->reviews;
    }

    /**
     * Adds a new review to this user.
     * @param $review
     */
    public function addReview($review) {
        $this->reviews[] = $review;
    }

}
