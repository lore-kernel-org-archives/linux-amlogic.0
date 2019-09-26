Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC13C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 19:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532DC217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 19:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gn3LTbig";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jG3mOcOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532DC217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ankwi/TeVD4BqK9a/Dnocp8Y7zBna+HcljwoYGsAPU=; b=gn3LTbigufL7Ez
	hmy6thwbjvN1WIxjQA0AVKpF+Q7hdTJHlYFPGeVYoqp9QCS+SOkxqVeggk5siuaL84dzjnfdZKYOX
	ouEEF/Q3yEJycOn+iQmDjBzEn+V87Sk4smjH2ho0iGX1zNbVWRY/U5vR+rwSd3GcNUg+Vm4BVRuTP
	bbt3jGWwE0OEe1oIEHM1j3AlyMWicslFWDz/GQKtYLMc2r/8EFEjhwtJwP14snmwcVoQb72SjSZnq
	OcNyLHq7N6J+tfCCKC5EkWOvfTT3EuyIv+QGZrGypU2JzHoFFvftPiAtyY/FdKhRp+ximwh1f+fKD
	7Z8mancELUxNmNe6M8dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDZ7c-0003rM-Cm; Thu, 26 Sep 2019 19:08:12 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDZ7Z-0003qZ-10
 for linux-amlogic@lists.infradead.org; Thu, 26 Sep 2019 19:08:10 +0000
Received: by mail-pg1-x544.google.com with SMTP id t14so2069534pgs.3
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2019 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=F73+uceeMuwpCeg4MV5QzpHw3q82Pex8Nuzkj5F9opo=;
 b=jG3mOcORe7V8TStUeyIHOoco3/ZswveSY1cOOp7+I6U41pzEdJnFQwWJ98wBGIA2JH
 ysiJn7mqk0oWBxQ/cx9Ucobt9do5ZcSNfrPnJ8SxX2FJ3OTLpp65IYyr1yVF5s1zn5g1
 y47d+NB/p0veHoUaA/rMoR7KUvOVtyee6EJUU0sm3hwXuBRVVFS8Z4QnY9/NNrsw5js9
 557vui3D5YVUp+54ISTnwmbrDt4XS18I/v/hSaT1mpHn3Sp2L4ZUhV/29wqn3bwaNI69
 A9cjhnRNxswTYp8QBLslLYsx6mHdnviP7NKfIu5cZlTlsiTa5yx+dQJ7UHqFj07JaEeO
 81MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=F73+uceeMuwpCeg4MV5QzpHw3q82Pex8Nuzkj5F9opo=;
 b=TelQm/exc1CgU6T9wA5OXnZabGk9vw6haQw8YkKX7B2V4ZrxLKSV7zhrdVBFArCc4G
 SzzEfvJW8e6erpf+A9sfIIx99IermnpBnR+DBra9zRrAYrcDiL7lB35cy609kHKnUXsq
 y70PZzYRRr8U8255mUzG+nEIzEsFKrVRscqb5Sj4hcfDBlftsxzozx7ay2/eUp4qAq4l
 6PieamD26Gl/UuBnA6tps5StbISnWw0U21l0/+p8zVxB2XNJ/7MZvcf/OOP5ylGJ7RpV
 BWlXVAL9FlrO9yVp9I6LeiYuZnRwA/tM9E+W7zUYqMoQF573TeyPZ6+zvFZ1P0JJTz0S
 HReQ==
X-Gm-Message-State: APjAAAXi2PhzBVKoXVUDRTt1xDcfi6KCVUbdum7E8qCFcgHxoeJrWNCx
 gKVYXRCRoFUpUe1syB696EiXzA==
X-Google-Smtp-Source: APXvYqwcQ3nCA8Z13SSlrZG7RcPrMaxO33BCtRCxeOgnBoi95HRUlE0FcaBHLDCq4saFBcU8qbnZnQ==
X-Received: by 2002:aa7:8acf:: with SMTP id b15mr5312222pfd.191.1569524885043; 
 Thu, 26 Sep 2019 12:08:05 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k3sm3221570pgl.9.2019.09.26.12.08.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 12:08:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/2] soc: amlogic: ee-pwrc: ensure driver state maches
 HW state
In-Reply-To: <8936e777-8996-5c7b-ea9d-8e17c8d6c4b1@baylibre.com>
References: <20190925213528.21515-1-khilman@kernel.org>
 <20190925213528.21515-3-khilman@kernel.org>
 <8936e777-8996-5c7b-ea9d-8e17c8d6c4b1@baylibre.com>
