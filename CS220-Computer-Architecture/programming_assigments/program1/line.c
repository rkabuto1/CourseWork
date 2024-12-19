#include "line.h"
#include <stdlib.h> // For malloc and free
#include <stdio.h> // For sprintf
//-----------------------------------------------------------------------------------------------------------------------
	struct line_struct 
	{
	// Specify all the fields required to make a line
	float slope;
	float y_intercept;
	};
//-----------------------------------------------------------------------------------------------------------------------
	line line_create(float slope,float y_intercept) 
	{
	// Replace this with code to create a new line "object" and return a pointer to that object
	// The returned line should have a slope and y_intercept, as specified in the arguments.
    	line line1 = malloc(sizeof(struct line_struct));
    	if (line1 != NULL) 
    		{
        	line1->slope = slope;
        	line1->y_intercept = y_intercept;
    		}
    	return line1;
	}
//-----------------------------------------------------------------------------------------------------------------------	
	line line_from_coords(coord from, coord to) 
	// Replace this with code to create a new line "object" and return a pointer to that object
	// The returned line should go through both the from and to coordinates specified in the argument
	// Return NULL if both from and to have the same x coordinate (which would make the slope infinity)
	{	
    	if (coord_getx(from) == coord_getx(to)) 
    		{
        		return NULL; 
    		}
    	
    	float slope = (coord_gety(to) - coord_gety(from)) / (coord_getx(to) - coord_getx(from));
    	float y_intercept = coord_gety(from) - slope * coord_getx(from);
    	
    	line line2 = malloc(sizeof(struct line_struct));
    	if (line2 != NULL) 
    		{
        	line2->slope = slope;
        	line2->y_intercept = y_intercept;
    		}
    	return line2;
	}
//-----------------------------------------------------------------------------------------------------------------------
	coord line_intersect(line l1,line l2) 
	// Replace with code to return a new coordinate where lines l1 and l2 intersect
	// Return NULL if lines l1 and l2 have the same slope. They are parallel and never intersect
	{
	
    	if (l1->slope == l2->slope) 
    		{
        		return NULL; 
    		}   	
    	float interceptofx = (l2->y_intercept - l1->y_intercept) / (l1->slope - l2->slope);    
    	float interceptofy = l1->slope * interceptofx + l1->y_intercept;  	
    	coord z = coord_create(interceptofx, interceptofy);
    	return z;
	}	
//-----------------------------------------------------------------------------------------------------------------------	
	char * line_format(line ln)
	// Replace with code to return the pointer to a string that contains the formatted description of a line.
	// If ln is NULL, return "NULL"
	// The result should be in the form: "y = <m>x + <b>", 
	// where <m> and <b> are replaced by the floating point representation (%f)
	// of the slope and y-intercept of the line.
	// You may use a static char buffer (see coord_format for an example) to hold the
	// result, based on the assumption that the result will be used before line_format is called again. 
	{	
    	if (ln == NULL) 
    	  {
        	return "NULL";
    	  }   	
    	static char buf[60];     	
    	snprintf(buf, sizeof(buf), "y = %fx + %f", ln->slope, ln->y_intercept);
    	return buf;
	}
//-----------------------------------------------------------------------------------------------------------------------	
	void line_delete(line ln) 
	// Add code to free any memory consumed by the ln line "object"
	{
	 	if(ln!= NULL) 
	 	free(ln);
	}


