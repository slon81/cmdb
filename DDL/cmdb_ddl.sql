CREATE TABLE  "ENTITYTYPE" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255), 
	"ENTITYCATEGORYID" NUMBER(10,0), 
	"DESCRIPTION" VARCHAR2(1024), 
	 CONSTRAINT "ENTITYTYPE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "ENTITYTYPE_UNQ" UNIQUE ("NAME")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYTYPESTATUS" 
   (	"ENTITYTYPEID" NUMBER, 
	"ID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(255), 
	"PARENTSTATUSID" NUMBER, 
	 CONSTRAINT "ENTITYTYPESTATUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "ENTITYTYPESTATUS_UNQ" UNIQUE ("ENTITYTYPEID", "NAME")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYATTRIBUTE" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(255), 
	"ATTRTYPE" NUMBER(5,0), 
	"ENTITYTYPEDOMAINID" NUMBER(10,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR2(255), 
	 CONSTRAINT "PK_ENTITYATTRIBUTE_ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ_ENTITYATTRIBUTE_NAME" UNIQUE ("NAME")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYSTATUSATTRREQUIRED" 
   (	"ENTITYSTATUSID" NUMBER NOT NULL ENABLE, 
	"ENTITYATTRID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ENTITYSTATUSATTRREQUIRED_PK" PRIMARY KEY ("ENTITYSTATUSID", "ENTITYATTRID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYINTERRUPTIONTYPE" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(255), 
	 CONSTRAINT "ENTITYINTERRUPTIONTYPE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYINTERRUPTION" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"FROMDATE" DATE, 
	"TODATE" DATE, 
	"FROMTIME" TIMESTAMP (6), 
	"TOTIME" TIMESTAMP (6), 
	"STATUS" NUMBER, 
	"INTERRUPTIONTYPE" NUMBER, 
	"OWNERUSERID" VARCHAR2(20), 
	 CONSTRAINT "ENTITYINTERRUPTION_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITY" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"ENTITYTYPEID" NUMBER(10,0), 
	"STABILITYID" NUMBER(10,2), 
	 CONSTRAINT "ENTITY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "ENTITY_UK1" UNIQUE ("NAME")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYINTERRUPTIONLIST" 
   (	"INTERRUPTIONID" NUMBER NOT NULL ENABLE, 
	"ENTITYID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ENTITYINTERRUPTIONLIST_PK" PRIMARY KEY ("INTERRUPTIONID", "ENTITYID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PLUGIN_GANTT_DEMO_TASKS" 
   (	"T_ID" NUMBER NOT NULL ENABLE, 
	"T_PARENT_T_ID" NUMBER, 
	"T_TITLE" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"T_DESCRIPTION" VARCHAR2(400 CHAR), 
	"T_START_DATE" DATE NOT NULL ENABLE, 
	"T_DURATION" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"T_PROGRESS" NUMBER(4,3) DEFAULT 0 NOT NULL ENABLE, 
	"T_SORT_ORDER" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CHECK (  
        t_progress BETWEEN 0 AND 1  
    ) ENABLE, 
	 PRIMARY KEY ("T_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PLUGIN_GANTT_DEMO_LINKS" 
   (	"L_ID" NUMBER NOT NULL ENABLE, 
	"L_SOURCE" NUMBER NOT NULL ENABLE, 
	"L_TARGET" NUMBER NOT NULL ENABLE, 
	"L_TYPE" NUMBER(1,0) NOT NULL ENABLE, 
	 CHECK (  
        l_type IN (  
            0,1,2,3  
        )  
    ) ENABLE, 
	 PRIMARY KEY ("L_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYATTRVALUE" 
   (	"ENTITYID" NUMBER(10,0), 
	"ENTITYATTRID" NUMBER(10,0), 
	"VALUE" VARCHAR2(1024), 
	"DOMAINATTRVALUEID" NUMBER(10,0), 
	"VALIDFROM" DATE, 
	"VALIDTILL" DATE, 
	"STABILITYID" NUMBER(10,2)
   )
/
CREATE TABLE  "ENTITYEVENT" 
   (	"ID" NUMBER(10,0), 
	"ONDATE" DATE, 
	"ONTIME" TIMESTAMP (6), 
	"PARENTENTITYEVENTID" NUMBER(10,0), 
	"ONCHANGE" DATE DEFAULT SYSDATE, 
	"CHANGETYPEID" NUMBER, 
	"REASON" VARCHAR2(1024), 
	"CHANGESTATUS" NUMBER
   )
/
CREATE TABLE  "ENTITYLINK" 
   (	"ENTITYID" NUMBER(10,0), 
	"PARENTID" NUMBER(10,0), 
	"ENTITYLINKTYPE" NUMBER(10,0), 
	"ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_ENTITYLINK_ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "TMP_LOADER_BAREMETALHOST" 
   (	"HOST_NAME" VARCHAR2(255), 
	"HOST_STATUS" VARCHAR2(255), 
	"SITE_CODE" VARCHAR2(255), 
	"HOST_TYPE" VARCHAR2(255), 
	"HOST_ROLE" VARCHAR2(255), 
	"RAM_SIZE" VARCHAR2(255), 
	"CPU_FREQUENCY" VARCHAR2(255), 
	"CPU_QTY" VARCHAR2(255), 
	"CPU_CORE_QTY" VARCHAR2(255), 
	"RESPONSIBLE_DIVISION" VARCHAR2(255), 
	"RESPONSIBLE_DEPARTMENT" VARCHAR2(255), 
	"VENDOR_NAME" VARCHAR2(255), 
	"MODEL_NAME" VARCHAR2(255), 
	"OS_UPDATES_ROLE" VARCHAR2(255), 
	"OS_NAME" VARCHAR2(255), 
	"CPU_TYPE" VARCHAR2(255), 
	"NOTES" VARCHAR2(255), 
	"UPDATE_FROM_INVENTORY" VARCHAR2(255), 
	"INVENTORY_ACTUAL_TO" VARCHAR2(255), 
	"EXISTS_IN_INVENTORY" VARCHAR2(255)
   )
/
CREATE TABLE  "ENTITYTYPEATTRLINK" 
   (	"ENTITYTYPEID" NUMBER(10,0) NOT NULL ENABLE, 
	"ENTITYATTRID" NUMBER(10,0), 
	"REQUIRED" NUMBER(1,0) DEFAULT 0, 
	"ISRESOURCE" NUMBER(1,0) DEFAULT 0, 
	"ISSTATISTIC" NUMBER(1,0) DEFAULT 0, 
	"ENTITYTYPEDOMAINID" NUMBER, 
	"ID" NUMBER
   )
/
CREATE TABLE  "PLUGIN_GANTT_DEMO_HOLIDAYS" 
   (	"H_DATE" DATE NOT NULL ENABLE, 
	"H_COMMENT" VARCHAR2(30), 
	 CHECK (h_date = trunc(h_date)) ENABLE, 
	 PRIMARY KEY ("H_DATE")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYCATEGORY" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(250), 
	"PARENTCATEGORYID" NUMBER
   )
/
CREATE TABLE  "ENTITYEVENTATTRIBUTE" 
   (	"ENTITYEVENTID" NUMBER(10,0) NOT NULL ENABLE, 
	"ENTITYID" NUMBER(10,0) NOT NULL ENABLE, 
	"ENTITYATTRID" NUMBER(10,0) NOT NULL ENABLE, 
	"VALUE" VARCHAR2(1024), 
	"ISPROCESSED" NUMBER(1,0), 
	 CONSTRAINT "ENTITYEVENTATTRIBUTE_PK" PRIMARY KEY ("ENTITYID", "ENTITYATTRID", "ENTITYEVENTID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ENTITYATTRVALIDATOR" 
   (	"ENTITYATTRIBUTEID" NUMBER(10,0), 
	"ENTITYTYPEID" NUMBER(10,0), 
	"REGEXP" VARCHAR2(255)
   )
/
CREATE TABLE  "TMP_LOADER_VMWAREHOSTS" 
   (	"VM" VARCHAR2(255), 
	"DNSNAME" VARCHAR2(255), 
	"POWERON" VARCHAR2(255), 
	"CPUS" VARCHAR2(255), 
	"MEMORY" VARCHAR2(255), 
	"DISKS" VARCHAR2(255), 
	"NETWORK1" VARCHAR2(255), 
	"NETWORK2" VARCHAR2(255), 
	"NETWORK3" VARCHAR2(255), 
	"NETWORK4" VARCHAR2(255), 
	"FOLDER" VARCHAR2(255), 
	"PROVISIONMB" VARCHAR2(255), 
	"INUSEMB" VARCHAR2(255), 
	"UNSHAREDMB" VARCHAR2(255), 
	"CREATED" VARCHAR2(255), 
	"ID" VARCHAR2(255), 
	"ITSERVICE" VARCHAR2(255), 
	"ITSYSTEM" VARCHAR2(255), 
	"DATACENTER" VARCHAR2(255), 
	"CCLUSTER" VARCHAR2(255), 
	"HOST" VARCHAR2(255), 
	"VMID" VARCHAR2(255), 
	"VMUUID" VARCHAR2(255), 
	"ANNOTATION" VARCHAR2(1024), 
	"OS" VARCHAR2(255)
   )
/
CREATE TABLE  "ENTITYRESOURCES" 
   (	"ID" NUMBER, 
	"ENTITYID" NUMBER(10,0), 
	"ENTITYATTRIBUTEID" NUMBER(10,0), 
	"OTBS" NUMBER, 
	"VALUE" NUMBER, 
	"VALUEDATE" DATE, 
	"DESCRIPTION" VARCHAR2(255), 
	"ISREVERSAL" NUMBER, 
	"PARENTRESOURCEID" NUMBER
   )
/
CREATE TABLE  "TMP_LOAD_EMPLOYEE" 
   (	"HRM_ID" VARCHAR2(20), 
	"DEPARTMENT" VARCHAR2(255), 
	"POSITION" VARCHAR2(255), 
	"FIO" VARCHAR2(255), 
	"BIRTHDATE" VARCHAR2(20), 
	"HIREDATE" VARCHAR2(20), 
	"COLUMN1" VARCHAR2(255)
   )
/
CREATE TABLE  "TMP_LOAD_ONECOL" 
   (	"COL" VARCHAR2(1024)
   )
/
CREATE TABLE  "ENTITYLINKRESTRICT" 
   (	"PARENTENTITYTYPEID" NUMBER(10,0), 
	"ENTITYTYPEID" NUMBER(10,0), 
	"ENTITYLINKTYPEID" NUMBER(10,0)
   )
/
CREATE TABLE  "ENTITYLINKTYPE" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(1024)
   )
/
ALTER TABLE  "ENTITYINTERRUPTIONLIST" ADD CONSTRAINT "ENTITYINTERRUPTIONLIST_FK1" FOREIGN KEY ("INTERRUPTIONID")
	  REFERENCES  "ENTITYINTERRUPTION" ("ID") ENABLE
/
ALTER TABLE  "ENTITYINTERRUPTIONLIST" ADD CONSTRAINT "ENTITYINTERRUPTIONLIST_FK2" FOREIGN KEY ("ENTITYID")
	  REFERENCES  "ENTITY" ("ID") ENABLE
/
ALTER TABLE  "ENTITYINTERRUPTION" ADD CONSTRAINT "ENTITYINTERRUPTION_FK2" FOREIGN KEY ("INTERRUPTIONTYPE")
	  REFERENCES  "ENTITYINTERRUPTIONTYPE" ("ID") ENABLE
/
ALTER TABLE  "ENTITYSTATUSATTRREQUIRED" ADD CONSTRAINT "ENTITYSTATUSATTRREQUIRED_FK1" FOREIGN KEY ("ENTITYATTRID")
	  REFERENCES  "ENTITYATTRIBUTE" ("ID") ENABLE
/
ALTER TABLE  "ENTITYSTATUSATTRREQUIRED" ADD CONSTRAINT "ENTITYSTATUSATTRREQUIRED_FK2" FOREIGN KEY ("ENTITYSTATUSID")
	  REFERENCES  "ENTITYTYPESTATUS" ("ID") ENABLE
/
ALTER TABLE  "ENTITYTYPESTATUS" ADD CONSTRAINT "ENTITYTYPESTATUS_FK1" FOREIGN KEY ("ENTITYTYPEID")
	  REFERENCES  "ENTITYTYPE" ("ID") ENABLE
/
ALTER TABLE  "PLUGIN_GANTT_DEMO_LINKS" ADD FOREIGN KEY ("L_TARGET")
	  REFERENCES  "PLUGIN_GANTT_DEMO_TASKS" ("T_ID") ENABLE
/
ALTER TABLE  "PLUGIN_GANTT_DEMO_LINKS" ADD FOREIGN KEY ("L_SOURCE")
	  REFERENCES  "PLUGIN_GANTT_DEMO_TASKS" ("T_ID") ENABLE
/
ALTER TABLE  "PLUGIN_GANTT_DEMO_TASKS" ADD FOREIGN KEY ("T_PARENT_T_ID")
	  REFERENCES  "PLUGIN_GANTT_DEMO_TASKS" ("T_ID") ENABLE
/
CREATE UNIQUE INDEX  "ENTITYATTRVALIDATOR_PK" ON  "ENTITYATTRVALIDATOR" ("ENTITYATTRIBUTEID", "ENTITYTYPEID")
/
CREATE UNIQUE INDEX  "ENTITYCATEGORY_PK" ON  "ENTITYCATEGORY" ("ID")
/
CREATE UNIQUE INDEX  "ENTITYEVENT_PK" ON  "ENTITYEVENT" ("ID")
/
CREATE UNIQUE INDEX  "ENTITYLINKTYPE_PK" ON  "ENTITYLINKTYPE" ("ID")
/
CREATE INDEX  "ENTITYLINK_ENTITYLINKTYPE_FK" ON  "ENTITYLINK" ("ENTITYLINKTYPE")
/
CREATE UNIQUE INDEX  "ENTITYLINK_PK" ON  "ENTITYLINK" ("ENTITYID", "PARENTID", "ENTITYLINKTYPE")
/
CREATE UNIQUE INDEX  "ENTITYRESOURCES_PK" ON  "ENTITYRESOURCES" ("ID")
/
CREATE UNIQUE INDEX  "PK_ENTITYTYPEATTR" ON  "ENTITYATTRVALUE" ("ENTITYID", "ENTITYATTRID")
/
CREATE INDEX  "TMP_INDEX1" ON  "TMP_LOADER_VMWAREHOSTS" ("DNSNAME")
/
CREATE UNIQUE INDEX  "UNQ_ELINKRESTRICT" ON  "ENTITYLINKRESTRICT" ("PARENTENTITYTYPEID", "ENTITYTYPEID", "ENTITYLINKTYPEID")
/
CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYATTRIBUTE_TAPI" IS  
    TYPE entityattribute_tapi_rec IS RECORD ( attrtype entityattribute.attrtype%TYPE,  
    entitytypedomainid entityattribute.entitytypedomainid%TYPE,  
    description entityattribute.description%TYPE,  
    id entityattribute.id%TYPE,  
    name entityattribute.name%TYPE );  
    TYPE entityattribute_tapi_tab IS  
        TABLE OF entityattribute_tapi_rec;  
  
-- insert  
    PROCEDURE ins (  
        p_attrtype             IN entityattribute.attrtype%TYPE DEFAULT NULL,  
        p_entitytypedomainid   IN entityattribute.entitytypedomainid%TYPE DEFAULT NULL,  
        p_description          IN entityattribute.description%TYPE DEFAULT NULL,  
        p_id                   IN entityattribute.id%TYPE DEFAULT NULL,  
        p_name                 IN entityattribute.name%TYPE DEFAULT NULL  
    );  
-- update  
  
    PROCEDURE upd (  
        p_attrtype             IN entityattribute.attrtype%TYPE DEFAULT NULL,  
        p_entitytypedomainid   IN entityattribute.entitytypedomainid%TYPE DEFAULT NULL,  
        p_description          IN entityattribute.description%TYPE DEFAULT NULL,  
        p_id                   IN entityattribute.id%TYPE,  
        p_name                 IN entityattribute.name%TYPE DEFAULT NULL  
    );  
-- delete  
  
    PROCEDURE del (  
        p_id   IN entityattribute.id%TYPE  
    );  
  
  
   FUNCTION GetDomainTypeId(p_attrid IN entityattribute.id%TYPE) return entityattribute.id%TYPE;  
  
  
END entityattribute_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYATTRIBUTE_TAPI" IS  
-- insert  
  
    PROCEDURE ins (  
        p_attrtype             IN entityattribute.attrtype%TYPE DEFAULT NULL,  
        p_entitytypedomainid   IN entityattribute.entitytypedomainid%TYPE DEFAULT NULL,  
        p_description          IN entityattribute.description%TYPE DEFAULT NULL,  
        p_id                   IN entityattribute.id%TYPE DEFAULT NULL,  
        p_name                 IN entityattribute.name%TYPE DEFAULT NULL  
    )  
        IS  
    BEGIN  
        INSERT INTO entityattribute (  
            attrtype,  
            entitytypedomainid,  
            description,  
            id,  
            name  
        ) VALUES (  
            p_attrtype,  
            p_entitytypedomainid,  
            p_description,  
            seqentityattribute.nextval,  
            p_name  
        );  
  
    END;  
-- update  
  
    PROCEDURE upd (  
        p_attrtype             IN entityattribute.attrtype%TYPE DEFAULT NULL,  
        p_entitytypedomainid   IN entityattribute.entitytypedomainid%TYPE DEFAULT NULL,  
        p_description          IN entityattribute.description%TYPE DEFAULT NULL,  
        p_id                   IN entityattribute.id%TYPE,  
        p_name                 IN entityattribute.name%TYPE DEFAULT NULL  
    )  
        IS  
    BEGIN  
        UPDATE entityattribute  
            SET  
                attrtype = p_attrtype,  
                entitytypedomainid = p_entitytypedomainid,  
                description = p_description,  
                name = p_name  
        WHERE  
            id = p_id;  
  
    END;  
-- del  
  
    PROCEDURE del (  
        p_id   IN entityattribute.id%TYPE  
    )  
        IS  
    BEGIN  
        DELETE FROM entityattribute WHERE  
            id = p_id;  
  
    END;  
   
   FUNCTION GetDomainTypeId(p_attrid IN entityattribute.id%TYPE) return entityattribute.id%TYPE  
   is    
      hlp_result entityattribute.id%TYPE;  
        
   begin  
        
      select nvl(eat.ENTITYTYPEDOMAINID,0)  
      into hlp_result  
      from entityattribute eat  
      where eat.id = p_attrid;  
        
      return hlp_result;  
   end;  
   
END entityattribute_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYATTRVALUE_TAPI" 
IS    
type ENTITYATTRVALUE_tapi_rec    
IS    
  record    
  (    
    DOMAINATTRVALUEID ENTITYATTRVALUE.DOMAINATTRVALUEID%type ,    
    VALIDFROM ENTITYATTRVALUE.VALIDFROM%type ,    
    ENTITYATTRID ENTITYATTRVALUE.ENTITYATTRID%type ,    
    ENTITYID ENTITYATTRVALUE.ENTITYID%type ,    
    STABILITYID ENTITYATTRVALUE.STABILITYID%type ,    
    VALUE ENTITYATTRVALUE.VALUE%type ,    
    VALIDTILL ENTITYATTRVALUE.VALIDTILL%type );    
type ENTITYATTRVALUE_tapi_tab    
IS    
  TABLE OF ENTITYATTRVALUE_tapi_rec;    
  -- insert    
  PROCEDURE ins(    
      p_DOMAINATTRVALUEID IN ENTITYATTRVALUE.DOMAINATTRVALUEID%type DEFAULT NULL ,    
      p_VALIDFROM         IN ENTITYATTRVALUE.VALIDFROM%type DEFAULT SYSDATE ,    
      p_ENTITYATTRID      IN ENTITYATTRVALUE.ENTITYATTRID%type ,    
      p_ENTITYID          IN ENTITYATTRVALUE.ENTITYID%type ,    
      p_STABILITYID       IN ENTITYATTRVALUE.STABILITYID%type DEFAULT NULL ,    
      p_VALUE             IN ENTITYATTRVALUE.VALUE%type DEFAULT NULL ,    
      p_VALIDTILL         IN ENTITYATTRVALUE.VALIDTILL%type DEFAULT to_date('01013500','ddmmyyyy')   );    
  -- update    
  PROCEDURE upd(    
      p_DOMAINATTRVALUEID IN ENTITYATTRVALUE.DOMAINATTRVALUEID%type DEFAULT NULL ,    
      p_VALIDFROM         IN ENTITYATTRVALUE.VALIDFROM%type DEFAULT NULL ,    
      p_ENTITYATTRID      IN ENTITYATTRVALUE.ENTITYATTRID%type ,    
      p_ENTITYID          IN ENTITYATTRVALUE.ENTITYID%type ,    
      p_STABILITYID       IN ENTITYATTRVALUE.STABILITYID%type DEFAULT NULL ,    
      p_VALUE             IN ENTITYATTRVALUE.VALUE%type DEFAULT NULL ,    
      p_VALIDTILL         IN ENTITYATTRVALUE.VALIDTILL%type DEFAULT to_date('01013500','ddmmyyyy')   );    
  -- delete    
  PROCEDURE del(    
      p_ENTITYID     IN ENTITYATTRVALUE.ENTITYID%type ,    
      p_ENTITYATTRID IN ENTITYATTRVALUE.ENTITYATTRID%type );   
  
  FUNCTION getAttrIDByName(p_attrname VARCHAR2) RETURN NUMBER;     
  FUNCTION getValueByAttrId(p_attrid NUMBER, p_entityid NUMBER) RETURN VARCHAR2;  
END ENTITYATTRVALUE_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYATTRVALUE_TAPI" IS    
  -- insert    
  
    PROCEDURE ins (  
        p_domainattrvalueid   IN entityattrvalue.domainattrvalueid%TYPE DEFAULT NULL,  
        p_validfrom           IN entityattrvalue.validfrom%TYPE DEFAULT SYSDATE,  
        p_entityattrid        IN entityattrvalue.entityattrid%TYPE,  
        p_entityid            IN entityattrvalue.entityid%TYPE,  
        p_stabilityid         IN entityattrvalue.stabilityid%TYPE DEFAULT NULL,  
        p_value               IN entityattrvalue.value%TYPE DEFAULT NULL,  
        p_validtill           IN entityattrvalue.validtill%TYPE DEFAULT TO_DATE('01013500','ddmmyyyy')  
    ) IS  
        hlp_returnvalue   entitytypeattrlink.isresource%TYPE;  
    BEGIN  
        begin  
        hlp_returnvalue := entitytypeattrlink_tapi.get_type_resource(  
                                p_entitytypeid => entity_tapi.get_entitytypeid(p_entityid => p_entityid),  
                                p_entityattrid => p_entityattrid);  
  
         exception   
            when others then  
               hlp_returnvalue:=0;  
        end;  
        IF hlp_returnvalue>0 THEN  
              ENTITYRESOURCES_TAPI.ins (    P_OTBS => hlp_returnvalue,  
                                            P_ENTITYID => P_ENTITYID,  
                                            P_VALUEDATE => p_validfrom,  
                                            P_DESCRIPTION => 'create by entityvalue api',--P_DESCRIPTION,  
                                            P_PARENTRESOURCEID => NULL,  
                                            P_ENTITYATTRIBUTEID => p_entityattrid,  
                                            P_ID => NULL,  
                                            P_VALUE => p_value,  
                                            P_ISREVERSAL => 0) ;    
  
        END IF;  
  
        INSERT INTO entityattrvalue (  
            domainattrvalueid,  
            validfrom,  
            entityattrid,  
            entityid,  
            stabilityid,  
            value,  
            validtill  
        ) VALUES (  
            p_domainattrvalueid,  
            p_validfrom,  
            p_entityattrid,  
            p_entityid,  
            p_stabilityid,  
            p_value,  
            p_validtill  
        );  
  
    END;    
-- update    
  
    PROCEDURE upd (  
        p_domainattrvalueid   IN entityattrvalue.domainattrvalueid%TYPE DEFAULT NULL,  
        p_validfrom           IN entityattrvalue.validfrom%TYPE DEFAULT NULL,  
        p_entityattrid        IN entityattrvalue.entityattrid%TYPE,  
        p_entityid            IN entityattrvalue.entityid%TYPE,  
        p_stabilityid         IN entityattrvalue.stabilityid%TYPE DEFAULT NULL,  
        p_value               IN entityattrvalue.value%TYPE DEFAULT NULL,  
        p_validtill           IN entityattrvalue.validtill%TYPE DEFAULT TO_DATE('01013500','ddmmyyyy')  
    )  
        IS  
  
       hlp_returnvalue   entitytypeattrlink.isresource%TYPE;  
    BEGIN  
        hlp_returnvalue := entitytypeattrlink_tapi.get_type_resource(  
                                p_entitytypeid => entity_tapi.get_entitytypeid(p_entityid => p_entityid),  
                                p_entityattrid => p_entityattrid);  
  
  
        UPDATE entityattrvalue  
            SET  
                domainattrvalueid = p_domainattrvalueid,  
                validfrom = p_validfrom,  
                stabilityid = p_stabilityid,  
                value = p_value,  
                validtill = p_validtill  
        WHERE  
            entityid = p_entityid  
            AND   entityattrid = p_entityattrid;  
  
    END;    
-- del    
  
    PROCEDURE del (  
        p_entityid       IN entityattrvalue.entityid%TYPE,  
        p_entityattrid   IN entityattrvalue.entityattrid%TYPE  
    )  
        IS  
    BEGIN  
        DELETE FROM entityattrvalue  
        WHERE  
            entityid = p_entityid  
            AND   entityattrid = p_entityattrid;  
  
    END;  
  
    FUNCTION getattridbyname (  
        p_attrname VARCHAR2  
    ) RETURN NUMBER IS  
        p_outid   NUMBER;  
    BEGIN  
        SELECT  
            id  
        INTO  
            p_outid  
        FROM  
            entityattribute et  
        WHERE  
            upper(et.name) = upper(p_attrname);  
  
        RETURN p_outid;  
    END;  
  
FUNCTION getValueByAttrId(p_attrid NUMBER, p_entityid NUMBER)  
  RETURN VARCHAR2  
  IS  
     hlp_val ENTITYATTRVALUE.value%TYPE;  
  BEGIN  
    
    select min(ev.value)  
      into hlp_val  
    FROM ENTITYATTRVALUE ev  
    Where ev.ENTITYATTRID = p_attrid  
       and ev.entityid = p_entityid;  
      return hlp_val;  
  END;  
  
END entityattrvalue_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYEVENTATTRIBUTE_TAPI" 
is  
  
type ENTITYEVENTATTRIBUTE_tapi_rec is record (  
ENTITYATTRID  ENTITYEVENTATTRIBUTE.ENTITYATTRID%type  
,ENTITYID  ENTITYEVENTATTRIBUTE.ENTITYID%type  
,ISPROCESSED  ENTITYEVENTATTRIBUTE.ISPROCESSED%type  
,ENTITYEVENTID  ENTITYEVENTATTRIBUTE.ENTITYEVENTID%type  
,VALUE  ENTITYEVENTATTRIBUTE.VALUE%type  
);  
type ENTITYEVENTATTRIBUTE_tapi_tab is table of ENTITYEVENTATTRIBUTE_tapi_rec;  
  
-- insert  
procedure ins (  
p_ENTITYATTRID in ENTITYEVENTATTRIBUTE.ENTITYATTRID%type  
,p_ENTITYID in ENTITYEVENTATTRIBUTE.ENTITYID%type  
,p_ISPROCESSED in ENTITYEVENTATTRIBUTE.ISPROCESSED%type default null   
,p_ENTITYEVENTID in ENTITYEVENTATTRIBUTE.ENTITYEVENTID%type  
,p_VALUE in ENTITYEVENTATTRIBUTE.VALUE%type default null   
);  
-- update  
procedure upd (  
p_ENTITYATTRID in ENTITYEVENTATTRIBUTE.ENTITYATTRID%type  
,p_ENTITYID in ENTITYEVENTATTRIBUTE.ENTITYID%type  
,p_ISPROCESSED in ENTITYEVENTATTRIBUTE.ISPROCESSED%type default null   
,p_ENTITYEVENTID in ENTITYEVENTATTRIBUTE.ENTITYEVENTID%type  
,p_VALUE in ENTITYEVENTATTRIBUTE.VALUE%type default null   
);  
-- delete  
procedure del (  
p_ENTITYID in ENTITYEVENTATTRIBUTE.ENTITYID%type  
,p_ENTITYATTRID in ENTITYEVENTATTRIBUTE.ENTITYATTRID%type  
,p_ENTITYEVENTID in ENTITYEVENTATTRIBUTE.ENTITYEVENTID%type  
);  
end ENTITYEVENTATTRIBUTE_tapi;  
  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYEVENTATTRIBUTE_TAPI" IS  
-- insert  
  
    PROCEDURE ins (  
        p_entityattrid    IN entityeventattribute.entityattrid%TYPE,  
        p_entityid        IN entityeventattribute.entityid%TYPE,  
        p_isprocessed     IN entityeventattribute.isprocessed%TYPE DEFAULT NULL,  
        p_entityeventid   IN entityeventattribute.entityeventid%TYPE,  
        p_value           IN entityeventattribute.value%TYPE DEFAULT NULL  
    )  
        IS  
    BEGIN  
        INSERT INTO entityeventattribute (  
            entityattrid,  
            entityid,  
            isprocessed,  
            entityeventid,  
            value  
        ) VALUES (  
            p_entityattrid,  
            p_entityid,  
            p_isprocessed,  
            p_entityeventid,  
            p_value  
        );  
  
    END;  
-- update  
  
    PROCEDURE upd (  
        p_entityattrid    IN entityeventattribute.entityattrid%TYPE,  
        p_entityid        IN entityeventattribute.entityid%TYPE,  
        p_isprocessed     IN entityeventattribute.isprocessed%TYPE DEFAULT NULL,  
        p_entityeventid   IN entityeventattribute.entityeventid%TYPE,  
        p_value           IN entityeventattribute.value%TYPE DEFAULT NULL  
    )  
        IS  
    BEGIN  
        UPDATE entityeventattribute  
            SET  
                isprocessed = p_isprocessed,  
                value = p_value  
        WHERE  
            entityid = p_entityid  
            AND   entityattrid = p_entityattrid  
            AND   entityeventid = p_entityeventid;  
  
    END;  
-- del  
  
    PROCEDURE del (  
        p_entityid        IN entityeventattribute.entityid%TYPE,  
        p_entityattrid    IN entityeventattribute.entityattrid%TYPE,  
        p_entityeventid   IN entityeventattribute.entityeventid%TYPE  
    )  
        IS  
    BEGIN  
        DELETE FROM entityeventattribute  
        WHERE  
            entityid = p_entityid  
            AND   entityattrid = p_entityattrid  
            AND   entityeventid = p_entityeventid;  
  
    END;  
  
END entityeventattribute_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYEVENT_TAPI" 
IS    
type ENTITYEVENT_tapi_rec    
IS    
  record    
  (    
    CHANGETYPEID ENTITYEVENT.CHANGETYPEID%type ,    
    ONCHANGE ENTITYEVENT.ONCHANGE%type ,    
    ONDATE ENTITYEVENT.ONDATE%type ,    
    PARENTENTITYEVENTID ENTITYEVENT.PARENTENTITYEVENTID%type ,    
    ID ENTITYEVENT.ID%type ,    
    ONTIME ENTITYEVENT.ONTIME%type );     
type ENTITYEVENT_tapi_tab    
IS    
  TABLE OF ENTITYEVENT_tapi_rec;    
  -- insert    
  PROCEDURE ins(    
      p_CHANGETYPEID        IN ENTITYEVENT.CHANGETYPEID%type DEFAULT NULL ,    
      p_ONCHANGE            IN ENTITYEVENT.ONCHANGE%type ,    
      p_ONDATE              IN ENTITYEVENT.ONDATE%type DEFAULT NULL ,    
      p_PARENTENTITYEVENTID IN ENTITYEVENT.PARENTENTITYEVENTID%type DEFAULT NULL ,    
      p_ID                  IN ENTITYEVENT.ID%type ,    
      p_ONTIME              IN ENTITYEVENT.ONTIME%type DEFAULT NULL,    
      p_reason              IN ENTITYEVENT.reason%type DEFAULT 0 /*0=AUTO*/,   
      p_changestatus        IN ENTITYEVENT.changestatus%type DEFAULT NULL   
  );    
  -- update    
  PROCEDURE upd(    
      p_CHANGETYPEID        IN ENTITYEVENT.CHANGETYPEID%type DEFAULT NULL ,    
      p_ONCHANGE            IN ENTITYEVENT.ONCHANGE%type ,    
      p_ONDATE              IN ENTITYEVENT.ONDATE%type DEFAULT NULL ,    
      p_PARENTENTITYEVENTID IN ENTITYEVENT.PARENTENTITYEVENTID%type DEFAULT NULL ,    
      p_ID                  IN ENTITYEVENT.ID%type ,    
      p_ONTIME              IN ENTITYEVENT.ONTIME%type DEFAULT NULL );    
  -- delete    
  PROCEDURE del(    
      p_ID IN ENTITYEVENT.ID%type );    
END ENTITYEVENT_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYEVENT_TAPI" IS    
  -- insert     
    
    PROCEDURE ins (    
        p_changetypeid          IN entityevent.changetypeid%TYPE DEFAULT NULL,    
        p_onchange              IN entityevent.onchange%TYPE,    
        p_ondate                IN entityevent.ondate%TYPE DEFAULT NULL,    
        p_parententityeventid   IN entityevent.parententityeventid%TYPE DEFAULT NULL,    
        p_id                    IN entityevent.id%TYPE,    
        p_ontime                IN entityevent.ontime%TYPE DEFAULT NULL,    
        p_reason              IN ENTITYEVENT.reason%type DEFAULT 0 /*0=AUTO*/,   
        p_changestatus        IN ENTITYEVENT.changestatus%type DEFAULT NULL   
    )    
        IS    
    BEGIN    
        INSERT INTO entityevent (     
            changetypeid,    
            onchange,    
            ondate,    
            parententityeventid,    
            id,    
            ontime ,   
            reason,   
            changestatus   
        ) VALUES (    
            p_changetypeid,    
            p_onchange,    
            p_ondate,    
            p_parententityeventid,    
            nvl(p_id,seqentityevent.NEXTVAL),    
            p_ontime,   
            p_reason,   
            p_changestatus   
        );    
  
    END;    
-- update    
  
    PROCEDURE upd (    
        p_changetypeid          IN entityevent.changetypeid%TYPE DEFAULT NULL,    
        p_onchange              IN entityevent.onchange%TYPE,    
        p_ondate                IN entityevent.ondate%TYPE DEFAULT NULL,    
        p_parententityeventid   IN entityevent.parententityeventid%TYPE DEFAULT NULL,    
        p_id                    IN entityevent.id%TYPE,    
        p_ontime                IN entityevent.ontime%TYPE DEFAULT NULL    
    )    
        IS    
    BEGIN    
        UPDATE entityevent    
            SET    
                changetypeid = p_changetypeid,    
                onchange = p_onchange,    
                ondate = p_ondate,    
                parententityeventid = p_parententityeventid,    
                ontime = p_ontime    
        WHERE    
            id = p_id;    
  
    END;    
-- del    
  
    PROCEDURE del (    
        p_id   IN entityevent.id%TYPE    
    )    
        IS    
    BEGIN    
        DELETE FROM entityevent WHERE    
            id = p_id;    
  
    END;    
  
END entityevent_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYINTERRUPTION_TAPI" IS  
    TYPE entityinterruption_tapi_rec IS RECORD ( status entityinterruption.status%TYPE,  
    fromtime entityinterruption.fromtime%TYPE,  
    fromdate entityinterruption.fromdate%TYPE,  
    todate entityinterruption.todate%TYPE,  
    owneruserid entityinterruption.owneruserid%TYPE,  
    id entityinterruption.id%TYPE,  
    interruptiontype entityinterruption.interruptiontype%TYPE,  
    totime entityinterruption.totime%TYPE );  
    TYPE entityinterruption_tapi_tab IS  
        TABLE OF entityinterruption_tapi_rec;  
  
-- insert  
    PROCEDURE ins (  
        p_status             IN entityinterruption.status%TYPE DEFAULT NULL,  
        p_fromtime           IN entityinterruption.fromtime%TYPE DEFAULT NULL,  
        p_fromdate           IN entityinterruption.fromdate%TYPE DEFAULT NULL,  
        p_todate             IN entityinterruption.todate%TYPE DEFAULT NULL,  
        p_owneruserid        IN entityinterruption.owneruserid%TYPE DEFAULT NULL,  
        p_id                 IN OUT entityinterruption.id%TYPE,  
        p_interruptiontype   IN entityinterruption.interruptiontype%TYPE DEFAULT NULL,  
        p_totime             IN entityinterruption.totime%TYPE DEFAULT NULL  
    );  
-- update  
  
    PROCEDURE upd (  
        p_status             IN entityinterruption.status%TYPE DEFAULT NULL,  
        p_fromtime           IN entityinterruption.fromtime%TYPE DEFAULT NULL,  
        p_fromdate           IN entityinterruption.fromdate%TYPE DEFAULT NULL,  
        p_todate             IN entityinterruption.todate%TYPE DEFAULT NULL,  
        p_owneruserid        IN entityinterruption.owneruserid%TYPE DEFAULT NULL,  
        p_id                 IN entityinterruption.id%TYPE,  
        p_interruptiontype   IN entityinterruption.interruptiontype%TYPE DEFAULT NULL,  
        p_totime             IN entityinterruption.totime%TYPE DEFAULT NULL  
    );  
-- delete  
  
    PROCEDURE del (  
        p_id   IN entityinterruption.id%TYPE  
    );  
  
END entityinterruption_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYINTERRUPTION_TAPI" IS  
-- insert  
  
    PROCEDURE ins (  
        p_status             IN entityinterruption.status%TYPE DEFAULT NULL,  
        p_fromtime           IN entityinterruption.fromtime%TYPE DEFAULT NULL,  
        p_fromdate           IN entityinterruption.fromdate%TYPE DEFAULT NULL,  
        p_todate             IN entityinterruption.todate%TYPE DEFAULT NULL,  
        p_owneruserid        IN entityinterruption.owneruserid%TYPE DEFAULT NULL,  
        p_id                 IN OUT entityinterruption.id%TYPE ,   
        p_interruptiontype   IN entityinterruption.interruptiontype%TYPE DEFAULT NULL,  
        p_totime             IN entityinterruption.totime%TYPE DEFAULT NULL  
    )   
        IS  
    BEGIN  
        select SEQENTITYINTERRUPTION.nextval  
        into p_id   
        from dual;  
        INSERT INTO entityinterruption (  
            status,  
            fromtime,  
            fromdate,  
            todate,  
            owneruserid,  
            id,  
            interruptiontype,  
            totime  
        ) VALUES (  
            p_status,  
            p_fromtime,  
            p_fromdate,  
            p_todate,  
            p_owneruserid,  
            p_id,  
            p_interruptiontype,  
            p_totime  
        );  
       return;  
    END;  
-- update  
  
    PROCEDURE upd (  
        p_status             IN entityinterruption.status%TYPE DEFAULT NULL,  
        p_fromtime           IN entityinterruption.fromtime%TYPE DEFAULT NULL,  
        p_fromdate           IN entityinterruption.fromdate%TYPE DEFAULT NULL,  
        p_todate             IN entityinterruption.todate%TYPE DEFAULT NULL,  
        p_owneruserid        IN entityinterruption.owneruserid%TYPE DEFAULT NULL,  
        p_id                 IN entityinterruption.id%TYPE,  
        p_interruptiontype   IN entityinterruption.interruptiontype%TYPE DEFAULT NULL,  
        p_totime             IN entityinterruption.totime%TYPE DEFAULT NULL  
    )  
        IS  
    BEGIN  
        UPDATE entityinterruption  
            SET  
                status = p_status,  
                fromtime = p_fromtime,  
                fromdate = p_fromdate,  
                todate = p_todate,  
                owneruserid = p_owneruserid,  
                interruptiontype = p_interruptiontype,  
                totime = p_totime  
        WHERE  
            id = p_id;  
  
    END;  
-- del  
  
    PROCEDURE del (  
        p_id   IN entityinterruption.id%TYPE  
    )  
        IS  
    BEGIN  
        DELETE FROM entityinterruption WHERE  
            id = p_id;  
  
    END;  
  
END entityinterruption_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYRESOURCES_TAPI" 
is  
  
type ENTITYRESOURCES_tapi_rec is record (  
OTBS  ENTITYRESOURCES.OTBS%type  
,ENTITYID  ENTITYRESOURCES.ENTITYID%type  
,VALUEDATE  ENTITYRESOURCES.VALUEDATE%type  
,DESCRIPTION  ENTITYRESOURCES.DESCRIPTION%type  
,PARENTRESOURCEID  ENTITYRESOURCES.PARENTRESOURCEID%type  
,ENTITYATTRIBUTEID  ENTITYRESOURCES.ENTITYATTRIBUTEID%type  
,ID  ENTITYRESOURCES.ID%type  
,VALUE  ENTITYRESOURCES.VALUE%type  
,ISREVERSAL  ENTITYRESOURCES.ISREVERSAL%type  
);  
type ENTITYRESOURCES_tapi_tab is table of ENTITYRESOURCES_tapi_rec;  
  
-- insert  
procedure ins (  
p_OTBS in ENTITYRESOURCES.OTBS%type default null   
,p_ENTITYID in ENTITYRESOURCES.ENTITYID%type  
,p_VALUEDATE in ENTITYRESOURCES.VALUEDATE%type default sysdate   
,p_DESCRIPTION in ENTITYRESOURCES.DESCRIPTION%type default null   
,p_PARENTRESOURCEID in ENTITYRESOURCES.PARENTRESOURCEID%type default null   
,p_ENTITYATTRIBUTEID in ENTITYRESOURCES.ENTITYATTRIBUTEID%type  
,p_ID in ENTITYRESOURCES.ID%type  
,p_VALUE in ENTITYRESOURCES.VALUE%type default null   
,p_ISREVERSAL in ENTITYRESOURCES.ISREVERSAL%type default null   
);  
-- update  
procedure upd (  
p_OTBS in ENTITYRESOURCES.OTBS%type default null   
,p_ENTITYID in ENTITYRESOURCES.ENTITYID%type  
,p_VALUEDATE in ENTITYRESOURCES.VALUEDATE%type default null   
,p_DESCRIPTION in ENTITYRESOURCES.DESCRIPTION%type default null   
,p_PARENTRESOURCEID in ENTITYRESOURCES.PARENTRESOURCEID%type default null   
,p_ENTITYATTRIBUTEID in ENTITYRESOURCES.ENTITYATTRIBUTEID%type  
,p_ID in ENTITYRESOURCES.ID%type  
,p_VALUE in ENTITYRESOURCES.VALUE%type default null   
,p_ISREVERSAL in ENTITYRESOURCES.ISREVERSAL%type default null   
);  
-- delete  
procedure del (  
p_ID in ENTITYRESOURCES.ID%type  
);  
  
FUNCTION getbalancebyentattr (  
        p_entityid NUMBER,  
        p_entattrid NUMBER  
    ) RETURN NUMBER;  
end ENTITYRESOURCES_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYRESOURCES_TAPI" AS  
  
    PROCEDURE ins (  
        p_otbs                IN entityresources.otbs%TYPE DEFAULT NULL,  
        p_entityid            IN entityresources.entityid%TYPE,  
        p_valuedate           IN entityresources.valuedate%TYPE DEFAULT  SYSDATE,  
        p_description         IN entityresources.description%TYPE DEFAULT NULL,  
        p_parentresourceid    IN entityresources.parentresourceid%TYPE DEFAULT NULL,  
        p_entityattributeid   IN entityresources.entityattributeid%TYPE,  
        p_id                  IN entityresources.id%TYPE,  
        p_value               IN entityresources.value%TYPE DEFAULT NULL,  
        p_isreversal          IN entityresources.isreversal%TYPE DEFAULT NULL  
    )  
        AS  
    BEGIN  
  
        INSERT INTO entityresources (  
            id,  
            entityid,  
            entityattributeid,  
            otbs,  
            value,  
            valuedate,  
            description,  
            isreversal,  
            parentresourceid  
        ) VALUES (  
            seqentresource.NEXTVAL,  
            p_entityid,  
            p_entityattributeid,  
            p_otbs,  
            p_value,  
            p_valuedate,  
            p_description,  
            p_isreversal,  
            p_parentresourceid  
        );  
  
    END ins;  
  
    PROCEDURE upd (  
        p_otbs                IN entityresources.otbs%TYPE DEFAULT NULL,  
        p_entityid            IN entityresources.entityid%TYPE,  
        p_valuedate           IN entityresources.valuedate%TYPE DEFAULT NULL,  
        p_description         IN entityresources.description%TYPE DEFAULT NULL,  
        p_parentresourceid    IN entityresources.parentresourceid%TYPE DEFAULT NULL,  
        p_entityattributeid   IN entityresources.entityattributeid%TYPE,  
        p_id                  IN entityresources.id%TYPE,  
        p_value               IN entityresources.value%TYPE DEFAULT NULL,  
        p_isreversal          IN entityresources.isreversal%TYPE DEFAULT NULL  
    )  
        AS  
    BEGIN  
    -- TODO: Implementation required for procedure ENTITYRESOURCES_TAPI.upd  
        NULL;  
    END upd;  
  
    PROCEDURE del (  
        p_id   IN entityresources.id%TYPE  
    )  
        AS  
    BEGIN  
    -- TODO: Implementation required for procedure ENTITYRESOURCES_TAPI.del  
        NULL;  
    END del;  
      
    FUNCTION GetBalanceByEntAttr(p_entityid NUMBER, p_entattrid NUMBER)  
     return number   
         
    is  
    hlp_out NUMBER;  
     begin  
       select sum(  
         et.value *   
         decode(otbs,1,1,2,-1,0)  -- 1 =Balance+, 2=Balance-    
       ) as balance  
       into hlp_out  
from entityresources et  
where et.entityid = p_entityid  
and   et.entityattributeid = p_entattrid  
group by et.entityattributeid;  
    return hlp_out;  
      
     end ;  
       
END entityresources_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYTYPEATTRLINK_TAPI" IS  
    TYPE entitytypeattrlink_tapi_rec IS RECORD ( entitytypedomainid entitytypeattrlink.entitytypedomainid%TYPE,  
    entityattrid entitytypeattrlink.entityattrid%TYPE,  
    entitytypeid entitytypeattrlink.entitytypeid%TYPE,  
    isstatistic entitytypeattrlink.isstatistic%TYPE,  
    required entitytypeattrlink.required%TYPE,  
    isresource entitytypeattrlink.isresource%TYPE );  
    TYPE entitytypeattrlink_tapi_tab IS  
        TABLE OF entitytypeattrlink_tapi_rec;   
  
-- insert  
    PROCEDURE ins (  
        p_entitytypedomainid   IN entitytypeattrlink.entitytypedomainid%TYPE DEFAULT NULL,  
        p_entityattrid         IN entitytypeattrlink.entityattrid%TYPE,  
        p_entitytypeid         IN entitytypeattrlink.entitytypeid%TYPE,  
        p_isstatistic          IN entitytypeattrlink.isstatistic%TYPE,  
        p_required             IN entitytypeattrlink.required%TYPE,  
        p_isresource           IN entitytypeattrlink.isresource%TYPE  
    );  
-- update  
  
    PROCEDURE upd (  
        p_id IN entitytypeattrlink.ID%TYPE,  
        p_entitytypedomainid   IN entitytypeattrlink.entitytypedomainid%TYPE DEFAULT NULL,  
        p_entityattrid         IN entitytypeattrlink.entityattrid%TYPE,  
        p_entitytypeid         IN entitytypeattrlink.entitytypeid%TYPE,  
        p_isstatistic          IN entitytypeattrlink.isstatistic%TYPE,  
        p_required             IN entitytypeattrlink.required%TYPE,  
        p_isresource           IN entitytypeattrlink.isresource%TYPE  
    );  
-- delete  
  
    PROCEDURE del (  
        p_entitytypeid   IN entitytypeattrlink.entitytypeid%TYPE,  
        p_entityattrid   IN entitytypeattrlink.entityattrid%TYPE  
    );  
  
    -- ???????? ??? ????????  ????????? ????????  
    FUNCTION GET_TYPE_RESOURCE(  
        p_entitytypeid   IN entitytypeattrlink.entitytypeid%TYPE,  
        p_entityattrid   IN entitytypeattrlink.entityattrid%TYPE   
    ) RETURN  entitytypeattrlink.isresource%TYPE;  
  
  
END entitytypeattrlink_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYTYPEATTRLINK_TAPI" AS  
  
    PROCEDURE ins (  
        p_entitytypedomainid   IN entitytypeattrlink.entitytypedomainid%TYPE DEFAULT NULL,  
        p_entityattrid         IN entitytypeattrlink.entityattrid%TYPE,  
        p_entitytypeid         IN entitytypeattrlink.entitytypeid%TYPE,  
        p_isstatistic          IN entitytypeattrlink.isstatistic%TYPE,  
        p_required             IN entitytypeattrlink.required%TYPE,  
        p_isresource           IN entitytypeattrlink.isresource%TYPE  
    )  
        AS  
    BEGIN  
        INSERT INTO entitytypeattrlink (  
            id,  
            entitytypedomainid,  
            entityattrid,  
            entitytypeid,  
            isstatistic,  
            required,  
            isresource  
        ) VALUES (  
            seqentityattrlinkid.NEXTVAL,  
            p_entitytypedomainid,  
            p_entityattrid,  
            p_entitytypeid,  
            p_isstatistic,  
            p_required,  
            p_isresource  
        );  
  
    END ins;  
  
    PROCEDURE upd (  
        p_id                   IN entitytypeattrlink.id%TYPE,  
        p_entitytypedomainid   IN entitytypeattrlink.entitytypedomainid%TYPE DEFAULT NULL,  
        p_entityattrid         IN entitytypeattrlink.entityattrid%TYPE,  
        p_entitytypeid         IN entitytypeattrlink.entitytypeid%TYPE,  
        p_isstatistic          IN entitytypeattrlink.isstatistic%TYPE,  
        p_required             IN entitytypeattrlink.required%TYPE,  
        p_isresource           IN entitytypeattrlink.isresource%TYPE  
    )  
        AS  
    BEGIN  
        UPDATE entitytypeattrlink  
            SET  
                entitytypedomainid = p_entitytypedomainid,  
                entityattrid = p_entityattrid,  
                entitytypeid = p_entitytypeid,  
                isstatistic = p_isstatistic,  
                required = p_required,  
                isresource = p_isresource  
        WHERE  
            id = p_id;  
  
    END upd;  
  
    PROCEDURE del (  
        p_entitytypeid   IN entitytypeattrlink.entitytypeid%TYPE,  
        p_entityattrid   IN entitytypeattrlink.entityattrid%TYPE  
    )  
        AS  
    BEGIN  
    -- TODO: Implementation required for PROCEDURE ENTITYTYPEATTRLINK_TAPI.del  
        NULL;  
    END del;  
  
    FUNCTION get_type_resource (  
        p_entitytypeid   IN entitytypeattrlink.entitytypeid%TYPE,  
        p_entityattrid   IN entitytypeattrlink.entityattrid%TYPE  
    ) RETURN entitytypeattrlink.isresource%TYPE IS  
        hlp_resourcetypeid   NUMBER;  
    BEGIN  
     begin  
        SELECT  
            el.isresource  
        INTO  
            hlp_resourcetypeid  
        FROM  
            entitytypeattrlink el  
        WHERE  
            el.entitytypeid = p_entitytypeid  
            AND   el.entityattrid = p_entityattrid;  
       exception  
         when no_data_found then   
           hlp_resourcetypeid:=0;  
       end;  
        RETURN hlp_resourcetypeid;  
    END;  
  
END entitytypeattrlink_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITYTYPE_TAPI" 
IS   
type ENTITYTYPE_tapi_rec   
IS   
  record   
  (   
    ENTITYCATEGORYID ENTITYTYPE.ENTITYCATEGORYID%type ,   
    DESCRIPTION ENTITYTYPE.DESCRIPTION%type ,    
    ID ENTITYTYPE.ID%type ,   
    NAME ENTITYTYPE.NAME%type );   
type ENTITYTYPE_tapi_tab   
IS   
  TABLE OF ENTITYTYPE_tapi_rec;   
  -- insert   
  PROCEDURE ins(   
      p_ENTITYCATEGORYID IN ENTITYTYPE.ENTITYCATEGORYID%type DEFAULT NULL ,   
      p_DESCRIPTION      IN ENTITYTYPE.DESCRIPTION%type DEFAULT NULL ,   
      p_ID               IN ENTITYTYPE.ID%type ,   
      p_NAME             IN ENTITYTYPE.NAME%type );   
  -- update   
  PROCEDURE upd(   
      p_ENTITYCATEGORYID IN ENTITYTYPE.ENTITYCATEGORYID%type DEFAULT NULL ,   
      p_DESCRIPTION      IN ENTITYTYPE.DESCRIPTION%type DEFAULT NULL ,   
      p_ID               IN ENTITYTYPE.ID%type ,   
      p_NAME             IN ENTITYTYPE.NAME%type );   
  -- delete   
  PROCEDURE del(   
      p_ID IN ENTITYTYPE.ID%type );   
        
      FUNCTION GetEntityTypeById(p_entitytypeid NUMBER) RETURN VARCHAR2;      
END ENTITYTYPE_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITYTYPE_TAPI" IS   
  -- insert   
   
    PROCEDURE ins (   
        p_entitycategoryid   IN entitytype.entitycategoryid%TYPE DEFAULT NULL,   
        p_description        IN entitytype.description%TYPE DEFAULT NULL,   
        p_id                 IN entitytype.id%TYPE,   
        p_name               IN entitytype.name%TYPE   
    )   
        IS   
    BEGIN   
        INSERT INTO entitytype (   
            entitycategoryid,   
            description,   
            id,   
            name   
        ) VALUES (    
            p_entitycategoryid,   
            p_description,   
            seqentitytype.NEXTVAL,   
            p_name   
        );   
  
    END;   
-- update   
  
    PROCEDURE upd (   
        p_entitycategoryid   IN entitytype.entitycategoryid%TYPE DEFAULT NULL,   
        p_description        IN entitytype.description%TYPE DEFAULT NULL,   
        p_id                 IN entitytype.id%TYPE,   
        p_name               IN entitytype.name%TYPE   
    )   
        IS   
    BEGIN   
        UPDATE entitytype   
            SET   
                entitycategoryid = p_entitycategoryid,   
                description = p_description,   
                name = p_name   
        WHERE   
            id = p_id;   
  
    END;   
-- del   
  
    PROCEDURE del (   
        p_id   IN entitytype.id%TYPE   
    )   
        IS   
    BEGIN   
        DELETE FROM entitytype WHERE   
            id = p_id;   
  
    END;   
  
FUNCTION GetEntityTypeById(p_entitytypeid NUMBER) RETURN VARCHAR2  
 IS   
    hlp_name VARCHAR2(255);  
 BEGIN    
   select name into hlp_name from entitytype e where e.id =  p_entitytypeid;  
   return hlp_name;  
 END;   
  
END entitytype_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "ENTITY_TAPI" 
IS    
type ENTITY_tapi_rec    
IS    
  record    
  (    
    ENTITYTYPEID ENTITY.ENTITYTYPEID%type ,    
    STABILITYID ENTITY.STABILITYID%type ,    
    ID ENTITY.ID%type ,    
    NAME ENTITY.NAME%type );    
type ENTITY_tapi_tab    
IS    
  TABLE OF ENTITY_tapi_rec;    
  -- insert    
  PROCEDURE ins(    
      p_ENTITYTYPEID IN ENTITY.ENTITYTYPEID%type ,    
      p_STABILITYID  IN ENTITY.STABILITYID%type DEFAULT NULL ,    
      p_ID           IN OUT ENTITY.ID%type ,    
      p_NAME         IN ENTITY.NAME%type DEFAULT NULL );    
  -- update    
  PROCEDURE upd(    
      p_ENTITYTYPEID IN ENTITY.ENTITYTYPEID%type ,    
      p_STABILITYID  IN ENTITY.STABILITYID%type DEFAULT NULL ,    
      p_ID           IN ENTITY.ID%type ,    
      p_NAME         IN ENTITY.NAME%type DEFAULT NULL );    
  -- delete    
  PROCEDURE del(    
      p_ID IN ENTITY.ID%type );    
  
  FUNCTION GET_ENTITYTYPEID (P_ENTITYID ENTITY.ID%type) return ENTITY.ENTITYTYPEID%type;  
  
END ENTITY_tapi;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "ENTITY_TAPI" IS    
  -- insert    
    
    PROCEDURE ins (    
        p_entitytypeid   IN entity.entitytypeid%TYPE,    
        p_stabilityid    IN entity.stabilityid%TYPE DEFAULT NULL,    
        p_id             IN OUT entity.id%TYPE,    
        p_name           IN entity.name%TYPE DEFAULT NULL    
    )    
        IS    
    BEGIN    
        INSERT INTO entity (    
            entitytypeid,    
            stabilityid,    
            id,    
            name    
        ) VALUES (    
            p_entitytypeid,    
            p_stabilityid,    
            seqentity.NEXTVAL,    
            p_name    
        )  
         RETURNING id INTO p_id;    
  
    END;    
-- update    
  
    PROCEDURE upd (    
        p_entitytypeid   IN entity.entitytypeid%TYPE,    
        p_stabilityid    IN entity.stabilityid%TYPE DEFAULT NULL,    
        p_id             IN entity.id%TYPE,    
        p_name           IN entity.name%TYPE DEFAULT NULL    
    )    
        IS    
    BEGIN    
        UPDATE entity    
            SET    
                entitytypeid = p_entitytypeid,    
                stabilityid = p_stabilityid,    
                name = p_name    
        WHERE    
            id = p_id;    
  
    END;    
-- del    
  
    PROCEDURE del (    
        p_id   IN entity.id%TYPE    
    )    
        IS    
    BEGIN    
        DELETE FROM entity WHERE    
            id = p_id;    
  
    END;    
  
  FUNCTION GET_ENTITYTYPEID (P_ENTITYID ENTITY.ID%type)   
  return ENTITY.ENTITYTYPEID%type  
  IS  
    hlp_ReturnValue ENTITY.ENTITYTYPEID%type;  
  BEGIN    
     begin  
      select e.ENTITYTYPEID  
      into hlp_ReturnValue  
      from entity e  
      where e.id = P_ENTITYID;  
    end;  
      return hlp_ReturnValue;  
  END;  
  
END entity_tapi;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "PACK_APEX_LDAP_AUTH" as  
  
  function ldap_auth(p_username in varchar2, p_password in varchar2) return boolean;  
  
end pack_apex_ldap_auth;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "PACK_APEX_LDAP_AUTH" is  
  
   
  
    FUNCTION ldap_auth(  
  
      p_username IN VARCHAR2,  
  
      p_password IN VARCHAR2  
  
    )  
  
    RETURN BOOLEAN IS  
  
      l_ldap_host     VARCHAR2(256) := 'ldap.fuib.com';  
  
      l_ldap_port     VARCHAR2(256) := '389';  
  
      l_ldap_base     VARCHAR2(256) := 'dc=fuib,dc=com'; --base DN можете уточнить у своих системных администраторов.  
  
      l_dn_prefix     VARCHAR2(100) := 'dho_domain\'; -- здесь указываем префикс домена. Т.е. пользователю будет достаточно указать только логин.  
  
  
  
      l_retval        PLS_INTEGER;  
  
      l_session       DBMS_LDAP.session;  
  
  
  
    BEGIN  
  
      -- Choose to raise exceptions.  
  
      DBMS_LDAP.use_exception := TRUE;  
  
  
  
      -- Connect to the LDAP server.  
  
      l_session := DBMS_LDAP.init(hostname => l_ldap_host,  
  
                                  portnum  => l_ldap_port);  
  
  
  
      l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,  
  
                                          dn     => l_dn_prefix || p_username,  
  
                                          passwd => p_password);  
  
  
  
      -- No exceptions mean you are authenticated.  
  
      RETURN TRUE;  
/*  
    EXCEPTION  
  
      WHEN OTHERS THEN  
  
        -- Exception means authentication failed.  
  
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);  
  
  
        APEX_UTIL.set_custom_auth_status(p_status => l_retval||'Incorrect username and/or password (or other reason)');  
  
        RETURN FALSE;  
*/  
  
    END ldap_auth;  
  
  
  
end pack_apex_ldap_auth;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "PKG_ENTITY" as     
   procedure EntityFindByName(p_name entity.name%TYPE, o_id out entity.id%TYPE);    
  
   procedure EntityTypeAdd(p_Name entitytype.name%TYPE,     
                           p_entitycategoryid entitytype.id%TYPE     
                           --,                           o_id OUT entitytype.id%TYPE    
                           );    
   /*procedure EntityType_FillAttributes(p_entitytypeid entitytype.id%TYPE,     
                                       p_list_id_attributes VARCHAR2,     
                                       p_list_id_required_attr VARCHAR2);    
   */    
   procedure EntityAdd(p_name entity.name%TYPE, p_entitytypeid entity.id%TYPE, o_id OUT entity.id%TYPE);    
  
   procedure EntityLinkAdd(p_entityid NUMBER, p_parententityid NUMBER, p_linktypeid NUMBER);    
  
  
   procedure EntitityTypeAttrAddLink(p_EntityTypeID NUMBER, p_EntAttrId NUMBER, p_required NUMBER DEFAULT 0);    
  
  
   procedure EntitityTypeAttrUnLink(p_EntityTypeID NUMBER, p_EntAttrId NUMBER);    
  
  
   procedure EntityEventAdd(p_ondate DATE, p_PARENTENTITYEVENTID NUMBER, p_changetypeid NUMBER, o_id OUT NUMBER);    
  
  
   procedure EntityEventAttrAdd(p_eventid NUMBER,     
                                p_entityid NUMBER,     
                                p_entityattrid NUMBER,     
                                p_value NUMBER ,     
                                p_isprocessed NUMBER DEFAULT 0);    
  
  
  
   PROCEDURE EntityAttributeAdd(    
                                p_name VARCHAR2,    
                                p_ENTITYTYPEDOMAINID ENTITYATTRIBUTE.ENTITYTYPEDOMAINID%TYPE,    
                                p_DESCRIPTION ENTITYATTRIBUTE.DESCRIPTION%TYPE,    
                                o_id OUT ENTITYATTRIBUTE.id%TYPE);    
  
  
  
  
  
end pkg_entity;  
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "PKG_ENTITY" AS    
    
    PROCEDURE entityfindbyname (    
        p_name   entity.name%TYPE,    
        o_id     OUT entity.id%TYPE    
    )    
        IS    
    BEGIN    
        BEGIN    
            SELECT    
                v.id    
            INTO    
                o_id    
            FROM    
                entity v    
            WHERE    
                upper(v.name) = upper(p_name);    
  
        EXCEPTION    
            WHEN no_data_found THEN    
                o_id := NULL;    
        END;    
  
        return;    
    END;    
  
    PROCEDURE entitytypeadd (    
        p_name               entitytype.name%TYPE,    
        p_entitycategoryid   entitytype.id%TYPE     
    --,    o_id OUT entitytype.id%TYPE    
    )    
        AS    
    BEGIN    
        INSERT INTO entitytype (    
            id,    
            name,    
            entitycategoryid    
        ) VALUES (    
            seqentitytype.NEXTVAL,    
            p_name,    
            p_entitycategoryid    
        )    
 /* RETURNING id    
  INTO o_id*/;    
  
        return;    
    END entitytypeadd;    
  
    PROCEDURE entityadd (    
        p_name           entity.name%TYPE,    
        p_entitytypeid   entity.id%TYPE,    
        o_id             OUT entity.id%TYPE    
    )    
        AS    
          hlp_entityid NUMBER;  
    BEGIN    
        entity_tapi.ins(p_entitytypeid => p_entitytypeid,p_stabilityid => NULL,p_id => hlp_entityid,p_name => p_name);    
  
        entityfindbyname(p_name => entityadd.p_name,o_id => entityadd.o_id);    
        return;    
    END entityadd;    
  
    PROCEDURE entitylinkadd (    
        p_entityid         NUMBER,    
        p_parententityid   NUMBER,    
        p_linktypeid       NUMBER    
    )    
        AS    
    BEGIN    
        INSERT INTO entitylink (    
            entityid,    
            parentid,    
            entitylinktype    
        ) VALUES (    
            p_entityid,    
            p_parententityid,    
            p_linktypeid    
        );    
  
    END;    
  
    PROCEDURE entititytypeattraddlink (    
        p_entitytypeid   NUMBER,    
        p_entattrid      NUMBER,    
        p_required       NUMBER DEFAULT 0    
    )    
        AS    
    BEGIN    
        INSERT INTO entitytypeattrlink (    
            entitytypeid,    
            entityattrid,    
            required    
        ) VALUES (    
            p_entitytypeid,    
            p_entattrid,    
            p_required    
        );    
  
    END;    
  
    PROCEDURE entititytypeattrunlink (    
        p_entitytypeid NUMBER,    
        p_entattrid NUMBER    
    ) AS    
        hlp_cnt   NUMBER;    
    BEGIN    
  -- ????? ?????????????? ??? ? ?????? ???????? ??? ???????????? ???????? ?? ???????? ?????????    
        SELECT    
            COUNT(1)    
        INTO    
            hlp_cnt    
        FROM    
            entityattrvalue ev,    
            entity et    
        WHERE    
            et.entitytypeid = et.id    
            AND   et.entitytypeid = p_entitytypeid    
            AND   ev.entityattrid = p_entattrid;    
  
        IF    
            hlp_cnt = 0    
        THEN    
            DELETE FROM entitytypeattrlink    
            WHERE    
                entitytypeid = p_entitytypeid    
                AND   entityattrid = p_entattrid;    
  
        ELSE    
            NULL;--raise_error('Fault');    
        END IF;    
  
    END;    
  
    PROCEDURE entityeventadd (    
        p_ondate                DATE,    
        p_parententityeventid   NUMBER,    
        p_changetypeid          NUMBER,    
        o_id                    OUT NUMBER    
    )    
        IS    
    BEGIN    
        INSERT INTO entityevent (    
            id,    
            ondate,    
            parententityeventid,    
            changetypeid    
        ) VALUES (    
            seqentityevent.NEXTVAL,    
            p_ondate,    
            p_parententityeventid,    
            p_changetypeid    
        ) RETURNING id INTO o_id;    
  
        return;    
    END;    
  
    PROCEDURE entityeventattradd (    
        p_eventid        NUMBER,    
        p_entityid       NUMBER,    
        p_entityattrid   NUMBER,    
        p_value          NUMBER,    
        p_isprocessed    NUMBER DEFAULT 0    
    )    
        IS    
    BEGIN    
        INSERT INTO entityeventattribute (    
            entityeventid,    
            entityid,    
            entityattrid,    
            value,    
            isprocessed    
        ) VALUES (    
            p_eventid,    
            p_entityid,    
            p_entityattrid,    
            p_value,    
            p_isprocessed    
        );    
  
    END;    
  
    PROCEDURE entityattributeadd (    
        p_name                 VARCHAR2,    
        p_entitytypedomainid   entityattribute.entitytypedomainid%TYPE,    
        p_description          entityattribute.description%TYPE,    
        o_id                   OUT entityattribute.id%TYPE    
    )    
        IS    
    BEGIN    
        INSERT INTO entityattribute (    
            id,    
            name,    
            entitytypedomainid,    
            description    
        ) VALUES (    
            seqentitytype.NEXTVAL,    
            p_name,    
            p_entitytypedomainid,    
            p_description    
        ) RETURNING id INTO o_id;    
  
    END;    
  
END pkg_entity;  
/

CREATE OR REPLACE EDITIONABLE PACKAGE  "PKG_ENTITYTYPEATTRLINK_API" 
IS    
type ENTITYTYPEATTRLINK_tapi_rec    
IS    
  record    
  (    
    ENTITYATTRID ENTITYTYPEATTRLINK.ENTITYATTRID%type ,    
    ENTITYTYPEID ENTITYTYPEATTRLINK.ENTITYTYPEID%type ,    
    ISSTATISTIC ENTITYTYPEATTRLINK.ISSTATISTIC%type ,    
    REQUIRED ENTITYTYPEATTRLINK.REQUIRED%type ,    
    ISRESOURCE ENTITYTYPEATTRLINK.ISRESOURCE%type );    
type ENTITYTYPEATTRLINK_tapi_tab    
IS    
  TABLE OF ENTITYTYPEATTRLINK_tapi_rec;    
  -- insert    
  PROCEDURE ins(    
      p_ENTITYATTRID IN ENTITYTYPEATTRLINK.ENTITYATTRID%type DEFAULT NULL ,    
      p_ENTITYTYPEID IN ENTITYTYPEATTRLINK.ENTITYTYPEID%type DEFAULT NULL ,    
      p_ISSTATISTIC  IN ENTITYTYPEATTRLINK.ISSTATISTIC%type ,    
      p_REQUIRED     IN ENTITYTYPEATTRLINK.REQUIRED%type DEFAULT NULL ,    
      p_ISRESOURCE   IN ENTITYTYPEATTRLINK.ISRESOURCE%type,   
      p_entitytypedomainid IN  ENTITYTYPEATTRLINK.entitytypedomainid%TYPE  );    
  -- update    
  PROCEDURE upd(    
      p_ENTITYATTRID IN ENTITYTYPEATTRLINK.ENTITYATTRID%type DEFAULT NULL ,    
      p_ENTITYTYPEID IN ENTITYTYPEATTRLINK.ENTITYTYPEID%type DEFAULT NULL ,    
      p_ISSTATISTIC  IN ENTITYTYPEATTRLINK.ISSTATISTIC%type ,    
      p_REQUIRED     IN ENTITYTYPEATTRLINK.REQUIRED%type DEFAULT NULL ,    
      p_ISRESOURCE   IN ENTITYTYPEATTRLINK.ISRESOURCE%type,   
      p_entitytypedomainid IN  ENTITYTYPEATTRLINK.entitytypedomainid%TYPE);    
  -- delete    
  PROCEDURE del(    
      p_ENTITYTYPEID IN ENTITYTYPEATTRLINK.ENTITYTYPEID%type ,    
      p_ENTITYATTRID IN ENTITYTYPEATTRLINK.ENTITYATTRID%type );    
END PKG_ENTITYTYPEATTRLINK_api;  
/
 CREATE SEQUENCE   "SEQENTITYATTRIBUTE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 30 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SEQENTITY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 34 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SEQENTITYATTRLINKID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SEQENTITYTYPE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 71 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SEQUENTITYLINKTYPE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITY" ("ENTITYID", "ENTITYNAME", "ENTITYTYPEID", "ENTITYTYPENAME") AS 
  select ent.ID as entityid,    
       ent.NAME as entityname,    
       ent.ENTITYTYPEID ,    
       enttype.NAME as ENTITYTYPENAME    
from entity ent,    
     entitytype enttype    
where ent.entitytypeid = enttype.id
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYATTRIBUTEDOMAIN" ("ID", "NAME", "ATTRTYPE", "ENTITYTYPEDOMAINID") AS 
  SELECT ID,     
       NAME,     
       ATTRTYPE,     
       ENTITYTYPEDOMAINID     
FROM ENTITYATTRIBUTE attr    
where nvl(attr.ENTITYTYPEDOMAINID,0) <> 0
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYATTRIBUTES" ("ID", "NAME", "ATTRTYPE", "ENTITYTYPEDOMAINID", "DESCRIPTION") AS 
  SELECT ID,    
  NAME,    
  ATTRTYPE,    
  ENTITYTYPEDOMAINID,    
  DESCRIPTION    
FROM ENTITYATTRIBUTE
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYATTRIBUTEVALUES_ALL" ("ENTITYID", "ENTITYNAME", "ENTITYTYPEID", "ENTITYTYPENAME", "ENTATTRID", "ENTATTRNAME", "ENTITYTYPEDOMAINID", "VALUE", "DOMAINATTRVALUEID", "UNDEFINEDVALUE") AS 
  SELECT   
    ent."ENTITYID",   
    ent."ENTITYNAME",   
    ent."ENTITYTYPEID",   
    ent."ENTITYTYPENAME",   
    attr.entattrid,   
    attr.entattrname,   
    attr.entitytypedomainid,   
    --attrvalue.value,   
    decode(nvl(attr.isresource,0),0,attrvalue.value,   
        abs(ENTITYRESOURCES_TAPI.GetBalanceByEntAttr(p_entityid => ent.entityid , p_entattrid => entattrid ))  
    ) as value,  
      
    attrvalue.domainattrvalueid,  
    nvl(attrvalue.entityid, -1) as undefinedvalue  
FROM   
    v_entity ent   
    JOIN v_entitytypeattributes attr ON ( ent.entitytypeid = attr.entitytypeid )   
    LEFT JOIN entityattrvalue attrvalue ON ( attrvalue.entityid = ent.entityid   
                                              AND attrvalue.entityattrid = attr.entattrid )
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYCATEGORY" ("ID", "NAME", "PARENTCATEGORYID") AS 
  SELECT ID, NAME, PARENTCATEGORYID FROM ENTITYCATEGORY
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYEVENT" ("ID", "ONDATE", "ONTIME", "PARENTENTITYEVENTID", "ONCHANGE", "CHANGETYPEID", "REASON", "CHANGESTATUS") AS 
  select "ID","ONDATE","ONTIME","PARENTENTITYEVENTID","ONCHANGE","CHANGETYPEID", "REASON", "CHANGESTATUS" from entityevent
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYEVENTATTRIBUTE" ("ENTITYEVENTID", "ENTITYID", "ENTITYATTRID", "VALUE", "ISPROCESSED") AS 
  SELECT ENTITYEVENTID,    
  ENTITYID,    
  ENTITYATTRID,    
  VALUE,    
  ISPROCESSED    
FROM ENTITYEVENTATTRIBUTE
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYTYPE" ("ID", "NAME", "ENTITYCATEGORYID", "ENTITYCATEGORYNAME", "DESCRIPTION") AS 
  SELECT et.ID, et.NAME, et.ENTITYCATEGORYID, ec.NAME as ENTITYCATEGORYNAME, DESCRIPTION    
FROM ENTITYTYPE et     
     left join ENTITYCATEGORY ec on (ec.id = et.ENTITYCATEGORYID)  
--------------------------------------------------------
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITYTYPEATTRIBUTES" ("ENTLINKID", "ENTITYTYPEID", "ENTITYTYPENAME", "ENTATTRID", "ENTATTRNAME", "ENTITYTYPEDOMAINID", "REQUIRED", "ISRESOURCE", "ISSTATISTIC", "ID") AS 
  select  entattrlink.id as entlinkid,  
        enttype.id as entitytypeid,    
        enttype.name as entitytypename,      
        entattr.id as   entattrid,    
        entattr.name as entattrname,    
        entattr.entitytypedomainid,    
        entattrlink.required,    
        entattrlink.ISRESOURCE,    
        entattrlink.ISSTATISTIC,  
        entattrlink.id    
     
from    entitytype enttype,    
        ENTITYTYPEATTRLINK   entattrlink,    
        ENTITYATTRIBUTE entattr    
where   entattrlink.ENTITYTYPEID = enttype.id         
    and entattr.id=entattrlink.ENTITYATTRID
/
CREATE OR REPLACE FORCE EDITIONABLE VIEW  "V_ENTITY_EXT_ATTR_VALUES" ("UNIQUEID", "ENTITYTYPEID", "ENTITYID", "ATTRIBUTEID", "NAME", "VALUE", "DOMAINATTRVALUEID", "STABILITYID") AS 
  select      
        enttype.rowid||ent.rowid||eav.rowid||attr.rowid||attrl.rowid uniqueid,    
        enttype.ID as entitytypeid,    
        ent.id as entityid,    
        attr.id as attributeid,    
        attr.name,    
        eav.VALUE,    
        eav.DOMAINATTRVALUEID,    
        eav.STABILITYID    
from  entitytype enttype    
      join entitytypeattrlink attrl on (attrl.entitytypeid = enttype.id)    
      join entityattribute attr on (attr.id = attrl.ENTITYATTRID)     
      join ENTITY ent on (ent.entitytypeid = enttype.ID)      
      left join ENTITYATTRVALUE eav on (eav.ENTITYID = ent.id and eav.ENTITYATTRID = attrl.ENTITYATTRID)
/
