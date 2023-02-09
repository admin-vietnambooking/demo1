<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContactManagementTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('contact_management', function (Blueprint $table) {
            $table->bigInteger('delete_contact_id');
            $table->foreign('delete_contact_id')->references('id')->on('delete_contact');
            $table->bigInteger('detail_id');
            $table->foreign('detail_id')->references('id')->on('detail_contact');
            $table->string('reply_contact');
            $table->foreign('reply_contact')->references('id')->on('reply_contact');
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
        Schema::dropIfExists('contact_management');
    }
}
