#ifndef __FORMAT16X2STRING_H__
#define __FORMAT16X2STRING_H__


class Format16x2String : public String {

private:
  static const String pad;

public:
  Format16x2String(uint32_t v1, uint32_t v2);
  Format16x2String(double v1, uint32_t v2);
  Format16x2String(uint32_t v1, double v2);
  Format16x2String(double v1, double v2);
  Format16x2String(const String &v1, const String &v2);
  Format16x2String(uint32_t v1);
  Format16x2String(double v1);
  Format16x2String(const String &v1);

};

#endif

