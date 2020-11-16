Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29095C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5BC222E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ycJyghY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2UW4VXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5BC222E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E7RkinX37DBUE1zi1zWW2y3zOprtbl8cU0kJPDq9nmQ=; b=2ycJyghYn6PT6KUFaWC0rWQEv
	BDcH92QYUeqEzp/AGc+1AxJYazq4hf34YlkdfS4hTYYjLn3qHn3iD0mW6zFlPMW66fcU2aZhzLiun
	BIitanAcf4c0MBbe9IWE/ZycNHQuIY/emYtvQHxZenwiWR71uFxut391S43G8cle8NRpa/TmGaYFp
	g/HzpqpCQJ3bxlDDDfkWkS3Q2XvoCM5zZaR1F/Wgnn+iGQbArRkSgLDyYCC6jV3JqWE8Z1bnavxAh
	aBsyQaLmKLgDCN7lZLLr2NpMvPA7Q5+7u6JGQcgtJoNZavhtiEVn6uE8CZylOMoEVKiCF1ldVBlf5
	Cj5/g44Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keifv-0001J8-Oh; Mon, 16 Nov 2020 17:52:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keifK-00015q-Ni; Mon, 16 Nov 2020 17:51:59 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DF3D206D9;
 Mon, 16 Nov 2020 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549105;
 bh=01bBWQt5m1BIflz7aF7nD81bGfvALRAb9nF6NGbIkcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2UW4VXWuTDtBuFpoj1xY+LVIZTNLSkksUJ1l2FtrLmYrgVqUb2At42olz/GaNfpx
 5nOw8xiTubsQUOsqncgjLFzyGIs43D/4A2ivwhvOpaAVwur+ZNLmXSCexvhN4RAjlo
 xIns/j1qFCUCWQ3EZl2cyuAZenpc1ZZnEvWyWO7M=
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
Subject: [PATCH 2/4] ASoC: sh: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:51:31 +0100
Message-Id: <20201116175133.402553-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_125146_944499_DE01DB73 
X-CRM114-Status: GOOD (  14.62  )
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

The SH4 FSI sound drivers use SuperH clocks thus they cannot be built on
platforms without proper clock support (e.g. compile test on MIPS with
RALINK and SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/sh/fsi.o: in function `fsi_clk_set_rate_external':
    fsi.c:(.text+0x2714): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sh/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index ef8a29b9f641..346c806ba390 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -23,6 +23,7 @@ config SND_SOC_SH4_SSI
 
 config SND_SOC_SH4_FSI
 	tristate "SH4 FSI support"
+	depends on SUPERH || COMMON_CLK
 	select SND_SIMPLE_CARD
 	help
 	  This option enables FSI sound support
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
