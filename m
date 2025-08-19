Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2808CA0EEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Aug 2025 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ij+XCG2tu0RV3qzhv7K+XW+QbRczjySr0abMlTeFT34=; b=E7xGFqxeWW8lcz
	HKsI8CDctQqP1BCueDPRhVzcGCf0O3nTRwX1zg1DimitMqRMOFURYWvgvlE3SisLMLav/KCA8bi2y
	HhsDTKIPn9l65d+GYAUzExq+xj9i8OqEx6l/hZ32MUEUx7sleNY1lGx2Sp0suZyaX/a0s1BX171Tm
	5MsjiuvF7Ok8jRfdcZxlla8yhdurr0CAmRYhRiu3zPUmzZHFB08RqcNBlEGTKSou1pBOr8jtmAXkr
	b3fF+TBIE+uHsicQ7LUaFl2Fu9m4iIPAFzEoRGmpxLA8SbLqGORS8lKJwCrLyTsyVOoTFWQclG84i
	6Lcev5bhUGPAfZGMISkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQxa-0000000BHLC-18sc;
	Tue, 19 Aug 2025 18:21:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOPr-0000000AuUs-3tPK
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Aug 2025 15:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 624B35C5657;
	Tue, 19 Aug 2025 15:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3476C4CEF1;
	Tue, 19 Aug 2025 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755617907;
	bh=WRnEY5mnXKIAn8fJoPOREi7qTQPCOerE9LQWJjKAxg0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mucZ1rhaqeajrsUd6si8VwwKDekoCZtEaVRe3PKN6ewpUk+A3cB5QVI3Sz1ZVeAXS
	 1/51zIPrjqV9MKtuIcV9wdq5IJPSAlZAAmmgQq33Z1oIJVzqKrMj2hd1vQy+H/dY8s
	 St3IW5W7mo4hreHWuJAvFvBojODnXbSuFcsBiCb+IzxEKIB0AHnal3kXC6g7jKRLTv
	 hjy6+vCTK6cs5r9MDTcaTDY5RRZADt54bHPsuYDbd5cdm50ryyDhKdrM1F/u5ArQVi
	 3TletLwvnkJoy1ES6kUpFoSzl67MX3uWMsuF/3iKUnZtfCK4SdltPhSZF7sixx/ovL
	 t12se6xOErbRw==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250819040239.434863-1-rongqianfeng@vivo.com>
References: <20250819040239.434863-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] spi: SPISG: Use devm_kcalloc() in aml_spisg_clk_init()
Message-Id: <175561790566.178223.1385181209019603763.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 16:38:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_083828_009502_99D53CED 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, 19 Aug 2025 12:02:38 +0800, Qianfeng Rong wrote:
> Replace calls of devm_kzalloc() with devm_kcalloc() in aml_spisg_clk_init()
> for safer memory allocation with built-in overflow protection, and replace
> sizeof(struct clk_div_table) with sizeof(*tbl) to shorten the line.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: SPISG: Use devm_kcalloc() in aml_spisg_clk_init()
      commit: c1dd310f1d76b4b13f1854618087af2513140897

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
