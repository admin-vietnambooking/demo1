<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProviderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('provider', function (Blueprint $table) {
            $table->id();
            $table->string('list_provider');
            $table->bigInteger('detail_providerId');
            $table->foreign('detail_providerId')->references('id')->on('provider_info');
            $table->enum('status_provider');
            $table->bigInteger('staticId');
            $table->foreign('staticId')->references('id')->on('provide_static');
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
        Schema::dropIfExists('provider');
    }
}
