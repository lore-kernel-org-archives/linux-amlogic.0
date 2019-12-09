Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FD9C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 23:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40509206D5
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 23:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TMPQgCkq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOldM6XD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40509206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVZtKSi7wCHOj4dzwJ6DY74VYrf3vQyS2cTV83vbjLY=; b=TMPQgCkq3p49cN
	RhIBwNCVWhZM8G6jxlkR3RmmcPWz06vXHVZSz6ALtoogjj7RXpvlV9W9SObn6V25YZoph3rReScV7
	MqTOjTBiC56gVnTy+rcQ1AJobHwp1WsmdnxJU7WfZ7jat6C9L9RlvDsEv6hAanu3Oci9LQJnAN1vW
	zeNTFSD0O2gkexkgSuCrQjIv+OPGJHAHxly4zPt3lovzXx/If42TkKzGfVC/n8jKyInCmalvoyGei
	MoFkQVzEXdMeUwmoDSV4MsR+XBPM14b7ZtJG1qZcw+/jkqYFA187H43ep1MnkrPJ045yLOnnclClv
	Kf8RAQWOahha51kBsoBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieSl1-0002df-3A; Mon, 09 Dec 2019 23:48:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieSky-0002cu-2j
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 23:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575935279;
 bh=sVX/iY+JUk1aHGcEEkgEUITs85NYKDtQkCx4K/ifuyk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=aOldM6XDw8zxU9L6PxY7vqha9G6uy+RY9ozZ1FD59+3xz+lNjrrPpOwXFt+fB0SHM
 uWE2WxSV2d9tj7mo5pXH35Bcdea0zXfpV1iyR4cyDW06ZzrxuhJldjhJ1rbOGqfrhK
 wLx98dJYIciCOsn/VX4mW1Pr1DOBY7zlAuFbQnzM=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157593527947.1710.16986687500752563574.git-patchwork-notify@kernel.org>
Date: Mon, 09 Dec 2019 23:47:59 +0000
References: <20191205131900.2059-1-glaroque@baylibre.com>
In-Reply-To: <20191205131900.2059-1-glaroque@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_154800_143108_F549BCA1 
X-CRM114-Status: UNSURE (   4.70  )
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

On Thu,  5 Dec 2019 14:19:00 +0100 you wrote:
> add gpio irq to support interrupt trigger mode.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> hi,
> 
> this patch depends of
> https://lkml.org/lkml/2019/12/4/644
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt
    https://git.kernel.org/khilman/linux-amlogic/c/30388cc075720aa0af4f2cb5933afa1f8f39d313

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
