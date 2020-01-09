Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C49C33CA1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D220E206ED
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZA1HZJI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UORIG1YW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D220E206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0F2NQ8uWXdkAP+qMKhvfr5n17ABjtwoOHSdBvYPIoBQ=; b=NZA1HZJICgMMta
	E86ZX6CPx25tzTm7EHQha98ep8x1Op2yYGOSL7tq1jgVpRT5KZikRTmyGhLVNFiV9MMdm4PE5Nhy2
	XusEt4XeQzehMlNX7xPtv7RNiMwGGRiKBAGjHbd7iSmnc4GR2MNMbDkFVccKteeu+8W1TVylbeZ+f
	2zFYz3TKsgN3B6mnccyIq2ECeQ2hMmGaCKHBaAji1BGRhjP1BX2ApMHDaag4pMIRc4sDqGQBlHkLl
	mcVw6dL3XuulZLJu4GuPXNM3bzW0zWbkwemhKwoM9HMbrRauQ/oCeFPaDUpaXejhwyXzPYEL5ghL/
	dtpFoGsLOCk+k3jhfZ7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcQc-0000J7-7d; Thu, 09 Jan 2020 18:21:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcQY-0000En-Py
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578594062;
 bh=AAoTlE2x+YzEkorvJ3GZARctyONByUIpHQxnoHCqy8Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=UORIG1YWBKPQn03iqq904hv+aKFDosHJy4TlCTcB1K2QTOoa8sYvIAs2tu74s38la
 jUr8m2UUO6i16llMh58IXnedg3bIhsB2LlOX6AWnx8OGrpqCPaYRs4T7iUwCA/mOVH
 1oiOJ1iN628P57pueqhR8Am+5lIWDJLW2rB5isgI=
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] ARM: dts: meson: fixes for GPU DVFS
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157859406249.9795.5041642377887714770.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2020 18:21:02 +0000
References: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_102102_863950_409FD395 
X-CRM114-Status: UNSURE (   8.61  )
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

On Wed, 25 Dec 2019 02:06:04 +0100 you wrote:
> While testing my patch to add DVFS support to the lima driver [0] I
> found one bug and two inconveniences with the GPU clocks in the
> Meson8 and Meson8b .dts:
> - the first patch is an actual fix so the two mali GPU clock trees can
>   actually be used on Meson8b
> - patch two and three are to prevent confusion when comparing the
>   frequencies from the .dts with the actual ones on the system
> 
> [...]


Here is a summary with links:
  - [1/3] ARM: dts: meson8b: fix the clock controller compatible string
    https://git.kernel.org/khilman/linux-amlogic/c/da256557441700d4f3f95c6e94ef57794acd6bfc
  - [2/3] ARM: dts: meson8: use the actual frequency for the GPU's 182.1MHz OPP
    https://git.kernel.org/khilman/linux-amlogic/c/fe634a7a9a57fb736e39fb71aa9adc6448a90f94
  - [3/3] ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP
    https://git.kernel.org/khilman/linux-amlogic/c/c3dd3315ab58b2cfa1916df55b0d0f9fbd94266f

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
