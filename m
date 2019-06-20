Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE7CC4646B
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677C12070B
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7LYdrFn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G1zhdoz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677C12070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ4qQehPC9h2zSRUUZtHviw5EYrHk05JYKXaH1REGao=; b=L7LYdrFnNg8PZ5
	rZhUC0VINcj5/DuVVxpNhUJDevs9e0LIAmWEliam8Rw5jocWTqnTDEsP6acP2ot6sBojrUi32hVzJ
	5xZbHvX2Y+nLNQgRxWK6308+NNa4KyCN9t2cTPCRVToo5iICq8GJhVfTwfBcn69r4kDwo43AkpBJ6
	v+aXoA3qysMCGb9ta/EwCVrP80bikLBqIgRLEU4+/BLP9ERPFom+UdHIZ4FyiIVmACJOEYnfyn9Zo
	iG19nJd1wgouot1eu1QNQVeWo18OLSjnM6LlOGzU55kX6hFv5vj7EhHD2aXoupzbITMOu8s2iUY/k
	qk6CZN4bhtcRszTzEMnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he4Rk-0003mP-Vn; Thu, 20 Jun 2019 21:18:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4Rj-0003m5-Mg; Thu, 20 Jun 2019 21:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CgfSr6OXpUyqvm3UTW7jbZ0Gfdfs29YwkHCNmm8OMhA=; b=G1zhdoz2AQEleJNPzDZEUV9+4
 qTqFFBkO/XhhIcIKKxUaYDW3QnPt+1YtHlXtMEG9L50lx3SgzemvB/wejqkuWoogzz7IbWwMUh6RF
 ABspNvjxA9cL6kBlx0c8OfIL/v7jArqdNkQqIhJMZjvUl4RUz3aDeDObSbcKLeVJ3g1Usv/V8sHrp
 cm03WqevHZfgFVPT58O9QkzqWGxp3CHGQOcf/mEqLU/4XuA4MeLHmHM7mVaaZ9tWxzVuGk5fYfvA/
 UterMgq0v3mKYQipBk+39N/J67Om3LVpGC9XwjLoG2KRtkcOw6cw65U/cG1ooopq+F9pzXmjBuPWx
 hdWQNvRQw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4Rh-000676-7Y; Thu, 20 Jun 2019 21:18:15 +0000
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr
 [90.65.161.137])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D39F9C0003;
 Thu, 20 Jun 2019 21:17:36 +0000 (UTC)
Date: Thu, 20 Jun 2019 23:17:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 2/2] rtc: Add Amlogic Virtual Wake RTC
Message-ID: <20190620211736.GF23549@piout.net>
References: <20190607194343.18359-1-khilman@kernel.org>
 <20190607194343.18359-2-khilman@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607194343.18359-2-khilman@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_221813_346607_76606D0A 
X-CRM114-Status: GOOD (  17.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Kevin,

On 07/06/2019 12:43:43-0700, Kevin Hilman wrote:
> +static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned long local_time;
> +	struct timespec64 time;
> +
> +	ktime_get_raw_ts64(&time);
> +	local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
The RTC is supposed to be set to UTC so the TZ adjustment is not
necessary.

> +	rtc_time_to_tm(local_time, tm);
> +

Please use the 64 bit version.

> +	return 0;
> +}
> +
> +static void meson_vrtc_set_wakeup_time(struct meson_vrtc_data *vrtc,
> +				       unsigned long time)
> +{
> +	writel_relaxed(time, vrtc->io_alarm);
> +
> +	dev_dbg(&vrtc->pdev->dev, "set_wakeup_time: %lu\n", time);
> +}
> +
> +static int meson_vrtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
> +	struct timespec64 time;
> +	unsigned long local_time;
> +	unsigned long alarm_secs;
> +	int ret;
> +
> +	if (alarm->enabled) {
> +		ret = rtc_tm_to_time(&alarm->time, &alarm_secs);
> +		if (ret)
> +			return ret;
> +

Use the 64bit version which makes it clear that it never fails (checking
ret is useless).

> +		ktime_get_raw_ts64(&time);
> +		local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
> +
> +		vrtc->alarm_time = alarm_secs;
> +
> +		if (alarm_secs >= local_time) {

This is already ensured by the core so no need to check here.

> +			alarm_secs = alarm_secs - local_time;
> +
> +			meson_vrtc_set_wakeup_time(vrtc, alarm_secs);
> +
> +			pr_debug("system will wakeup %lus later\n", alarm_secs);
> +		}
> +	} else {
> +		vrtc->alarm_time = 0;
> +		meson_vrtc_set_wakeup_time(vrtc, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int meson_vrtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
> +
> +	if (!vrtc->alarm_time) {

I think this test is inverted.

> +		alm->enabled = true;
> +
> +		rtc_time_to_tm(vrtc->alarm_time, &alm->time);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops meson_vrtc_ops = {
> +	.read_time = meson_vrtc_read_time,
> +	.set_alarm = meson_vrtc_set_alarm,
> +	.read_alarm = meson_vrtc_read_alarm,
> +};
> +
> +static int meson_vrtc_probe(struct platform_device *pdev)
> +{
> +	struct meson_vrtc_data *vrtc;
> +	struct resource *res;
> +
> +	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
> +	if (!vrtc)
> +		return -ENOMEM;
> +
> +	vrtc->pdev = pdev;
> +
> +	/* Alarm registers */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	vrtc->io_alarm = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(vrtc->io_alarm))
> +		return PTR_ERR(vrtc->io_alarm);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	platform_set_drvdata(pdev, vrtc);
> +
> +	vrtc->rtc = devm_rtc_device_register(&pdev->dev, "meson-vrtc",
> +					     &meson_vrtc_ops, THIS_MODULE);
> +	if (IS_ERR(vrtc->rtc))
> +		return PTR_ERR(vrtc->rtc);
> +

Please use devm_rtc_allocate_device and rtc_register_device. This
doesn't help much but my plan is to get rid of devm_rtc_device_register.

I suppose you don't get any interrupt for the alarm?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
