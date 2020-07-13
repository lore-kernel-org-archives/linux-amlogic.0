Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E83AC433E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237E220663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aZ698wsZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULa0h9/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237E220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdD6dO3i57RfJRkRp2pfBpRthLz1P8FszGUCdMzEJHI=; b=aZ698wsZP4A06QU1+ZCGrO/g3
	5AlVmtee0svT8Qvsts7ebbvhFO/1eiPjQD6LW72hcd92zP28IYXPawd/3HL/j2R5NnDNQIH/EG7yz
	E2FgXDMnF8VDupkkf0Fvz5QFrFqM9RCUxEDR3hr3OqaHO+srfy2hnksSNEGpvInpS3HlQ8WGP6n1m
	RXlEPNkbRxzLo2sE63WNi/wuZ7yRB4BGSav0i3BidhMEi6ieCByHBEZqKjVCkgsxcp6Itacg0GvTb
	RwIOxE8W0SWVVB4j5//2kb1IIP2jRtSY2f/CF3zzWwF0lTebI6p27K9IITPpIbNX8x8xHJ6VqyWVX
	+Q3MqJeDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41K-0005Yf-W8; Mon, 13 Jul 2020 19:21:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41F-0005Vf-8g
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668099;
 bh=ZJzveTkQwynlqX7KTPzqYsCIqllU1B0H7wuAnwwtnTo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=ULa0h9/TWrQDk8CztXGVFtfMLGcoBliTgscgq+YIOC/NSiY0GMc6cN+kTEdcDQOaf
 KQ23dvjBvt/1Ph52+KfmoAKD9rjViYSMNHjmGvmW4+Ej9lx0jnQ3evfM8A2awNzJ/7
 fT2+MVGL14t3tWgsJyzW3zbiWi47qJqv5SOXFps0=
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] ARM: dts: use the SDHC MMC controller for eMMC
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466809973.23057.1772704234605983219.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:39 +0000
References: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152141_497923_14E3DBD9 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Sat, 20 Jun 2020 18:36:51 +0200 you wrote:
> Amlogic Meson6/8/8b/8m2 SoCs have two built-in MMC controllers:
> - SDIO (which is supported on mainline for a long time now but is
>   limited to ~40MHz bus frequency)
> - SDHC (which supports up to HS-200 modes at ~100MHz bus frequency but
>   for which we didn't have a driver)
> 
> Boards with NAND flash will now be able to use the SDIO controller for
> SDIO based wifi cards and the SDHC controller for the SD card slot.
> Boards with eMMC, SD card and SDIO wifi can only use two out of three
> MMC based devices for now until the MMC core and Meson SDIO driver gain
> support for multiple "mmc-slots" per controller.
> 
> [...]


Here is a summary with links:
  - [1/3] ARM: dts: meson: add the SDHC MMC controller
    https://git.kernel.org/khilman/linux-amlogic/c/73106f75bf9498ff5d50f1052ad3cf03730d806d
  - [2/3] ARM: dts: meson8b: ec100: enable the SDHC controller
    https://git.kernel.org/khilman/linux-amlogic/c/73501b890a6f15460613878b463319d0e0cd1632
  - [3/3] ARM: dts: meson8b: odroidc1: enable the SDHC controller
    https://git.kernel.org/khilman/linux-amlogic/c/d6a3873c7be6d58914ea5584dc7875f2045d6721

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
