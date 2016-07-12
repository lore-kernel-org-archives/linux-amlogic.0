From: alexandre.belloni@free-electrons.com (Alexandre Belloni)
Date: Tue, 12 Jul 2016 19:22:35 +0200
Subject: [PATCH v3 1/4] rtc: support for amlogic meson rtc
In-Reply-To: <1467748122-14833-3-git-send-email-ben.dooks@codethink.co.uk>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-3-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <20160712172235.GU22202@piout.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Very few comments below

On 05/07/2016 at 20:48:41 +0100, Ben Dooks wrote :
> +/* registers accessed from cpu bus */
> +#define RTC_REG(x)		((x) * 4)	/* rtc registers 0-4 */
> +
> +#define LINE_SDI		(1 << 2)
> +#define LINE_SEN		(1 << 1)
> +#define LINE_SCLK		(1 << 0)
> +

Maybe use BIT() here.

> +/* RTC interface layer functions */
> +
> +static int meson_rtc_gettime(struct device *dev, struct rtc_time *tm)
> +{
> +	struct meson_rtc *rtc = dev_get_drvdata(dev);
> +	int ret;
> +	u32 time;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	ret = meson_rtc_read(rtc, RTC_COUNTER, &time);
> +	if (!ret) {
> +		rtc_time_to_tm(time, tm);

Can you use the 64bit version?

> +		dev_dbg(dev, "read time %lu\n", (unsigned long)time);
> +	}
> +
> +	mutex_unlock(&rtc->lock);
> +	return ret;
> +}
> +
> +static int meson_rtc_settime(struct device *dev, struct rtc_time *tm)
> +{
> +	struct meson_rtc *rtc = dev_get_drvdata(dev);
> +	unsigned long time;
> +	int ret;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	rtc_tm_to_time(tm, &time);

Ditto.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
