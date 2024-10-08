<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Customers extends Authenticatable implements JWTSubject
{
    use HasFactory;

    protected $table = 'Customers';

    protected $primaryKey = 'CustomerID';

    protected $keyType = 'string';

    public $incrementing = false;

    protected $fillable = [
        'CustomerID',
        'CustomerName',
        'NumberPhone',
        'Email',
        'Password',
        'CreatedDate',
    ];

    protected $hidden = [
        'Password',
    ];


    // Metode JWT
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }


    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }
}
