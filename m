Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BB1C433EA
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32DE20760
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QLS2gfNZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yeAIeOAu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32DE20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PNdotCLjibjE8QNE67Xf1Ewzqxm7k9Mw6K41a4GPxi4=; b=QLS2gfNZC2FM4PAzsSEqYsFDK
	8S7Ry7IfxBoo0hTiSvyWblz56gr0NPJwqjWsoV3vJw+dZ/QWmNnmKFyEcPzVdTcmatcpx9XVJIoxS
	6lCquOqFOh6irOl1FE4tpbYv8V9PZGmV7TJDlmyP+HKPbRA6eoTKCcyyiML7uGJu7TdY4jmJJfmGJ
	4DglRvNrHOXO/a1i0S4qiY/mNbyCmbEvrONoGAPqUJDo6PxCJKEkFBDac07s3B+qOcsWmuM2TGJdv
	LszbtVVHFnClGddy7+3zNiJAkexPuxOn8ZFrZWQKaxNMiHMSWxaPZDrWqLO6Yi8gDvXAdMglGKJXY
	VtQK0zGig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFk-000237-1V; Mon, 17 Aug 2020 17:49:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFd-0001xX-6h
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686532;
 bh=V35d6ytH9djt1g/D7Ycmv4nx2tF1cdsMIFneyiiZ/pU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=yeAIeOAumSPV5qy49mYsRW2Ejq8jM6IUIKpk077f5YOTZrlbPBcu9zmrC/idH49kg
 VYRmJrRn+a8aPdsCjkaD2k9nJFbkthaj6Et8AQoL4pxSzBI1KBPoK5/275m9NF6YrO
 U1Xsr4jVLrd/RkW2ktq3kOHZ0PGLJxOzcxSdvBXU=
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] ASoC: meson: tdm fixes
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653199.32160.14174015330281741230.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:51 +0000
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134853_368788_2DCE70FB 
X-CRM114-Status: UNSURE (   5.63  )
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

On Wed, 29 Jul 2020 17:44:52 +0200 you wrote:
> This patcheset is collection of fixes for the TDM input and output the
> axg audio architecture. Its fixes:
>  - slave mode format setting
>  - g12 and sm1 skew offset
>  - tdm clock inversion
>  - standard daifmt props names which don't require a specific prefix
> 
> [...]


Here is a summary with links:
  - [1/4] ASoC: meson: axg-tdm-interface: fix link fmt setup
    https://git.kernel.org/khilman/linux-amlogic/c/6878ba91ce84f7a07887a0615af70f969508839f
  - [2/4] ASoC: meson: axg-tdmin: fix g12a skew
    https://git.kernel.org/khilman/linux-amlogic/c/80a254394fcfe55450b0351da298ca7231889219
  - [3/4] ASoC: meson: axg-tdm-formatters: fix sclk inversion
    https://git.kernel.org/khilman/linux-amlogic/c/0d3f01dcdc234001f979a0af0b6b31cb9f25b6c1
  - [4/4] ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties
    https://git.kernel.org/khilman/linux-amlogic/c/e44815a295a50027a9953f3ef62827d14631b96b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
