#include <Arduino.h>
#include <stdint.h>

#include "Format16x2String.h"



const String Format16x2String::pad("        ");

Format16x2String::Format16x2String(uint32_t v1, uint32_t v2) : String(String(v1) + pad.substring(String(v1).length()) + v2 + pad.substring(String(v2).length()))
{
}

Format16x2String::Format16x2String(double v1, uint32_t v2) : String(String(v1,1) + pad.substring(String(v1,1).length()) + v2 + pad.substring(String(v2).length()))
{
}

Format16x2String::Format16x2String(uint32_t v1, double v2) : String(String(v1) + pad.substring(String(v1).length()) + String(v2,1) + pad.substring(String(v2,1).length()))
{ 
}


Format16x2String::Format16x2String(double v1, double v2) :String(String(v1, 1) + pad.substring(String(v1,1).length()) + String(v2,1) + pad.substring(String(v2,1).length()))
{ 
}

Format16x2String::Format16x2String(const String &v1, const String &v2) : String(v1 + pad.substring(v1.length()) + v2 + pad.substring(v2.length()))
{  
}

Format16x2String::Format16x2String(uint32_t v1) : String(String(v1) + pad.substring(String(v1).length()))
{
}

Format16x2String::Format16x2String(double v1) : String(String(v1,1) + pad.substring(String(v1,1).length()))
{
}

Format16x2String::Format16x2String(const String &v1) : String(v1 + pad.substring(v1.length()))
{
}




