Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B5DC88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7fiYRJiWFAF3L3pOAeFLqEYWcfNH6Iyxa97XWlEB5M=; b=IN58uoC1m5N/ET
	wrjPCD0Yq7fNwNuV3biq1RjftJyQRaKxe5L20iEPQXnt15bYk+6dKfx1Rc1thCKbqGuL0Kv88w/zZ
	eU3nO3UGQqtMl1xsBhIcZG0AMh0jUIIBTGNFI1go1ewOS6hhY2Qd8yfzj1oylJsnW7aszW+mIQQ9T
	lrkfxgiYTKnlpYKWag8Zz1NDam6G55pCMABfIYnbsP71PeblIxrpO8y4KZrMR8Xe0mIUqDOlIkvSh
	a5lDjD2mVq083/avfsW4iuXEty5B9VkVxtEyE54fpWWtl9dg6fafS3dzghVv3H1glfvc8lKipt1VL
	Lp2zP6e4PXqXoTSy8fYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK1-0000000GU5Y-31gi;
	Fri, 11 Sep 2026 11:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK0-0000000GU4n-1zIe
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E50CF60A5A;
	Fri, 11 Sep 2026 11:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D021F0089D;
	Fri, 11 Sep 2026 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125691;
	bh=UuS/LZ1eE74D8SNYjwyHlLA2QH/XqSEZT/6QJcsLE34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ml80mA8NDu/bK/RLGKBH40B0M0mAIHn82bK48YbgazUldpDsDscqyW5/0b2hTaUNb
	 Uf5QaeKmYRIZCC3hWHDqWd8qYGfkQV9ANhqaL0L89yILFE80qdiWALrUNEysWjhIeh
	 cJEsyLYIDAqmCjn2DD18rUGJZjUmUHZbPoUnYPMeA35VMmGVLH1kuBRTGVC6RjXvJ6
	 4DBmT5e48UlEPqnLFqZy5wJPmE2GKLkcgm636CiipQvP74R/boT9sOrvJWQKbj6vC3
	 /mVz2rAD9Z4YUEK4CrIsldouMCVexGGmPsVCKTe5Xb4Tqzr3EikgWryt+IVTYdezNZ
	 0t/zz9d0gSIsA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Subject: Re: [PATCH 5.15.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Fri, 11 Sep 2026 07:20:52 -0400
Message-ID: <daily-reply-0033-re-clk-meson-gxbb-5-15@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910072950.341030-1-jbrunet@baylibre.com>
References: <20260910072950.341030-1-jbrunet@baylibre.com>
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

Queued for 5.15, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
