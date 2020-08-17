Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FCEC433E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D662067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQPR9rnj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK5cv1XJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D662067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K7hsBDbr7/g9yaTsfXpHJSvnT/N0d1LhoQZDTSgIkTs=; b=VQPR9rnjldK+YWNVMMsCoIoEj
	lEhhBv8FCdXvPK7UnQ6cN33A67G27g6azgmBo1eLB/pRURTxadNVbFXC8RSwbLVjWKQfunCgqPymp
	LMMxg/XS+iAsQviRdXDx9dj83OEGrtU37zxhXqVHyX32mXZKsXj6bT2034kpNwsSUmCVGNnC6oQlM
	UUZz2TFwo/9UI5iVVCVOfmmAq/vH3yZIDSwM1gHdL6DIf45R7U4qLsgODNWiCpDwLfpf1X+CkZUfk
	0w0pdPAHttx5xECoZDYS3utW4E06DlKnuxdN/s2zZ9hJSN49BNUDffmF8KtKn4tnlw6pVPSc2k5cm
	XskCMMJlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFo-000258-8d; Mon, 17 Aug 2020 17:49:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFe-0001zK-U3
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686532;
 bh=pW479GvIFLYH5L4s0lx5PzJ/abdYHmCG2j5viCumNf0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=DK5cv1XJ98Yr8fSlE21xwthI4sL+g38u9+7P2WZpXEjbhSsupEqtueynN/eaqC9+5
 mXJ65CHqA4VDyWUUh1B2x1qFY6IYMBpyvJw0AlTjgq4z7dUYGW7gauXn5IIA+Nmtk1
 PJPkXdcnNQjD5yJDg0taBBKu46z6Cd2kxhCN5pMc=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] clk: meson: g12a: Add the NNA source clocks
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653276.32160.16306823391897161143.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:52 +0000
References: <20200610083012.5024-1-narmstrong@baylibre.com>
In-Reply-To: <20200610083012.5024-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134855_123917_A663D0DB 
X-CRM114-Status: UNSURE (   5.61  )
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

On Wed, 10 Jun 2020 10:30:10 +0200 you wrote:
> This patchset adds the Neural Network Accelerator source clocks present
> on the Amlogic SM1 SoCs family.
> 
> Dmitry Shmidt (2):
>   dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
>   clk: meson: g12a: Add support for NNA CLK source clocks
> 
> [...]


Here is a summary with links:
  - [1/2] dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
    https://git.kernel.org/khilman/linux-amlogic/c/df06230106e95347ec613f1707a704b04737c59b
  - [2/2] clk: meson: g12a: Add support for NNA CLK source clocks
    https://git.kernel.org/khilman/linux-amlogic/c/2f1efa5340eff9af36c9a7347bb97abd726128a0

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
