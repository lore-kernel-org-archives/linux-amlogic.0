Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB9EC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D75420859
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G7WkqQJl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fhNJgPa2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D75420859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6N2v6+rzK+1kBHx+o69Ye5zc2BvQi64QZ96lj7LGKY=; b=G7WkqQJlCMrtpp
	gu37BYKBASVGVn8VpHUlbZ9fVVwcjfRUdv0DPxEKe6lNd4OmjSUK3YLyoFTV9W6xt61Rr8hjv/jYC
	f0aa5OaJLGSvbBRSxt1tjNUyTJ5hL5fuW7cmqxDv0qvuOFv/eA1RHW0YsZuuJmlZC9l9VERCqi9ji
	OuTBSQVV84FCegV4MQvEEI1JcVMzOthxkPB7yORBk7D7YtcRoJRSuzTSlpdMSnK1HHeEU5TTmI36d
	3AI4LuVHg+q9oqFCwp25WOQXZg81VRg1JkqIIc1Kz70mPUodO5vVNsfEfMXP9VnVjA66iqVKiD5YO
	WQDFrg+Rjyxa/4L1yhkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkE1c-0000rg-Iu; Thu, 17 Jan 2019 20:12:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkE1Y-0000rE-Se
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:12:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so2401598wmc.1
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=4uG8rTQ+z04nwT9w7QR/uF5MC1nQ18tGXhygYKcakPE=;
 b=fhNJgPa210vg0R22Xc4oG4gLupBwuJzRnYqWHxAys1Q4fDJLoRQEVQmkuDk5cd0wf0
 Idmu8ZlK0DmxgMCvbkmyzLfnwMANjC3ROZWDYrabG89sqoJpHf4vNGwuQaJTzPb72JiV
 m2KJQLNQ/na2w34P/GF4Dfuk/mOelmJlRXmJaZQ9G9gKnkfg2X/SgmkL+g76sQ0LTp4T
 ODQEaOA3Ev9Ck27u15yFMnMjLIoZ3QlwaKuP/RmPG5Ps3GM49MUGc0joL8Pjjzv4tZ4A
 xDMbMer82xA5lcv1mmzGlAMB80OUkm9H/qcK/tpomaQaNH6btMw3Bkp1+awNIbVt9iQl
 uZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=4uG8rTQ+z04nwT9w7QR/uF5MC1nQ18tGXhygYKcakPE=;
 b=UTy+Lcypz071F5gbvDjQQY8LNmDu2dOAmAY70A8bmytw4R08FO00N4pjrz9c6uquKN
 bwZB2j4EP+yBE1IySuydgE/pCcQpHALdV+lHACYM0Vgy8ANc0yfxQOAirziLdf6tQ2HM
 2bY7BxhQ3IFVLGyt1WhiZLOFpTGzDVSHswwCSY2+iMYUGklW2HBSaniw3mCMAvgNaEZj
 PgAp8PfwQziPUcAumJcUo1UVsZGZZznd1LQWXhjsvBKI3Mtpw9YEwMbmPJqEmdZAKpCa
 HQ145URHizHymqLRW4uiUKxCtVtD0bMCHV2Vy00sBDtvxt3RAHMxzzqcI7MgAUd8FhXs
 V9bA==
X-Gm-Message-State: AJcUukctmZKmwoendHcFA46IAEFw6GaIBCf2LoNnHMJawd8mH5DVJj4K
 icLiM84e7qIn0SOf21bM48RVDg==
X-Google-Smtp-Source: ALg8bN7IvkGWx/OA1yQPOpoCWMIc2j/U+zlQc1EzWP4ydgibgCcR6CAsMERKQYUZoJPKQ+UFSG+JXQ==
X-Received: by 2002:a1c:60c3:: with SMTP id u186mr14070746wmb.66.1547755943138; 
 Thu, 17 Jan 2019 12:12:23 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id t199sm24951671wmt.1.2019.01.17.12.12.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:12:22 -0800 (PST)
Message-ID: <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 21:12:20 +0100
In-Reply-To: <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_121224_924018_C269E8E6 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu, 2019-01-17 at 21:03 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Jan 16, 2019 at 5:52 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
> > -               aobus: bus@ff800000 {
> > -                       compatible = "simple-bus";
> > -                       reg = <0x0 0xff800000 0x0 0x100000>;
> are you sure about removing aobus?
> in your patch "arm64: dts: meson: g12a: add pinctrl support
> controllers" from [0] you're adding back an "rti" bus at the same
> memory address, except that it's size is 0x1000 instead of 0x100000

Yes, I'm sure. The fact that the aobus region size is completly made up, for
all I know, is the reason 

> 
> I don't have any G12A datasheet so it's hard for me to ACK / NACK this
> patch, here are some clues why I'm asking:
> - GXM's public datasheet lists the "RTI" region at 0xC8100000 -
> 0xC81FFFFF, we call it "aobus" in our .dtsi

... RTI region which will appear once i submit the clock controller

Yes GXM (and GXBB, GXL or AXG) has the same made up region with nothing
matching in the datasheet, but it is bit late fix that now.

> - buildroot_openlinux_kernel_4.9_fbdev_20180706/kernel/aml-
> 4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi
> also uses an aobus node as well as an io_aobus_base sub-node for the
> codec_io node (the latter is obviously not upstream)

I know, but again, it does not map to anything in the doc, and it has been the
case for several SoC.

> 
> Regards
> Martin
> 
> 
> [0] https://lore.kernel.org/patchwork/patch/1032981/



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
