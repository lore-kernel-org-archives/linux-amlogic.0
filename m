Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CE2C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 03:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhW8fhGsBwkP/ZtuUJwzE4MgMfUEzfNRSoSKEinqwBM=; b=VS3ZrFXzG2pSub
	bBLMeDzN5kuCU/sxtmrNeaCpj8SUJSA8mJio+PP8X/aH0VNAu0m2YsukrM+fnrJNI6s6zAAtyNjRJ
	OFU0gpA3ynqvNy6f2Vmo6HrbN5j5mFRFOCXKY2JkR8RnPgWF74GXixa0rJbZNl3Y5eQMbq1sSGfu5
	4laPftob2RG44icnRpkcopky015x7Z/fcPvTNP2r3Lc9uYWKvlIwT0T7+oLO3x0qUHfbelhUEMpZw
	JN4XSrmulHVty2bCEDWdts57XEqCKCIZvGlRQ/3BQZcoy6xIycFy1gJC/vF+NPpZWjNpAtQZnQMga
	+JxjV74X0TtiDAz/sXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9eE8-001L5x-Va; Mon, 26 Dec 2022 03:32:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9eE5-001L3g-Av
	for linux-amlogic@lists.infradead.org; Mon, 26 Dec 2022 03:32:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5169360C61;
	Mon, 26 Dec 2022 03:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EFC9C433D2;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672025549;
	bh=s3Txn3CCYMAINuVdaMFj5eS3c7GT6CDWa/bWGWX49pc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZXx064i5rzq++NFOg11/wWaYl1fWBWbUUVMfNobuX1gR6W+hSC5ZaIT6xMvUkTbzq
	 uKsKmPlP0Osoqt3ugX6Jfs12ItSnAT2NYH7dk2L+o+0+q2TEXpuxPP+n517ttUD3B5
	 qERgwZvw07+bg0wqawChHt9pmtSu0jNWxxTY4ZiIJYITZEI0pf/eE3E2hOO32H/1pi
	 kRFc6KGtABB/2V9Bn76V1EKJYHbpXbJgtJ4cicnkkjfmrqdOYoYYZdUWhIIjno3hJF
	 AKMqe2WqeZ/Z/UT0sDmee/HfVbq9AKYnEqjtJVTpIEQ4+UAzbfm79swmY7Zbv+nhP1
	 /yZj5hZlsSzMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 69A72E5250A;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common
 DAI properties
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <167202554942.9518.4179971549708682531.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:32:29 +0000
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: neil.armstrong@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 lgirdwood@gmail.com, broonie@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, fengzheng923@gmail.com,
 povik+lin@cutebit.org, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, peter.ujfalusi@gmail.com,
 cychiang@chromium.org, tzungbi@kernel.org, groeck@chromium.org,
 bleung@chromium.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 stephan@gerhold.net, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, frattaroli.nicolas@gmail.com, heiko@sntech.de,
 s.nawrocki@samsung.com, festevam@gmail.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, alexandre.belloni@bootlin.om, lars@metafoo.de,
 bogdan.togorean@analog.com, nuno.sa@analog.com, vincent.knecht@mailoo.org,
 kuninori.morimoto.gx@renesas.com, mripard@kernel.org,
 rriveram@opensource.cirrus.com, patches@opensource.cirrus.com,
 j-choudhary@ti.com, drake@endlessm.com, katsuhiro@katsuster.net,
 shengjiu.wang@nxp.com, paul@crapouillou.net, jee.heng.sia@intel.com,
 lkundrak@v3.sk, codrin.ciubotariu@microchip.com, mkumard@nvidia.com,
 spujar@nvidia.com, rohitkr@codeaurora.org, derek.fang@realtek.com,
 biju.das.jz@bp.renesas.com, cy_huang@richtek.com, joabreu@synopsys.com,
 afd@ti.com, shifu0704@thundersoft.com, shenghao-ding@ti.com,
 flatmax@flatmax.com, ricardw@axis.com, perex@perex.cz, tiwai@suse.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_193233_493194_DDB277EA 
X-CRM114-Status: GOOD (  10.79  )
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

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Mark Brown <broonie@kernel.org>:

On Sat,  3 Dec 2022 17:04:40 +0100 you wrote:
> Rename name-prefix.yaml into common DAI schema and document
> '#sound-dai-cells' for completeness.  The '#sound-dai-cells' cannot be
> really constrained, as there are users with value of 0, 1 and 2, but at
> least it brings definition to one common place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
    https://git.kernel.org/chrome-platform/c/3fda85324b8d
  - [2/3] ASoC: dt-bindings: Reference common DAI properties
    https://git.kernel.org/chrome-platform/c/58ae9a2aca6f
  - [3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
    https://git.kernel.org/chrome-platform/c/8a5a05583a04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
