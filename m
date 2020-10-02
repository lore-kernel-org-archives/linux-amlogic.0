Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10E1C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:34:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F489206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Puvr6HNK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F489206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1rOHQwWz1vppXUQMS78RnjF2ya331Fg/8LOzGQiOPM=; b=Puvr6HNKfG9z3IDlSxAQ9COy2f
	yQ0pOLBmtBz3zGdyFuExk51Q5AcraRjdTbvavOpENmP4Nhz24h9+wq6x9epIsXg3niSLSVpSl90D2
	P1puehYGJukQNR1G/5sxDq3XxM9OZXdhho4xYtBgmgVVLAXrzVz+9KDQ9rVBjxKFxp0hfk0ebh6ho
	smNzpUMcaVrBVlfxL7gHpcD52yeTK59dnvQDCnfl5Q5FtQQB5/P+sCrmc7J/wN8FIUqzU7s6VgmSs
	nXsn4X2alyv6CIKSW328Z3eZg8q2JnsqJvLR+Qb9YwMiavG0CniUcv0Fm9x8iaE126gnFjlrA5X9g
	Mu2C4jlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHS6-0006xB-Dc; Fri, 02 Oct 2020 09:34:10 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHS3-0006wa-Ph; Fri, 02 Oct 2020 09:34:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 5CBF4487E;
 Fri,  2 Oct 2020 11:27:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPtXpE6sPQPp; Fri,  2 Oct 2020 11:27:44 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id EA00E4129; Fri,  2 Oct 2020 11:27:42 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
Date: Fri, 02 Oct 2020 11:27:32 +0200
Message-ID: <4533120.poq1GmoeVQ@ada>
In-Reply-To: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
 <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_053407_963053_66D8145A 
X-CRM114-Status: GOOD (  13.95  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> > 
> > Notes:
> >     v6:
> >       * added this patch to series
> >  
> >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> 
> Somehow you did not CC the maintainers... please use
> scripts/get_maintainers.pl to obtain list of addresses.

Well, that will be a huge list of Cc then.  What is the policy?  Everybody 
gets the whole series or different list of receivers per patch?

> All these should be separate patches per sub-architecture.

I already suspected that.  Will do in v7.

Thanks for your feedback.
Alex




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
