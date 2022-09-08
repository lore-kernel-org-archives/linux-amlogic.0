Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9E8C54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LqbSJ12qVQWug7kixBmHidbgHtwskKUp9/Qvm9U/60=; b=AZ5pSr/NXjfpeF
	T2OJtG2amC5fvaCkMVP1/AavugDL5ioJrbYOyQAaQlsKihmSOf9biPeAts3VGYHybwxCNJGTGBlb6
	Bf4fEoBqxkl0mvGSDXK4es8xo1RY2DiimJ19dmnPUlhEIrtuMJBnUbX1PyKgYt3L2Ly1oIXgNDSZq
	48EwO8sbgQ9xMIniLcd0LNh9eK0HGUAnyxRF5TTnIPZ59m7vVJV8tipL38Mbp/+pB/f3yWrxRF/aA
	axnv8FoqiP6rYapCAxV+s82c55apNL0KJN8mGKsTPvMOUX+APSyHxLmBsm468WnakCoN+C/eTF6uN
	V5LGiDrKqpRr+UaFDN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIT8-004dVg-05; Thu, 08 Sep 2022 14:25:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIT5-004dO8-8J; Thu, 08 Sep 2022 14:25:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A9A961D10;
	Thu,  8 Sep 2022 14:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B09C433D6;
	Thu,  8 Sep 2022 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662647121;
	bh=GnXm3DasQPANuFBkOmVp81W6zikm6F2UaWae26C2T5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OWJQjCg131BkZfLerYXrBNn0mERHWwF9lUiU3wq5MR17jFYdpoUWmLJmQuU+EoAJ8
	 T5fYdr6aKVdppfnCgoiUJlfRwIe7rd1nqus+m2TYnZvFx7xRqqoinfaEEGQpMZLeKj
	 3yZZejBk3TjF5SYlg8nQKS7L2IYDidoduq0aCsD3NmnHwJA6jvgT1NESHkADBHQYTT
	 ++qF2tPjxW8siFuV9Xf+fAScX0ufBnnQ88h/0NLRxtEuLOiGcPISqBp7kfbCwBmFPj
	 w3X3h5U5I6sAI2ckm0km/NQywHcrHch48q1ec3ghld01we1rR3FAFkWziE+wl1lFcN
	 nJn+Gm8VGr6Lw==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220908121803.919943-1-narmstrong@baylibre.com>
References: <20220908121803.919943-1-narmstrong@baylibre.com>
Subject: Re: [PATCH] spi: meson-spicc: do not rely on busy flag in pow2 clk ops
Message-Id: <166264712029.115040.727850066200274922.b4-ty@kernel.org>
Date: Thu, 08 Sep 2022 15:25:20 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_072523_383307_071B2730 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, 8 Sep 2022 14:18:03 +0200, Neil Armstrong wrote:
> Since [1], controller's busy flag isn't set anymore when the
> __spi_transfer_message_noqueue() is used instead of the
> __spi_pump_transfer_message() logic for spi_sync transfers.
> 
> Since the pow2 clock ops were limited to only be available when a
> transfer is ongoing (between prepare_transfer_hardware and
> unprepare_transfer_hardware callbacks), the only way to track this
> down is to check for the controller cur_msg.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: do not rely on busy flag in pow2 clk ops
      commit: 36acf80fc0c4b5ebe6fa010b524d442ee7f08fd3

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
