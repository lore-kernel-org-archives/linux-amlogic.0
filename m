Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF1C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 18:55:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57ADC22B3F
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 18:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEIsO/BM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1CXslw7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57ADC22B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3puFoMPKIBr6uPavclqQNndKVgIYQwey2GQv932Red8=; b=TEIsO/BM3j122kwUBfNbarMQpE
	mcnS/pRwqD0/yuowAe5L0CxQ6VL2ONcCDAN2U8Vj8nB7Uz4TmWZHTL7dAC2RwLcY9FbB8sn9MXFf5
	iA+fn3uSlijN0cn3qjMiKlcLEUZ6hi5eRKtzNy1loDk/veoDa2s1tuJAYQSugm95ZPyNjkoh2KPRe
	NfQ9TG0WiR54SNLuIcYBz4khtRBlIoqqm82Kv/1batjrZ3fdVXLTMi/GAfSQQ+GT2+lEXm3RZt4tN
	gqpd1D6/SuEKanzjvT0+AvpDpkwLcJqIo+RQliD2bw34i1AWHQu+ueCnJ/7oqIJO0w8a28Bxp4qlc
	65Aeca4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1aBC-00068I-60; Fri, 31 Jul 2020 18:54:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1aBA-00067y-Ha
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 18:54:53 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADF682076B;
 Fri, 31 Jul 2020 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596221691;
 bh=cPENTsFz9NF34PUPiqsjoOUpv0lIovNmL4NJV2As9rY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1CXslw7ZcjA8wGEp6WkGIj4fIERNm2rwKBELVJ8SoffTqg3wy2yhUKxHu4BmH/YWF
 strMAr2J0tsImHVpgIxZw3tYlf2aOW46AzBlKyL0Qr5D3CHhbiQuZI4b0t4O4XOpXs
 XnWNKOaRj278/QBTtKXqPMH4gWUbQ+6Ns9iH/C9s=
Date: Fri, 31 Jul 2020 19:54:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200731120603.2243261-1-jbrunet@baylibre.com>
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
Message-Id: <159622167150.22822.13397652809932065449.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_145452_764184_70E73652 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, zhangn1985@outlook.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 31 Jul 2020 14:06:03 +0200, Jerome Brunet wrote:
> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
> changed the meaning of dpcm_playback/dpcm_capture and now requires the
> CPU DAI BE to aligned with those flags.
> 
> This broke all Amlogic cards with uni-directional backends (All gx and
> most axg cards).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: cards: deal dpcm flag change
      commit: da3f23fde9d7b4a7e0ca9a9a096cec3104df1b82

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
