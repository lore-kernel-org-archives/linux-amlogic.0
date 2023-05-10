Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA97C77B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e1+KjN0ZXrSluPSxYdVeZOgwAS0v29PFXheAa0RC8oY=; b=MizJnekEkuIf7T
	+89y3m7CrY1DVVD8NeFwcSk3vbHzFxtru8XllHx//K9fhfiRFnevJ47iGkOhG00A55E3P+INWh4ja
	c+jnHyLFOx1RwQdp+IE3FisuO1/Sfaz8qSqHIn6A18CK6EQ1wx4E/NBmb0Sr9HgfgS1cAYjLr3yOK
	dk8ot0j7rH7z4G83n18wFwr9MZ8kNPrR4ZWgCMYfdmw15uqLMepvY9oEHm5StEBl0gO4Odq3w13at
	eNP+s/YeL2En7QAvszyQYxwjovOqFdy2VbiDZV7nmxiixJ5FYLnSITZFBI1jfDSG4brwAQpVeLkcu
	+rrYP97W9XjQbNZhaTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwj65-0069ot-2n;
	Wed, 10 May 2023 12:39:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwj63-0069ns-0P;
	Wed, 10 May 2023 12:39:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E702863DCA;
	Wed, 10 May 2023 12:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A45C4339B;
	Wed, 10 May 2023 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683722344;
	bh=f0fP/tgxFKsPgjnscQ94ka4Hd7mBxCyklUQ2gUyL6IQ=;
	h=From:Date:Subject:To:Cc:From;
	b=tNFNAF35JsCGohGM63hPwU4+ItmPRKpaN3yBaORCq9j4E24GrMrxqbYUPuZR8g/oW
	 d9L69xe7/7tQ1zPv9bda95KQhpHe5fvko8N8uB8D2BPO4IFiy6ULAQHdnRnwRQ/Kap
	 dGS1vHBbPGLkcFbWBXXqafhpAxtZO44S58Qq0IjYPV6x/88Jgbe0OMA/JaAlaJwyKw
	 89IwW/R6bWp9TS/t43/AGu/JHrRx0lV+Z4x2yOUphC7cp+B7bl6sK/xj4B8A53pCk0
	 Wu0bQWHYPX/bYKOqm6l6AOy9Lbb9zb476+hYwHXNcceJp0O5pFBhdV7G9nto20aGHk
	 23wbO0TkA4gkw==
From: Simon Horman <horms@kernel.org>
Date: Wed, 10 May 2023 14:39:00 +0200
Subject: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function
 type
MIME-Version: 1.0
Message-Id: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGOQW2QC/x2N0QrCMAxFf2Xk2UDbMXD+ivjQpakNrFWaTYSxf
 zf4eA7ccw9Q7sIKt+GAzh9ReTUDfxmASmxPRknGEFwY3eQd1kqoqZBg1Yp5b7TZBCnqhpnCPM1
 XH9OYwQpLVMalx0bFGm1fV5Pvzlm+/8v74zx/8Nf47YIAAAA=
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, llvm@lists.linux.dev, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_053907_256513_C0FDA733 
X-CRM114-Status: GOOD (  12.50  )
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

Rather than casting mmc_free_host to an incompatible function type,
provide a trivial wrapper with the correct signature for the use-case.

Reported by clang-16 with W=1:

 .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_host *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
         ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_action_or_reset'
         __devm_add_action_or_reset(release, action, data, #action)
                                            ^~~~~~

The same approach is taken in litex_mmc.c with the function
litex_mmc_free_host_wrapper(). There may be scope for consolidation.

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index da85c2f2acb8..97168cdfa8e9 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -776,6 +776,11 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
 	regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
 }
 
+static void meason_mx_mmc_free_host(void *data)
+{
+       mmc_free_host(data);
+}
+
 static int meson_mx_sdhc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -788,8 +793,7 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 	if (!mmc)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
-				       mmc);
+	ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
 	if (ret) {
 		dev_err(dev, "Failed to register mmc_free_host action\n");
 		return ret;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
