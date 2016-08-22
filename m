From: ben-linux@fluff.org (Ben Dooks)
Date: Mon, 22 Aug 2016 23:15:01 +0100
Subject: [PATCH 5/5] rtc: warn if rtc_tm_to_time64 overflows in rtc_tm_to_time
In-Reply-To: <20160822221501.21945-1-ben-linux@fluff.org>
References: <20160822221501.21945-1-ben-linux@fluff.org>
Message-ID: <20160822221501.21945-6-ben-linux@fluff.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The addition of the compatibility layer for rtc_tm_to_time()
to bridge the move to rtc_tm_to_time64() does not check if
the value will overflow the old call's use of unsigned long
to restore the result.

This means that if the result is bigger than the arch's
use of unsigned long then the result will be silently
truncated to whatever the maximum value of the unsigned
long. Since the call does not have an option of returning
an error, at least have an WARN_ON() to show if the value
is out of range.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 include/linux/rtc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index b693ada..ef7bb2c 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -45,7 +45,10 @@ static inline void rtc_time_to_tm(unsigned long time, struct rtc_time *tm)
  */
 static inline int rtc_tm_to_time(struct rtc_time *tm, unsigned long *time)
 {
-	*time = rtc_tm_to_time64(tm);
+	time64_t tt = rtc_tm_to_time64(tm);
+
+	WARN_ON(tt > ~(0UL));
+	*time = tt;
 
 	return 0;
 }
-- 
2.9.3
