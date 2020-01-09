Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D33C4741C
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6962072A
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qv3kHQ2P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmnMceOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6962072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpivpzcoQoqnb9kcIblVQZp12MXOtCyN9YoLMZF2ubA=; b=Qv3kHQ2PNkumd9
	Xk7jS4rW6fSMgybOJWRf3ZOsFG9hFpd2tAjD1p9Qq9Q7NCHaqIkEEAnbfN4u8yYqI+Es0bfSD7mxn
	Fi6zmLpRnbkJ30XWKge0XijO44uoK0y5oYCcl8s7/zWQEjnbGQSbfRB/99N4wiimvjg/dFViqVUeC
	kSpuG4KHNtoFnaejhSFYCsWnraidI0uwbqyEZxGLdHQkYvYqH3+6YS3kK0PLCFSJmDla+mIiddbDA
	dmcA/nfqgNOuUFCbwvp0NO3SuDt7TDMVGiKmW9ZrbHXYHhD0uBEEhjCWe9AuEQ5M7+JVpw+2UG3RN
	Q580RXx41V1v/ih50KEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcQc-0000Jm-RQ; Thu, 09 Jan 2020 18:21:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcQY-0000El-Pj
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578594062;
 bh=4S1/mPcT9sj3PDqO9xGv8ooD0faHzWZzx47ypuO42uk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=KmnMceOQNfEze8kByKHbXc3/EKoR5CnPnuJwHLaSI5nFHQfXV0M1wRBBXkS60lvux
 zuaug6ykj86B615j83nbuCF/K6injZP2gx3X+1bivPy3rCDAlv6/Dnf0VwsBLAPIdS
 nRMbzobgd8FD78DAuK/DJfkFLYNISY28RQBbxDMY=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: add audio fifo depths
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157859406212.9795.5438356062946963503.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2020 18:21:02 +0000
References: <20191218202452.1288378-1-jbrunet@baylibre.com>
In-Reply-To: <20191218202452.1288378-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_102102_859251_5A154DA3 
X-CRM114-Status: UNSURE (   4.59  )
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

On Wed, 18 Dec 2019 21:24:52 +0100 you wrote:
> Add the property describing the depth of the audio fifo on the axg, g12a
> and sm1 SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Hi Kevin,
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson: add audio fifo depths
    https://git.kernel.org/khilman/linux-amlogic/c/be63807524ddfd4c2e87ffd6cf2de8e7617d4832

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
