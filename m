Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8FBC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046DE20709
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="htHoRkWG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVQ5czmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046DE20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Q3o2/2XYoUYWlCtCGvzkPZiRQjjXXqKhMQsYqgds8c=; b=htHoRkWG063IFE
	9RWrIljex4MFpbPBMOXrgXQw/zk4XXfUqGase4ia0XO26IWc3kHXC2GwNBDwEeYw4AVT88KK3PB5c
	8xmdZTUYCK/nTtXyeEGROLh4KjaP4WsnajQaxh/eAnTUwcnrxNRh85rraWWXF+ykfr6dn4PAAM0+i
	8Cs/ok3bLo7OZjPbiUOGsJIFmlevBYNk1MyWrmLEajZwwn+4Mj2L5GOr8X5QZ7JjJYOwQuHbeh146
	xXKbUcd4MsyIx0zFvf0txmonEWOunby824OsUGDG2BmWTcz/TnmfyL70lBdUQT8N5u91GDph06ul9
	HdePAlH4jpxsU/grvZzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCAw-0005Vf-GB; Wed, 20 May 2020 00:01:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCAs-0005R8-93
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932889;
 bh=a1LsHya3ofEbhP/kfDaHrZSRWESaU7+1y1wrJoYbfJI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=TVQ5czmgrR22k6FWvY8LxQ6K2rMn7tAzc8hAkhx8Y5BB8rbFmu8eXXXSZNYWUWoW+
 s8XK05+OfbVkx4UhOJer76sP8tg7dwiTs/fN2wWqd1E8Ys7IiAbBRcqefO3pLQZTsn
 3SJqWdfKWriKelzePXDaci9RCZ/7fZW431bVGIf4=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arm64: dts: meson-sm1: add thermal nodes
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158993288940.29142.8049006002077258199.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 00:01:29 +0000
References: <20200512093916.19676-1-narmstrong@baylibre.com>
In-Reply-To: <20200512093916.19676-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170130_351109_2AA8139A 
X-CRM114-Status: UNSURE (   5.39  )
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

On Tue, 12 May 2020 11:39:14 +0200 you wrote:
> SM1 Thermal is missing and broken since the G12A/G12B thermal enablement,
> fix this here by moving the g12b thermal nodes to meson-g12b.dtsi
> and adding the proper sm1 thermal nodes.
> 
> Neil Armstrong (2):
>   arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
>   arm64: dts: meson-sm1: add cpu thermal nodes
> 
> [...]


Here is a summary with links:
  - [1/2] arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
    https://git.kernel.org/khilman/linux-amlogic/c/fc9eab4b4276481ab1625d56bde57a87d73987bb
  - [2/2] arm64: dts: meson-sm1: add cpu thermal nodes
    https://git.kernel.org/khilman/linux-amlogic/c/c30dd9270197d060dae9e6d8f0b7f7864341cb2c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
