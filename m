Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD81AC433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:21:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B9D20729
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0dNU3oV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiOYenH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B9D20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lTYTIf9JWt1hGY7RJvvGiboBtzXnLj34ky8N3TQGBQw=; b=p0dNU3oVDSYy6KtcVisLzo5Ge
	3hCwaM+u1IQlbyaxSgWr11i31pQtpVrCC2SofrK6pL4T0F4T8fKFeDflFjeGqtLdXMXiECIieWQJ0
	hJAUbzbVyXe32qI9FNq74aNn0sWjQR604Uxkfk5fIOfpacCd4nyUMVgbmdQRCQ21vbRaxRufWii1M
	PtGAFaqoGVU4PhBzl2onve9YMxSbzKeRV+AsoNJKCL7Na10KPJMWe3CFEABoF7/BcySNzsqx6+YAF
	rvqUPyQl00ewvo8//LW4xYgaKHaN4FgrQYrIYCRAKKbyvJAKkAXW29Edg79s4ZaEF2KPYc/8PDnOv
	WwIYK4bSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k08gt-0004r1-Ae; Mon, 27 Jul 2020 19:21:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08gp-0004pk-IS
 for linux-amlogic@lists.infradead.org; Mon, 27 Jul 2020 19:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595877693;
 bh=T/U6FriC5+Wmrs3XCdxTcVG5cMO8cvRSf4U4++K+xqU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=GiOYenH9RyA711b5p33BP4K/Okp9vKeDIWN7g009nXSqs1u4twTueOTHJCerVZNEm
 Fw4Z5FFBv9wbAx8fXqnwUQOIF2gIBZXQLwt1GRdFZ3iUj/0uR+o0nGKMENUW/zirSx
 4U61+r1weDiuKNlAyqvsntCZDDkdauDz7drGnr2w=
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159587769327.4970.8492967376665082145.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jul 2020 19:21:33 +0000
References: <20200721015950.11816-1-christianshewitt@gmail.com>
In-Reply-To: <20200721015950.11816-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_152135_772550_F8A466C7 
X-CRM114-Status: UNSURE (   6.11  )
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

On Tue, 21 Jul 2020 01:59:50 +0000 you wrote:
> Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
> tuning errors on VIM3 after a few hours uptime:
> 
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
> 
> [...]


Here is a summary with links:
  - [v2] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
    https://git.kernel.org/khilman/linux-amlogic/c/f1bb924e8f5b50752a80fa5b48c43003680a7b64

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
