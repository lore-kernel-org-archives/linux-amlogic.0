Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E9EC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 21:46:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14EF420728
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 21:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1jWum7s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOY17cav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14EF420728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7fOVnwM9iDRE57ambHGPlFwq1HbX0fC/Yhkskq+2oY=; b=L1jWum7s//M9cMSbk7/qDY9I5
	zIufRd+rkuC7ATds5ldNHh+UAs0uw//WrqLwzPGUNqq55C/CiEA83Ai0T1IBAl7/hOSAQg78S1d3O
	YQKBoqgo8MptPFBZeQwr+X3iMv7yzK3G7/4ppToySG5rz6mia26fNmWaJdTvd3VuwlEniclDhsG25
	EazwkvnK1YRdDAulDrWwe8UXT7kDy0R05zQPBMIgYyc4lTxJkGGM0iiNXV/tj4DaO4y9dfuqk0IOy
	smWiAatrWuogwRWqYT/JEnrGNAgBpIeM9kit5Dr6yDMkI1v75sKMKcjpRGYW7Kx4o0RX4UxxWXarw
	DBaEB1ToA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khJfZ-0006Kn-4q; Mon, 23 Nov 2020 21:46:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khJfU-0006Iu-SQ; Mon, 23 Nov 2020 21:46:42 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47C43205F4;
 Mon, 23 Nov 2020 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606167999;
 bh=h1WrtCqHFEifntLejOukfoRyk+72OOTTFpb+0uydT44=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hOY17cav9OLxzc4q5+yNWYMZC3qBgOxIfojY1YOrnf4XOvN5GnRqe2qoqBUGAZHBA
 ae4HOcBIcnqe12QMccsN8KNeGUyjqf7hrRyVVB3mMpwje/pQkISelRy2G91TIW7Vjv
 pu9FWfoprlxHwl7um2xKEdveD59KlqDgZhpU0KzY=
Date: Mon, 23 Nov 2020 21:46:16 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Alexandre Torgue <alexandre.torgue@st.com>,
 Olivier Moysan <olivier.moysan@st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
Message-Id: <160616797659.26421.3555642178452735947.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_164641_094285_5AF2EE3D 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 16 Nov 2020 18:51:30 +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/aiu-encoder-spdif.o: in function `aiu_encoder_spdif_startup':
>     aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/axg-tdm-formatter.o: in function `axg_tdm_formatter_event':
>     (.text+0x7ec): undefined reference to `clk_set_parent'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
      (no commit info)
[2/4] ASoC: sh: depend on COMMON_CLK to fix compile tests
      commit: c3d900dc905b78788c94f3a063b769bdbad16a98
[3/4] ASoC: stm: depend on COMMON_CLK to fix compile tests
      commit: 82ceffce96336ee9863f3dfde63aef5748ca4ab1
[4/4] ASoC: ti: depend on COMMON_CLK to fix compile tests
      commit: b3cf78e0dacb7fba50d0c1eb9dfa6f92d31529e2

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
