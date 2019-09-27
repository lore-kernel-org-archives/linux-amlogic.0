Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A7DC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 16:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F56207E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 16:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VsNdijEC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hjOW3C4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F56207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq5cJMkhdIFrDU3d12BDyo79pazZ98yUFXqHp/ocFOU=; b=VsNdijECtuyV37
	yDoXd88ZiS/Y6XlWwHA4Of4arAo/DziGGMDKnj4IW11d2/X3iD3qwlpGzeWEYSKLnot2oLmSXU7gX
	P3bIibvqmxOPKJvWLasPkLGBdnRY+z1AR0CjaHj7o3GWpXyfk1exKFmNXYECnaHIJHYkDTWOfpR/5
	7lBzZnAAd4C6pZlnR9TWIkbG6dtKUXRc73hSKQozC5U1ZxFEIG2eAg6itGDxeb9t41ndDlGMRwuLe
	vxUHrTvCA1zLAWmeyyH0qI5IglQfLqzET9PLR10oTIDpe/Vd6Fv3udOEhlM/Tr81pOS573N3PXL9Y
	rfUiTARyH/OiMw/IjSqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDshR-00069E-HX; Fri, 27 Sep 2019 16:02:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDshE-0005zY-BY
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 16:02:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id q24so1262865plr.13
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=29a3oTunOouDFzxMtIrWBXRyyY3LWhUwRCrePjAx2qE=;
 b=hjOW3C4SuSB7unJjx+5yJqjFuAldtauxybxk3cFSxQaAi/4e2KMQ5NI0EB1NNtU0qH
 cGdKRs/ubtIEtWKlpW1ocUVwjIJRmYWOzzUhbRyKQdXU+6wQ0TgkJr1gw+EqD3zHXdH0
 n8Yh8s/nV0q88MN/8eTOSlrHBN54E60xXDlIqi4XS+0r5whpKFVIm5W9GzB2TGCXXsYg
 Abgl4pZGte7BQ2QkOSc8lgsBxcO2JERK0RIAkorcmy6y1T/xwnUUewm+J//PZ6Y1bx49
 Pk9N2zMO6R7zVsUrJt/SJrV5GvSOETzFSEI+ZDMZoK53UcVEfDZhyWiJXRy2e4Q1QuJk
 NOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=29a3oTunOouDFzxMtIrWBXRyyY3LWhUwRCrePjAx2qE=;
 b=kzoEvDEhvHNQzkL3zFJqqKpmju7Rol2buc/5SSQWdXAw+pRVhSzcFGlvO+63swtxJH
 uGLbCp6x6Mqw+gPRmECktsKP5pVT2+3gyT0LG2bJ6hO7wr9uUjv5vPpuDWEUisYGcN6t
 /x4cAp8xmhTpOlrD+CSfv4k09ui+ameefq6SsdDIUg7H7beRJS2lgy08beCGKwzDIBh2
 1Mg6X+Yb8td1WnoEzrWF5gsvSpo/JgoXnar5hSH+3/izT+0ejQ32AUQgDGP72h0KtB2w
 NkK/IK9B9/uLAYojMipgJIAWyI/WL9ZWDeZPafuXgg6XXrVuIk1tJk04WLac3REQM25W
 1FYQ==
X-Gm-Message-State: APjAAAVuYaPYskmWZkexnD5JLZgkBhkAUwjNTFPbYtAVPcMBuspVyVDe
 oZ3nnl9nGAy2WZVZEyeZDai57Q==
X-Google-Smtp-Source: APXvYqwb2qcrphZZtwIWMoEm1Jl9XAX4IezpkCTvrSf1SgdfEcRynzdCEgT5Z+6j0c7zO2GfixPHEw==
X-Received: by 2002:a17:902:9896:: with SMTP id
 s22mr5360521plp.207.1569600135203; 
 Fri, 27 Sep 2019 09:02:15 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 196sm3586887pfz.99.2019.09.27.09.02.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Sep 2019 09:02:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/2] soc: amlogic: ee-pwrc: ensure driver state maches
 HW state
