Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B1EC76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjGDpzniH+rQfT+VzARMw6ftb5XySRd4s+rdTPMytJY=; b=mMKVu5aUoTwKly
	+BqDtpgSSyVL0Ha2S/l+xlagVS95S+RjejUUjvPMqyKZ3EOSqAplqKgcgIzuQk/feswdtaTz2U9xI
	DTnIDY44yZDA/MFV35J8wVdj+Wp3IpGPL0i6SZqB59wlQ0OuD95UKNeVlMVXQon4+YdSDaXg6vlqS
	KoeY7EOKdDuvKUwwhTSyIlTzSNQFtJ6B2FJ24GS2P7HnsXwzUY1Szqoh5gJ72h4MkNGcWTMy76Kgu
	39ZLHQfD+PMSmDwFW4Qkxv05RHM9kIpUGoyCZH3NkC1xe4IYpR+zn+57YlkX7rQ6qEmS0BMZdta7w
	uVymUrDOPRAv+Vap4FIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEUH-000Asa-0M;
	Tue, 11 Apr 2023 13:56:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEU9-000AoD-2R;
	Tue, 11 Apr 2023 13:56:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F021F62725;
	Tue, 11 Apr 2023 13:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D92C433D2;
	Tue, 11 Apr 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681221396;
	bh=fPGYqiIU6kquDKz5yXmqMisxWPOXWHevU445IPmGMMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qvdPqhB7cLAz9EWo6NwQqxMNKNlEUT8/NtqgYiYnAd8gWN6tdLKsgOcoDNfW39+a7
	 LT4YisxrPggrSWnINyn+zAWgZEWfYDZnij937wXOpR40CJ2D+xeNrI/zszbhBC2SQy
	 nrNuaq2T3ozOjHMXCJ3QYxogpGwY/MsO19zstq5GaEu/7CKGNxCKNl1fWvYBc4Qe3h
	 CtxNsDd3W3CIWcbS9Hoz0a4sCH1sKKyvXIkFO0WLrN1lOsWc4b2PydmAT3bt++kR1s
	 4xFoGwyG68vMeeeF4PGdXjlUQanVoRqYAOPEw7w1Bz84LaHQlYqKyIHRg42lzdjyMA
	 QgkWHCiw/Wfmg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
In-Reply-To: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
References: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v3 0/2] add support for Amlogic A1 SPI Flash Controller
Message-Id: <168122139290.49976.14155303919070360064.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 14:56:32 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-00303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_065637_847196_AAA0441C 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, 03 Apr 2023 21:32:15 +0300, Martin Kurbanov wrote:
> This patchset introduces DT bindings and driver for the Amlogic A1 SPI
> flash controller (A113L SoC).
> 
> The existing spi-meson-spifc driver is incompatible with the A1 SPIFC
> at all.
> 
> The implementation has been tested on the Amlogic A113L SoC based device
> connected with ESMT F50L1G41LB spinand flash.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: add Amlogic A1 SPI controller
      commit: d040fe8f9fa94cf17cb3558bd061cb580a4d63c8
[2/2] spi: add support for Amlogic A1 SPI Flash Controller
      commit: 909fac05b92653f860ecaa1e59b23fc25d27166e

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
