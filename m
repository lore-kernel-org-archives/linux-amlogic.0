Return-Path: <SRS0=gjj1=XY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6868C352A9
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 16:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFC721835
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 16:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLIdXPKe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="im7vmOen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AFC721835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ucr.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AW93CwDnqwaReMgt+RfFOubFexf08tyijELI6eq7rJc=; b=NLIdXPKedw4Jbz
	YPWx73xm6aB9sk34DmkN9bNnTxdNpJgLqjbScePd1ydYdizeysLp68nCF6QO/ZJCvMpDIXxNpXGIt
	zW/JIYOAuZj1rYaBSXh6AcJpysU18JgzuzIIraZ3G7zUvNSlrIbrGAOsxIcR3QXY0ih6O0nUQ93u2
	5wskiUcQI0UaPXwIcjsrU1A7F80WCqcEQPEppNKyxe8mvEv6xVwNEPYydl2u0Hf8mX/b8ZhKVCxmP
	mFHwasw4ZJ+hVpqY82FxnuM6Tx6XOF0uQQItR1oIh1+WdR6oBNLuROvUZ/BW3fyLeigdv0WL3bwwK
	FtQIgJDNwOLZsWKVxJFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEcTk-0002wH-7l; Sun, 29 Sep 2019 16:55:24 +0000
