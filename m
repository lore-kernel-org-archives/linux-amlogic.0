Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3817AC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 21:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08760214C6
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 21:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhAH/1fE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AL/SFOvh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08760214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhfmTsgfIr6BmrIJTMsbslr/ryUHpyNRuj7naXmeIvU=; b=WhAH/1fEY61Yia
	eqJ5Vv103KLDv+SurtTyU7URfOA/gimZAUGzP/rbsNR7D3cZUDJCevtV9687OnRqywX14B8Z8HJ/7
	sDjzEjlqqBlGpo8lyPYZ/sPFA8awym5v4DFvUegAgTqz/1NVgygRErcAPdb2knaU1dbVkSq37AXP/
	gKtZoSvZSzMxnEDQ5NXuL9dYoR2SniZNeWqwn2sWCUABL8juDjG3br7GMZnnAJd7zTt9YdCD5hMpn
	KG/wv6yUWpkutoVRzC7PUMiu7PL33WabuI9NKEDIhf2Udl11Zo6Xz9fnPvSrkcq9oqS0RvWCe3+ds
	YQ0QwJQxRSNDAdtY9SnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHENU-0005hJ-1c; Thu, 18 Apr 2019 21:15:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHENR-0005gt-9w
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 21:15:27 +0000
Received: by mail-wm1-x341.google.com with SMTP id o25so4232076wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 14:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=IxpSWGO1Tmz/SMG8ECwGOzCKnUr/jKuNewyS3PdDbos=;
 b=AL/SFOvhcNuLWQkzWZOabeg4MbfI3CN2NNhkNqy3ebUxXWIW/pUcs9GbtfoBS+mmdv
 2r5vZtVtnmm02o27KipYTFsMq2xj9cf6/Y7sqGWy2tt3342tm+et14zDD16iOnLxQpcd
 M47H9TtGBAlvqB+7+QlLz1jJdJdPBQOiIrioXku9CU3IlC+UXCRewOIQY8Kx1TgzmQjA
 KXQBsczramf6JAMd9IKkg+JKYupm9gP1dbTy+RTrC4OF8XCwhRFij2S/wZy2nSz0bcIB
 4fpBwmOJOKP7dmxz/37qBCitlBz0YcMK/0d2KTdJXJhNCf3Opn3GA2wpFbq6QGzAsgg6
 TDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=IxpSWGO1Tmz/SMG8ECwGOzCKnUr/jKuNewyS3PdDbos=;
 b=fdrFGDOkyX1u1F4XPMkspxgYtipD741yWO5G5piabpa8M4HfHVMj0J7NTaFfOGo9j3
 BiXXS+hwYs5SfN2hCFaAUnwD5sfkDgepzRQKIeOXtfqfc365taNZcYQ4jyYTtOQYBLzD
 2/gWsCMMCHftVOW7Uf1iV5+/rRNajFTbnOFbTOxJ8VQNz6WHGL66QbUpPPPlxEPbv19w
 N4mqqFtNGBkWFdSQBMgIA418EWiAIRU+yZCc3GRi5GxoVD6+hfH1lFzCWdGQI+Uc5Guy
 at+kWEeDCW+MXx8PU9kiV+ZXExiUDGD4UcmDWfuH/5Ax4bbMLH81cDIA/ho/3x4SAdLi
 H9kg==
X-Gm-Message-State: APjAAAXdQZ+DXyIOYQhrJ9C+jpS8rOiUUgwcPPtz0Mb44p2zJSCptyVj
 lxe4BIPnWwCpJFNrG+zAurUwJQ==
X-Google-Smtp-Source: APXvYqwfvXKELWltHoybPpWO9POZf6OHiTGua/h5I6onsUHELa1XfhjIcqthQ9jT02o6JqLX4H9XBA==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr215333wmc.49.1555622123598;
 Thu, 18 Apr 2019 14:15:23 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y125sm4636450wmc.39.2019.04.18.14.15.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Apr 2019 14:15:22 -0700 (PDT)
Message-ID: <5b19d32be23fbe630339fd48f93b16e9301385d1.camel@baylibre.com>
Subject: Re: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 23:15:21 +0200
In-Reply-To: <CAFBinCBQPSsqwDSd6nQMLqOuApiESwHXn4wQbOp49WLpXfBk=Q@mail.gmail.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-6-jbrunet@baylibre.com>
 <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
 <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
 <CAFBinCBQPSsqwDSd6nQMLqOuApiESwHXn4wQbOp49WLpXfBk=Q@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_141525_349561_B4CD67F5 
X-CRM114-Status: GOOD (  21.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-04-18 at 22:53 +0200, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Thu, Apr 18, 2019 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Thu, 2019-04-18 at 22:16 +0200, Martin Blumenstingl wrote:
> > > Hi Jerome,
> > > 
> > > On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > Activating DDR in the Amlogic mmc controller, among other things, will
> > > > divide the output clock by 2. So by activating it with clock on, we are
> > > > creating a glitch on the output.
> > > > 
> > > > Instead, let's deal with DDR when the clock output is off, when setting
> > > > the clock.
> > > > 
> > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > it seems that this patch breaks SD card on my Khadas VIM and Khadas VIM2.
> > 
> > The error I see in your logs is with eMMC and hs200, not SD card.
> sorry, I should have been more clear that there are two errors:
> eMMC, this is what I have been seeing for a while on my Khadas VIM2
> (it's probably not related to this patch):
>   mmc1: mmc_select_hs200 failed, error -84
>   mmc1: error -84 whilst initialising MMC card

Following patches were also supposed to help the vim2. 
... something I tested numerous time on this particular board.

> 
> however, then there's this other error:
>   print_req_error: I/O error, dev mmcblk0, sector 0 flags 0
>   Buffer I/O error on dev mmcblk0, logical block 0, async page read
> as result of this the partition table cannot be read and my kernel
> cannot find the rootfs.

I don't know what the problem is (probably some CRC error - you can check the log
in interrupt for this) but I'm pretty sure it is not related to this patch.

I see in the log SD is indeed in HS mode, so not in any DDR mode.
I also see that the SDIO fails as well. There something really weird, which can't
be explained by this patch alone AFAICT.

> 
> > Either way, There is something I don't really get. eMMC should not go through
> > any DDR mode to reach HS200 (which is an SDR mode), neither should SD to reach
> > HS.
> > 
> > All this does is flipping the DDR bit (when necessary) when clock if off for
> > the mmc device, avoiding a glitch on clk line.
> > 
> > This patch should not make any difference for SDR only setup, Maybe I missed
> > something, but I don't see how it could make anything different for SDR only.
> > 
> > I (repeatedly) tested both vim1 and vim2, without seeing this issue, so I can't
> > debug this. I'll need more detail to progress, something does not make sense here.
> please let me know from which part of the driver do you want debug logs
> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
