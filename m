Return-Path: <SRS0=TX8f=BU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D5AC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:01:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73164206C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIX1PeXt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONQ6oNYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73164206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BMXfp+QZInada23J8m3iYc9W3ucGIndSAJrGA78ggAI=; b=HIX1PeXtpt4WGTvMuXE9oqdvd
	jLeqa2NucdjWEUyE11zr5k5r2j9ZZrBCGdjuRBcgWW/F0beDTWlYkR6C6A+QA4dSIMbYuWQ4my5R0
	cJKARD7o5VsIuUeoHx794G/jaG6VL22Y7FQnL2WXJcp4hitNy2P5ctM5dQukEmqGebXShlOkYTix5
	ILA3vK4YpnhPWy/wKvST4J6YEf4AHLn4LKMdbwdWsl8DfO6KrBeFrE54/UT4fh21YyCIAK5wRbdMv
	Wf4P/Rjn7g2nPRJSQNDWoXzKoKPsMHrq2LtMdYn9U6OkK7wbd8wPSrdvIYI6UQLiJIBBfvDdlpPIp
	47c4tF/bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5FrF-0007nU-D2; Mon, 10 Aug 2020 22:01:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5FrB-0007lR-7l
 for linux-amlogic@lists.infradead.org; Mon, 10 Aug 2020 22:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597096883;
 bh=tRJh1y083Eq2OMUBu5jOmVpTlleqwIBITDeRQVTe0h8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=ONQ6oNYhKphDObisiWWqX5LVy7YIC6suMAEGs1wckk2uH0dr8cPvLdYFv7yRqRjdD
 BrSejs3f4ADHfEjUTdWgh1N+9tUlE3G8oguPJxSGupKpQBuaPVjpKV0DpqDsUYnfCt
 Zessq7AiIng8WkpFiFcyqL+DgX2BHQYjx0iLZTvc=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: vim3: make sound card common to all
 variants
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159709688370.2036.12487936581720494196.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2020 22:01:23 +0000
References: <20200803142158.173402-1-jbrunet@baylibre.com>
In-Reply-To: <20200803142158.173402-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_180125_367092_C32F07F8 
X-CRM114-Status: UNSURE (   7.13  )
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

On Mon,  3 Aug 2020 16:21:58 +0200 you wrote:
> The vim3 sound card definition should be same all the vim3 variants
> Move the definition to the appropriate device tree file.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 88 ------------------
>  .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 88 deletions(-)


Here is a summary with links:
  - arm64: dts: meson: vim3: make sound card common to all variants
    https://git.kernel.org/khilman/linux-amlogic/c/7c9c06246cea90f6b0cc4fcfe28505832362691c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
