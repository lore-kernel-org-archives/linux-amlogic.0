Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FB6C04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A620621479
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJAhnn8D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BsAksXq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A620621479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMkdgdbR5nOpMOSm7bZ1+2THH5Z1v+Qsjw7LzIuv1x4=; b=aJAhnn8DAZANNE
	R+pbnlRTGeZbERlez9f0yvwQR4OviqFqIy2jiqts/zzt65m00ZStkkjAtyOEkyFKp435+RVfUWb0v
	EU1g/2SYwRaDEZ2A7sNDlBs3qjaT1cpaNXiLm0WQ9pgbUYjN4yDdfK4ThijYJ42X/zO/BQ5+Ca6Wm
	ZzoWW0iI5D8E52fIuMJecp+/UGILiGeNebbsphlpgcPYH947RW0JoZWfAnUFy8e8QBV8MRYCJDehT
	SCrbbGgARd+95+kVcR1boi5ZUoo5OiG3PMeEnAZzaRGDaNsUBfvx6A8u0yewFkUW1Zs3EJvt7Ovlc
	DVeOZ1k4HWbJfc21LFqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ7eI-0003LU-SV; Mon, 13 May 2019 09:53:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ7e9-0003DI-8C
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 09:53:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id h4so14485645wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 02:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=KQaBMNzV2Xp0O7iigiyVm7H6auSbkH4OdllLgyfmhe0=;
 b=BsAksXq4oRDwEX5mX7EWVAIzkcTyS3vSKsA5LtprZ/xNSLxLrEjGCPBZwjawwlUHMc
 I1Zsr9XcY41npKLQuBcapnMBl5OauonrjdbvMVvG4HqDbqsrnnPuZqC7zwtgjMkrfdmU
 HMLTY4yM1YEmSFdX3g4XVRzRF4l5AtN98vJyLtwNdQLra8CaDUKYSTeYlVYah7Yq1hm/
 S9N+yRy1BgBrsa4CGYrnq6QRjOnxtuJsK1WVMWSADZVfXzSoGs7IVjK44nCqZ/T39w0z
 PdE6ZQ9Mbl79DzwiTA+ktxVg8GjpUSXvgvnS+E0E41HedcK+V7Ww/nbFqtdEXzV/6CD+
 djjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KQaBMNzV2Xp0O7iigiyVm7H6auSbkH4OdllLgyfmhe0=;
 b=dgPkMR0b0MRo/Jx1Xel63RzpdXmatCJPADHLWRKvGMnj56jym6HAed2ddJTTvVJpfA
 nbWhUl62VQefvLt01UWYi3TMMdYsp1ssDkHBWC6NknG+52xxGdCWHeyG1lbmDC4h3ohF
 ytkt2ZvUykDPnrfeEuxOO0Ngcdq9ZRI2FAitVhKa17HCGRpgSKHGksDmeJtCsn0Oh7wJ
 WlyMd5iB1I0k5veDYOjK6Tdn/5b3TtN8RSNB6d55AHHeXVBDeR+zorUdzzl9LT9BEHRV
 E03KgkCMUZoKEdT/ZFHScakslPcRqEE0/6oASQTSumsj7s4Uo4c1vrE1bwOVWYHANzzi
 /4zg==
X-Gm-Message-State: APjAAAX2i+gsSirvrnyMcubNB96Rmfa2HS7Y5xeN8RaG5KxvEiDkF1Uu
 gFHH3vXHfunh1SOjSpFVkzh6iw==
X-Google-Smtp-Source: APXvYqwTMiFzb89k+OzaDeG1ErvqmwjB/WR+4vAZ0D34Bp6gF05DDbIJaQoNiA3jALnCB4WBKi2Yaw==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr1309662wrs.314.1557741203610; 
 Mon, 13 May 2019 02:53:23 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b10sm24629084wrh.59.2019.05.13.02.53.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 May 2019 02:53:22 -0700 (PDT)
Message-ID: <dc6ee617fb0902ae05289b2bc794c8362fd08eae.camel@baylibre.com>
Subject: Re: arm64: dts: meson: Boot failure with using eMMC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bob <pigiron@protonmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 13 May 2019 11:53:21 +0200
In-Reply-To: <7yaiVYWS-VlbP5H6BTXnSiNE_w6ZJQRMX8DjxBa7gDLaZ4PoWFPg_CZkd9EU0-UVVuGvpxrlTJR1_6i64BP7eSb3XZdCV9vv3NFhHsmifA8=@protonmail.com>
References: <7yaiVYWS-VlbP5H6BTXnSiNE_w6ZJQRMX8DjxBa7gDLaZ4PoWFPg_CZkd9EU0-UVVuGvpxrlTJR1_6i64BP7eSb3XZdCV9vv3NFhHsmifA8=@protonmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_025325_295367_EACF8A03 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-05-11 at 20:49 +0000, Bob wrote:
> Even though I come with a problem, I first want to thank you folks for all
> that you do. It's much appreciated.
> 
> So on to the problem. I've got an Odroid C2 (meson-gxbb) with an eMMC chip
> that Ameridroid claims to be an "eMMC Version 4.5 - HS200 interface with
> 8bit DDR mode from Samsung".

Could you share the complete part number that is written on the samsung MMC
module ?

> 
> I run the Arch Linux "mainline" kernel and it had been working well. But when
> I upgraded the kernel from 4.20 to 5.0 it failed to boot when UBoot couldn't
> mount the root filesystem, so it dropped into it's shell. Using an USB serial
> dongle, I noticed that none of the usual /dev/mmcblk* files were created.
> 
> I saved the failing boot output from the USB dongle, downgraded back to the
> 4.20 kernel, and now it booted successfully. When I compared the good/bad
> dongle outputs it seems that the first error messages were:
> 
>    [2.790141] meson-gx-mmc d0074000.mmc: no support for card's volts
>        (snip)
>    [2.799730] mmc0: error -22 whilst initialising MMC card
> 
> I then did a bunch of "git bisect" compiles on Linus' "vanilla" kernel from his
> git tree and ultimately it pointed to commit:
> 
>    arm64: dts: meson: disable pad bias for mmc pinmuxes
>    96a13691c1ddfafc301d1ee451d91fc2cca48d27
> 
> Sure enough, when I now revert that commit in /boot/dtbs/amlogic/meson-gxbb-
> odroidc2.dtb on the latest shipping 5.1 kernel, it boots successfully. That
> same 5.1 kernel fails to boot with the same error messages when that commit
> is engaged.

Would you mind trying this branch from kevin:

https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=integ

This particular commit might be useful considering your bisect results:

https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/commit/?h=integ&id=1c10023f4d1b75ed164f60bb0ee6bc239655408c

> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