In-Reply-To: <21eafa69-fe26-2df1-d187-cddfe5b37951@baylibre.com>
References: <20190925213528.21515-1-khilman@kernel.org>
 <20190925213528.21515-3-khilman@kernel.org>
 <8936e777-8996-5c7b-ea9d-8e17c8d6c4b1@baylibre.com>
 <7hwodulvu6.fsf@baylibre.com>
 <21eafa69-fe26-2df1-d187-cddfe5b37951@baylibre.com>
Date: Fri, 27 Sep 2019 09:02:13 -0700
Message-ID: <7h1rw1iv7e.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_090216_397369_C58482C0 
X-CRM114-Status: GOOD (  34.32  )
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

> On 26/09/2019 21:08, Kevin Hilman wrote:
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> On 25/09/2019 23:35, Kevin Hilman wrote:
>>>> From: Kevin Hilman <khilman@baylibre.com>
>>>>
>>>> During init, ensure that the driver on/off state as well as clock and
>>>> reset state matches the hardware state.  Do this by always calling the
>>>> drivers 'on' function, and then callling the 'off' function if the
>>>> HW state was initially detected as off.
>> 
>> [...]
>> 
>>> I don't see what you are trying to solve except simplifying the code.
>> 
>> Simplifying the code is a worthwhile goal on its own, but that's not the
>> only thing I'm tring to accomplish.
>
> I still find it ugly to power_on a domain to power it off right afterwards.
> The issue is with the CCF enable handling which is not in sync with the
> HW, if you boot with an already enabled clock, it won't be marked enabled
> in CCF, and it's clearly bad when you want to have a fine-tuned gate state
> handling.

It's not just the clocks.  The only thing we actually know is the HW
state of the sleep bit (because we read it.)  We don't know the state of
all the mem_pd bits or the iso_reg, nor do we know the state of the
reset lines.  Calling 'on' ensures everything is where we expect, and
we're not relying on the bootloader to do it.

