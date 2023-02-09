<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('customer', function (Blueprint $table) {
            $table->id();
            $table->string('customer_reg');
            $table->double('customer_point');
            $table->foreign('customer_point')->references('id')->on('customer_coupon');
            $table->string('customer_detail_Id');
            $table->foreign('customer_detail_Id')->references('id')->on('customer_info');
            $table->char('static_id');
            $table->foreign('static_id')->references('id')->on('customer_static');
            $table->timestamp('create_at');
            $table->timestamp('updated_at');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
    }
}
