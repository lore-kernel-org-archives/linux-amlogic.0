Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0E9C636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmG12qW2K8abo1Q3Wr6nWNFaIzCoUhcWJ8FLFBaNm0E=; b=R31u4DxyLSf1Gr
	gSr1/vB3qJIDFfovJROmiXTJUlOj0ofA12IUA9MRfl9TWkF1cp6YG2PYfwAW7oRj44xlkJti8VxH+
	+ptek2SYUo+51N+mjSzgeFLnZ7reeqgbp4tXX1LQ4zswut8fgxRSLCAcQMsDiW644J2R9rLJ/Y4Sx
	syYfrfhnLuPhrhIv4iNgK4fEnMZNEBUN0BW1TJ8JVb8cNQDnoxE5Ss5HMwp7wixgiz5p1rn7HOzke
	rI9yazBYiYClKH/jxDLOVOL2QjyNS2mw4gVq/Z/AW1+/0g0UzaILfyaNFZ2iHuJGW/DLiNj9zeYEo
	nm+BqELbwKl8CKL+lmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPXx-00CcKS-0d; Tue, 07 Feb 2023 15:06:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPXs-00CcJf-Mw
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:06:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DD2BB8198E;
	Tue,  7 Feb 2023 15:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A4AC433EF;
	Tue,  7 Feb 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675782365;
	bh=YqDF29yTDTzZofC0OrRusN/jw+sSqFWwWjB3YnAN8mA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=asZxJim1OThPT7N/ebQJty/PhYOPN7aFj6sKP/aVDIQUStFsecBWjYU/z1Fwo4eor
	 6ElGV8nV1q4aW+V2wdnhw7ENQbNQqV5fVShFAZRy5vAFuFaU3miDJKqOQYnAE5mD/P
	 vCvk5dFDVixQFm4zarCpiEraFsialIIpxdIHrAoBxmldRTYNwRxUNU+jHEQUqV8LBW
	 MA8X0lf0/kfczCAOln2DWdu4hac1ib2WjoD1HploTeNTz+P8BxL3QqPjjRnjPY1kGN
	 O06lj23OOqxzUp9BStpP+K+64A38HMwWIhbbrUnlNS938ik+nXlmz9H5vdQKG21cRO
	 iTTTOoHtOR3nQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH v2 0/7] ASoC: dt-bindings: meson: covert axg
 audio to schema
Message-Id: <167578236315.223502.6627129328138282057.b4-ty@kernel.org>
Date: Tue, 07 Feb 2023 15:06:03 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070608_951595_8EDAC539 
X-CRM114-Status: GOOD (  12.18  )
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

On Mon, 06 Feb 2023 16:34:42 +0100, Jerome Brunet wrote:
> Convert AXG audio dt-binding documentation to schema
> 
> Changes since v1:
> * Drop 2 patches applied with v1
> * Drop node name patterns
> * Fix examples indentation
> * Yaml fixups requested by Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: meson: convert axg tdm interface to schema
      commit: cdff91122de52f480bea730fee6665a7404d758c
[2/7] ASoC: dt-bindings: meson: convert axg tdm formatters to schema
      commit: c5536e7be70cf2ab55c674b3c2120565e9559c50
[3/7] ASoC: dt-bindings: meson: convert axg pdm to schema
      commit: 4d37c72ec42374c5ad416f851b572a9fb794e8ef
[4/7] ASoC: dt-bindings: meson: convert axg fifo to schema
      commit: 6b6f5ea7ab0062d152a3bc9192cee45c7fc31387
[5/7] ASoC: dt-bindings: meson: convert axg spdif input to schema
      commit: ede6aa4087abfac527267c4ac5bb6eebdfe958ba
[6/7] ASoC: dt-bindings: meson: convert axg spdif output to schema
      commit: 32f7b9102bfc48a210bf655e049145f6450b03a0

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
