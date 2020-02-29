Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E12C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4C024677
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eo1IZuT9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlKM5a+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE4C024677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYyCLc8G264CNc0b8FYEz1CiC2e8AXPJ0XHQvFcMCLY=; b=eo1IZuT9Zi2jjW
	qG7viOfwlww/0gjCTE+wMIRphSQ6PU52zdTuj1XCUlZwGdecpq0TTwO2qeSIFrCN2d34zSTXYLLWm
	iHLEKs4PINFf0kCefpsacANmjiYnJbmb+gvGfuh5beRzgNOh65OQndYFT8rJJwxtZQ7OxpGGBe52O
	7vXbg5b6Eld0Lqq/2AKtTuFxsDQdk2zye1eF0UtOYijyBm6zhsQEoXdUgPfzs+4q40tj2xvX3g4XW
	N8YVS69HyxVhXhzK97pa35Vq+j5HUACh2aiP+rlT5UizIBSZh/48vD+TUBLefdd9Y7mJpDI6LHwDt
	5mJh3mEevGHUR4za5voQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j86kN-0007vJ-IW; Sat, 29 Feb 2020 18:21:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j86kI-0007r4-3V
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 18:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583000509;
 bh=6K1xKAd1BbQf0sCF7d49dSq/B3CixGK7aE8tTGB1zLg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=DlKM5a+01ehVOK1G3MlowHZujJOu3OJ85bbWggh2WujvHAdHdiySpJG5cj21YqnMo
 rFw2pchyU8AyWm/WdtrCuWSQ5p5KP+J9rpWF+TRVY69wEofBUQUH7ljkjpA5jdcWCJ
 +tUlGXy8eKMQD1bJaCLajtg5/xASrW7NcV6FUUBE=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-gxbb-odroid-c2: add rc-odroid ir keymap
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158300050945.2726.14875556307760847678.git-patchwork-notify@kernel.org>
Date: Sat, 29 Feb 2020 18:21:49 +0000
References: <1582213085-11656-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1582213085-11656-1-git-send-email-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_102150_158956_0261FACF 
X-CRM114-Status: UNSURE (   5.21  )
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

On Thu, 20 Feb 2020 19:38:05 +0400 you wrote:
> Add the rc-odroid keymap to the Odroid C2 device-tree.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
>  1 file changed, 1 insertion(+)


Here is a summary with links:
  - arm64: dts: meson-gxbb-odroid-c2: add rc-odroid ir keymap
    https://git.kernel.org/khilman/linux-amlogic/c/67c4dd59fe9f8c0d3f86e170cd20f1ec55660feb

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
