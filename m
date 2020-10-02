Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F307BC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:13:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38462068E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEr3EUiC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2Ws41X+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A38462068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vf7RytEt7syE82TykSrnESRq65+HmHVsZ3DHFBlcnBw=; b=DEr3EUiCIgqpPa5XfvQhN8R+U
	epl4aXjJ0oTerEx8xCI0/9krC8uu6R3P3KuP801SkQ+eCd+yFjof+7w5horXrTBZb4tYKkipsUy0j
	XnE1BDi9uLxWxS/iRoGeBp2h5OuYMm+dZlC03qPhv1IIcUyWReLv9eJTHcexlTNAR0G9fB5AE0D8C
	t5GfOsSL7su7S5rNQnYOgc+u68kzMfHBQNmELlTjAW0vntNqAoOV/KKOP/o8f6GmtT85C4U5Bg0uS
	je86O+z/+ixkEjGQ/xh7nz8uWMdDKaY3Ix9qR9s3n0Plmw9ouNtYQaa16pg+ElIRWp+Ynaq+1CZMC
	mcramO5WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOH7k-00045o-Az; Fri, 02 Oct 2020 09:13:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOH7i-000452-9O; Fri, 02 Oct 2020 09:13:07 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCB81206A5;
 Fri,  2 Oct 2020 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601629984;
 bh=8a9a2j+Q9TdoEDPH23Ae2HnjNbpRmIF9vtNV8rnH2vQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e2Ws41X+UNrnNFSTOb3hHvWb3YfjncnZQ59oCGnE7JOU6e7heO6JfoSLH5pHei0eg
 BC2b71jVluyqxGHJ0QR5kWnUooypgWbQFCErWr5684bzCO+XF6iFpwxtP7Y+nxZdxZ
 RpIRhmFkBimbov+669+iCgi5oldne2Y5z8G4dV28=
Received: by mail-ed1-f54.google.com with SMTP id 33so893563edq.13;
 Fri, 02 Oct 2020 02:13:03 -0700 (PDT)
X-Gm-Message-State: AOAM531EKJ+DbNz6/sdFs/SiPpkYfaoE7f4c5gwvsVh6finvziibu9qr
 AXOa19SDZ0zBixzdOJHYk0C13QNAs84qIAfARzY=
X-Google-Smtp-Source: ABdhPJxBtB7fdjB7sO1ypylhPr0oi8dpib+2DW5jCMpkty90gseodUSNpkeVzNSqRvn/UxzjtCaV66+yk1Gc6ZLF7DA=
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr1353773edb.246.1601629982305; 
 Fri, 02 Oct 2020 02:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
In-Reply-To: <20200930234637.7573-6-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:12:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
To: Alexander Dahl <post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_051306_447078_7E3260FB 
X-CRM114-Status: GOOD (  14.03  )
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
 Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6:
>       * added this patch to series
>
>  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
>  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
>  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
>  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
>  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
>  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
>  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
>  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--

Somehow you did not CC the maintainers... please use
scripts/get_maintainers.pl to obtain list of addresses.

All these should be separate patches per sub-architecture.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
