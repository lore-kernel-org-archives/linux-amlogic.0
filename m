Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A851AC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ABC2206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MSTMHBBz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jroKBF/m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ABC2206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4cbiE7/laNwaFTm3fftAb1bVbGOW7PbVm/ddyEAmm4w=; b=MSTMHBBzf9ITtkwuHwXxzqg+7
	HYejidKuuXUmPNHfNlNLX8EQ2mpJNApKrG/zSQ2LExgyWM/uIz1fgt6UMgWS+3RCMbwUa+l0yBNf/
	QTdbzYBMQ9yFEZC2K7+h+XKuX/JZ/TqT9edY+FOVhEu6CCXJd2JTSVFiBwIRlotUNSjRe1CeE8x0O
	3EZoHWR7/TxDTud+wVa2F4MCE2wjRMetz7I8+KwkJ/A1Du3OEdoGQzXTXjqrw8XexeQX3YN7P5KnS
	O/OyICwccbXvjVYYogy/9VaH+HUdX4lF1+S3ETleLZAkojSt67xJUFFyRwsVFxIZxchW/wJXD6x2D
	pZwHDXQdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgd-0003Nb-0u; Tue, 07 Jul 2020 18:51:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgT-0003HL-TF
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147871;
 bh=Kb5Aur2Uc1U3cs5mqSm//5p2TW6v4+wc6kj9Lp9oDII=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=jroKBF/mUFAnEFBWZiiiR0LPvb1emC7SnSyZd+noQUlD5oTGk1Dv9u1GJeWrsLdhY
 EBGer2Nof4k/kYW+PS4b7RyWipDh+4JoyczEUozl0jbOSCI4BMTwMUotfTmw/ma7Xg
 uEGsSqZU9kB12CYj5bdLVJ0HBLd93+hi+xRfj9R4=
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: fix memory leak of links if allocation of
 ldata fails
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787183.3387.5104845479572791462.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:11 +0000
References: <20200604171216.60043-1-colin.king@canonical.com>
In-Reply-To: <20200604171216.60043-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145114_209906_6C22AEF7 
X-CRM114-Status: UNSURE (   4.77  )
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

On Thu,  4 Jun 2020 18:12:16 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the allocation of ldata fails the error return path
> does not kfree the allocated links object.  Fix this by adding
> an error exit return path that performs the necessary kfree'ing.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]


Here is a summary with links:
  - ASoC: meson: fix memory leak of links if allocation of ldata fails
    https://git.kernel.org/khilman/linux-amlogic/c/6e801dc411329aff592fbd48fb116183d0acdb00

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
