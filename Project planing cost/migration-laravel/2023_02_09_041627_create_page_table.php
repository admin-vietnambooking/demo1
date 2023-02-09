<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('page', function (Blueprint $table) {
            $table->id();
            $table->string('create_page');
            $table->string('update_page');
            $table->timestamp('delete_page');
            $table->bigInteger('slide_bannerId');
            $table->foreign('slide_bannerId')->references('id')->on('slide_banner');
            $table->bigInteger('blockId');
            $table->foreign('blockId')->references('id')->on('block_management');
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
        Schema::dropIfExists('page');
    }
}
