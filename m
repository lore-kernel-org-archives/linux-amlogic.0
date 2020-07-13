Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F916C433EA
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7171120663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxcf26WF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xcNV4WlA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7171120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vzl8UlLGlXpME1HlA2/J9rCbgzrT9LBn+/IeWmKqjUc=; b=dxcf26WFCGk4L59qaswLH34aD
	MFFk0GzW3tauMTz6tW0gc8BPLm0HAy4UNOigB3pT7TfXG6baMw3JZgsc0pooS+B2dNNAA2T3exMUj
	BnEW2pHBZ+0rJAAUghaTixxB1Yh7tMSBiIRyD0O1MOlUZpYaf5ckV8yqtXkCu1A/WhCl+ln5OgzPC
	5rOQAin/2dRowcsOVQjTBy7Bc5q2bzU2rPIC2mJfwqaGAeTIYg9eaZuUrgzLKuynv/W3HdR/q7NbG
	twm4tl8SJ+kdS5rgDh3ZAOJZU9uSdJTH6GtsK+BYnJ+SvEi83p98HmxAstXKHVFRWQVOfyX7zH0s2
	StLQLcTpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41M-0005ZI-GO; Mon, 13 Jul 2020 19:21:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41G-0005Ww-Up
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668100;
 bh=rcwIE8LOCVYDHEyk7BI3EMyCgMQECikthpZXt18k148=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=xcNV4WlASPUaDYBfx4WBtlhB7zj29iRdUwp57vSxYUhpsp5v4tcR7kRzcx9sk+hQv
 pxFmWWGimaQerVQDpHe0hAa/K6q9S+tfrKqKqJ7Z/ZjJc1Ynd9RZPjalrNNG29pYtb
 cSXF59ix5iMHgM9y1iH4rjnFVpv9KmOwUCo77064=
MIME-Version: 1.0
Subject: Re: [PATCH] mmc: meson-gx: limit segments to 1 when dram-access-quirk
 is needed
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466810062.23057.13090715805390676518.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:40 +0000
References: <20200608084458.32014-1-narmstrong@baylibre.com>
In-Reply-To: <20200608084458.32014-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152143_106702_2A9CDFD7 
X-CRM114-Status: UNSURE (   6.20  )
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

On Mon,  8 Jun 2020 10:44:58 +0200 you wrote:
> The actual max_segs computation leads to failure while using the broadcom
> sdio brcmfmac/bcmsdh driver, since the driver tries to make usage of scatter
> gather.
> 
> But with the dram-access-quirk we use a 1,5K SRAM bounce buffer, and the
> max_segs current value of 3 leads to max transfers to 4,5k, which doesn't work.
> 
> [...]


Here is a summary with links:
  - mmc: meson-gx: limit segments to 1 when dram-access-quirk is needed
    https://git.kernel.org/khilman/linux-amlogic/c/27a5e7d36d383970affae801d77141deafd536a8

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
