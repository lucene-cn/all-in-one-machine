create  function cl_init_start as 'cn.lucene.plugins.service.udf.CL_INIT_START';
select cl_init_start();

CREATE external table  if not exists  s_y_s_t_start(hb string)
STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerStart'; 

select count(*) from s_y_s_t_start limit 10;



CREATE external table  if not exists s_y_s_t_loadjson( tbl string,part string, cond string,json string) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerWriteJson' ;
CREATE external table  if not exists s_y_s_t_loadbyjson( tbl string,part string, cond string,json string,rawdata string) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerWriteJson'
;



CREATE external table  if not exists s_y_s_t_cmmap0(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap0"
); 
CREATE external table  if not exists s_y_s_t_cmmap1(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap1"
); 
CREATE external table  if not exists s_y_s_t_cmmap2(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap2"
); 
CREATE external table  if not exists s_y_s_t_cmmap3(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap3"
);
CREATE external table  if not exists s_y_s_t_cmmap4(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap4"
); 
CREATE external table  if not exists s_y_s_t_cmmap5(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap5"
); 
CREATE external table  if not exists s_y_s_t_cmmap6(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap6"
); 
CREATE external table  if not exists s_y_s_t_cmmap7(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap7"
); 
CREATE external table  if not exists s_y_s_t_cmmap8(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap8"
); 
CREATE external table  if not exists s_y_s_t_cmmap9(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap9"
); 





CREATE external table  if not exists s_y_s_t_cmmap10(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap10"
); 
CREATE external table  if not exists s_y_s_t_cmmap11(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap11"
); 
CREATE external table  if not exists s_y_s_t_cmmap12(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap12"
); 
CREATE external table  if not exists s_y_s_t_cmmap13(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap13"
);
CREATE external table  if not exists s_y_s_t_cmmap14(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap14"
); 
CREATE external table  if not exists s_y_s_t_cmmap15(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap15"
); 
CREATE external table  if not exists s_y_s_t_cmmap16(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap16"
); 
CREATE external table  if not exists s_y_s_t_cmmap17(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap17"
); 
CREATE external table  if not exists s_y_s_t_cmmap18(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap18"
); 
CREATE external table  if not exists s_y_s_t_cmmap19(r0 array<string>,r1 array<int>,r2 array<bigint>,r3 array<float>,r4 array<double>) STORED BY 'cn.lucene.plugins.service.storageHandler.api.sys.CLStorageHandlerMap'
TBLPROPERTIES(
"s_y_s_t_cmmap.table.name"="s_y_s_t_cmmap19"
); 


CREATE external  table if not exists  s_y_s_t_loadtxt_info( 
line string,
filepos bigint,
filepath string
)
 ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
 stored as 
    INPUTFORMAT 'cn.lucene.plugins.service.storageHandler.api.user.CLInputFormatWithFileInfo'
    OUTPUTFORMAT 'cn.lucene.plugins.service.storageHandler.api.sys.HiveOutputFormatNotSupport' 
TBLPROPERTIES (
    'cl.combine.input.format.raw.format'='org.apache.hadoop.mapred.TextInputFormat'
);


create  function YMortonUnHash as 'cn.lucene.plugins.service.udf.CL_GEO_UNHASH';
create  function YMortonHashDistance as 'cn.lucene.plugins.service.udf.CL_GEO_DISTANCE';
create  function YMortonHash as 'cn.lucene.plugins.service.udf.CL_GEO_HASH';
create  function YAnalyzer as 'cn.lucene.plugins.service.udf.CL_Analyzer';


