Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B891BC636D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJddleJ91RKL3M9DHhnyBdM2xdqtC3LxS2d3lZK+LNI=; b=MkqBNC2U9kS57v
	L1hC8Kv1dNyJc0FSyO5tfQb7KyCBhzJvyrpYcio84jbRUXiK7lqXlUTbaDnzHio/S6hDQSkZUhN0W
	ZvBLBLoU5hlqnBDimQ5PVFfJjkPF4ODciS6c/V0ow2bnovBExgzbqNxNkMZtuamMOO8zGgzCN7HS6
	8gP64lG+4JXUnRtEUiZKqGW1/lmlkM9rnMrLxN16xHHoM4rJFUl3/3EZr90faUdumr5HDVyTAynPv
	w1tAutpMUGZzBf7XjS8ikOyksYlHdS0tvjcSLqauBWX5f9l0Wzmd/oxrMRf19Q5sLzQuDDp0FI61E
	qPkNk6bdMVJloBfRWdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPp49-00Gb49-Eh; Wed, 08 Feb 2023 18:21:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPp46-00Gb3J-Tl
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 18:21:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D335616DB;
	Wed,  8 Feb 2023 18:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7E7C433D2;
	Wed,  8 Feb 2023 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675880465;
	bh=A3n0nGZLvj39U/jVCAMmkf50AXmyykK4cBXFyjRUEI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vM8zBdZmnGDwhC9d+aA/tyJIiVWIPa8XO+fRKKyYaZWm2mAJaM4bvsGqkucEsaqdO
	 XT1ZIWwMriMTr3+0dUHTTeKdRatMQ6cZiAach0QgAwCEERGyNfNA7dtv6WT1v+ONBY
	 1HqQTRNuYEFyucD8geWd+ttsu5Rq7/7k9XpbwQyREbKuv+aIhHp0y4Hv1iVdoWavL3
	 JkG+8qbkzEFFQGRE1/5r6HGB316meziv579/isaEvb6Q7Ei8DhwXhSLQ/vJl1rVeIC
	 BIy7RV7f/8yuOFWwu68BQm2t0U1yrhVeC840RTmMZPXlNB/TlAGlxAFUVJ78XHb1Va
	 lgaCnSivSpoFA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230208093520.52843-1-jbrunet@baylibre.com>
References: <20230208093520.52843-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to
 schema
Message-Id: <167588046319.297485.6961864943902317327.b4-ty@kernel.org>
Date: Wed, 08 Feb 2023 18:21:03 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_102107_030404_BCBAE4F5 
X-CRM114-Status: GOOD (  12.49  )
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

On Wed, 08 Feb 2023 10:35:18 +0100, Jerome Brunet wrote:
> Continue conversion of AXG audio dt-binding documentation to schema
> 
> Changes since v2:
>  * Drop 6 patches applied with v2
>  * Drop Yaml block style indicator for multiline description
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

[1/1] ASoC: dt-bindings: meson: convert axg sound card control to schema
      commit: 65f0a8ea90d2fc2e79a616143f844047e25057c8

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
