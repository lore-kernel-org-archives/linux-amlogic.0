Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E910C88E54
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJssWPlGBUvOOKsAIGOB70/ZkYXohxCHibq/Zy4KYgI=; b=boWixVHqyhDrII
	0x/dsd/Q2TDfEF0ftEAeu3Cmw2P1Vx/D5E7KS9jukyoIK5o0A+JzQHj1PgDDyD3zzcbGdBlY5E2T6
	FzBDcd204UnNSoDCGB3846Hz5qyNLZZPPPhwp451fMvFZxbLsP9WmQKCJVo8YLTdTkq63E+PpPJLM
	P5Of8VSC0E9H6V5zP/8vGJkICiKSVAr3Zo6rV+FADYiVr7WFBmo6LV8hb+315USkzdcf5Gx82r8fJ
	ZV5xpTN9HuLBGeeeL66LtH8ChJBME1RtiGovKNXH1+nDLWW4/CoE4EzasTDd9DMzTPuWptNXUI60x
	/prU5AcYDwERTqho+bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK1-0000000GU5J-2Q9j;
	Fri, 11 Sep 2026 11:21:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJz-0000000GU4Q-1AFK
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6CF0439FC;
	Fri, 11 Sep 2026 11:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13431F0089A;
	Fri, 11 Sep 2026 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125689;
	bh=lDF/02Lp6+QVn7+jxKuUQFuC2ILiYrfwchkLol8wKCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CkRZ+rCdW61JL722geuXVQXwacbrIssJ+Svx9GpUfahLb7N1hdXA4l/WRWw82FRXR
	 FeaSGzGfc59a2byy1bj2aMYbLcpim0JOqOl2trJzgKTA5dsVTTVInbE/S8pjkw54X1
	 uzFN8rslNYE6mCsV2mzvk6w/kbhDgw8YGF/WPnYC9Xkxs9j6UYWZEURIui58aED44u
	 a/E4CpSY9pwZkC09RKCl2jPvSLShpX9hBf7gibuXOPok+RSdhr4u/CTqDCqutL9P38
	 GdC/EQwWg9R8ZJvhXs+Nnj1nSW7ozWTBgFF7oap4UdTB3y9nYkAvO0hiB22jD19uHu
	 0q+Sgg74inmMQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Subject: Re: [PATCH 6.6.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Fri, 11 Sep 2026 07:20:50 -0400
Message-ID: <daily-reply-0031-re-clk-meson-gxbb-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910072347.317012-1-jbrunet@baylibre.com>
References: <20260910072347.317012-1-jbrunet@baylibre.com>
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

Queued for 6.6, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
