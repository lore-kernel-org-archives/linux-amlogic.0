Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF16CC433FE
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Nov 2022 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nI660eUUFEp/9Wmv+4HuEWtBomOYkUsbg9q5qQAsrA8=; b=3SnYYx1mtkAd3D
	2Ne8cHdRAdimuBKae6VebgNjmTGSmbUdj1yYkLtHWkDnXiNI0Xr/1wqLbxb8uGEPZ/nDLa61C9/Kw
	RQfRFd6VSdh4FmdHiWvJK/RF3HJm181DmydT8w77SayaUAuF5ZHa4SVt2dZEBN+2x3XA4IGO/gx/t
	pJPrHiwFB18cGZ4d0EEBrrD8UwpeE2VopXTFwekokzfOeL7TgtK8MhsulLQNPw6FG4Yk3CCmxYCQ6
	SxsZpwAREzkWdfi+j+00/98DW9WOAhB4EQBNEtxiJBSWL/iwbCGQsa/s1IJlITWEayHuldwvPIPNP
	qnZi2Uk3wxjXirg4D6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouJmp-00DiB1-Fe; Sun, 13 Nov 2022 20:41:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouJmm-00Di8b-9c
	for linux-amlogic@lists.infradead.org; Sun, 13 Nov 2022 20:41:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso6486282wmo.1
        for <linux-amlogic@lists.infradead.org>; Sun, 13 Nov 2022 12:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=smMBG8cth6Wetp8FRPQwBWABZlQNfxVO31AeOc5lUC8=;
        b=JEVEeqze3UWXQn+koWcOG/UYGjm8nnam7/ZT1kq93GITnzz0svZPjyJjIbeGkrMhKY
         f+wWDphZaY5X0RS6HDGXS098J6iKV3q5d4XFJkWcg5PhvCj17J+ajy4dZGFaEdM689ND
         QppIbT6JM0Rq0184K0CBNc6QSBRlRiUv8N5C3M8C3nsqvJq5BYnl7dqvdVPwo5farIcH
         uuYDpi7Eywn0wACmBjB5/XuilV++BSUH4cytjAAiRKsN34CigB2mEw91IM3mHWCsbsv3
         3+uAe5prI0fFbgVE/T+Ree/+K70r1oRnx3/Ftv898mpo5twBX3cuJ4Nu0qDwc9VNX7NS
         mTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smMBG8cth6Wetp8FRPQwBWABZlQNfxVO31AeOc5lUC8=;
        b=SXoWPDhEbZaOEX9bOcq4uc369VV718DZNAGxGEFp/gSEJCTReAWzWOP0AnnzKMQD4w
         615Ds07QbhItlH5PiM0wmu1CrKXfxX8FvBZMvn+pr4n1W9WTtik8SR2LNXXvUvfQmkG4
         npWr58QYbF9eUNhM0NoRoSP0CPGBa95/InT87ioTzRmnVrkFb3MvaXii6fbFYTwEi4pV
         YHEDdi0kZJthzsOSLyJ0HtpiOkE2T+oh3DXkr8BKDRd0ONzvVV4TBadVxJqvdGvLyEu3
         gHbnKcat8+p3s9Vtsj0pSSrCq6Zza+MgXD+ie9u1Pb7VL7m1I9AWjbaIvEljpON/8NAF
         X0nA==
X-Gm-Message-State: ANoB5pkCi5W/98rT9FU9doAbKo0tJD+USNNe4mgTH8IimSfJtYMNEF5z
	FYJT2+lvqMWJuHGkJ1DIu3stBA==
X-Google-Smtp-Source: AA0mqf6DKEqamvPE5yKKuqNWJTOSNf6Z6IDCyJRkxZBFiXxsNuUILEzLvjWteuvVbXn5OMMxZPkt0g==
X-Received: by 2002:a7b:c00b:0:b0:3cf:a985:7692 with SMTP id c11-20020a7bc00b000000b003cfa9857692mr6261764wmb.104.1668372057473;
        Sun, 13 Nov 2022 12:40:57 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003c6f8d30e40sm17246093wmq.31.2022.11.13.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 12:40:56 -0800 (PST)
References: <20221110150035.2824580-1-adeep@lexina.in>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Bocharov <adeep@lexina.in>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: amlogic: mmc: meson-gx: Add core, tx, rx
Date: Sun, 13 Nov 2022 21:06:44 +0100
In-reply-to: <20221110150035.2824580-1-adeep@lexina.in>
Message-ID: <1jk03y37vs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_124100_443080_9BEE4F58 
X-CRM114-Status: GOOD (  19.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 10 Nov 2022 at 18:00, Vyacheslav Bocharov <adeep@lexina.in> wrote:

> The mmc driver use the same phase values (core - 180, tx/rx - 0) for all
> meson64 platforms. However, some platforms (and even some boards) require
> different values

Where does it stops ? Trying to solve the instabilities of this
IP/driver by tweaking the phase has proven to be dead-end.

Soon, you'll end up tweaking these settings depending on the on
particular version of the device because it ships with a different eMMC
manufacturer. Then comes multi sourcing, sdio modules, sdcards ...

> (axg for example use 270 degree for core clock).

Where ? Upstream linux does not

u-boot does something of the sort for sm1 and I'm not entirely sure this
appropriate either.

IMO, this setting has more to do with the mode the mmc device is
operating at - not the platform or board.

We had some discussions with the HW designers at AML and they recommended
to keep a phase shift of 180 between the Core and Tx. They also
recommended to leave Rx alone (actually, starting from the v3, the Rx
field has no effect. It is not even wired to actual HW)

Funnily, that is not what the vendor driver does. It also does A LOT of
extremely complex and 'debatable' things, which mostly mask how much the
driver is unstable.

With the upstream drivers, modes up to SDR50 and HS200 have been stable
lately. SDR104 and DDR modes (DDR52 or HS400) remains problematic.

Changing the settings further would require more discussion with AML.
Blindly poking these value until you get something stablish for 1
particular use case is a recipe for disaster.

> This patch
> transfers the values from the code to the variables in the device-tree files.
> If not set in dts, use old default values.

I think going that way is opening a big can of worms. 
I don't think this should be applied

>
> Vyacheslav Bocharov (4):
>   arm64: amlogic: mmc: meson-gx: Add core, tx, rx eMMC/SD/SDIO phase
>     clock settings from devicetree data
>   arm64: amlogic: mmc: meson-gx: Add dts binding include for core, tx,
>     rx eMMC/SD/SDIO phase clock settings from devicetree data
>   arm64: amlogic: dts: meson: update meson-axg device-tree for new core,
>     tx, rx phase clock settings.
>   arm64: dts: docs: Update mmc meson-gx documentation for new config
>     option amlogic,mmc-phase
>
>  .../bindings/mmc/amlogic,meson-gx.txt         |  7 ++++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  3 ++
>  drivers/mmc/host/meson-gx-mmc.c               | 18 +++++++---
>  include/dt-bindings/mmc/meson-gx-mmc.h        | 35 +++++++++++++++++++
>  4 files changed, 58 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/mmc/meson-gx-mmc.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
