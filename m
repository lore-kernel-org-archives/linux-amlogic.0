Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A2AC04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 20:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2A5217D7
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 20:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMWca0i6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="p49itp4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2A5217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7WAzLNdWK+ZvpfFLhdmUK6klJDLO60FnZSrd89hJd04=; b=DMWca0i6Gt/U1x
	4AM/Ba7jySY3Nu1Yv1CmTq/5lvHDuFz/hZc0xMyZBtU492vJGyZYeyjJISP37Lw3Q2h1m6MS/BOOw
	cE/ZGmxWABpQjhN2/lQYMsyOnzisnbvuI2Y7oqkUGRaMTg5kryXQRttdvAXeXxK93zBDTGl6Q6lqX
	gE/uL0ECoCI63fPiaguyCXQt2CfjU47JsZONynog3G3ru8+lIP0D9O+tw4gWrD35MMNf3gcXDeqL+
	VOqSkjn1c7x6HG6cGXSjdakaQ/R6F1XGbSOgyw3dkDf+arGQ2IbsrqZSP5ePKC/VTLgY7qWNCgHYu
	BjSb+z4Qy0CC6s7+dnNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPYwW-00062D-RG; Sat, 11 May 2019 20:50:04 +0000
Received: from mail-40132.protonmail.ch ([185.70.40.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPYwL-0005lp-Nn
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 20:49:56 +0000
Date: Sat, 11 May 2019 20:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557607787;
 bh=MxsDWggys2dskHCU5PWyuUf8L5ocabzHRB0JVzjm0/0=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=p49itp4ZM6YkvDcAOfsUotB9LGIphD1fpdeYQWq+vEL6M7Z2GqAjT+7JbJS4sepba
 TrAgqGLM30PETZpsGG8+o88YqmulUKwpBJw3k4G8rFpxgvasFr3h+qj6mXRW+eBARh
 z2yt6ljniJCWcquWykU8HaKIW+VoQ2jluC+6vqHk=
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
From: Bob <pigiron@protonmail.com>
Subject: arm64: dts: meson: Boot failure with using eMMC
Message-ID: <7yaiVYWS-VlbP5H6BTXnSiNE_w6ZJQRMX8DjxBa7gDLaZ4PoWFPg_CZkd9EU0-UVVuGvpxrlTJR1_6i64BP7eSb3XZdCV9vv3NFhHsmifA8=@protonmail.com>
Feedback-ID: C9LuG3VnvxsVE-NK__4mgtHQkVUBjoNZAKT1UPY69jR3O3SjppQt3FTXk4t40ZQ2rrvuZCw-kRM7a0ytDe7Whg==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_134954_349149_F6C7D20E 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Bob <pigiron@protonmail.com>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Even though I come with a problem, I first want to thank you folks for all
that you do. It's much appreciated.

So on to the problem. I've got an Odroid C2 (meson-gxbb) with an eMMC chip
that Ameridroid claims to be an "eMMC Version 4.5 - HS200 interface with
8bit DDR mode from Samsung".

I run the Arch Linux "mainline" kernel and it had been working well. But when
I upgraded the kernel from 4.20 to 5.0 it failed to boot when UBoot couldn't
mount the root filesystem, so it dropped into it's shell. Using an USB serial
dongle, I noticed that none of the usual /dev/mmcblk* files were created.

I saved the failing boot output from the USB dongle, downgraded back to the
4.20 kernel, and now it booted successfully. When I compared the good/bad
dongle outputs it seems that the first error messages were:

   [2.790141] meson-gx-mmc d0074000.mmc: no support for card's volts
       (snip)
   [2.799730] mmc0: error -22 whilst initialising MMC card

I then did a bunch of "git bisect" compiles on Linus' "vanilla" kernel from his
git tree and ultimately it pointed to commit:

   arm64: dts: meson: disable pad bias for mmc pinmuxes
   96a13691c1ddfafc301d1ee451d91fc2cca48d27

Sure enough, when I now revert that commit in /boot/dtbs/amlogic/meson-gxbb-
odroidc2.dtb on the latest shipping 5.1 kernel, it boots successfully. That
same 5.1 kernel fails to boot with the same error messages when that commit
is engaged.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
