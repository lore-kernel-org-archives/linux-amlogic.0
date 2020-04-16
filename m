Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B6BC2BB55
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA86F2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qb9VGPg5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9NgH7KF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA86F2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHtLiaCQUH0hQ/ML4ykvIUzaLKGNoZ1kQInnbSY63og=; b=qb9VGPg5vclDMY
	Y9taPObPChvhjLCp/B5QR1AWDlNVg/3jC56zqXhBZYBWEqr7I+4r8OKZaAqo7la9BUuIwdx/1Ag4b
	KwZLL/wWGcFUPtIEo7YyjBGG0h6EEN0CkP/8F9Fbui8lSHwt2S3DWpwTEp42IMbjOrODyGBlegZj5
	opJI0uWEd/lbrhkvRDVYO2aGrUDzHuMFqqOX8hjJahz7+XagpCcjo3EgEFZGqTZxCZ9hQBlIrK1K0
	dz8gvI2vNs/VS1YZ9bLvGNvwmrA2HVbQZjyEJXxdzkhpPi9fbU31KZAsaxFbUuskXY8D2dl0XnXgy
	I0SeswqQU3bxDjhKqXjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP742-00009H-U6; Thu, 16 Apr 2020 16:08:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73a-00080M-V5
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053281;
 bh=IXyzSRXOnuXGa0qTYq084SV6xyys8iGrY1gsQXPbbXk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=p9NgH7KFbPWeVEIBUCpOxNM3XaTIKPEHXeIQPCakM3nytv2dahAvIUnnbksuZqQhc
 m1mMOrcg/H9sVIsENmth9w25XRQANjL5yIEmskE4JJWV58g75dQjFSfDqVBXIuFgCn
 ufJYK3+ccM3gSPg8h9pQtpH3YyCvZ97m4w7AvgTM=
MIME-Version: 1.0
Subject: Re: [PATCH] clk: meson: meson8b: set audio output clock hierarchy
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328106.8629.14599909936484550805.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:01 +0000
References: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090803_089397_E15B7125 
X-CRM114-Status: UNSURE (   4.47  )
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

On Thu, 20 Feb 2020 21:44:33 +0100 you wrote:
> The aiu devices peripheral clocks needs the aiu and aiu_glue clocks to
> operate. Reflect this hierarchy in the clock tree.
> 
> Fixes: e31a1900c1ff73 ("meson: clk: Add support for clock gates")
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]


Here is a summary with links:
  - clk: meson: meson8b: set audio output clock hierarchy
    https://git.kernel.org/khilman/linux-amlogic/c/71202c412478d6553281726a6772d0d5510c42fb

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
