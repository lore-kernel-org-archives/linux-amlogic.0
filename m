Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B97606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RfjgSUEU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQM3C8c8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gvZ76YUK1S7k52F6Hp14Z6ZR1Zt8LZSTLtpXrCQQy2M=; b=RfjgSUEUeN5bhNyEbaU2PALafr
	Y+OllORXfARt3862GDv6YVmodiEnPcMVQm1VgY3zC2/T2ORyzpiL5rJpbPgO8WizA8Cc/1uLwrHgX
	sVGESLDS/Gyy8qR4AZ+xqK7EQHSLVdBdXVloMwsyG434nSWi53oFuRxtK7jod1w0pkosouodmSACz
	pdtsrAtpyADi6CapBRs4OD9Dd+p/IzK8+Vg6f9flCr6xfADHBu+6Vpprqu1vXlPhyvs98zv/CvvHj
	I73csvmTbAajTbRaGICjQWOEu35IBJZMeYGCacmiQcYkkJkZdmvH7a+s8SiYjW8CN3Gw452aTDCwt
	hJ2+jiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufp-0000000FyMV-0h7u;
	Fri, 27 Nov 2026 12:03:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueO-0000000FwcX-0zf9
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso98376535e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780918; x=1796385718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=MQM3C8c85l/ZKqHUQSiPAAFGgRIN8BOWOcPunr/gB/m4hDFQhzPqyTXFWKJeebnico
         bnlAaviKTZC8Smy07v7JjlcbQo3mz7Eb6wM4x+/0Sf9qOxX7LbBOJ0Z0WsSfX31/zSJZ
         uKCO+M9f8p77ZAERfq20t2n29T8QDfBEKdbCAUiMehn9Cuf5UOJncTayctllwGCYQXIA
         wNDfnLhdVKLs30chvuX90zRZeQUOXU70EJgtkNQhlObV8soxxWBrCb2aWVi2ZETFtLHv
         7hH7nnQyN1Gf4K8NO9EqHtX05jzSyP3mNfsONPkcRl382ihJgHhvWVzwo5JaccsSSI+L
         N5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780918; x=1796385718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=cSv4mDDVPz6wz8BRw1fk7cxiXD19OydIDBQzsu/R3J0FhH44IFH/kGQt1X7CzlC3nc
         Pyqjuv5buzeDqetYR1DoaqV2tWJB2ydjucSgbCBHDxmjkzsb8wVU3ffaNeUv4tTDsztO
         CspnNcNKvku6nO/LAdaSmNLw5c6Xc3iW+qdSpgqn8lts2Dq8q7c/1vG4qIeEcxk9r5LM
         S0xrHpzg4Mg7XvNBYzzaaBeVA3vl53VI4d67hxp+zgDsO5JMbRY6SVR0byLRhK82LdEV
         5MA4luXCiCOxPTEhnc5SBxfDCgc4RMJmMc68OfJr2AD0X7UaZq6sOiUjpZRoWyx6NQWA
         1zfA==
X-Forwarded-Encrypted: i=1; AL+hErGqYAmxtihI7928ZBW47UipdQ7HmmffdJ36TSBrci2IiYwTYiaU0baIzPaM0HxWRrdBbTKc64+cdsvDhXjw@lists.infradead.org
X-Gm-Message-State: APuU4Z9tRfeJQvzXj7/tQM76Ny+LTRtpMLeFX3me2dr7O3hqOiOvsAGf
	hIl6Us4q13DiHbsvFW5TGSr9L6B+HarrrfKRbjjG8FRaEbn/slgN5ifB
X-Gm-Gg: AZFdTZfT0VTyRwzPK3sdRTcJdn6E/X81qNPr1s+D76+RYn8VZYuUIBQDl6adnSy0LMK
	+OKJWigU92h1AMs7l13Kk+005bEkYYLc+T/RH8EMTuoW3qDZRrwQYmkv+UltUjK+uj/j3mYco1e
	lPv3Dj5Cer0QMsjWhJExXUDaxBFs35POmspdTd2qxNaFgaV3OLYz7Pj1romTAskKIJCspf0fv/G
	7Da0yvgwxfHzzBKL0OxT4TUaUwC9A92RBPkoZabDFJTIMq9W6bsy3M7XwfPKyLA7eyFNsx4E14p
	vmR8fbYoR/jQivLyLAjJ24FooYv05XUbvYWiSWMOgaVJ4TYkqqvgJr+G5NmO7o/EUubxivDFOD8
	Y6RH8Aa6wfLdAuvGO7Ha9RtKFw3vyQ8U+iEMPtQR+vxx2S7uAarwWQLBUmN2m3zcyhArZRBKa7b
	86RFhnZlipiNoR+MUdti2Vks2o5wyIgTsJtY/aAOIgpDOIIlLC1DWsj7trwQJ0Gav8JovvAuuZl
	x3r96XAsuYBlARcgnznHHWZgkzsKm1apYmD96OufPonGHiNzlzLhbTU3gq6431FhUmrc420KjX3
	I5SzPGfZsR/6JEeAbpndNrlFOrKZW8VdKf1le44QWnygDe4=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr517059715e9.19.1795780916248;
        Fri, 27 Nov 2026 04:01:56 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:55 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 20/30] crypto: amlogic: drop unused field and stale includes
Date: Fri, 27 Nov 2026 13:00:53 +0100
Message-ID: <20261127120103.1532882-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040200_347850_5DB9B3E2 
X-CRM114-Status: GOOD (  14.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the unused meson_flow.keylen field, drop unused includes in the
cipher and core files, and fix stale kernel-doc field names.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  3 ---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  2 --
 drivers/crypto/amlogic/amlogic-gxl.h        | 10 +++-------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 72892fdcd55d..c11ccbaf920d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -9,9 +9,6 @@
  */
 
 #include <linux/crypto.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <crypto/scatterwalk.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-mapping.h>
 #include <crypto/internal/skcipher.h>
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 38b9645386ae..8ce3f6640753 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -19,9 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <crypto/internal/skcipher.h>
 #include <crypto/internal/hash.h>
-#include <linux/dma-mapping.h>
 
 #include "amlogic-gxl.h"
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 3f1ce6c05558..9c3df0d162b9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -69,18 +69,16 @@ struct meson_desc {
 /*
  * struct meson_flow - Information used by each flow
  * @engine:	ptr to the crypto_engine for this flow
- * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
- * @tl:		pointer to the current ce_task for this flow
+ * @tl:		pointer to the current descriptor for this flow
  * @stat_req:	number of request done by this flow
  */
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int irq;
-	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -90,8 +88,8 @@ struct meson_flow {
 
 /*
  * struct meson_pdata - SoC series dependent data.
- * @reg_descs:	offset to descriptors register
- * @reg_status:	offset to status register
+ * @descs_reg:	offset to descriptors register
+ * @status_reg:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
  * @support_192bit_key:	indicates whether platform support AES 192-bit key
@@ -112,7 +110,6 @@ struct meson_pdata {
  * @flow:	flow to use in next request
  * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
- * @dbgfs_stats: Debugfs dentry for statistic counters
  */
 struct meson_dev {
 	void __iomem *base;
@@ -181,7 +178,6 @@ struct meson_hasher_req_ctx {
 
 /*
  * struct meson_hasher_tfm_ctx - context for a hasher TFM
- * @enginectx:		crypto_engine used by this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  */
 struct meson_hasher_tfm_ctx {
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
