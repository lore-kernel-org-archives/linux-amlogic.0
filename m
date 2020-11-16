Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43412C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 19:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E602225B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 19:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NmGRdTAo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilLlQscx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E602225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ph9IuIlttm/q5Kd252yW/6eYFdF4H+EMRJQ/m15ImZU=; b=NmGRdTAo/EYxn9hTNe/121R0L
	o8hBAN39vw4Apk8ZGicea5vWqwmSWGg8h/8xfARBnY4S7gugFiQCMAzkRTeBip18moKQSK37kZxCV
	WleQ7wVTQvN5cVwPrhsrBRtUpwsl4A9PciMP40GKRh47MKFCrOkKrF74GCxXjPmq6ZZc2V6f7ePBb
	566zkiXLJ+JQN0BAcTnEZpkF+VzxNyM1Z4d4GMsQiOHR30UreKrriOLwdQE5a5/Uubo6YyuOHEnVQ
	m+odjaxH8z/EKJAYYu2Xgkru7BHwjaWWV3apSTI8qJ5k9cpzaW5cFAwA4WAJhnf5JaesXfapKt43F
	9PrPdl5AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kejoc-0004B7-Gv; Mon, 16 Nov 2020 19:05:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keifS-00019D-Gw; Mon, 16 Nov 2020 17:52:18 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 300F820B80;
 Mon, 16 Nov 2020 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549113;
 bh=eEsYH55eH+FauXTIeKvQAw4mnoGY2nOsaUiqsTf/7WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ilLlQscxULowt4Lmlymi7n8TbrOjii1m9ZEPk6XgeI7cDozEVjFUbCO/t7yxdIQtv
 PbKmDIJE0fSsLticdAx3N74gXSbLw3U77x8yrKf/PMn9hQyRP+eG+uFFpq+jQT83PY
 Bxckzm+EH04bt+SaoLDQmmBZIAA//eY4lludgWcs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/4] ASoC: ti: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:51:33 +0100
Message-Id: <20201116175133.402553-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_125154_789674_462CB6A4 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The TI/OMAP sound drivers use Common Clock Framework thus they cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/davinci-mcasp.o:davinci-mcasp.c:(.text+0x1c64): more undefined references to `clk_set_parent' follow
    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/omap-dmic.o: in function `omap_dmic_set_dai_sysclk':
    omap-dmic.c:(.text+0xa5c): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/ti/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 9775393d46b6..698d7bc84dcf 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -26,6 +26,7 @@ config SND_SOC_DAVINCI_ASP
 
 config SND_SOC_DAVINCI_MCASP
 	tristate "Multichannel Audio Serial Port (McASP) support"
+	depends on COMMON_CLK
 	select SND_SOC_TI_EDMA_PCM
 	select SND_SOC_TI_SDMA_PCM
 	select SND_SOC_TI_UDMA_PCM
@@ -47,7 +48,7 @@ config SND_SOC_DAVINCI_VCIF
 
 config SND_SOC_OMAP_DMIC
 	tristate "Digital Microphone Module (DMIC) support"
-	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST
+	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for DMIC IP found in
@@ -55,7 +56,7 @@ config SND_SOC_OMAP_DMIC
 
 config SND_SOC_OMAP_MCBSP
 	tristate "Multichannel Buffered Serial Port (McBSP) support"
-	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST
+	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for McBSP IP found in
@@ -99,7 +100,7 @@ config SND_SOC_OMAP3_PANDORA
 
 config SND_SOC_OMAP3_TWL4030
 	tristate "SoC Audio support for OMAP3 based boards with twl4030 codec"
-	depends on ARCH_OMAP3 || COMPILE_TEST
+	depends on ARCH_OMAP3 || COMPILE_TEST && COMMON_CLK
 	depends on TWL4030_CORE
 	select SND_SOC_OMAP_MCBSP
 	select SND_SOC_TWL4030
@@ -221,7 +222,7 @@ config SND_SOC_DM365_VOICE_CODEC_MODULE
 
 config SND_SOC_J721E_EVM
 	tristate "SoC Audio support for j721e EVM"
-	depends on ARCH_K3 || COMPILE_TEST
+	depends on ARCH_K3 || COMPILE_TEST && COMMON_CLK
 	depends on I2C
 	select SND_SOC_PCM3168A_I2C
 	select SND_SOC_DAVINCI_MCASP
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
