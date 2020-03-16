Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D05C0044D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 23:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB4A20674
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 23:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UlJjZSy5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+T+5X0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB4A20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lhm/j8iXu4d34sM9EIbHbwSsoiKC61H3nmU7H3k37u8=; b=UlJjZSy58YQ7dM
	yp3xRglcVu+9/cv32+hJ9eDtkdf9WeMs2mbnDKulBS1u9I1OhH3xFGluKZC1RGGc3FQeYhg9sP7R9
	7y++4f7+U+SU7V2/9eZ6ll6SMFXV40z9b8IVw9bw4XXml4Wmd0QcaBp3JVLf183B2XQSa5TXfma33
	uR8YvVT6/LP2YcIq2S+Z6SyhAyojzle0UrzTBSiJFb3FDr130Fp4IXi7ooiJWZyYytLW6jjCcXTm3
	IwlWtCebUhoNXnAxe41+33jnCOEnoPhg34fl+YsXZSxISvdsTZ/BVQn+Di+R9288jTbC1VEwMoRQ+
	eC0pJ1fVWbJPwBUm2E4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDyjV-0001WQ-4h; Mon, 16 Mar 2020 23:01:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDyjS-0001W9-ML
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 23:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584399674;
 bh=th0ARMECsvo10lei114jj/qtxtdBnXzZDiEn0vd5pWI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=a+T+5X0wik3KvVwy+PQ6/HSDvCj5KIzt1r9guzr6PKzSX/kKnM18vN5tInh1nWbQF
 x3/1yFm3YG9wn2DLdGOz/NtnudEro7qIdPnRib9V9VCJA+ztjEEAmnwD4KGmE6BPvb
 NVv+OqPkNOD9rUINbRWemM0OlJ2zd0QfxHPdSMlM=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-g12-common: add spicc controller nodes
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158439967397.30045.15693799554094854033.git-patchwork-notify@kernel.org>
Date: Mon, 16 Mar 2020 23:01:13 +0000
References: <20200313091401.15888-1-narmstrong@baylibre.com>
In-Reply-To: <20200313091401.15888-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_160114_752605_8200E634 
X-CRM114-Status: UNSURE (   5.40  )
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

On Fri, 13 Mar 2020 10:14:01 +0100 you wrote:
> This adds the controller and pinctrl nodes for the Amlogic G12A SPICC
> controllers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Kevin,
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-g12-common: add spicc controller nodes
    https://git.kernel.org/khilman/linux-amlogic/c/5fa86f4f72e049470897fef32cc785b448fcf42b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
