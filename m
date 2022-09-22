Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9222CC54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Sep 2022 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHgZXdpU8wivn+OkUISPieyLRxlLbKYgEruyEw7B5cc=; b=GbGc/JkZ2mS13d
	I24LALCt8H+/TIKQ5GtbI8lICCLCTfshR+921bJ0R/5G1fyycD/sbutttQiZQ5hdkr1YCdUoGUrhh
	MS5/VWxAZe78q8d6v3mMVs/VgdZ7kS3grtClzRsdReUtH/X7gMS+i2xoyOQ8iffRnZcaKkdtlqDHe
	EsCSzODfEMqDJuFJFiNC4SD/MLrSyUGcq+aHunCalFNsMRlXvb6OqFfWTYhtvD8ZucG54n3w1aVo3
	N1Z0p41yBYZ6vBkqZzqjQN1KahOtGpgk/gBonjRnXUN1yh4yJNYNc9gj0R1MZTCs5W1ImYzr8vClm
	FgDSrBy91Cdb7/QO0r5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obQOx-00HAZt-PE; Thu, 22 Sep 2022 17:54:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obQOw-00HAYs-0N; Thu, 22 Sep 2022 17:54:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C357B819F6;
	Thu, 22 Sep 2022 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56B8C433C1;
	Thu, 22 Sep 2022 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663869255;
	bh=sPEfNt549leOVSeFwAMTEwbkpSUroLM7+a3d5AF/yOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OvYT0old6lhYOJhem8X36tPfmhv22eGf3e+sJH/9fHFJYf3i5es8jXKB99PO6jxpV
	 fRd8EyvusTckJGk8t3WbrXTYwbF+xBC/rTU+ZEN6XJo8CAp0UzA3S7DKKwqc8XYOHI
	 tFALL65D+D2/xDpIAOVRXKJ2jIq4xUPJT4BRyTi9xc+bZ9EHGiDpSrx4tuB/eyXp4F
	 oRA4ueKSzej39t+5y32Is7pnueaZWTancF4aTNiUq5OTykHYYnUJUg5KFEJLzslUWH
	 xcP7J7vFTi2p7QZCGIBiASP0IkgYm1LbiTTPhwzg2ji88SmtIzRIrMhSz9kVRwEcMK
	 MLro8/Fvj071g==
From: Mark Brown <broonie@kernel.org>
To:  Wei Yongjun <weiyongjun@huaweicloud.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
References: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
Subject: Re: [PATCH -next] spi: meson-spicc: make symbol 'meson_spicc_pow2_clk_ops' static
Message-Id: <166386925058.727991.8817892530350799405.b4-ty@kernel.org>
Date: Thu, 22 Sep 2022 18:54:10 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_105418_225725_686C2836 
X-CRM114-Status: GOOD (  13.45  )
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

On Thu, 22 Sep 2022 04:08:07 +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/spi/spi-meson-spicc.c:570:22: warning:
>  symbol 'meson_spicc_pow2_clk_ops' was not declared. Should it be static?
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: make symbol 'meson_spicc_pow2_clk_ops' static
      commit: 077dac343b54babfd56b1a52cf1f091518118957

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