>> Part of the goal is make the init less VPU specific and thus make it
>> more understandable/maintainable.  But the more important part is to
>> ensure that the driver state and HW state is consistent for all the
>> domains (not just VPU.)  I've had to debug lots of power-domain issues,
>> and inconsistiences between HW state and driver state tend to be the
>> primary cause of problems.
>> 
>> Also I'm generally not a fan of the "don't mess with bootloader state"
>> approach as that leads to subtle dependencies on specific bootloader
>> versions that are also difficult to debug.
>> 
>> Antother equally important goal is to actually be able to power-down the
>> VPU when it's not used.  Right now, we'll never power off the VPU if the
>> bootloader enabled it, and that seems a bit extreme so I'm looking to
>> improve that and be able to power off the VPU when not used.
>> 
>>> And the case is more that "matching the clock state" here, the
>>> pm_domain_always_on_gov was is a real case when booting from the Amlogic
>>> U-boot.
>> 
>> I'm not understanding what you mean about vendor uboot.  I've done
>> testing with vendor uboot too:
>> 
>> I tried on g12a-u200, g12a-x96-max, and sm1-khadas-vim3l all of which
>> have vendor uboot, and I tried before and after $SUBJECT patch.
>> 
>> In all cases, I see the vendor uboot splash screen, and I see the
>> framebuffer console from linux after kernel boot.  I see the same
>> behavior before and after my patch.
>> 
>> I also tried on g12b-odroid-n2 (vendor uboot), and there is _no_ uboot
>> spash screen, but I see the linux framebuffer console come up both
>> before and after my patch.
>
> Thanks for testing all these cases
>
>> 
>> What's the specific case you're worried about with vendor uboot?
>
> It's an issue I got when bringing up mainline uboot and the vpu power controller
> driver, I had regressions on GXBB and GXL boards.
> But it seems it's no more the case on G12A/G12B, we'll see this when
> GX support will be added in this driver.
>
>> Also...  note something interesting I noticed on sm1-khadas-vim3l:
>> before my patch, the framebuffer console appears, but the background is
>> a bluish/green color.  After my patch, the background is black (as
>> expected.)  
>
> Yes it's an issue I have on my infinite todo list, it's a different
> init done by the latest vendor uboot. I have a fix but it seems it
> breaks display when booting other boards.
>
>> 
>>> The display power domain is complex and as been half solved by using
>>> "simple-framebuffer" on gx and is missing on g12a/g12b/sm1.
>>>
>>> For example, Debian installer runs without the modules, but will use
>>> the EFIfb set by U-Boot, but in this precise case :
>>> - the DRM driver isn't loaded
>>> - we can't hook this power domain with EFIfb
>> 
>> OK, so I agree that this case where we want the display to continue to
>> work but linux DRM drivers never loaded is a special case.
>> 
>> Is there a way to check if efifb is enabled?  Is the the linux driver
>> (drivers/video/fbdev/efifb.c) or something else only done by uboot?
>> 
>> If we can detect efifb from the kernel (not just whether the domain is
>> already on), then a simple addition to my patch like this:
>> 
>>  	if (is_off)
>>  		meson_ee_pwrc_off(&dom->base);
>> +	else if (efifb_is_enabled)
>> +		dom->base.flags |= GENPD_FLAG_ALWAYS_ON;
>> 
>> would force the domain always-on in the case of efifb.  
>> 
>> In fact, now that I think of it, simply adding:
>> 
>>  	if (is_off)
>>  		meson_ee_pwrc_off(&dom->base);
>> +	else
>> +		dom->base.flags |= GENPD_FLAG_ALWAYS_ON;
>> 
>> to my current patch would get back to the same behavior of the existing
>> driver.  But I still don't like the idea that we can *never* power off
>> the VPU if the bootloader enables it. :( I'd rather see patches
>> conditionally adding that flag with detailed explanations as to why it's
>> needed.
>> 
>>> When *not* in EFIfb, we use simple-framebuffer on GX, using this
>>> power domain, but it hasn't been copied to G12A.
>> 
>> I don't quite understand what problem simple-framebuffer is
>> solving. Could you explain that in more detail.
>
> simple-framebuffer has the power domain hooked in it's node, so
> when u-boot will boot linux with HDMI enabled it will enable
> this node and until the DRM driver loads the simple-framebuffer
> will live and keep the power domain enabled.

Ah, thanks for the explanation.  I didn't realize it was u-boot that was
adding/enabling the simplefb node in the DT.

>> 
>> Assuming it is solving something, why can't it be used on g12[ab]/sm1 ?
>
> It will, but I need to push the patches.
>

OK.

>>> Personally I'll leave this code until we really tested and checked all
>>> uses cases, 
>> 
>> Right, I don't want to break anything on purpose, but I think the
>> current state of this driver is fragile and difficult to
>> understand/maintain, so I would be grateful for any help in
>> understanding the corner cases better, as well as testing them (or
>> explaining to me how to reproduce them.)
>> 
>> Generally, with long-term maintenance in mind, if I'm forced to choose
>> between understandable/maintainable code and "covers 100% of corner
>> cases" I will most often chose the former.
>> 
>>> not only on the sei510/sei610 using mainline u-boot.
>> 
>> See above about all the other boards with vendor uboots also tested.
>
> Let's leave apart the vendor uboot issue for g12.
>
> Since display support for G12A will land soon in mainline U-boot, let me
> push the DT patches for simple-framebuffer to we have a fallback in
> case the DRM driver isn't loaded/built.
>
> We can consider that in case of EFIfb, the simple-framebuffer node would have
> been enabled and the power domain hooked and enabled.

OK, that makes sense to me.

So can I consider this an 'ack' from you for this patch, as long as I
wait to apply it until the simplefb DT patches are also merged?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
