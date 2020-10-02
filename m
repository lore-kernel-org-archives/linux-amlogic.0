Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E6DC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7A0206DD
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CVlATH+D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zK6KwWMf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7A0206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VrmgROTnwMstJY9xxtRR/zHj0gLucKiibLuICmOyNXg=; b=CVlATH+DKBa2w+3CEI3LCsraW
	YtVEV6qYsh56OnESe+WlBnqJabWMPF5mxmytOTH6gh2Ojm6+JX1YkNuDRCjkXR7beKFm6Heq/Rkqs
	NRb4KzvBSKimTo4fPdvFGWafPWkisr3Htl0GBMv3aXMvEQHlAyVf1xVDX0+UdMhBQitETAiiexjWy
	z3RnTNAf42MOLorp+LdhHun0aXlprgwJENSMvCY9Ww17CcuWbOyYsIow6ef4CPQQ3bIQ0RWWFE6TE
	uTc8c8/XJ+QMDivvEe8GtverGogKK7dblLJqrqJPg0QJ+wotGJhAbaSTqQdWYuQtcPjfYz1n9mV6w
	3Dx4fngIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHxg-0001fw-V2; Fri, 02 Oct 2020 10:06:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHxd-0001fH-Rc; Fri, 02 Oct 2020 10:06:47 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52300207EA;
 Fri,  2 Oct 2020 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601633204;
 bh=UJnxaC4M1lOTDgzs586QRSYYhrDCyDplqGq8e17l78E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zK6KwWMfGx+COYeTiW7XydYPT01P72wNhoDo1SEhefHyCZ2dCm5+bFatWiMRR3iyG
 pV7fqxOJPOW+mEONS9qBxxAEg/5+9PT+UdMukVhcUctmHwSVNjY1+32RMDdRWy6r9m
 KaGUN9J4TqtYuUjQJ6SSBLyjrSliBPEQN5WSsiOQ=
Received: by mail-ed1-f53.google.com with SMTP id n22so1070211edt.4;
 Fri, 02 Oct 2020 03:06:44 -0700 (PDT)
X-Gm-Message-State: AOAM532uStxl5yMSg5iAQXvUJZH9uZx8P/ySRa7YEJ0Oe0oFcEEggZfS
 6Wb9d2Cf+2FWPDTTW/x+WA9xls9ijUNWwC3PDds=
X-Google-Smtp-Source: ABdhPJyMUEsiLReOne5kMxnk5FpY37kPG9ggO9a1YAGcyv6YS7ZODs7IzG6QmWx9MLtvVFTrSOvy1Y7+WgappyP9AWU=
X-Received: by 2002:a50:a452:: with SMTP id v18mr350430edb.143.1601633202677; 
 Fri, 02 Oct 2020 03:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
 <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
 <4533120.poq1GmoeVQ@ada>
In-Reply-To: <4533120.poq1GmoeVQ@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:06:30 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
Message-ID: <CAJKOXPd3um-RvcmjexhYbpnbwcd6yKRYdCV1fnmjKoLguVOLKQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_060646_624821_8EAB6AEF 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2 Oct 2020 at 11:28, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> > >
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > ---
> > >
> > > Notes:
> > >     v6:
> > >       * added this patch to series
> > >
> > >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> > >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> > >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> > >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> > >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> > >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> > >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> > >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> > >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> > >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> >
> > Somehow you did not CC the maintainers... please use
> > scripts/get_maintainers.pl to obtain list of addresses.
>
> Well, that will be a huge list of Cc then.  What is the policy?  Everybody
> gets the whole series or different list of receivers per patch?

With git send email and get_maintainers.pl you can simplify it:
1. Send cover letter to everyone (could be skipped and instead send to
mailing lists and then link included under --- in each patch).
2. Send automatically each patch only to maintainers, with adjusted
in-reply-to to the cover letter already sent. Something like: git
send-email --cc-cmd "scripts/get_maintainer.pl --no-git --no-roles
--no-rolestats".

Probably 1+2 could be even one command if you put manually lists as Cc
in the cover letter.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
