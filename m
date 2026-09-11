Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94FC88E50
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9pn3BeKnNwagS83ETZ4Sl4K/HOYsMyhq7iNkfF9540=; b=36UXsfFid7+EzN
	xgWSHX+RFWm5CkALxyd889Z5eJ3vyJLpXEzvnIR0p2dgjbqmf7VBoWHT+ACzOHCfYfsPEO3jSCFpY
	yzFKehur/5tImLqR2X7n750fIdKh0ZNoe/+AWj37f7Gj5eMoCRqgjPP6k/2uh3YnNdtHCOhXB9PJh
	aL3ozpC4oqhV8bHW5t57F5KgMikk8mNuXdPsmYhLpTri+vWFC4rhG9yad8tSEgjRNOoXRVXb0p1Fe
	oDqyMif5akYG+qTv9+TQa0jDA711uH+aNksMPY6T2YsAFyCiiBGC4WYW5KFxpetNjKxFdDAILkyC+
	yFNzpsVYPw650y+qxbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK1-0000000GU5T-2ke4;
	Fri, 11 Sep 2026 11:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJz-0000000GU4W-3Sn8
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC18860A57;
	Fri, 11 Sep 2026 11:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4EB1F000FF;
	Fri, 11 Sep 2026 11:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125690;
	bh=31aDyKlLwas57gyTB/BvEWRjjsOpuBSPhyWDOTaDasA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DfCexNw3OqNQ75/zC4xa8gK2bQ5iNLInbOGp/T82MhEiXFqwSgLssigK947nTIKjH
	 HKiYc7wMJTQm6Tcp4TolUxBM+a30GDtv5bDdGncXWJdlRGCb/gseE86b6Vo2Oo5i+J
	 crKe6nbg1k9Ul2YlQVUDiHXc5E0p4Dw/ADnjRQFqa9yvyVljMJVCjgHqyYEcpDWasr
	 jZtNR4XnxYxtK6H6/JIEGOpjQMniGVlEjHIRWAznDqC6KFYrQ24QX6kumS4exO+0vY
	 Om339zZAWaxY+ZpsR06to0mxGbI+m3BrWdXnXs5iWbLFmAuLOFnw9riMGXapsHTMer
	 Wsurz6cLwl+yQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Fri, 11 Sep 2026 07:20:51 -0400
Message-ID: <daily-reply-0032-re-clk-meson-gxbb-6-1@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910072518.322125-1-jbrunet@baylibre.com>
References: <20260910072518.322125-1-jbrunet@baylibre.com>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> The following out-of-bounds read has been observed by Christian on a
> GXBB WeTek Hub:

Queued for 6.1, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
