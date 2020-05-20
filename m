Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5B2C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3291920823
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rd8q5Tam";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTc45IyX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3291920823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+2sfmY/bd5xdNWZemptNckqOmnbQ+yMLdyn3P0b2hU=; b=rd8q5Tam3OZ95M
	rWqDoQc8Ptg9czCiKgZ0ltJodJ4qPaAs/gKEFSb3JxOCgKgGpdSJQF5LnfptP7z/UxPe7BAmWrxYC
	i+DcLJJyGAA4Ms0a9jAckoLsCb+Fg3rCaKbAjvUJtBZV294akjNNpe3tQ5vWsrB8+cJXWBVjeZNYr
	ykRtFMkCX/yglKuXZuqPNkGlQ54cGwYgx2b45lF+UtOSZSTcUIC9HU+i/HBme+mqPT8svY4EO+Jy9
	isfgYiXEiYVYht8KIAPkoIihr8oA0QqtfNdHa47J8qOsEoCc6C3pku3WpvcODkGy9TJcYlZTHXUCf
	66DfVIAhrLjbbfj650tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCB2-0005co-Th; Wed, 20 May 2020 00:01:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCAt-0005SF-Mf
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932890;
 bh=kYu4/iz/3N3FZRCch5utGPOBLZ0KdGlza00NZtn0aD4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=bTc45IyX4W5P9wd8LrHGDa0bI3HtqpclmWAXJAwnzECB/556VI61QS6fZ7FKJ+/to
 9w2PDibnHl3Y7UptxUXS1APWmg1wyBxrT1Ala7Zr+enhaOQJ39Ls+wkjgJ+WHHOlsH
 s76CvUdNlAzkwTzoDezjYja7hK4iwj3Z+ls0aJJc=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: add ethernet interrupt to wetek dtsi
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158993289027.29142.12254982476025567545.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 00:01:30 +0000
References: <20200518025451.16401-1-christianshewitt@gmail.com>
In-Reply-To: <20200518025451.16401-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170131_790556_88E2E73E 
X-CRM114-Status: UNSURE (   5.42  )
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

On Mon, 18 May 2020 02:54:51 +0000 you wrote:
> Add Ethernet interrupt details to the WeTek Hub/Play2 dtsi to resolve
> an issue with Ethernet probing in mainline u-boot.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)


Here is a summary with links:
  - arm64: dts: meson: add ethernet interrupt to wetek dtsi
    https://git.kernel.org/khilman/linux-amlogic/c/647e1643d61312ce08172e466fa1c8d8a5c8fbc8

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
