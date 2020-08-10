Return-Path: <SRS0=TX8f=BU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068F5C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA112206C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ORTeFgBB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yoTOYXpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA112206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K29W5jZ8EJcf0a3vRS9p9HFw4HTWr52JS5EeJUuwHiw=; b=ORTeFgBBC44VIX6RzWGgM/fKX
	IynK09vL20Sku7FTxEoqJoNkpWIKhm2VDyK/zcwfW5qrz+2f4IjTuUT+Ej3wxEYsQ52uaWvpVKS+J
	B0+7kWg5HMV4U/25+T/tsqdnqqNtQll3r6YGWb5YdIXdAxC/EH35IZ/rXiPr/tfJ5jAYwPMwUNhkj
	lKiVCdUOphZaaQavx7H1xfro63fnWFBITx7f3ev30fy11ropOzQHih45gEMIJ4Bi1Q/3lecm/vJ94
	pArcmFPIZjUKfQm86LXdtRw3GDh/M7NlNDkNTBPyMn626/1OWN3YDBPTEqpxw3Ds1bwPQ1aPSRIKI
	jPQ+UXlWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5FrC-0007mX-T6; Mon, 10 Aug 2020 22:01:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5FrB-0007lO-69
 for linux-amlogic@lists.infradead.org; Mon, 10 Aug 2020 22:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597096883;
 bh=UekLpdqhTzmUIrzfb7upAgcTVLUh/G1pVC8gQFgXysQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=yoTOYXpzXCBBWBZySabxeK7kjASPxtxf7KdFuNgjQjWeKmk1Jn74K2knMKAu0Pgdo
 ZHns9GcBc9L/P7gFQOd3h+Hz7P4yqgrnHQwrWNCUHI20Kip+OSlrUmiSW6R56FJcJo
 MBCM8SZiprcJEPbBVoETa26aJokmp9klt7Ckn4QA=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: vim3: correct led polarity
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159709688351.2036.5757019832023563982.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2020 22:01:23 +0000
References: <20200803141850.172704-1-jbrunet@baylibre.com>
In-Reply-To: <20200803141850.172704-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_180125_319888_0510FAD3 
X-CRM114-Status: UNSURE (   8.46  )
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

On Mon,  3 Aug 2020 16:18:50 +0200 you wrote:
> The LEDs on the vim3 are active when the gpio is high, not low.
> 
> Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Here is a summary with links:
  - arm64: dts: meson: vim3: correct led polarity
    https://git.kernel.org/khilman/linux-amlogic/c/1f9d87d08e4a2299e86f8a1600aedf87ecd3b636

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