Date: Thu, 26 Sep 2019 12:08:01 -0700
Message-ID: <7hwodulvu6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_120809_094795_90E82F35 
X-CRM114-Status: GOOD (  25.72  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 25/09/2019 23:35, Kevin Hilman wrote:
>> From: Kevin Hilman <khilman@baylibre.com>
>> 
>> During init, ensure that the driver on/off state as well as clock and
>> reset state matches the hardware state.  Do this by always calling the
>> drivers 'on' function, and then callling the 'off' function if the
>> HW state was initially detected as off.

[...]

> I don't see what you are trying to solve except simplifying the code.

Simplifying the code is a worthwhile goal on its own, but that's not the
only thing I'm tring to accomplish.

Part of the goal is make the init less VPU specific and thus make it
more understandable/maintainable.  But the more important part is to
ensure that the driver state and HW state is consistent for all the
domains (not just VPU.)  I've had to debug lots of power-domain issues,
and inconsistiences between HW state and driver state tend to be the
primary cause of problems.

Also I'm generally not a fan of the "don't mess with bootloader state"
approach as that leads to subtle dependencies on specific bootloader
versions that are also difficult to debug.

Antother equally important goal is to actually be able to power-down the
VPU when it's not used.  Right now, we'll never power off the VPU if the
bootloader enabled it, and that seems a bit extreme so I'm looking to
improve that and be able to power off the VPU when not used.

> And the case is more that "matching the clock state" here, the
> pm_domain_always_on_gov was is a real case when booting from the Amlogic
> U-boot.

I'm not understanding what you mean about vendor uboot.  I've done
testing with vendor uboot too:

I tried on g12a-u200, g12a-x96-max, and sm1-khadas-vim3l all of which
have vendor uboot, and I tried before and after $SUBJECT patch.

In all cases, I see the vendor uboot splash screen, and I see the
framebuffer console from linux after kernel boot.  I see the same
behavior before and after my patch.

I also tried on g12b-odroid-n2 (vendor uboot), and there is _no_ uboot
spash screen, but I see the linux framebuffer console come up both
before and after my patch.

What's the specific case you're worried about with vendor uboot?

Also...  note something interesting I noticed on sm1-khadas-vim3l:
before my patch, the framebuffer console appears, but the background is
a bluish/green color.  After my patch, the background is black (as
expected.)  

> The display power domain is complex and as been half solved by using
> "simple-framebuffer" on gx and is missing on g12a/g12b/sm1.
>
> For example, Debian installer runs without the modules, but will use
> the EFIfb set by U-Boot, but in this precise case :
> - the DRM driver isn't loaded
> - we can't hook this power domain with EFIfb

OK, so I agree that this case where we want the display to continue to
work but linux DRM drivers never loaded is a special case.

Is there a way to check if efifb is enabled?  Is the the linux driver
(drivers/video/fbdev/efifb.c) or something else only done by uboot?

If we can detect efifb from the kernel (not just whether the domain is
already on), then a simple addition to my patch like this:

 	if (is_off)
 		meson_ee_pwrc_off(&dom->base);
+	else if (efifb_is_enabled)
+		dom->base.flags |= GENPD_FLAG_ALWAYS_ON;

would force the domain always-on in the case of efifb.  

In fact, now that I think of it, simply adding:

 	if (is_off)
 		meson_ee_pwrc_off(&dom->base);
+	else
+		dom->base.flags |= GENPD_FLAG_ALWAYS_ON;

to my current patch would get back to the same behavior of the existing
driver.  But I still don't like the idea that we can *never* power off
the VPU if the bootloader enables it. :( I'd rather see patches
conditionally adding that flag with detailed explanations as to why it's
needed.

> When *not* in EFIfb, we use simple-framebuffer on GX, using this
> power domain, but it hasn't been copied to G12A.

I don't quite understand what problem simple-framebuffer is
solving. Could you explain that in more detail.

Assuming it is solving something, why can't it be used on g12[ab]/sm1 ?

> Personally I'll leave this code until we really tested and checked all
> uses cases, 

Right, I don't want to break anything on purpose, but I think the
current state of this driver is fragile and difficult to
understand/maintain, so I would be grateful for any help in
understanding the corner cases better, as well as testing them (or
explaining to me how to reproduce them.)

Generally, with long-term maintenance in mind, if I'm forced to choose
between understandable/maintainable code and "covers 100% of corner
cases" I will most often chose the former.

> not only on the sei510/sei610 using mainline u-boot.

See above about all the other boards with vendor uboots also tested.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
