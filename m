Return-Path: <SRS0=E9O4=YL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265C2CA9EA1
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 14:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA0C21925
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 14:04:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Adhyy1K6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv2Cc5fh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA0C21925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAx0z0BovQOJ+ZdTp2m5/I13PT2umHlZLeJKA5qYCEo=; b=Adhyy1K6ED3iJp
	lFshDY0ZiyhgteBiIAvCDT5dkfoBRSZ2rje340ih/rXEulXtYOAyEhv4Mp1C1qMvO1GTPhJ/KMut9
	DBKJZuXojsvXKJnWl/6GDArKBTeIp8CdMnWJ8byRJ7NA939L1ojdNW2evNmFxxdqLQL7/Z/XayXMG
	pDWtMH1287tZbP7FJNkyan1KuCd5S/s+/g4leQKCj2jL7VV26V9ypLL/3XLKJAQMSe0gPmf5T9GnZ
	5FYMc/KHvqzRFh5+NgoIa/4dSOXAn93ECT8MfUhnkB8UXNU102SuRRCjNWX0oq1z4ZHAlaASel4ss
	mLOLJcKyK6Mj1urt9qBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLSs0-0000GG-TB; Fri, 18 Oct 2019 14:04:44 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLSrm-0008VS-FF; Fri, 18 Oct 2019 14:04:32 +0000
Received: by mail-il1-x144.google.com with SMTP id c12so5660899ilm.1;
 Fri, 18 Oct 2019 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFzoYmplkki9kyOBFxHB/h7HTLnl6ZxTVUTZz24IbTM=;
 b=Mv2Cc5fhH95jd20n/Sf2opUMvxeC4GuDidaIvU95LAnx2bjFB31zzog/P6oqWNI58d
 XM4kMQNx9ix/JvgLSWiV7rzZz237lTyUC6xWCtOCj91cdMKPCsv6byLDvUndFWxaGk0L
 HaFovSd7qTmKH50MXUduQUJKddS1QIt0tOelQnPWH60Wn/uylOnx7KRn78t7S3kM9aK7
 nsz2w2pVnCnOPthzSr12A/S8UYEgfISBV/Ngbi5zNtoleFlCH6MWRuOKtu7jbM4ue7kk
 OiblLeg1doD4dboEnAuQMI+pSP1pjHIH7bya5MdqmBmJVTXcYLqH7s0TZljYFeuCIxlI
 cWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFzoYmplkki9kyOBFxHB/h7HTLnl6ZxTVUTZz24IbTM=;
 b=iJrez1uZwJa9sK9DK8vlhIRsY+vYULEpsOrPDS+hVzsDWof/O9PfekXo40zh4bA2FM
 3Vs6jTVySOjMwHkt0ribai3KlAPEJ5c+W9mc3ymZRAz599fGihG8OX6RSD3YsFwEhQ33
 XPQl/yDn/Ohk9QVuxm28UhaXa6aJvShkNJs1E9UskXG+tVnCQo203QTuvrfYP8KfwskX
 Gkkpk0JJ2tBUPNBvE57goDY/FzWemK2uTXDrN8FxRRjcnKkmzd1fxsYofPUCP+zGoqEf
 vebNNuM96TAit4FFspLsn2VlXFwuaC2DnCN35m1HBRNqSDNVQvENYCdW7ACO0wxGoZop
 8EwA==
X-Gm-Message-State: APjAAAXTJrnARQi/9vNJZi++ikMjyTcCeumNfXnC1WczEJHKzM0Dc1yS
 hYiQ6fVRJ/vr+Ws62/h/I7VrPLN0ltbRaBaovVI=
X-Google-Smtp-Source: APXvYqz5b2jpVcV5HjYOaFTUFnpF8IRGwxXAMSHZl48NFIAtlszEF0ulaRrEut4XiC3rkm7Hkfuu3yszlbUbKSTUifA=
X-Received: by 2002:a92:c80b:: with SMTP id v11mr10713556iln.6.1571407464959; 
 Fri, 18 Oct 2019 07:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com>
 <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
 <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
 <1jwode9lba.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwode9lba.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Oct 2019 19:34:14 +0530
Message-ID: <CANAwSgSoK4X3_QbO3YpZRXNTpPJ+zVeid=w93f14Eyk8Dd32EQ@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_070430_506786_76B8D15A 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome / Neil / Martin,

On Wed, 9 Oct 2019 at 17:34, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 09 Oct 2019 at 10:48, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Kernel command line: console=ttyAML0,115200n8
> > root=PARTUUID=45d7d61e-01 rw rootwait
> > earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
> >
> > [0] https://pastebin.com/eBgJrSKe
> >
> >> you can also try the command line parameter "clk_ignore_unused" (it's
> >> just a gut feeling: maybe a "critical" clock is being disabled because
> >> it's not wired up correctly).
> >>
> >
> > It look like some clk issue after I added the *clk_ignore_unused* to
> > kernel command line
> > it booted further to login prompt and cpufreq DVFS seem to be loaded.
> > So I could conclude this is clk issue.below is the boot log
> >
> > Kernel command line: console=ttyAML0,115200n8
> > root=PARTUUID=45d7d61e-01 rw rootwait
> > earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
> > clk_ignore_unused
> >
> > [1] https://pastebin.com/Nsk0wZQJ
> >
>
> Next step it to try narrow down the clock causing the issue.
> Remove clk_ignore_unused from the command line and add CLK_INGORE_UNUSED
> to the flag of some clocks your clock controller (g12a I think) until
>
> The peripheral clock gates already have this flag (something we should
> fix someday) so don't bother looking there.
>
> Most likely the source of the pwm is getting disabled between the
> late_init call and the probe of the PWM module. Since the pwm is already
> active (w/o a driver), gating the clock source shuts dowm the power to
> the cores.
>
> Looking a the possible inputs in pwm driver, I'd bet on fdiv4.
>

I had give this above steps a try but with little success.
I am still looking into this much close.

Well I am not the expert in clk or bus configuration.
but after looking into the datasheet of for clk configuration
I found some bus are not configured correctly.

As per Amlogic's kernel S922X (Hardkernel)
below link share the bus controller.

[0] https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/arch/arm64/boot/dts/amlogic/mesong12b.dtsi#L295-L315

looking in to current dts changes it looks bit wrong to me.

*As per 6.1 Memory Map*
apb_efuse: bus@30000  --> apb_efuse: bus@ff630000
periphs: bus@34400    --> periphs: bus@ff634400
dmc: bus@38000        --> dmc: bus@ff638000
hiu: bus@3c000        --> hiu: bus@ff63c0000

Also the order of these is not correct.

Down the line in the datasheet some of the interrupt GIC bit are not
mapped correctly for example.

*As per 6.9.2 Interrupt Control Source*
223 SD_EMMC_C
222 SD_EMMC_B
221 SD_EMMC_A

and so on.
Please share your thought if these changes are valid.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
