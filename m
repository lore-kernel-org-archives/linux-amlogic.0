Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F3C636D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecpjYVx8YFkmzTqQfCeU3Do2jvNFkeglj5RtbFbwldo=; b=hes0AEFAgKlZOc
	gpDfR8BTtfbXfCBU/wbV24WJZa97nF9JtO+bBrjDcGQRs/lDKvwof6WAuDTN/RBz3e8fNxz+gfgr0
	ObRqO1IpgshcVlYJaUdvOs0w/SSe7mRx/AnFKQCzaU4IvlySmOrP7Rus7dxxH15k6uRNWKzFwFKCg
	RZzHqPCFvPsEWvIBheLSDpoSN55rs5t9ae1gbr8pv8C475EXCYpLQNLa9UmAOBpRVx4ydMFzwX5qs
	tlbvBupdjRUkAJySLqr91mXRbGAfDFGy5YMsJCuoZzVgEx4dQ2M9G+KaT0nmv+9aJj9WB+THRcJkK
	VD6MuxlyySdl7HQaH1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxU2-002YhZ-Ud; Fri, 03 Feb 2023 14:56:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxTy-002Ygx-Je
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 14:56:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E313AB82ADD;
	Fri,  3 Feb 2023 14:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D1CC4339B;
	Fri,  3 Feb 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675436163;
	bh=bHTwdQUfTMFSZm5VtpOoEQH5hZ/O5gwP6aGVUcpUMpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T2KVSpJUj9K690EgAN5EuTtJGGxDCTHELFkwiKcrgx8WIw8ACPr0OdzILjMcuGVHH
	 w/nwhMDgvMyG5luAYTt/Atp0Fkwe02Dc2ezLQseA0dVRCUXnlpJ+9ea6glnCUfRbmh
	 yKKRudgzhFJoKR2Z9gb8CWEql9vGIAS7FC1Z/ViFNF5dkvryXoelnQPi9nP9nc+sUK
	 VUma/CzQzhj+1cbiU0aTddu23R3ZpzjCOmFiPUlxgrQDbNDzVXXRmic06VuWh7O0i8
	 ezt45RNs1R4ZaOpniUVkHtYwS4gS/5/+mfY97oIpNvzPGJ8OGED9v6CjOuPbDIlOG1
	 nARdhXFeG2IwQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/9] ASoC: dt-bindings: meson: covert axg
 audio to schema
Message-Id: <167543616131.928818.17902040818579023398.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:01 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_065606_842260_84E97FBB 
X-CRM114-Status: GOOD (  11.28  )
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

On Thu, 02 Feb 2023 19:36:44 +0100, Jerome Brunet wrote:
> Convert AXG audio dt-binding documentation to schema
> 
> Jerome Brunet (9):
>   ASoC: dt-bindings: create component common schema
>   ASoC: dt-bindings: meson: fix gx-card codec node regex
>   ASoC: dt-bindings: meson: convert axg tdm interface to schema
>   ASoC: dt-bindings: meson: convert axg tdm formatters to schema
>   ASoC: dt-bindings: meson: convert axg pdm to schema
>   ASoC: dt-bindings: meson: convert axg fifo to schema
>   ASoC: dt-bindings: meson: convert axg spdif input to schema
>   ASoC: dt-bindings: meson: convert axg spdif output to schema
>   ASoC: dt-bindings: meson: convert axg sound card control to schema
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: create component common schema
      commit: e398bbb9834a2f6cbe27cbd72956159ecc92055f
[2/9] ASoC: dt-bindings: meson: fix gx-card codec node regex
      commit: 480b26226873c88e482575ceb0d0a38d76e1be57

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
