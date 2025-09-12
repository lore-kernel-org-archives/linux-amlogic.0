Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D01FCAC58E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Sep 2025 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imSZ/JZf84CBUcUs+Df+UHOiRkTFaPTIsKcSMt3yj9E=; b=16uI//jxCI5yim
	ICpX9VeLq1Dw3zdojcqBoDn79znrsjnWDfd/qtu79+Skq0qDaL8yzIXLiaYmNjdLy2NI7Da8iPozS
	1PMfw0gUf5cvXznZ7UmURg10LUrAX8L11l7S4DlJMfB23gkfLsFbim6n1vHZc5UlEhu/XyKe5ki5z
	/VLBC11IY3YFOs7CBp77Tog6x6ZATbud9zfRDXOXODz+IA+VNIwXrFMC3ze1zL2CKRvPjUDkwM2Ep
	DKNKGqIS+2C0RKeeQKocdwuBST3nmQ0AsKnoAqP5V3qDucJ0EIb+iQzMlp9it6Yswg5Ui16LDdRpl
	yuw6dRElfeUPjhm1YEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsK7-00000006FDU-48v5;
	Fri, 12 Sep 2025 01:11:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsK5-00000006FCK-47cc
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Sep 2025 01:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E8554177A;
	Fri, 12 Sep 2025 01:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AC7C4CEF5;
	Fri, 12 Sep 2025 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757639491;
	bh=FhvGWK1FyLoco9IJWznEyqzst1SC2dNncuWCauBb6Xs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nddgyKYIyK08ZZp3OVP5SuAXX4qG9NMjEwvT03dMpSgN6ryeqCl7NOc2sUuJojIxL
	 Sf3rlqjqgmr7wNq3htx13Gvhu/YdYOk2Sl3e7ynQNQUVmmnPgeG+jp/JVyAqPWe52y
	 4T08KPlG7GmL/GE5Fphc0AxDeG7Zidc+M9rXfBeYhGAhlVrKMXU6ebul3xICGnh7Px
	 wsrQ7iBgLKV5DFWKpaMTYQX8KeLp8kkXgesmZ9iqN7ZmEn4FtrK/rdK5e20vbBLQKW
	 +RTVxqh/LOJ6z/OOT7qwcpV6rP/rGi45R9ET6K55xnWItEKVHiU5Or7Vok/3r0ufW8
	 b7nrw7OxqCKKw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250910-spifc-v6-0-1574aa9baebd@amlogic.com>
References: <20250910-spifc-v6-0-1574aa9baebd@amlogic.com>
Subject: Re: [PATCH v6 0/3] support for Amlogic SPI Flash Controller IP
Message-Id: <175763948875.238908.2008440685033086798.b4-ty@kernel.org>
Date: Fri, 12 Sep 2025 02:11:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_181134_052839_A2BCDA65 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, 10 Sep 2025 18:18:24 +0800, Xianwei Zhao wrote:
> This Flash Controller is derived by adding an SPI path to the original
> raw NAND controller. This controller supports two modes: raw mode and
> SPI mode. The raw mode has already been implemented in the community
> (drivers/mtd/nand/raw/meson_nand.c).
> This submission supports the SPI mode.
> 
> Add the drivers and bindings corresponding to the SPI Flash Controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: add Amlogic A113L2 SFC
      commit: 0467d6c99d1c64210ee8c9621cd63b12301cab2e
[2/3] spi: amlogic: add driver for Amlogic SPI Flash Controller
      commit: 4670db6f32e9379f5ab6c9bb2a6787cd9b9230a9
[3/3] MAINTAINERS: Add an entry for Amlogic spifc driver
      commit: 6a129b2ca5c533aec89fbeb58470811cc4102642

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
