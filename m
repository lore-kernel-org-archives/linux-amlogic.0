Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F826606A321
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qo6F10PI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XXg5WRKa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUF1LCP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ZkzRQSLdcUGeVBIRQ1Q3jCZiM3Zg4QK+ZxaJhYwtjA=; b=Qo6F10PIXca2BYXdHJa3WnNR8G
	Sh5LaYPQXLNCj/xIn3QM8suZqAZDXxEcJQPoxBq1P2OiHwb+wVR+m/ukwh4b1PxRDjtPwazvEdncm
	1SlD92PWSDd1PdaN0FIDOQf7G8ZkmYetq8cpblx34KmwKTvc1C9zLp1ZpUa/I7ycMNy7OIJJjW7WB
	y4SjgWngmzIFseCeWFCt9QRcrTjxJzFVSnRtJyW21f7ojpHikvnuPv3EABB6OyjjHLxdo4OREwb0E
	uRxw7CEuXTgq+ECcA7v6IN5tDbW+pQs5kGiy4QVdRUZHT4zfI3sbG3CHl/MaWdmC7B4DubTEQa1m9
	aAbmtouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEN-0000000EKz9-2mk1;
	Thu, 26 Nov 2026 19:34:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDv-0000000EK6D-3eRx
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=; b=XXg5WRKawZzAq/elMfCgoBFVoS
	Jz/cDJ6gcz2ElAenArRtKatftV1mu4AfEiKLrHcPEz/BCmMos/jfouLR6OwxK9r8FsZSuh2m1J1+K
	KoQ21R+7NBMZdwPcVma6RmkGEpiCttsTVBbkCooxUYy15J6TeVCS7r6vs2bMI1V4ujQDwnxNxuwiX
	C7nRQq+h/o2zuGBurrWFkaXCTIc+lzJzjSM8ylLP5UMVvr2PBC6s98cfKw0370Ybx63oCLie5TUGc
	8bM3UZYDV2ToIL/I3RGQdAUqgeaknblk68GjcJ1fw9Shj8RMF6NhEj5ot5SEGR4Wxy6Be8HE8Qf8C
	M1kV5Ejg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDq-0000000700E-3u7B
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso52984495e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721613; x=1796326413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=DUF1LCP7w75f4dgZqzCctLdlHnIfLLW38uJvQmXLABUYoaOApb37Nz+aYqpMS55FEj
         KdpiSKQGn9v8DJsMnoc8tME6C/3m+fntHd341MEkcJD81sZssHON/eHPSkewCjK4Tu2d
         qH+jaxsxU5CwYKFrOxI7wYaakt2jllpBxKUg9zK27vNyRELuB6fHugaT9UmzTRuDw3U+
         dmFJufTv8KaIpH6huPasGE1hjlEYPQVSWggLOhyZ9WbHRjI5euEi3sRL8kJ5IidWxf88
         XRPCSfwuYTwvTUZPHyWdy/l3/uhPKzaiobP+8WX7piiUNFUXJ/mod+XKJt1JuPzQkYPG
         cJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721613; x=1796326413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=yj1HE+PiAoKbJNvZ/um1ZifEnzlIoU13Hh+37W+EM6QXwGVJN6+W89X12wcOFTdkNA
         wT3Nu6UJB+w7mZevTcwdJ6/Ty6b6q3tpvznFXsABoGKR+eTUgQKZ1sG32HE3uIiPP0XP
         H+BplKHrTqwEqhZhXBWQ2Wme6Sx68IH7O+Udd2iLC+8bOKQIL39F6KSt0JRSuMIeiJhV
         nuY8LfC+jN22yzEXYPv23NcSLJmIaMcWq5iqr5rXpJni9aXstL6vWVcWIDdyb2wNsF7n
         lI+vm9OsUJA5cVXwz7+/O3iQtl6vxDJL5iE39wrSXTlfrhjeAGcLqH6TiCoCrjv0MdKf
         R39Q==
X-Forwarded-Encrypted: i=1; AL+hErE/DA+BJ12z4Cf4+HLuNCqrh8vzFarTTvGQMEQqfBp+ecAm1KFKn6sLs8e98GVVKxOCrbvau7T7gu+Bqpi6@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZE6M/NC9Y+WNMdBrA+EuhlsVdT7Z852rsOduu++2/S+HdK6vZ
	f2Sj4/IzYoVRQQs9a/1gOdIMwLmZ3lFbEfw4u67MoukUdZ0ISaPyCO0g
X-Gm-Gg: AZFdTZcny9J8LX+Aqwm/GZyEukV7bvwwN0lHcx6mp+Y8kj97KSvNrbFH/IUwwCIhr4Y
	qqzjh3Wfc35s0qn4cdZCObiEEa1NKZdjmR6JMFyWyr79SsoDhGioI3UybCQLVQ22OPtverUiJyc
	EOLCvh1cQx6v7NhNK6XeGT8Sj3VtUTzh7rJVMCBtgLivL9TNAV9hJTl2QHLYMZn3WJLbgi4jGfD
	/rXE5I/gvRhOy3UO0YwpOR5r7v4Z1bA9ecwfR/VHE1d+9Ae1mLs9DDllKILO/0rwlmr12Hfr7oM
	elVWicGGr7njC+YBfcrhPjNXo4LLLJnEpPIzj0XV0B4o0DvfNDIhUCtTyGpajjktUKJSgO3S9E4
	9Tok62ysiuCD5tqO+mRhbIPWlG7Emvpyvuplb8tuUrZiSow7Dg6E4PkEAxSkr5yV6wXr4UYex/I
	mq6opxmyJ/+NNgOWzT0aYRBNz1kj8J8v4Glmyfy/mzd4ShsCRpYHYcaQNRHsaVqEtHpQ1TGYkCN
	DCfK/itXARedJ+TLvluoKSxPauYzNQamGzDvUqo5a2nFpTL7rTlnkoiHF5gtDtVo7xoFFee+AgS
	6UIdbZEddQESKOEPMyLhdcx+4R7QBn1oEGSpekcUEE/605Zy0IUEbJoAv5U0oy5BQoc=
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr548704265e9.5.1795721612906;
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
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
Subject: [PATCH v13 20/25] crypto: amlogic: drop unused field and stale includes
Date: Thu, 26 Nov 2026 20:32:36 +0100
Message-ID: <20261126193241.1471372-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193334_834175_30225CDD 
X-CRM114-Status: GOOD (  15.13  )
X-Spam-Score: -0.2 (/)
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
index e79175368d8c..90c817e412ad 100644
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
