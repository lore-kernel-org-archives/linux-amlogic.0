Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D692DC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9IG7tbH5iNjWym0cWqwD4nbmZnLOecXtzPWWk1AgLQ=; b=gUuCbEwPoDUVT8
	D95sVOto8BMmAvGkIuZN/h3A6E9CRI5S8bwj5mA2vo+wEzSWAHQSIOqYvbA8cciqCN16YcYSkU8Lc
	M6+pbUNEqyqQJTkYNLkPjEWhDQnjZIP2++rRuu0roEOveTnGHwYboAB608SvxHf9lARlxoquHa7Xz
	+kWBqnqAC4Zv0WIBh/jQaSmuL4mY0PNqa+oM4Cs+0lNjYcXBLm8lgZttsbbI5RT3ebT7R8K6iVo4z
	tqrIulc17D3A0oSf/7UbaPjXy/WtfJIIKrtWrlwTWZCNZBfTQvIDemyeC837bhMRf2mFp9ara4O+r
	21/9s/97LWl/wgL75ijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olug3-008trK-Pk; Fri, 21 Oct 2022 16:15:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olug1-008tqY-A6; Fri, 21 Oct 2022 16:15:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1AB661F16;
	Fri, 21 Oct 2022 16:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816BFC433C1;
	Fri, 21 Oct 2022 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666368915;
	bh=iCewE/mUxFUwxBVTnDRE81TzLYGC1UfmkQxqs8i3xdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UgOkjA0vCyTWZOEVc0oZ4JGwhq2kdluMgDqvKxBto23HIa/+qVg2HuTj8IPoirRh3
	 kwSGgDINHoE4fvG4RsW1tyq6DKMjNxwLoFuxE5TEs+CkhZp592InEZ1VXE9MlCcd7f
	 xXHc10Ha5fwttkEuWsvAKBs4se4DMNTdEo9Jrhw4Qo5zOlAjuKj+sQnfF3BbtWQs0Y
	 35bFprox0Lar/dETz922Q3AwU1CJR+R2NHNAI2r8v3rsaD84Aa9z9MuMll1moy9O73
	 0XYEhGoJG/nBTTXQQNNo4C88G7tEdm42dZKyJ5F6NR2atupQfzH6ESO7qyk3gueFhb
	 fwVEKgbbEn5lQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 devicetree@vger.kernel.org
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
Subject: Re: (subset) [PATCH v4 0/4] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
Message-Id: <166636891222.378315.9501642129883885314.b4-ty@kernel.org>
Date: Fri, 21 Oct 2022 17:15:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_091517_407297_D7788ED3 
X-CRM114-Status: GOOD (  17.50  )
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

On Fri, 21 Oct 2022 15:31:24 +0200, Amjad Ouled-Ameur wrote:
> Between SPI transactions, all SPI pins are in HiZ state. When using the SS
> signal from the SPICC controller it's not an issue because when the
> transaction resumes all pins come back to the right state at the same time
> as SS.
> 
> The problem is when we use CS as a GPIO. In fact, between the GPIO CS
> state change and SPI pins state change from idle, you can have a missing or
> spurious clock transition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
      commit: 031837826886e254fefff7d8b849dc63b6a7e2b9
[2/4] spi: meson-spicc: Use pinctrl to drive CLK line when idle
      commit: f4567b28fdd4bede7cab0810200d567a1f03ec5e

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
