Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E21C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CB2A206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TokHurc6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQdDEgH8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CB2A206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hEYkpsuqv4g5Mjdq7V43U3tgOos2fasucQVuvVHWhZE=; b=TokHurc6DsvwHGV3iHdrIa1Q+
	+CE6vrZsXKtBjAuqrJgwEV4ida4RfD9zYTAH779QLLbiGxdHayTbzYa+Riy3SQcxUwILfRpXNzjbv
	Ny3PggiDxv9CUoelZqOVqtUdRyUsT2mdekTsnd0B3/Xfj1oKxmdJfh0ipQplQHDkE8dQof4zPaI4C
	QaDMsHUgs8EfdYZFinMOnMixAU7+lS2ALkIlyu3x3hA6HiWDs3beqnAFYKU+XaROL0RhTvMEx+qkr
	ut9qOhQfeaB3y0KBtxit5poIhUg5mgeIak33C5yHXriAxBj4TznMLI/RZoztIDAEMpxbWqWHC+yU9
	s9P9LenlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgg-0003Q7-Vr; Tue, 07 Jul 2020 18:51:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgV-0003IN-71
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=hx5vKnjzPxWSXeemOCiBiDmF3FDShc9Ou60aHZ9YZJw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=cQdDEgH8fGAIFTQbveb4OZnUqNPJMFczPcRYDU6HAW2ZuQqI31eK0gF9dgcGpYa6f
 Wm5qy2C8/i/O3ucrRMYUT9eUEI1KDGuNxNJPqSZr2emlnpZMV+MhVzY8qHnwWhen1X
 xLe+HZcBFde+Dfb+5Ku3ormOK3v3cTwnB7wVw9mo=
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/8] dwmac-meson8b Ethernet RX delay configuration
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787236.3387.7759493328432890658.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145115_516007_2F88718A 
X-CRM114-Status: UNSURE (   6.34  )
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

On Tue, 12 May 2020 23:10:55 +0200 you wrote:
> The Ethernet TX performance has been historically bad on Meson8b and
> Meson8m2 SoCs because high packet loss was seen. I found out that this
> was related (yet again) to the RGMII TX delay configuration.
> In the process of discussing the big picture (and not just a single
> patch) [0] with Andrew I discovered that the IP block behind the
> dwmac-meson8b driver actually seems to support the configuration of the
> RGMII RX delay (at least on the Meson8b SoC generation).
> 
> [...]


Here is a summary with links:
  - [v3,1/8] dt-bindings: net: meson-dwmac: Add the amlogic, rx-delay-ns property
    https://git.kernel.org/khilman/linux-amlogic/c/7af4c8451d80d0a8622483c27ab141a7c1a94573
  - [v3,2/8] dt-bindings: net: dwmac-meson: Document the "timing-adjustment" clock
    https://git.kernel.org/khilman/linux-amlogic/c/ee0b8e6d02186321be0ea4ec0fb2cbd35bec7e29
  - [v3,3/8] net: stmmac: dwmac-meson8b: use FIELD_PREP instead of open-coding it
    https://git.kernel.org/khilman/linux-amlogic/c/3649abe43251de4357bdd6ef0163de25f96554e9
  - [v3,4/8] net: stmmac: dwmac-meson8b: Move the documentation for the TX delay
    https://git.kernel.org/khilman/linux-amlogic/c/889df20305ffeae0a6bbd435761810ba658e223d
  - [v3,5/8] net: stmmac: dwmac-meson8b: Add the PRG_ETH0_ADJ_* bits
    https://git.kernel.org/khilman/linux-amlogic/c/c92d1d2311a0513d8f7f8311f5c2b1d7e78005a0
  - [v3,6/8] net: stmmac: dwmac-meson8b: Fetch the "timing-adjustment" clock
    https://git.kernel.org/khilman/linux-amlogic/c/e4227bff804fc77e2f78c77470d3fbd2d4a6a8d0
  - [v3,7/8] net: stmmac: dwmac-meson8b: Make the clock enabling code re-usable
    https://git.kernel.org/khilman/linux-amlogic/c/a54dc4a4904568fe2c6b2ba249dcc97612affebb
  - [v3,8/8] net: stmmac: dwmac-meson8b: add support for the RX delay configuration
    https://git.kernel.org/khilman/linux-amlogic/c/9308c47640d515d16e06a7fdf333c51a39c1b0b1

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
