Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED67C38A2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192712223F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nw8IzW3c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYOr0DqX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 192712223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGr/ma0WkO10LRJmtQGgTp6SW2hDk8MIoXCYA3d1Kxg=; b=nw8IzW3c/N+uT3
	XiRT1tG+cC0y6vS0fQTN3B8UGVoSfWcKQdOzirAZwmrw+/tetYd9TqaQcfNUN+BXwzQx01/xiMzCZ
	htcfNVhbGyq+BqLq+9CI/P3X1XsS2pT3j2EvBmB9YHRL68yaXQ7rRdS8X3m8yC6SWug6VyNJs+CBw
	Ur/QRqEWiRPUPSKTvBOOHbtzfYN6c9Q042sVrNCd2n3Fyh4i7hOHam+DGs6a7ZDCvnUczM4SV1j41
	UEH3X1LJpf26taQyyC373gknBVPcwTkHQh0ujoK3h96NLkedkABr2hgGVxUqE/aK9VxlTcB+/984E
	sdTL5/nCnzB1k9SV8uhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73e-000851-6D; Thu, 16 Apr 2020 16:08:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73X-0007wt-Iw
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053279;
 bh=26saxJBCh7jWjx2b0sFwywCLhAPLYPIswfHmt0TSNK0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=lYOr0DqXcUPicUQnxKeVbV9CQOmxT0+uQtOI7A725D6OjYKGlp3M5kuE9/ML+zLTs
 cGxR9FlKvGV2xRxDTvwYDDhiM/2DcEb/gCEbXjCPWn/UcNGlW/Ij1N4uT4w/5YS7Su
 sz8g08va5qsc8YAWBRf3MDCRYdzirSP3AuePEWig=
MIME-Version: 1.0
Subject: Re: [PATCH v2] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705327923.8629.12866723834756541229.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:07:59 +0000
References: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
To: chewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090759_652950_8B5755CE 
X-CRM114-Status: UNSURE (   4.92  )
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

On Thu,  5 Mar 2020 07:07:46 +0400 you wrote:
> From: Igor Vavro <afl2001@gmail.com>
> 
> Add the tsin pinctrl definitions needed for integrated DVB hardware
> support on Meson GXBB/GXL/GXM boards.
> 
> changes in v2
> - fix ordering and numbering of uart_c ping flagged by Otto in [1]
> 
> [...]


Here is a summary with links:
  - [v2] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
    https://git.kernel.org/khilman/linux-amlogic/c/eaee5d9f203141496a7ad2158b715dda67c074c8

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
