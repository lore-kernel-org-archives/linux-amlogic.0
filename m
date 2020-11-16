Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBFBC63697
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:52:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1066820B80
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2+cbG6BC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBAUnKX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1066820B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGnC34EdqHvDLxLgg2UFek9WP9MKb2IqdjsZnq76WAo=; b=2+cbG6BCzW9lfMPmFo/5FymIg
	MUprsu8K5vUbUx4ftPtD/ZEjuhZU1yULosLeoklpkIooo+48RZFgIEULm7ZSEU+gS+UM+FIoAvA88
	Em4NzizlPdet0yecls8k1CnPJweVx8kvkwHZRbYeB3oMxNJM/48hVEYbVWz+HyP2KJ+vC/XW54v6f
	Wm+kpLE300Po/88Z6oqEY/RSBqCPADU69CvyNpZ9BzhfckcZigS5bplGlEKsfwnhWFU/ea+pnE3ka
	4cgcpEZjM76Gd6h0B8gpY3sJboSKkG8qTXCFZXTChQXlOdqwk+t/sLYH6Vz77z0Kw/VB9j+jqUEEe
	TZQ2hWbvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keigK-0001Sg-E9; Mon, 16 Nov 2020 17:52:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keifO-00017P-Fa; Mon, 16 Nov 2020 17:52:07 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4599121527;
 Mon, 16 Nov 2020 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549109;
 bh=U3gPdvUKBY4tT+mqMZ48wnhnjs8kcjcv1bwERY/jLCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jBAUnKX4FWEczGUOTPVmRGx364XSwixdowHViT4Ta3zeqZ/sfFoz4dNBf01M2ZOCp
 1KE+32MMNXLQUXELs0xQ5l+uxlXeowtX8xnMNA1m3qun1hk92Y5vitWZQ+1fCPQ+hc
 8NhcVRS3/7uZUeMITlDWhUe9mGB3V+LF6G7MlwVU=
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
Subject: [PATCH 3/4] ASoC: stm: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:51:32 +0100
Message-Id: <20201116175133.402553-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_125150_633960_0F9ED42C 
X-CRM114-Status: GOOD (  14.49  )
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

The STM32 I2S drivers use Common Clock Framework thus they cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/stm/stm32_i2s.o: in function `stm32_i2s_hw_params':
    stm32_i2s.c:(.text+0x1870): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/stm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index bbade257fe89..da1f7a16605b 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -15,6 +15,7 @@ config SND_SOC_STM32_SAI
 config SND_SOC_STM32_I2S
 	tristate "STM32 I2S interface (SPI/I2S block) support"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
+	depends on COMMON_CLK
 	depends on SND_SOC
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select REGMAP_MMIO
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
