Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D1CC5519F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:50:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266C92225E
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wZNpdoum";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QHFvxv/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 266C92225E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9/LKT9L+G5T0vQNfzIrdDXiCwlWi7M/4tuUEBKZHUsw=; b=wZNpdoumCuVoismFrSzi26/nQ
	9MjSm0Nf7zU0np5ZW0trXrH4STeSMktfXETcreHfth63d0wZafIeKPSa+COddu8+7DLf7oms9e5vH
	xUqCg6MWKZNmMREvoMe0eCEwp6MQJuJn+Kxagt+ps0BGEjNreO+w+i12ASzDWpIgZWVOnhU7/KKeX
	f+UecXLXqQDZCrs2uLJ/Y8jOkLj++/diBraV+k8tZdrJ6HI+ZueJxmv8IR4fc3qK9KlI1Toj70UhC
	X6mb8Do6DrA1FmuHXArvGkGVMjlPw31gg8l8afIhPHAenTCMirdwCuHSe5Pqb9u2gGjqbS9n8ddEq
	AtXW9zG+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewgY-0003fX-6c; Tue, 17 Nov 2020 08:49:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewgS-0003dV-D2
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:49:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id u12so15096301wrt.0
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nYGl1LXkb+yW2gi5P+uGkdBQoqbKU+cyHyb7bA4Qzn8=;
 b=QHFvxv/03gL+rCk/xN914inhm/X1qgmy3Qg2rT/tn1og+jKWYkUHGET1QG5MRvUUnj
 gjdALC2d8B2a42By8Lssb8GQZWnepiIfYejQvxfMP/+hd6E2veZi+0iGLX2202yN1RAx
 B+WUWIiKob3xNpfS7ErLFV608Ctvaevbxo4cgPc4Av3BgFJLmZhlcGbkwP3kOm/3AKAj
 g+ug53klMzeEfDYji5brOtaucdGKetGuXrCKYDpUUtLgZFQ6pwtKGAWH/jGgSJOjJ/tX
 u8zlJ1Ub+h9fJRbZ3ImU2PFdTuWuQ3TATCBcWbnrIUM3KjkFkoxyAe7mdbAmAOSHehIF
 /LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nYGl1LXkb+yW2gi5P+uGkdBQoqbKU+cyHyb7bA4Qzn8=;
 b=D7gMyPILOXy/em4S+xPp4zbnzNQDgRgKxWze179k6J1s9E8G4Dv1XXNgoXNdJzSZah
 6rZGpqwo/eaz0qbOxWWYMsuTvMHjCtQhJzlMBB9VfqEhp3argRNUxJP14QwmfvwPwCiF
 sP1ZDlcoQINgEOgamkXZqnKNn/Qv+DNeqVeVU85dgNzrv5bPdRoo8DEcjfWqvYo2oWI7
 ZdX2bmwxaZ6NgcIOVVnuyZv6YhU9Vg3U1GoUwhUsZxHvB7lTQDRTxiP3Cnve4DpVgCVJ
 lj0ZZtm4vMyHSPxWfMltcqmLL7Uhc8w1snPWR75QhS0Vo9lHPeLie8aqIpyJdfIwOcNZ
 Morw==
X-Gm-Message-State: AOAM531a2Tz3b/Rr/2UBeWwoSRGMEg3sKAY/O5wYV1F7aL8bPTn1xUML
 b3mWvClsCcmVZBpiXRmjeJTRXw==
X-Google-Smtp-Source: ABdhPJw8ZS4h3qIuitxj2t2LU+AZ3zMf8Zu7fItBjjVCar+dUuLWLmflzYgPcjMgPhsuAl/E+glPJA==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr22216426wrm.380.1605602991205; 
 Tue, 17 Nov 2020 00:49:51 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26?
 ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id u203sm2513007wme.32.2020.11.17.00.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:49:50 -0800 (PST)
Subject: Re: [PATCH 0/4] drm/meson: Module removal fixes
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <0b429c41-421a-2ae0-66a0-a142c56acadd@baylibre.com>
Date: Tue, 17 Nov 2020 09:49:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116200744.495826-1-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_034952_530469_6168E3E9 
X-CRM114-Status: GOOD (  28.73  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Marc,

On 16/11/2020 21:07, Marc Zyngier wrote:
> Hi all,
> 
> Having recently moved over to a top-of-the-tree u-boot on one of my
> VIM3L systems in order to benefit from unrelated improvements
> (automatic PCIe detection, EFI...), I faced the issue that my kernel
> would hang like this:
> 
> [  OK  ] Finished Helper to synchronize boot up for ifupdown.
> [  OK  ] Started Rule-based Manager for Device Events and Files.
> [    7.114516] VDDCPU: supplied by regulator-dummy
> [  OK  ] Found device /dev/ttyAML0.
> [    7.146862] meson-drm ff900000.vpu: Queued 2 outputs on vpu
> [    7.169630] fb0: switching to meson-drm-fb from simple
> [    7.169944] Console: switching to colour dummy device 80x25
> [    7.179250] meson-drm ff900000.vpu: CVBS Output connector not available
> 
> and that's it.
> 
> After some poking around, I figured out that it is in the
> meson-dw-hdmi module that the CPU was hanging...

I'll be interested in having your kernel config, I never had such report
since I enabled HDMI support in U-Boot a few years ago.

> 
> Reverting to the kernel DT instead of u-boot's papered over it
> somehow, but it turned out that removing the module (modprobe -r)
> resulted in a firework. And for every issue I was fixing, another
> followed. Much fun for a rainy Monday in the basement!
> 
> I ended up with the following 4 patches, which solve all my problems:
> I can now boot with the u-boot provided DT, and the hdmi and DRM
> drivers can be removed and re-inserted at will.
> 
> The first patch is a straightforward use-after-free, causing a NULL
> pointer dereference. Moving things around fixes it.
> 
> The second patch shows that I have no clue about the DRM subsystem
> whatsoever. I mimicked what my Rockchip systems are doing, and the two
> warnings disappeared. It can't completely be wrong (famous last
> words...).
> 
> The third patch fixes a *very* common issue with regulators (I've
> fixed at least 3 drivers with a similar issue). I guess the devm
> subsystem needs to grow a new helper at some point.
> 
> The last patch finally fixes the issue I was seeing: the HDMI driver
> hangs when accessing a register with clocks disabled, which they are
> on module removal. It also fixes my u-boot booting for similar
> reasons, I guess.

Anyway, thanks for fixing this !

> 
> I went as far as reaching out for a HDMI cable and verifying that I
> was getting a working display. Total dedication.

This is very appreciated :-)

> 
> Feedback much appreciated.
> 
> 	M.
> 
> Marc Zyngier (4):
>   drm/meson: Free RDMA resources after tearing down DRM
>   drm/meson: Unbind all connectors on module removal
>   drm/meson: dw-hdmi: Register a callback to disable the regulator
>   drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the
>     TOP registers
> 
>  drivers/gpu/drm/meson/meson_drv.c     | 12 +++++++-----
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 13 +++++++++++--
>  2 files changed, 18 insertions(+), 7 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
