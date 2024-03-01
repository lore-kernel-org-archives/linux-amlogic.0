Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2289DC5475B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MonbKrfMkOgUUM73LOf787JxX+mzUsEiaSS/iWIJE7A=; b=uJD+oGrrIaHArW
	lrXq+fplCT7YkI/8j31+adIrxMm0QVCsxEWTwMuLQGQXQOz66tHKQa6pLatYaRh2thn8bLiVwub//
	oRLmjsFo7rp3YyJuLuE5k77hPngFArf6b3nB8DaLAlxOvbzb9jwMhM83liLZOfVCnptdZ2/OFVJnW
	iiCs3+Uhw1mLrf2xSaV44tDTi/qJqaEgwo6HgOzM2dOdFIgYbk7Gl00YbHCYbl0+fPEVfRR8jKXGG
	tPWzABf0a0i86/T7G/mfCCrEL5YLMSHijYAEMZZxVxFBTFNqz9JQDKMpgr+4S7FHdbFbAXyAei8qi
	aR6KIEn79hwhHIE2/kNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg35x-00000000XlB-3sg8;
	Fri, 01 Mar 2024 13:38:37 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2xq-00000000Shg-0D83;
	Fri, 01 Mar 2024 13:30:15 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9E3481200EC;
	Fri,  1 Mar 2024 16:30:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9E3481200EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709299812;
	bh=roUwNBdU2vfmeGO0/uPIeWXRlle4l1zNhmfrHjctP+E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=eELWm7G2bZ7yNjJAgmEJlxLGZ19BxsK4Rfpbgya8DOLzB0FOLXE+GIo+EOyLIeAq+
	 X4aTDh2o3W2WDqYWLyprWz6CY2MmVbqk55D0K4Qg2oE6ZHQG+3JWlUNC+lLyotplnu
	 Q7iX+NwCzSu2hGy2EdNYuDVvJ/QCAtZjitzeFhpLS3pL2pkA1YRtNb1fLIgJxyPv0X
	 0Jkkty3Yx3b6Mwkp0rXdk2YrA/aJZUbxjEKR8ykbHUcgIDa9I1dXYM8Y/AK2RULQNj
	 X0Kb8bYguK0VQ6pawbSFLZVwJ3rFM0dWpaxEGatydC6UvDM3WeSu4ODBFnGuOzbcc2
	 sIDTnzRKsh3vw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Mar 2024 16:30:12 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 16:30:11 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v5 08/21] drivers: crypto: meson: cleanup defines
Date: Fri, 1 Mar 2024 16:29:23 +0300
Message-ID: <20240301132936.621238-9-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301132936.621238-1-avromanov@salutedevices.com>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_053014_467649_78B84E29 
X-CRM114-Status: GOOD (  14.92  )
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

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index bc3092a8a2c2..c662c4b86e97 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -205,7 +205,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -348,14 +348,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -373,7 +373,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -402,7 +402,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 9d66903aa73d..1ab3462dea42 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
