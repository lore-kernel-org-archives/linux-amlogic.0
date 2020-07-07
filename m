Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B61FC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB5B206E9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+k379Nk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF9J1Yu/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB5B206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QonqCyreIXc9ZTPD4tTJl9YfQyvQxAU4FsNABsz6fvU=; b=s+k379NkQ5VjSFm96Q5oVHCz5
	vyE+SloaNSzQ8rFdEOHnP59+pStPbdHmQmKg0tn1H1skC6DIDJHOs+rwk5cx2j7jr4WFqOZPxAXkQ
	Bz0NWoiCtwNbRHWzm8p6UeBcgYkrJrZIg8CvSXk+LHSg67kEwCdUisBSLpyy10CLUFQjrPtOdGLFz
	Q34/rzHug+OoaTlXCRbNnrB1oiciJ6zv3pF3S6Jg6k5wmCWMK3zDDnZEzplZ0ZqlqcKBeN8iolQrC
	uZ09RXYkt0jMDt9Otji+bifzMc1si8n4H/aTkeUH+R98+EzqFwzOYqgeoXrAss8lCcTLvwIDQ1cVp
	2bbbrxJ/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgc-0003ND-Cy; Tue, 07 Jul 2020 18:51:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgT-0003HP-T5
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=lijwxqYO/assnfZPRHiNqqNYZRJ4M9R3TmFRegsvg2I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=BF9J1Yu/OzvmBngF/qwMnKht+GUyDrLyGMgcS2qZsoPDvY+rLmeBTT/2IdJY2xMeG
 09EiKMs07TQ3r4oaitle/26PUq3xzfe8isYQA+2HOOcoCtkvyqStg8RlC/IIq0ODZV
 Cv7ib56iZ72qD1Nz+m+VAu9WptAHnVXFNTPjrVB0=
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: meson: Align L2 cache-controller nodename with
 dtschema
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787200.3387.1573895116274702314.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200626080626.4080-1-krzk@kernel.org>
In-Reply-To: <20200626080626.4080-1-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145114_201458_C7554996 
X-CRM114-Status: UNSURE (   5.53  )
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

On Fri, 26 Jun 2020 10:06:26 +0200 you wrote:
> Fix dtschema validator warnings like:
>      l2-cache-controller@c4200000: $nodename:0:
>          'l2-cache-controller@c4200000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/meson.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - ARM: dts: meson: Align L2 cache-controller nodename with dtschema
    https://git.kernel.org/khilman/linux-amlogic/c/54320dcaa2522db3222c02d68b52cfed32a2e95b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
