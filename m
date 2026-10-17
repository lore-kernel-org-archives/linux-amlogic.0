Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A996CCF2C7
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pa2JCbV71ZBhab2uZVEEUSdn6U5gQ751UVLTY9Dg7kE=; b=4XL3ru+J3G+8sD
	CN9BzbgIuiY4MMx/VHsgMnUbS0VTyP2CSAaUKkzpHh2c4SDD5mTEX26+Rg4CvJBlpksjnPOam5XpA
	RNRnYvpnbbWGNhV3EaulFqCmUs+j+6t/TAw1hs3HW3Fz0syR1bUtocxFr5k81eK69x3GcggnH46qI
	4T4asm0g9mTXmo/9I/qjHhMTaPsVdLjFT2jXzQndOUpNTpdu+WRd9w2DhO8D1nZSritOMt8PRTb4M
	a2Ja1sY4Tnc3xyqGIDBDVE79BI691S4P5Q8DWl1SyrI6l9M6//tm9XnqswAsTMvlWc28uoT/piwLb
	G+gZdLClFfDWMvfPCYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI197-00000004eeh-0NvS;
	Sat, 17 Oct 2026 09:56:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI191-00000004eeF-23ub
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Oct 2026 09:56:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B8C3402CF;
	Sat, 17 Oct 2026 09:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6C71F000C4;
	Sat, 17 Oct 2026 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792230961;
	bh=TkCfXjStqGW2jteRUK095mzfOnn48uimDZyVFl0o8ZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=axbJsIY/VuqAYJQYbPV3Rt6qYcYOrghbmItDrJa8rK0OWqnAoitTZkpAfVTE/J/0p
	 VB3Wxg9bTo0ArW1Eq3jVc3Xkl8EEn0BK3a0dnKgqJwiB09d6yHh9Bza0PJvjRstA/U
	 Rl2gPeuAwzNR2elXdL/j9buF703lAnhM6v4F9u5nAfRpOc/et8UWNX4gjQ1Po/a8Yz
	 s03FPBmPKm/FKqo16mHMBxveA5SWTX+eD+DCtWQVJKXCy7/p7N/dhWKQHuIpdA3j05
	 1s7sXxIOE9oKTbGnXYwH6Pop56ogcXI5f/0vaJXhCNVQRqI+Y4hT3O1g6sFAP4kSQA
	 a+ajdQDwxoKlQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Message-Id: <179223096443.840866.16372529405826771559.b4-ty@kernel.org>
Date: Sat, 17 Oct 2026 10:56:04 +0100
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


On Fri, 16 Oct 2026 03:00:17 +0000, Xianwei Zhao wrote:
> The func devm_regmap_init_mmio() only returns an error pointer on failure,
> Use IS_ERR() instead to make the intent clearer. And Fix the following
> compilation issue at the same time.
> 
> Smatch warnings:
> drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'
> 
> [...]

Applied, thanks!

[1/1] dmaengine: amlogic: Fix regmap error check issue
      commit: aff5e6a77fc69a7c490246465940d18422d7c631

Best regards,
-- 
~Vinod



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
