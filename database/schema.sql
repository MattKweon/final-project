set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "public"."accounts" (
	"accountId" serial NOT NULL,
	"username" TEXT NOT NULL UNIQUE,
	"hashedPassword" TEXT NOT NULL,
	CONSTRAINT "accounts_pk" PRIMARY KEY ("accountId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."tracks" (
	"trackId" int NOT NULL,
	"title" TEXT NOT NULL,
	"artistId" int NOT NULL,
	"albumId" int NOT NULL,
	"explicitLyrics" BOOLEAN NOT NULL,
	CONSTRAINT "tracks_pk" PRIMARY KEY ("trackId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."playlists" (
	"playlistId" serial NOT NULL,
	"name" TEXT NOT NULL,
	"accountId" int NOT NULL,
	CONSTRAINT "playlists_pk" PRIMARY KEY ("playlistId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."playlistTracks" (
	"playlistId" int NOT NULL,
	"trackId" serial NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."library" (
	"accountId" int NOT NULL,
	"trackId" int NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."albums" (
	"albumId" int NOT NULL,
	"title" TEXT NOT NULL,
	"coverUrl" TEXT NOT NULL,
	CONSTRAINT "albums_pk" PRIMARY KEY ("albumId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."artists" (
	"artistId" int NOT NULL,
	"name" TEXT NOT NULL,
	"pictureUrl" TEXT NOT NULL,
	CONSTRAINT "artists_pk" PRIMARY KEY ("artistId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "tracks" ADD CONSTRAINT "tracks_fk0" FOREIGN KEY ("artistId") REFERENCES "artists"("artistId");
ALTER TABLE "tracks" ADD CONSTRAINT "tracks_fk1" FOREIGN KEY ("albumId") REFERENCES "albums"("albumId");

ALTER TABLE "playlists" ADD CONSTRAINT "playlists_fk0" FOREIGN KEY ("accountId") REFERENCES "accounts"("accountId");

ALTER TABLE "playlistTracks" ADD CONSTRAINT "playlistTracks_fk0" FOREIGN KEY ("playlistId") REFERENCES "playlists"("playlistId");
ALTER TABLE "playlistTracks" ADD CONSTRAINT "playlistTracks_fk1" FOREIGN KEY ("trackId") REFERENCES "tracks"("trackId");

ALTER TABLE "library" ADD CONSTRAINT "library_fk0" FOREIGN KEY ("accountId") REFERENCES "accounts"("accountId");
ALTER TABLE "library" ADD CONSTRAINT "library_fk1" FOREIGN KEY ("trackId") REFERENCES "tracks"("trackId");
