Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59800C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23EEC2067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zNo2D3To";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Bg2lHz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23EEC2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FeM1QfUtqS1NUfQsphjJG1N4X445OzwisBfH46IM88U=; b=zNo2D3Tot1LU/aGvu/Hx4Fe/+
	E32ZZM5hlVBAk/lQq3fUt/D4TMxl1gcsIdgHMjMGA9iU1WBL26foPJ7y1Ky27+MB8SbifNKKhy4BK
	NjMBpim2ii0TIP7Kc84t6XhMtmhhx+xQTtsPQklFRv+q9P9NtLz2shl5/NiW7Ef6AjZVM70JCz5o7
	tpX3XFchlN28TbOzSI/HzZ8UbJTGiJI81JZKTfVk1kx+yBQO/xOlIvCh3tYmvHaBEdH/y6qBMebDv
	DrM2KcGEMALPj10FLc/69sx0jdSFn0OmjIre5aNehPOEJL5m46UtFFoCxunc7YflEzeGT1IoEmaxA
	8qhduFvuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFr-00027E-45; Mon, 17 Aug 2020 17:49:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFg-00020m-4m
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686533;
 bh=fqVnfomUO0NnDTcrdv8CMuTopmrnBEbL/41Pop7d10I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=o0Bg2lHzv4Quc5ku/tKMzlEWiDef6ZKdyXidcTjfnweY95FQ4oC8CEGI+RrPruxyr
 OfTUWp9QrzEt26qM0t/gTueBsVTPBuhsM/Rpu00UMrGGrHReLU+iWhIs/APXLmJrJo
 vTL/ALb33e4mMz/rzyrN2ia1J9VDC2Hsfs70IRd4=
MIME-Version: 1.0
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: Common CLK framework
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653373.32160.2179593875518619766.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:53 +0000
References: <20200703175114.15027-1-grandmaster@al2klimov.de>
In-Reply-To: <20200703175114.15027-1-grandmaster@al2klimov.de>
To: Alexander A. Klimov <grandmaster@al2klimov.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134856_366316_42DF5404 
X-CRM114-Status: UNSURE (   7.36  )
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

On Fri,  3 Jul 2020 19:51:14 +0200 you wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> [...]


Here is a summary with links:
  - Replace HTTP links with HTTPS ones: Common CLK framework
    https://git.kernel.org/khilman/linux-amlogic/c/2a05eaa7523c8177514137f78dbb36155a5ed54c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
