Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8F8C2BA19
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 00:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1313206A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 00:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiXcAa7T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a2XbOiwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1313206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgYRXwj+ZbTVlGLivUBo09DhwHhQNa+Mv8wV1zgtopg=; b=iiXcAa7T/6an32
	MS/23pKIatF12XgSu2IdTAkUcut/7VdDzykYy6qZfxbSEjDYCjmgJpqYNG5VUcd5m6wte6G3CxO1N
	nslbkMjIebFuAqatBjMhsGLrDInzL7wouhSsrOBgih+hXd6+cCNKFLH5PCol8AalKHnF9w3nJyF82
	bQ1ACJamcd5U2YZR4xs+RYCOmlw1r3Bxw6dQMqpv1yQCrm4sWuqoEGog7EiPnhKtVBJNY8ZuFZOll
	wFds6vgoQEjh0YC9IdBTBc15BVKNTdMKFA90nNQQzFolZLECTydbgZNvaIVqgNbueK5P6//k9njpw
	n0SXTWtJnF/TfAO2RUSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOsgX-0002cv-UK; Thu, 16 Apr 2020 00:47:17 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOsgU-0002cW-K8
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 00:47:16 +0000
Received: by mail-ot1-x342.google.com with SMTP id m18so1676297otq.9
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2020 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oymDymDSGwWgVl7PdrWgMeH1mdt9MH+svEJHIh9ofYo=;
 b=a2XbOiwlAAQzxczt4QF4WPs7900EFsrLVOxWmAfWFDrYlbOxFqFleRRIhOr+uI8M5f
 M2cwVJ40d4uDtjkefb7KmLLsMXHjL/sGzNwIx0DMzOlXnR5mb/1snHQ+m68Q4OvzwI+F
 RFsl2ztnRLmbC/I9LzD4UKpcjD3O1jAdNfCXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oymDymDSGwWgVl7PdrWgMeH1mdt9MH+svEJHIh9ofYo=;
 b=SxbgcPZq6qbAknMHXEHuM8yjXnrDKZhg8AwEicg6FgJXK6biTE23RWkJQ2IokE/Wd0
 Ic/jO1YJBp696J3ZsJ3zkU6+lhY7wXy43S29ea4BvkLFp0bYgkvNBQZTeAxRv07c9fTP
 peYYeoMeugaN5dbBCKHHy4+VO38BA89E9MHwNEFfdLtAqoG8UnzyTB5g4CdfWcueYEcL
 SrKrvPTOPhCl3+yzxVEHiucv55SbDc6edMMpVCjegxebuIclqNnFmu7F4BJjkPgc/0Oe
 UGKW3UOj5KLZdDlVDgXXyUizE4UYMhBBYbbeg0F3o7xKuK4O/2EdZZqTvhBr5WWSlva7
 F/RQ==
X-Gm-Message-State: AGi0PuY+AYEenY9PK+15aFyX3a7eCH/pOCPxY5zrpAsBFsN5A9NFJNX2
 6L56c74c8MCDOlPHxTru3Qin7Nq18Z0=
X-Google-Smtp-Source: APiQypKgxFva5UPDow76yzimukpa4VlB11le9roWeeAAdiybEpzYbOtsCJSXsAluYz97N2aVQQaeIQ==
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr15538523ota.303.1586998030239; 
 Wed, 15 Apr 2020 17:47:10 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id a13sm6325703oob.45.2020.04.15.17.47.08
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 17:47:10 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id k21so1706114otl.5
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2020 17:47:08 -0700 (PDT)
X-Received: by 2002:ab0:592c:: with SMTP id n41mr1543975uad.73.1586998027359; 
 Wed, 15 Apr 2020 17:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net>
In-Reply-To: <20200415231215.GA182398@roeck-us.net>
From: Evan Benn <evanbenn@chromium.org>
Date: Thu, 16 Apr 2020 10:46:39 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
Message-ID: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_174714_688109_20A993CB 
X-CRM114-Status: GOOD (  22.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks Xingyu,

Can anyone provide advice about making SMCWD_FUNC_ID a device tree
param directly, vs using the compatible to select from a table.

Please note get_timeleft erroneously returns res.a0 instead of res.a1
in this version.

Evan

On Thu, Apr 16, 2020 at 9:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Apr 15, 2020 at 03:29:29PM -0700, Julius Werner wrote:
> > > In addition, It looks more reasonable to use the "msec" as the unit of
> > > timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
> > >
> > > - The fw interface will compatible with the uboot generic watchdog
> > > interface at [0], and there is no need to convert timeout from msec
> > > to sec.
> >
> > I think we're trying hard to keep this compatible to a Trusted
> > Firmware counterpart that we have already shipped, so we would prefer
> > to keep it at seconds if possible. That's what the Linux watchdog core
> > uses as well after all, so it just seems natural. I don't really see
> > how what U-Boot does would have anything to do with this.
> >
> > > - Some vendor's watchdog may be not support the "wdt_trigger_reset"
> > > reset operation, but they can use the method below to reset the system
> > > by the watchdog right now.
> > >
> > > watchdog_set_time(1);  //1ms
> > > watchdog_enable();
> >
> > They can still do that but they should do that on the Trusted Firmware
> > side. Emulating a missing reset functionality should be handled by the
> > hardware abstraction layer (in this case Trusted Firmware), not at the
> > Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> > but then Trusted Firmware can choose to implement that by setting the
> > watchdog to the smallest possible timeout (which it can because it's
> > accessing it directly, not through this SMC interface) and letting it
> > expire.
>
> I agree. Using a watchdog to implement reset functionality is always a
> means of last resort and should be avoided if possible.
>
> Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
