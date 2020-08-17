Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBE9C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626662067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEYWXs9c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEufvgpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626662067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=quEDO85LtanWPacHKbG28rCbAR+XedXeWYofuH8PUa0=; b=cEYWXs9cKJP5T5KL+95RXsuny
	JMfwegtXGrpyUedbvYzBx/yvPidSYkTEoQ4w6PUpOO8N16EVqofN1YaZnUzfwk2MDcVfOG6Yjd3Nd
	ehaohBkXKusrKc31my7jlH2CsUyeI6vmBrImZQMBcF+XlZ+JIiYmRDVHSGdBGNaP88t3WdhaC9IRZ
	ZOsqMd3A3QwsAIFMUZOO3I1ILUZ8Kg9prkKYvu5Pobr3QSqa6p5mASXorKH+Y2+87PrEag0of84yu
	Ah0LY+Km2CoBDixaEOWO0zkwFmr5lEXjVuQqvi9+EWZoGYXDhI5IypvFTcYsFmMAK0isL8F/sGi0W
	sBio1SXCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFt-00029c-Ut; Mon, 17 Aug 2020 17:49:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFf-0001zN-0Y
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686533;
 bh=W23vI2GE3zHJ0fggNCFWFqt2TTw/IHDzqen0e7YZrx4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=jEufvgpFgymq+O9u403XcnjI1IgIQ7lNNpJGlOk0aYNr2DlBKzLeOz6Eo8XHXq7lv
 orWVqv+eKktuH89rFvJgtJKhLTldCoNGN2Vq2gCKPQTf/pxFgpSclKBVkGWYNQQ11N
 N4f6TF4VRmqlNcT//3OBuSBmnUVz2RU67n1vfKno=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] clk: meson8b: add two missing gate clocks
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653314.32160.13850752189133999945.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:53 +0000
References: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134855_261905_C9133121 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, 29 Jun 2020 22:39:02 +0200 you wrote:
> While trying to figure out how to set up the video clocks on the 32-bit
> SoCs I found that the current clock tree is missing two gates. This adds
> the missing gates based on evidence found in the public S805 datasheet,
> the GXBB clock driver and 3.10 vendor kernel.
> 
> I didn't add any Fixes tag because this clock tree is still read-only
> and the HDMI PLL (the top-most clock in this tree) needs more work as
> well.
> 
> [...]


Here is a summary with links:
  - [1/2] clk: meson: meson8b: add the vclk_en gate clock
    https://git.kernel.org/khilman/linux-amlogic/c/e653b41131f60054dbfa0c7431613d6aeaee2212
  - [2/2] clk: meson: meson8b: add the vclk2_en gate clock
    https://git.kernel.org/khilman/linux-amlogic/c/2568528f55356a2f20f80a18244d3e235cbd2cab

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
