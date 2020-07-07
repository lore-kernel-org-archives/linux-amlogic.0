Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811EAC433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528592075B
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0do/z7w0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQOQlrGv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528592075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pM3NvV7X3ablS/+sESRWyjRNUS19/k/La5KmUlRnQwM=; b=0do/z7w0rXKm/AHbiWYKgNIrr
	EK5ytdNYKga0ig1XgYHL+UgGw3Va3FcGddSrd5up2P27yPKLIr2vmGR/y4A1KPZNxgZHT5RB0TIpg
	9RxMkIXyyo7G8uhLjS64tYJtTqnYlfVjzjwFZ4hrVqYOT2/94fEIAPIGCIkNUQIiAkNN99vA0+5oB
	XoKvDPPqzKo4CTT3SXAL+VrUYsHC3TYmy5pdpS/STdBU7HstowkU+BVq1ehdUdoUg2cCV61tN20Sf
	Gp2Vi2wHEHaUipwzAkETBloWmzSg4C6AFeekBhc1dXvGY2KqJFUIxsVbWwy26axpvfiWxKx/SMvrb
	ftAo7L9Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgb-0003M9-3Z; Tue, 07 Jul 2020 18:51:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgT-0003HQ-T2
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=Pb7yJ2EqlsW5LVSayzxztZ7FRb91krZys7ajxSNwU64=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=oQOQlrGvzNW4B28kCs2bdPecNJabsS4lvaHgxlkskCxDiucPCN0oWMSK/meDv7SdF
 3MqTcJqoRRW6eGMwxMytkOwqfNvwM3oYe1dCZO53XeU8a0nKKiSu2wg/VvELCuww+v
 SlLsO0iD6K6i0o18Xw7/JGcbYXuTIGZFmNDcGYxM=
MIME-Version: 1.0
Subject: Re: [PATCH] mmc: host: meson-mx-sdhc: fix building with
 CONFIG_MMC_MESON_MX_SDHC=m
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787219.3387.6581875020552581715.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200518060811.1499962-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200518060811.1499962-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145114_167730_C4B3B0BF 
X-CRM114-Status: UNSURE (   5.41  )
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

This patch was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Mon, 18 May 2020 08:08:11 +0200 you wrote:
> For an x86_64 allmodconfig build Stephen reports that building
> meson-mx-sdhc-clkc.o warns that MODULE_LICENSE is missing and when
> linking meson_mx_sdhc_register_clkc cannot be found.
> 
> Compile the MMC controller driver together with the build-in clock
> controller driver into one module rather than using two separate
> modules to fix these issues.
> 
> [...]


Here is a summary with links:
  - mmc: host: meson-mx-sdhc: fix building with CONFIG_MMC_MESON_MX_SDHC=m
    https://git.kernel.org/khilman/linux-amlogic/c/67c7daec6981d9b15ba85018b20ff8bcc3bcd193

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
