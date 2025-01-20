CREATE TABLE "assets" (
  "id" INT PRIMARY KEY,
  "name" varchar(255) UNIQUE NOT NULL,
  "type" varchar(255) NOT NULL,
  "description" text
);

CREATE TABLE "states" (
  "id" int PRIMARY KEY,
  "asset_id" int,
  "param" varchar(255) NOT NULL,
  "value" varchar(255) NOT NULL,
  "lastupdate" timestamptz DEFAULT (now())
);

CREATE TABLE "history" (
  "id" int PRIMARY KEY,
  "asset_id" int,
  "state" varchar(255) NOT NULL,
  "active_time" interval NOT NULL
);

CREATE UNIQUE INDEX ON "assets" ("name");

CREATE INDEX ON "assets" ("type");

CREATE INDEX ON "states" ("asset_id", "param");

CREATE INDEX ON "history" ("active_time");

ALTER TABLE "states" ADD FOREIGN KEY ("asset_id") REFERENCES "assets" ("id");

ALTER TABLE "history" ADD FOREIGN KEY ("asset_id") REFERENCES "assets" ("id");
