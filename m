Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC99CA5FF0
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCg2NPQGdFR1jzOjwfSMPlWbpZBiFpyjTuUUjioArbI=; b=FrSNnUmPFxDcsr
	+ny8C5rUJf650UqtPwf5qGUnsMAA4wyrZUpjHPyxD0tuXUuBN1L5dQElDkYcm6rfZmLc1hlnGngRm
	CyPK8bWzAQI3UIPj8vGUkdc81X5F1+PVDTs1rpLKOOCMyXrjmRsXDt89wSlmiipqkJFK8LqFzVrEO
	bm2hfPhFmJAUbXUZ5X601xUFh6e8bG2R64mxplh4UlCmtpcn4wU1lXRud7bhne8QDGqOg/9sr24AO
	Z8fzHgUgnfjuYHY7w39TwOlRK8N445BYEZbfZgXopQ3lfMymqbiZTnUL9PohSxJMxMTJGaNM9rGDx
	0czUOUx2gaXtvHNLRJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqO-0000000GmJs-0R2g;
	Mon, 05 Oct 2026 15:43:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqM-0000000GmIq-018u
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Oct 2026 15:43:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F9C260A9D;
	Mon,  5 Oct 2026 15:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F076F1F00899;
	Mon,  5 Oct 2026 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214988;
	bh=Q1Vfx7NrxHZYYW5wQYD7P1oRNFAFAgPBJklq3qG+Db8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QZ8VS3DlM0nG+JWTLc1DKFMUZcfUCJzceZk2H1N9tb5uP4m/xH6GS1DKTl/6q+0Xw
	 Rsdc3xKVZnMgeMbB+iCO1HnRnhRX/zFf7H3cC2TJB/s5sPJ3Rs9qt4cefXKoKIIlsA
	 ev7ZcFrqmwtmjyHnlVO7rDhJsuul/aI+oOoQtCVC6ifhFg9NtPOmtRFXAF7ZPDIQUC
	 fJ4kQam4r4tRpn7mOJz45gDnkFVpEIc+KAbBlN32G1QlPJgClFjzeZM0RSh2pnCcXz
	 Zd47isaxvvS92HMx2+x1A53HJFtmn4oPkimxfHPPxBK5MGqSU1pwNZ0XcA0hJ8UilY
	 mYFyRGyTc4ZIA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
References: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
Subject: Re: [PATCH v12 0/3] Add Amlogic general DMA
Message-Id: <179121498561.358863.6559293781501344071.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu, 03 Sep 2026 07:38:27 +0000, Xianwei Zhao wrote:
> Add DMA driver and bindigns for the Amlogic SoCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
      commit: 9d79e5efaf7b908fd3eea1a6afb34fc06dfa1d7e
[2/3] dmaengine: amlogic: Add general DMA driver for A9
      commit: b84b5197e344e2d378a9edf5d782b6fbddff8d06
[3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
      commit: a5b2763df36b5c8ca0927f24ee97d9617e4eb6eb

Best regards,
-- 
~Vinod



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
