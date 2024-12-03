Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D148E6C5E5
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2024 01:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3f4CGdXykqdLMdCdMz+SDlsdxQFIFHwFSnJ7SId+OA=; b=I9+eBBb1/Ph+3p
	rt/KhPDV30ttAqJSo1hgjeEViMXi03040NsXYzo1/cuWn9KnKffP0rcY7RNsPCq9YntoWdFEaf/Mn
	yp1m3w7dIQHH8gXp/I5CC1KXr/PooQvGKukqrkUlDw57APqGIyaxkzkm4YdxOWJeYtLjX1UWBrXZ/
	Pk0MxpKRPj1gQJ0KMGdVJROujf4Dkksd9rGCdqlHa9LhkwQAjfp4Iepq53ZhEDqGcyb4A0r0Gu650
	NQyrHZx93XK8ekqckwIdCLNqzdEgeZkAw+XGx/hwSz5lHMK3JvvzHZaMyeHWysCZ/jONY9yKhRj6W
	WKiyjZ5We3RHJJ0Q+icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHbj-00000007v3b-2mel;
	Tue, 03 Dec 2024 01:21:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHbh-00000007v37-0svf;
	Tue, 03 Dec 2024 01:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5515B5C69EA;
	Tue,  3 Dec 2024 01:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3314C4CED1;
	Tue,  3 Dec 2024 01:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733188900;
	bh=1FtcmpRoCr5SeSvMzJ5tPuM2IMPDeMBkNlHhN+GJq3E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uEQjX+2RiKj7QLe7Eb5g69v4+Q62pK9d3XnjgEl6erIsn9RLMy1T0NS3Kzc4Cw+Wy
	 +mXW5JtWKdRQtL+ZNvtybvLi6D8tYePKaE5uIncjeFShWvQJ+VRa9HbttSXJO1nSAZ
	 GxObU5VYYadbP4e4lCfqWt0KB19/5zKOmr4bmDBtz40qUrQnEfeG4zMuwcUYcSOlxl
	 pSNfWQy3wGmjTLv6sF6Pu4dFOsAIwC/C1IIq/aeE+zKjuUimKWP+Xzre9V/YfRtyi0
	 OtoNwSO0zywo63vKJ4/TYcJ7DkYvF0cqkrDWnp8+KxN6oUb+EeYRasm2UineJCFNhs
	 4hhmeJFT8kTQA==
Message-ID: <ff51b468ac71f9206d4ca8c6f345f38f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241128-clk-audio-fix-rst-missing-v2-1-cf437d1a73da@baylibre.com>
References: <20241128-clk-audio-fix-rst-missing-v2-1-cf437d1a73da@baylibre.com>
Subject: Re: [PATCH v2] clk: amlogic: axg-audio: revert reset implementation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Dec 2024 17:21:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172141_295251_05C54FC2 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Quoting Jerome Brunet (2024-11-28 09:30:42)
> The audio subsystem of axg based platform is not probing anymore.
> This is due to the introduction of RESET_MESON_AUX and the config
> not being enabled with the default arm64 defconfig.
> 
> This brought another discussion around proper decoupling between
> the clock and reset part. While this discussion gets sorted out,
> revert back to the initial implementation.
> 
> This reverts
>  * commit 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
>  * commit 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
> 
> Both are reverted with single change to avoid creating more compilation
> problems.
> 
> Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
