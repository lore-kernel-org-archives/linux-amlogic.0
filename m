Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14DEC3F68F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 22:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC692081E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 22:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCH3b1Nf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uljlus4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC692081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3ZKgVrw9+jlHkTsKkvLSLv76fE7ZRzQsiHVKwWc+ac=; b=lCH3b1NfFOflbn
	gmh+8umPChtapZdILTc2+WsVOb1miAyHqaUho8QI6fXF+sixl/WrryKCkRhCb+Qdt4X109O1lx+HZ
	vljbjgJfcmqemRaNj3//NJPnmzGJSPeCJhMJ2HL53LY6PbLV6blP6EYhgRx9rU82ftZVkn5bE8O72
	xwX7f0YKqkKGpGtxMlfTKQq3472glOGvpA3+dJ140hhKEczyJsKdsVQphakFZG4Rk8n0ibsLPQQpl
	QYxQDPZ1GsE0q3zvqC7y+pk3Qv80vpR9dcvu47JbIVdLFVUD0rhklcc26TBySNL26y6BoguJVuQRO
	VjRHXUaqG5TqO+/ii6CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2je9-0001tp-Mr; Fri, 14 Feb 2020 22:41:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2je7-0001sg-5h
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 22:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581720074;
 bh=tDGi5sKDHgWOayiKB7wiruhnceHIKKjFY6F0+BxBzlc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=Uljlus4+QlDDRjtVt437Ps78OwiQeMRP17krl3gWPYgvp5M1CQ/iLK9aVJIPDYisS
 D+tIYVtPcT8NMJSTlZHxyXF2JCbbZqXHmx8uJzAhflyxIcAVDiG6TWaueMai+4zK8I
 MAsFJ/8ikCUKAi3nWROlbefyPjsn89gUQ8A8Kr7Q=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-sm1-sei610: add missing interrupt-names
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158172007462.10727.1754149476924944328.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2020 22:41:14 +0000
References: <20200117133423.22602-1-glaroque@baylibre.com>
In-Reply-To: <20200117133423.22602-1-glaroque@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_144115_229109_5E856412 
X-CRM114-Status: UNSURE (   4.61  )
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

On Fri, 17 Jan 2020 14:34:23 +0100 you wrote:
> add missing "host-wakeup interrupt names
> 
> Fixes: 30388cc07572 ("arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt")
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 1 +
>  1 file changed, 1 insertion(+)


Here is a summary with links:
  - arm64: dts: meson-sm1-sei610: add missing interrupt-names
    https://git.kernel.org/khilman/linux-amlogic/c/80a26ed452811d04b2eeaba0481a72bf00f97b89

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
