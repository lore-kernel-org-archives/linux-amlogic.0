From: alexandre.belloni@free-electrons.com (Alexandre Belloni)
Date: Tue, 12 Jul 2016 19:37:53 +0200
Subject: [PATCH v3 1/4] rtc: support for amlogic meson rtc
In-Reply-To: <4d98df06-cf00-b4fd-dfb5-1ac5d9c548fc@codethink.co.uk>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-3-git-send-email-ben.dooks@codethink.co.uk>
 <20160712172235.GU22202@piout.net>
 <4d98df06-cf00-b4fd-dfb5-1ac5d9c548fc@codethink.co.uk>
Message-ID: <20160712173753.GW22202@piout.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 12/07/2016 at 18:27:12 +0100, Ben Dooks wrote :
> On 12/07/16 18:22, Alexandre Belloni wrote:
> > Hi,
> > 
> > Very few comments below
> > 
> > On 05/07/2016 at 20:48:41 +0100, Ben Dooks wrote :
> >> +/* registers accessed from cpu bus */
> >> +#define RTC_REG(x)		((x) * 4)	/* rtc registers 0-4 */
> >> +
> >> +#define LINE_SDI		(1 << 2)
> >> +#define LINE_SEN		(1 << 1)
> >> +#define LINE_SCLK		(1 << 0)
> > 
> > Maybe use BIT() here.
> 
> I'll sort that out later.
> 
> >> +/* RTC interface layer functions */
> >> +
> >> +static int meson_rtc_gettime(struct device *dev, struct rtc_time *tm)
> >> +{
> >> +	struct meson_rtc *rtc = dev_get_drvdata(dev);
> >> +	int ret;
> >> +	u32 time;
> >> +
> >> +	mutex_lock(&rtc->lock);
> >> +
> >> +	ret = meson_rtc_read(rtc, RTC_COUNTER, &time);
> >> +	if (!ret) {
> >> +		rtc_time_to_tm(time, tm);
> > 
> > Can you use the 64bit version?
> 
> What would the 64bit version gain? The hardware register is 32bit.
> 

Well, at some point, I'll remove the 32bit version:
http://lxr.free-electrons.com/source/include/linux/rtc.h#L36

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