Received: from mx4.ucr.edu ([138.23.248.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEcTY-0002lZ-GO
 for linux-amlogic@lists.infradead.org; Sun, 29 Sep 2019 16:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1569776113; x=1601312113;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=x7b6SLeaG9bmKhPMxmT8BEbRRwJk0nI3N/pQdCncVCM=;
 b=im7vmOenWC8h5UPgD4ejuhL8BtsTPWqDoJHV8F6VjTi9vuAEOVBW8XTp
 WbIw5dGZMjNEY2+NokwYuoIfD9tMOJCMfeDmROmjq8HHxLCqOcHPDBEbM
 +ZW5EkNiRjZMspCuPVC0jWHiYz0ga/9bxqvoe+bkhTCYQOcnUs7h/h5GY
 RqpdJnr8nWM5GhUv1xn7p+UvIJP35gRi55qO9deOGte+g/i1g62UKv9Ck
 GRqwzbm51mDXOeJjdbPbJVTvYu1wWGZPZxRS/EQwNzEc/CiCclkzS8fsx
 LAeMS+Fz432ypfiqSOwpv+p2x2pedJBUbOQsTJQu/YPOeBzm+/P66zEgP A==;
IronPort-SDR: FTrS4dcSvC8E0z4j45YI6tGgS+zmKUT3INTjC+VKU8CUc6Ri+2AKHp91GMtlIMLTOcZ5dSGqM3
 8zkgu5icJ9uBYXVQuIlVqADUV+cGDMTxirXWaxvWhL2gISQKaMN25KEFbF/zt1uf5HDJ1YcDk6
 R+eoLuFfqYadfr+LMIxCENeh+n6/Yf/HhfLkDEzQVFa0f1gY/U7hbWLOBFOZqORF9ETCEP4NLw
 YCgUGHoqCIJji7ylvjnMiOFeYlSOADDkPxljBSagWeYwRsWiFV6ErwPxXAYc0jboL70VzTRfZ5
 97A=
IronPort-PHdr: =?us-ascii?q?9a23=3ADQHjUBM+q5JKz9cu5Cgl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0LfX/rarrMEGX3/hxlliBBdydt6sfzbaO+Pm4BiQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Nhq7oRneusULnYdvKLs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
 =?us-ascii?q?ZEWMtaSi5PDZ6mb4YXAOUBM+RXoYnzqVUNsBWwGxWjCfjzyjNUnHL6wbE23/?=
 =?us-ascii?q?gjHAzAwQcuH8gOsHPRrNjtNqgSUOG0zKnVzTXEcvhZ2jf955LJchs8pvyNXb?=
 =?us-ascii?q?NxccrLxkkuCw/JkludpJf4PzyJzOQBqXaU4Pd9Ve+2jWMstgJ/oiC3y8sylo?=
 =?us-ascii?q?XEgpgZx1PE+Clj3oo5Od61RFRmbdOgEpZdsTyROZFsTcM4WW5ovT43yrgBuZ?=
 =?us-ascii?q?GmYicH0I8nxxvDa/yfdIiI/w7jWP6RIThmgHJlf6qyhxOo/kihzu3wT8200F?=
 =?us-ascii?q?RXoiZcnNnAq3QA2h7J5siITft9+Uih2TKR2AzJ9u5EJkU0mbLaK54n3LEwio?=
 =?us-ascii?q?IevVrfEiLygkn7j6+bel869uS06OnreKjqq5ueOoNsjwHxKKUumsixAeQiNQ?=
 =?us-ascii?q?gOWnCW+OS91b3j50L5QalGguE4n6TCrZDVOd4bqrSnDABIz4Yv8wy/ACu+0N?=
 =?us-ascii?q?QEgXkHK0pIeBaGj4jvJlHPL+n0Au26g1SolzdryPHGMaH6D5XJL3jDi6vhfa?=
 =?us-ascii?q?1n505dzgozw8pf6IhJBb4fOv38R1X9tNvCDh82YESIxLPBCd590YcXQiqqCe?=
 =?us-ascii?q?e2LaLIvBfc6u81ZemBfpU9uDHzMb4s+6i9o2U+nAosfLupwJxfWnCxH7wyMl?=
 =?us-ascii?q?eZaHu02owpDGwQ+AcyUbq52xW5TTdPaiPqDOoH7TYhBdfjVN+bSw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EUAAAc4ZBdgMXQVdFmHAEBAQQBAQw?=
 =?us-ascii?q?EAQGBUwcBAQsBhA8qhCKIHIZSgg+ZJIF7AQgBAQEOLwEBhEACgzgjNAkOAgM?=
 =?us-ascii?q?JAQEFAQEBAQEFBAEBAhABAQkNCQgnhUKCOikBgz0BAQQSEQRSEAsLDQICJgI?=
 =?us-ascii?q?CIhIBBQEcBhMigwCCCwWfPoEDPIsmfzOIZwEJDYFIEnooAYwNgheBEYMSPod?=
 =?us-ascii?q?PglgEgS8BAQGLP4IxhyuWSQEGAoIQFIxNiD4bmTYtiiidBA8jgS+CETMaJX8?=
 =?us-ascii?q?GZ4FOUBAUgVoXFY4tJDCRFwEB?=
X-IPAS-Result: =?us-ascii?q?A2EUAAAc4ZBdgMXQVdFmHAEBAQQBAQwEAQGBUwcBAQsBh?=
 =?us-ascii?q?A8qhCKIHIZSgg+ZJIF7AQgBAQEOLwEBhEACgzgjNAkOAgMJAQEFAQEBAQEFB?=
 =?us-ascii?q?AEBAhABAQkNCQgnhUKCOikBgz0BAQQSEQRSEAsLDQICJgICIhIBBQEcBhMig?=
 =?us-ascii?q?wCCCwWfPoEDPIsmfzOIZwEJDYFIEnooAYwNgheBEYMSPodPglgEgS8BAQGLP?=
 =?us-ascii?q?4IxhyuWSQEGAoIQFIxNiD4bmTYtiiidBA8jgS+CETMaJX8GZ4FOUBAUgVoXF?=
 =?us-ascii?q?Y4tJDCRFwEB?=
X-IronPort-AV: E=Sophos;i="5.64,563,1559545200"; d="scan'208";a="79457927"
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2019 09:55:12 -0700
Received: by mail-lj1-f197.google.com with SMTP id j10so2263683lja.21
 for <linux-amlogic@lists.infradead.org>; Sun, 29 Sep 2019 09:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjNdX3e/FDjYlFzLDAbb3JmD3MBe1ko+MmFn61I90Os=;
 b=lCZp1So2UafvvVD6FQx3qRKM/vIi3W+imbr8bQTjM988JHQ9hi0FG9/IK4I1MYZehH
 iwVDft03SGag5q82Vw+4HV4gM1KWRq4PbgdIwl31vqSKmVRibXBSeiYrVYgczLYycgRd
 N1tZbDJDMVJftYilOIxyhuhuYcZhZaBTU7rpYbBLlLhSsk9TB/UMf8ij9zA0yPeYCSLZ
 r2uotRyIYJlZhwqvDhSbKLCGXQA/1NgsaO7QggIQ/BazFDh+LQbvLGvVhohEizELqd9C
 qKrOty4DVex4vIjE3T+d7gZgTZr9lCXUw/cfVH023bJI6Xgyec33thXF6mU8f0BUNbEB
 gKSA==
X-Gm-Message-State: APjAAAWGdegDfyLu8wW9x+Zls2VVB4oCFYPc/4qwdnSE1H74Gk/T7tto
 NC8N9hOmXcPB528zJQJCgj7Q/2B6eSCKPVRI2hMv2mchAjvPDTrtOXKJ+Tj5ntKQ5KflhQndQf/
 b0COaYTdmhVgPAUMPUv9Pc85cYUATgIlKcpIim42kLMr08FQ1
X-Received: by 2002:a19:f512:: with SMTP id j18mr9044159lfb.169.1569776108452; 
 Sun, 29 Sep 2019 09:55:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVzY32Bt/A8gXhlgqzeWJpqc+TMw73XWbverehqqSktg26b6k0t4TG24jtNlhtaPJc/gwb9AQK9KEvS4UtPUg=
X-Received: by 2002:a19:f512:: with SMTP id j18mr9044142lfb.169.1569776108214; 
 Sun, 29 Sep 2019 09:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190928004642.28932-1-yzhai003@ucr.edu>
 <20190928064720.GA24515@osadl.at>
In-Reply-To: <20190928064720.GA24515@osadl.at>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Sun, 29 Sep 2019 09:54:54 -0700
Message-ID: <CABvMjLR1sP+-z6-vy3kKmyv-srVHdvT9=Z7g=RSWo3oDuGt8+A@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: Variables could be uninitalized
 if regmap_read() fails
To: Nicholas Mc Guire <der.herr@hofr.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190929_095512_581318_6F62A073 
X-CRM114-Status: GOOD (  23.41  )
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
Cc: Chengyu Song <csong@cs.ucr.edu>, Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Nicholas Mc Guire <hofrat@osadl.org>,
 Zhiyun Qian <zhiyunq@cs.ucr.edu>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Nicholas:

Thanks for your feedback, I made changes and submitted new patches
already. Check patch script generated a warning if I strictly align
the parameter with (. I checked other code inside this file and
modified the continuation accordingly.

On Fri, Sep 27, 2019 at 11:47 PM Nicholas Mc Guire <der.herr@hofr.at> wrote:
>
> On Fri, Sep 27, 2019 at 05:46:41PM -0700, Yizhuo wrote:
> > Several functions in this file are trying to use regmap_read() to
> > initialize the specific variable, however, if regmap_read() fails,
> > the variable could be uninitialized but used directly, which is
> > potentially unsafe. The return value of regmap_read() should be
> > checked and handled.
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
>
> Just a few minor style issues - contentwise it look correct to me.
> Reviewed-by: Nicholas Mc Guire <hofrat@osadl.org>
>
> > ---
> >  drivers/iio/adc/meson_saradc.c | 28 +++++++++++++++++++++++-----
> >  1 file changed, 23 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> > index 7b28d045d271..c032a64108b4 100644
> > --- a/drivers/iio/adc/meson_saradc.c
> > +++ b/drivers/iio/adc/meson_saradc.c
> > @@ -323,6 +323,7 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
> >  {
> >       struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> >       int regval, timeout = 10000;
> > +     int ret;
> >
> >       /*
> >        * NOTE: we need a small delay before reading the status, otherwise
> > @@ -331,7 +332,9 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
> >        */
> >       do {
> >               udelay(1);
> > -             regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> > +             ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> > +             if (ret)
> > +                     return ret;
> >       } while (FIELD_GET(MESON_SAR_ADC_REG0_BUSY_MASK, regval) && timeout--);
> >
> >       if (timeout < 0)
> > @@ -358,7 +361,11 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
>
> any reason not to declear ret in the declaration block ?
> so just for consistency with coding style within meson_saradc.c
> this might be:
>
>         int regval, fifo_chan, fifo_val, count;
> +       int ret;
>
> >               return -EINVAL;
> >       }
> >
> > -     regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
> > +     int ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
>
> +       ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
>
> > +
> > +     if (ret)
> > +             return ret;
> > +
> >       fifo_chan = FIELD_GET(MESON_SAR_ADC_FIFO_RD_CHAN_ID_MASK, regval);
> >       if (fifo_chan != chan->address) {
> >               dev_err(&indio_dev->dev,
> > @@ -491,6 +498,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
> >  {
> >       struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> >       int val, timeout = 10000;
> > +     int ret;
> >
> >       mutex_lock(&indio_dev->mlock);
> >
> > @@ -506,7 +514,10 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
> >                */
> >               do {
> >                       udelay(1);
> > -                     regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
> > +                     ret = regmap_read(priv->regmap,
> > +                                     MESON_SAR_ADC_DELAY, &val);
>
> checkpatch does not fuss here but the continuation should be alligned
> witht the ( here
>
> > +                     if (ret)
> > +                             return ret;
> >               } while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
> >
> >               if (timeout < 0) {
> > @@ -784,7 +795,10 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
> >                * BL30 to make sure BL30 gets the values it expects when
> >                * reading the temperature sensor.
> >                */
> > -             regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
> > +             ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
> > +             if (ret)
> > +                     return ret;
> > +
> >               if (regval & MESON_SAR_ADC_REG3_BL30_INITIALIZED)
> >                       return 0;
> >       }
> > @@ -1014,7 +1028,11 @@ static irqreturn_t meson_sar_adc_irq(int irq, void *data)
> >       unsigned int cnt, threshold;
> >       u32 regval;
>
> same as above
>
> +       int ret;
>
> >
> > -     regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> > +     int ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
>
> +       ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
>
> > +
> > +     if (ret)
> > +             return ret;
> > +
> >       cnt = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_COUNT_MASK, regval);
> >       threshold = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
> >
> > --
> > 2.17.1
> >



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
