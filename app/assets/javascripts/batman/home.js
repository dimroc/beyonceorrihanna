// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Global dependencies
//= require jquery
//= require jquery_ujs
//= require underscore
//= require swfobject
//= require ICanHaz
//= require pretty

// Batman.js and its adapters
//= require batman/batman
//= require batman/batman.jquery
//= require batman/batman.rails

//= require batman/beyonceorrihanna

//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./helpers

// Run the Batman app
$(document).ready(function(){
  Beyonceorrihanna.run();
});