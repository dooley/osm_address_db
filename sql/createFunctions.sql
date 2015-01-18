-- ignore NOTICE
SET client_min_messages TO WARNING;

-- create functions for analyse relations

-- returns the value for the given key or NULL
CREATE OR REPLACE FUNCTION getValueOf(text, text[])
RETURNS text AS
$BODY$
    DECLARE

    BEGIN
        IF array_upper($2,1)<2 THEN
            Return NULL;
        END IF;
        FOR i IN 1..(array_upper($2,1)) LOOP
            
                IF ($2[i]=$1) THEN
                    Return $2[i+1];
                END IF;
                i:=i+1;              
            
        END LOOP;
        RETURN NULL;
    END;
$BODY$
LANGUAGE plpgsql;

-- returns all elements of a specific role and type (role, type(way, polygon, point), member)
CREATE OR REPLACE FUNCTION getMembersRoleType(text, text, text[])
RETURNS bigint[] AS
$BODY$
    DECLARE
	result bigint[];
    BEGIN
        IF array_upper($3,1)<2 THEN
            Return NULL;
        END IF;
        FOR i IN 1..(array_upper($3,1)) LOOP
            
                IF ($3[i+1]=$1) THEN
			IF ((substring($3[i] for 1)='n' AND $2='point') OR 
				(substring($3[i] for 1)='w' AND ($2='polygon' OR $2='way'))) THEN
				result = array_append(result, substring($3[i] from 2)::bigint);
			ELSIF (substring($3[i] for 1)='r' AND $2='polygon') THEN
				result = array_append(result, substring($3[i] from 2)::bigint*-1);
			END IF;
                END IF;
                i:=i+1;              
            
        END LOOP;
        IF array_upper(result,1)<1 THEN
		RETURN NULL;
	ELSE
		RETURN result;
	END IF;
    END;
$BODY$
LANGUAGE plpgsql;

-- returns first element of a specific role and type (role, type(way, polygon, point), member)
CREATE OR REPLACE FUNCTION getMemberRoleType(text, text, text[])
RETURNS bigint AS
$BODY$
    DECLARE
	
    BEGIN
        IF array_upper($3,1)<2 THEN
            Return NULL;
        END IF;
        FOR i IN 1..(array_upper($3,1)) LOOP
            
                IF ($3[i+1]=$1) THEN
			IF ((substring($3[i] for 1)='n' AND $2='point') OR 
				(substring($3[i] for 1)='w' AND ($2='polygon' OR $2='way'))) THEN
				RETURN substring($3[i] from 2)::bigint;
			ELSIF (substring($3[i] for 1)='r' AND $2='polygon') THEN
				RETURN substring($3[i] from 2)::bigint*-1;
			END IF;
                END IF;
                i:=i+1; 
            
        END LOOP;
	RETURN NULL;
    END;
$BODY$
LANGUAGE plpgsql;