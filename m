Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE50C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/+5m78WuKOq+ERBvuzBVCp1uDJoVCU+NU0Zera6ZoQ=; b=YMkca9UfU1MQvU
	xUgidadAS0OeDu5IHC6fqMfWsbAvpSt7gVXtCJ0N5RIxkNzbb24yLiczxwwhYPULSvMyc7+g9TWPa
	kiuJKUYKS+wtH4plFPJ94OdbE3yXS09Bzjt5BFPZ9PU7MrR6UPAgMLYjOT5Cy2H9zBjfpdJSmzzsl
	ofaXaka3nMTLYO4eURnSJwACiRR2RhOcEoLYlUThB0h7vODMcRmD4RC9hi92o9yzece8jJYNbZpUr
	QS0NKzT4Kz1WGeHj9qYnFiCXGaKX+Q9JXq2noeZbFla7ymnaYacSwPUw31EZ0Bt4s+1UGCS97PEoX
	E6oN4LCoYwARHiVTVI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFGX-00BeJ1-JE; Wed, 02 Nov 2022 15:02:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFGT-00BeGG-Jp; Wed, 02 Nov 2022 15:02:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 654C2619BA;
	Wed,  2 Nov 2022 15:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18473C433D6;
	Wed,  2 Nov 2022 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667401366;
	bh=ySDnWLtgKmB4MsWkDhRm3ekTNs1QeMnC8N/ulBhv1O4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uFAgba06loLQK4xeCO8L6yA1xDpNGCVUqS0F6XDlPaNvRw47cvnlE0yTRg1aWmZJX
	 Fu+xOO+Rj99idT4VZ7z2PAkz9tqY7QppEk4mvh3BXh7SkYcM9BhU/YaPjmpvMB+lct
	 3N2V/glp6DGf0z7z0CsXxXIKXVakb3R7tAJjp+ETSbZIwm3jY0HqvMuS3aMO6greDd
	 fuYl11+ZtPng1WsxcnpQg9sfLkQpxyCMztoaSHT1HBco9e+ClOV3t2WC0TK/HNh54j
	 QzJdE9l8NlIC0G+ZwRxhslXH8bBuF1JytES2U4t84R0lcOj/XtI0is46ful6PrRMiY
	 fYl3Vt481po1g==
From: Mark Brown <broonie@kernel.org>
To:  Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20221027-b4-spicc-burst-delay-fix-v2-0-8cc2bab3417a@linaro.org>
References: <20221027-b4-spicc-burst-delay-fix-v2-0-8cc2bab3417a@linaro.org>
Subject: Re: [PATCH v2] spi: meson-spicc: fix do_div build error on non-arm64
Message-Id: <166740136480.261515.18042223753301117319.b4-ty@kernel.org>
Date: Wed, 02 Nov 2022 15:02:44 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_080249_707642_580CA561 
X-CRM114-Status: GOOD (  13.77  )
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

On Wed, 02 Nov 2022 09:46:01 +0100, Neil Armstrong wrote:
> This fixes :
> error: passing argument 1 of '__div64_32' from incompatible pointer type
> 
> By passing an uint64_t as first variable to do_div().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: fix do_div build error on non-arm64
      commit: 134af9aa88453aeb9224e407092530ebba366c6c

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
