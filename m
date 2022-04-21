Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7761C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O92UwiMtT6SkK8lftaGlfvoOjzOqI8eEsPfAmtPs8lU=; b=2C+3YZdZobjESc
	ZNl+UJLSgZKGBSGRUIiSfjEidT7zH0PMk/oJvlssDuocQE0sdyH2K9J2rOYP6H9MFzNd66QJd/8yk
	H9NBWuQZHIkFwMmR/JziHQB8+rWaFtTbzlWvI6wbC02GQkO1m8xhYNHQO0NTWs8VQWzyxwdW+MUob
	na23xKrGOOiTSbR/RJX1zrXlYes5r/wZl18PrBFHdfYdi9HfEMdR5wcpW5c7VzQTd/MWqs197z0f4
	FNRyXqzWGeQ4bwPus3UzXwuP6R1m+uRTypyK6NuANoRShBQIBc7EIyNNxvgUg02r00UuKj3yYsGmT
	ssImo3nnSMbTH3lIAa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhaY8-00ETCS-Ha; Thu, 21 Apr 2022 17:25:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhaY5-00ETBQ-Hq
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 17:24:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B1561E0F;
 Thu, 21 Apr 2022 17:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6CFC385A5;
 Thu, 21 Apr 2022 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561896;
 bh=pvjWS/7gvq0FF19pafGJQJMuF8OjnvIMW/8E1FoI0mU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IcwqdMJZBk6G299ZOu9GLaAbInLrLWCkWMFTOVYIormnU5LF+eBe7wVnFSRcG5O3U
 9a3Q9CRl/jeuj/O2v8+eIcEeQO32LeoyYnCWe9UT2BDNc6gDFec4EVYYBhnoe0apVR
 NZHNr18u7DKg69qZeJElDkxgI7X1YDyatm70aDbdHAP8iIX6+Xmy2nMBAx4G2OiYjy
 4pnZ5KFlI7h71+kFqZbgZGGfcVN4EBSRBtRyh6YQYoabb15TIODDC06URf7BLvsuni
 ZDFNIpYbPTcF01SDhxXszmWmucSN4Wx4dp4d7kzWYkMUh6uiZ08s530OtG2FDFrvyJ
 5BvLqD0wbA0aw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, jbrunet@baylibre.com,
 broonie@kernel.org
Cc: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Message-Id: <165056189462.376935.4705329277665588764.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:54 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_102457_685026_E76D2837 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, 21 Apr 2022 13:38:00 +0100, Mark Brown wrote:
> These patches fix event generation issues in the custom controls in the
> Meson drivers detected by mixer-test and by inspection once I saw the
> pattern in these drivers. I'm also seeing other failures due to these
> controls having invalid values, eg:
> 
> # # AIU ACODEC SRC.0 value 3 more than item count 3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: meson: Fix event generation for AUI ACODEC mux
      commit: 2e3a0d1bfa95b54333f7add3e50e288769373873
[2/3] ASoC: meson: Fix event generation for AUI CODEC mux
      commit: fce49921a22262736cdc3cc74fa67915b75e9363
[3/3] ASoC: meson: Fix event generation for G12A tohdmi mux
      commit: 12131008fc13ff7f7690d170b7a8f72d24fd7d1e

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
