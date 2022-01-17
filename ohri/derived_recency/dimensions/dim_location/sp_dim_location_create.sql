USE recency_uganda_prod_analysis_test;
GO

DROP TABLE IF EXISTS derived_recency.dim_location;

-- $BEGIN

CREATE TABLE derived_recency.dim_location(
    location_id UNIQUEIDENTIFIER NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    name_in_maps NVARCHAR(255) NOT NULL,
    [type] NVARCHAR(255) NOT NULL,
    parent_id UNIQUEIDENTIFIER NULL
);
ALTER TABLE [derived_recency].dim_location ADD CONSTRAINT pk_location_id PRIMARY KEY ([location_id]);
ALTER TABLE derived_recency.dim_location ADD CONSTRAINT fk_district FOREIGN KEY (parent_id) REFERENCES derived_recency.dim_location(location_id);

-- $END