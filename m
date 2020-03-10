Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD557C10F25
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 01:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D52720637
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 01:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZOm53OL4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kjWV2H+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D52720637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76IaDV36Hl04q0v4BU4M/mcsur7QtILVfcDMl7KgvS8=; b=ZOm53OL4EWHoaG
	IhfuJl9UvN9MZpRC1rSRLVYfYDhDxQCsM4HB1SjnJTM3RywiE0XVAUW3lJ7uiQG5IFDuOTcfTUjrC
	o8ULnX02HYChLNhdp528IEAdakrQfgQeBefv4lRDjxD7DLp0RaHoT0SJVQTLLDhD6Qb0E7Qw/D9O1
	GSISFXB0kPNPCeBrzFSUG8+w3wEUUZpHWM0VHlUcYFnWJu62yez/EbmXSsJKOaNnqAwploNNldiqf
	euYMhSOyeEfjlzc7aV06072ZcF5yEy6lp1FwdPuotRflMqhAgI7TzcTLPfgw1/77dU1jL3w9Ijdut
	TrLpM2l+lcbSggBq8Nnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBTGY-0003mD-6J; Tue, 10 Mar 2020 01:01:02 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBTGU-0003l3-VJ
 for linux-amlogic@lists.infradead.org; Tue, 10 Mar 2020 01:01:00 +0000
Received: by mail-vs1-xe44.google.com with SMTP id k26so7368964vso.5
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Mar 2020 18:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5xnWgJ5omzmZiku6UfaNj8qU529m5YfhrjX1iEpn4A=;
 b=kjWV2H+ENIYP82wnkfLeoFh/cu0d6WCJIUEmu3ujdQeJGhIXy/5G1boCNlFG8g0qBr
 +2e4zj+IUgMgrGGmx8xi/SpqcykgxdFjE8+INLu57lfr0OaK5tzabI36l1MbeHx1erNT
 dYDE3RDADynW72cXRucYvQhJa+Zy4oyvr3wGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5xnWgJ5omzmZiku6UfaNj8qU529m5YfhrjX1iEpn4A=;
 b=QQShUMNLZ9Q5knMRYx+jK0x/+PJbmGUL79uNeDj4pChTZ4MABEy+G8N5kwP2CDdQ0l
 iVTncnFreZhp4xEg3Wq+feK5MFPJas4w3cxcPY/XeW27ImRgLn6o+sPYrf+bqzBvoKLy
 kDhPFf18cRu9RXfdxelEidG7cStKPKb2VHUOJra02Izd2JULgc4pno8kTgO/DJ60XQPx
 KZBcbV0/NYBZVXAt2DRmdT4JnbKuikfyJRHoV+bVcbSP7hyAUT+MlEDDh+StWPHTmmXC
 /GYRcL2hOYLBh06MSfYA6+EHDmY87wLtTHP5RqWseArDs4fHT4X+1DoIE+6YhVENni6D
 w6xQ==
X-Gm-Message-State: ANhLgQ3FnQZFNESRzXI/Pm5pBiGMEVZbV0QwjEmMh3rW1ga6uy2W8acq
 cXeymkBXzpb0Hh6XrZT6LThCglMAm+g=
X-Google-Smtp-Source: ADFU+vtPvnWZJLDv4NWExNNeMmzLVYQoC1SMLwXokfogDnH8PQ6yToPMcTGyDenvOguXVNqwDUynOA==
X-Received: by 2002:a67:ffcf:: with SMTP id w15mr3157620vsq.122.1583802056265; 
 Mon, 09 Mar 2020 18:00:56 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id i3sm10956178vso.3.2020.03.09.18.00.54
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 18:00:54 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id y3so4062893uaq.5
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Mar 2020 18:00:54 -0700 (PDT)
X-Received: by 2002:ab0:3392:: with SMTP id y18mr2111560uap.66.1583802054012; 
 Mon, 09 Mar 2020 18:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
 <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
 <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
In-Reply-To: <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Tue, 10 Mar 2020 12:00:27 +1100
X-Gmail-Original-Message-ID: <CAKz_xw2T1UceCwFZnBxg6WVp2D4+MziyvQPdU6tEnR_BdLh-PQ@mail.gmail.com>
Message-ID: <CAKz_xw2T1UceCwFZnBxg6WVp2D4+MziyvQPdU6tEnR_BdLh-PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To: Xingyu Chen <xingyu.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_180059_034814_6DF579E4 
X-CRM114-Status: GOOD (  23.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Yonghui Yu <yonghui.yu@amlogic.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Julius Werner <jwerner@chromium.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Xingyu,

I am trying to establish some clarity about what to do here.

The trusted firmware review has now been accepted
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.

I could try to add your mentioned extra operation indexes to the ATF
watchdog, to try to establish a standard ATF smc watchdog interface.
Hypothetically then your linux driver could connect to any of the ATF
watchdogs, apart from the meson indirection layer.
I do not quite understand the meson layer to be honest, would we run
the meson layer on non-amlogic SOCs?

It looks feasible to strip the meson part from your driver so that it
works on more socs, please correct me if I am wrong.

Alternatively we could also add these extra operation indexes to this
linux driver. Unfortunately I would not have a way to test that.

Thanks

Evan

On Tue, Feb 25, 2020 at 6:43 PM Xingyu Chen <xingyu.chen@amlogic.com> wrote:
>
> Hi, Julius
>
> On 2020/2/25 9:23, Julius Werner wrote:
> >> The SMC function ID may be solved by the DTS, but the wdt indexs(Eg:
> >> SMCWD_INFO) are also different
> >> for each vendor. The imx_sc_wdt.c is also use the SMC to operate the
> >> WDT, but the wdt indexs(Eg: IMX_SIP_TIMER_START_WDOG)
> >> are different from ours. IMO, If the ATF can implement a common hal
> >> interface and index for watchdog, then writing a
> >> common smc wdt driver will be easier to compatible with all vendors.
> > The MediaTek driver is still in flux (e.g. still being reviewed in
> > Trusted Firmware here:
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405),
> > we can still change it. So if we can now decide on making this a
> > "standard" driver, we can change the MediaTek interface to match IMX
> > and standardize on that. (There are existing Chromebooks shipped with
> > a different interface, but we could handle those separately with
> > downstream patches. I think having a unified interface that will
> > prevent this problem in the future would be worth some extra
> > complication right now.)
> If the ATF provides a common watchdog hal interface and index, I am
> happy to match
> the generic sec wdt driver. Compared to the current MTK wdt index [0],
> the following
> indexes need to be supported for meson wdt [1].
> - *_INIT.
> - *_GETTIMEOUT.
> - *_RESETNOW.  It is used to reset the system right now, similar to your
> SOFT RESET.
>
> For another platform-specific parameter "SMC function ID", the generic
> sec wdt driver can get it from the dts, but if
> the driver want to compatible with more vendors in the future, maybe we
> should consider Guenter's suggestion at [2]
>
> [0]: https://patchwork.kernel.org/patch/11395579/
> [1]: https://patchwork.kernel.org/patch/11331271/
> [2]:
> https://lore.kernel.org/linux-watchdog/20200220155159.GB29658@roeck-us.net/T/#md00328548222965054cd19ec7dda074f8fc09fe2
>
> Best Regards
> > .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
