Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1492DC433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D5820758
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zpjDzzLn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zpymFHdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D5820758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cYAfviIR38lbzeOXJmcMMEyiUUk1A3GAGCQm6IQw7W0=; b=zpjDzzLnuIOm+wrVVvD6dXNAx
	iSvLqiZfFHubnUN4kiu6ESMWuD5EeU1rNDBb86L7XywpWYoqSw44Rw0f9u6kQRSXZC4Go1B5KH1dI
	of/4QRX3k4f9Vk0IyeTrbvou7T71wu13h88WD3tU1K/O3Xye30/0BIee9zqGCbIpbB1T/rU7LU3WG
	XnfCYpUPD7/gKZ0Rgr3Y6BGZwUwIAii3NLiniYo5DqEG3SDnpyCR6GlnwsUIWbITy44FfJchoNNhI
	RFQ19UA2PVTpHr3XrKUKctgBzbSOVnOG/EjDG0hmOTpjrszlod5R/4eWI261+bpeSqzrmfyNJCGPl
	Tt+kUxIQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFs-00028Q-Sf; Mon, 17 Aug 2020 17:49:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFg-00020n-50
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686533;
 bh=cHmruRMDYAxnkUFAjzAOrRQBO5GLjtzvqUCFZvmeAyM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=zpymFHdPqiYLwA/K4R3m7v2rQpABLfIJYXqY2aipD8pmngD6Yz+XxQFcoFx9ir6uu
 +ImMp8JM4qyfTOn6ZSNk4h/IeoanHjy3jx5q/j1O2d6TaanGrzBfQ78lZSyH0LpOC2
 uhqYdvhbNWqyP7Lip4ROXYJRhoun5GbrH3xnSUC4=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] prepare dwmac-meson8b for G12A specific initialization
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653391.32160.5715609955586979731.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:53 +0000
References: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134856_388315_A96570A5 
X-CRM114-Status: UNSURE (   7.87  )
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

On Sat, 20 Jun 2020 21:26:39 +0200 you wrote:
> Some users are reporting that RGMII (and sometimes also RMII) Ethernet
> is not working for them on G12A/G12B/SM1 boards. Upon closer inspection
> of the vendor code for these SoCs new register bits are found.
> 
> It's not clear yet how these registers work. Add a new compatible string
> as the first preparation step to improve Ethernet support on these SoCs.
> 
> [...]


Here is a summary with links:
  - [1/2] dt-bindings: net: dwmac-meson: Add a compatible string for G12A onwards
    https://git.kernel.org/khilman/linux-amlogic/c/3efdb92426bf479aa87d38a55b66c81d2a60f41b
  - [2/2] net: stmmac: dwmac-meson8b: add a compatible string for G12A SoCs
    https://git.kernel.org/khilman/linux-amlogic/c/a4f63342d03d2dfb61d9e52f30d084d0780aaddd

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
