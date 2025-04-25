Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DB1C369D3
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Apr 2025 19:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Erxh/3CGCUKydSs0H6wQyKgN/c1SUWMiACH8Hok3vM=; b=0nrGbvIFdyFnys
	ZCISB4O9ZxrLTc6OMqWwO9DRmrnJQM0tluAoPMeWkKUKc8KfTf/26mLW6e/8NEMksvOBLdG/OW4dC
	SQI0iexE4WmhVx73HXUFG/kMe+zi/FVaW4Q0keSpg5UgZ+FJELSSWLuTILPqshgTHeDm7zQVh4UE4
	tzWNEK2CYbj1BQ8icM1qaUpgx1hna6Sc/5Bw5Zbd2YuZszzrFaj+ovQv7ucP1RTfYYeUlTycdb/d6
	KMK8ybUH2GMaGE2ngaE64e6fM2JyM+LMvW2NxOvaJ9TI0tQRScODP2m4p5sqWqRZEXs9UD+XOH26p
	m3Ki+aQWzG9HCmfTCbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OSv-00000000cTg-1YQ5;
	Fri, 25 Apr 2025 19:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OQw-00000000c5u-1FXs;
	Fri, 25 Apr 2025 19:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DB295C6B39;
	Fri, 25 Apr 2025 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF34C4CEE4;
	Fri, 25 Apr 2025 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608197;
	bh=xu+LZYG5C0xRUvosVpSNUcm82WBPS5ZJ4DDCffR5PaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eGM1veaTtQkife/GA793HF5sP63gRe/3WRKjGNSVmLxlRkgka5lNJ3z3lXQ31AXQI
	 eqWrfL83zPiP/sTymPn/BL/UQTkFqShov6A3/7yErCdTNCdFAsSzKQnD2GdqqT+8kp
	 UHBQWKkGGJEyzhUqGbZSqtkbooWX47Ia77faCamrT64/s4yKSdwGHUNbAy6KYaaP1I
	 2yySSUDVsRXRfpTceSBlRBjO5WmQis1y7lxGgtKs63f64G0riQozTt8MP+AsB5jJVc
	 NsTl2Gp1RSvOIfdwLgs0OCD2NjfVoX14LkRTr6xlHJBrTsnYyr1EG5bMjPTZvG4p9q
	 VfBb8CyUmveEg==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sunny Luo <sunny.luo@amlogic.com>
In-Reply-To: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
Message-Id: <174560819538.249436.6003671320235963859.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 20:09:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_120958_393537_F533EF8E 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, 14 Apr 2025 14:30:16 +0800, Xianwei Zhao wrote:
> Add DMA support for spicc driver.
> 
> DMA works if the transfer meets the following conditions:
> 1. 64 bits per word;
> 2. The transfer length must be multiples of the dma_burst_len,
>    and the dma_burst_len should be one of 8,7...2,
>    otherwise, it will be split into several SPI bursts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: add DMA support
      commit: 18197e98353d931fc7bb2bb9ec671d3aa407831d

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
