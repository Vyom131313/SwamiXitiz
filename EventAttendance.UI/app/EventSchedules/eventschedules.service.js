"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var core_1 = require('@angular/core');
var http_1 = require('@angular/http');
var http_2 = require('@angular/http');
require('rxjs/add/operator/toPromise');
require('rxjs/add/operator/map');
require('rxjs/add/operator/do');
require('rxjs/add/operator/catch');
require('rxjs/Rx');
var EventSchedulesService = (function () {
    //constructor(private http: Http) {
    function EventSchedulesService() {
        //public ServiceBaseUrl: string = "";
        this.ServiceBaseUrl = "http://localhost:23283/api/EventSchedules";
    }
    EventSchedulesService.prototype.getItems = function (http) {
        return http.get(this.ServiceBaseUrl)
            .toPromise()
            .then(function (response) { return response.json(); });
    };
    EventSchedulesService.prototype.getItem = function (http, id) {
        var params = new http_2.URLSearchParams();
        params.set('id', id.toString());
        return http.get(this.ServiceBaseUrl, { search: params })
            .toPromise()
            .then(function (response) { return response.json(); });
    };
    EventSchedulesService.prototype.add = function (http, eventschedule) {
        eventschedule.Id = 0;
        var headers = new http_1.Headers({ 'Content-Type': 'application/json' });
        var options = new http_1.RequestOptions({ headers: headers });
        return http.post(this.ServiceBaseUrl, JSON.stringify(eventschedule), options).map(function (res) { return res; });
        //.catch(this.handleError)
    };
    EventSchedulesService.prototype.update = function (http, eventschedule) {
        var headers = new http_1.Headers({ 'Content-Type': 'application/json' });
        var options = new http_1.RequestOptions({ headers: headers });
        return http.put(this.ServiceBaseUrl + "/" + eventschedule.Id, JSON.stringify(eventschedule), options).map(function (res) { return res; });
    };
    EventSchedulesService.prototype.delete = function (http, id) {
        var params = new http_2.URLSearchParams();
        params.set('id', id.toString());
        return http.delete(this.ServiceBaseUrl, { search: params }).map(function (res) { return res; });
    };
    EventSchedulesService = __decorate([
        core_1.Injectable()
    ], EventSchedulesService);
    return EventSchedulesService;
}());
exports.EventSchedulesService = EventSchedulesService;
