Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C7C48298
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpCbEvkwP5U1xx63d/cq9AwXBlPUFM1yWGV7zzdiOuQ=; b=yLMiBaPesE1j8z
	m47cLzH5PBk6KadNiXH0S4T1m+7tNfJHX0WOkcOj7SqH71odhouDzF4BtFeQN8QH0LpOyczUki8Uk
	Ehw56OBOp2SQoSO16t0hf/pf6pbbTX6MCG2xnBuW/y93wNVFCXDU0KSANHQVh/Gsx50/qTpMBgNF3
	Sg465GNQyuH3uX+4DCIlodJJnvh1MVqdrnQsDMNr85sMWcqOQqtpb+By5oPRvnoxvVoMIbhgKBlta
	eThowimjG7GUklnd/lU8Pdy/khodim8/qUDDWy23Y8OsbZvraFiH/WnTSjd87h100ESGKIH2xptq3
	2mVKx602AZgXb/mjo/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1M2-00000003u1q-179z;
	Mon, 05 Feb 2024 15:57:54 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1KE-00000003spg-3CFr;
	Mon, 05 Feb 2024 15:56:13 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BB3FC12000F;
	Mon,  5 Feb 2024 18:55:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BB3FC12000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707148552;
	bh=zDAhb+Rc1l4GwazN7hwx3va0URSvsV0XxGiBlV0n2II=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mQoN8TtDtmXVyYxWgfnNrEcm8+y2z2IuHfnT9QyGi9lNACTp4j4QuV1Ln3KbtmZuU
	 0eUg2n7J5/ppxD1zE4vLjU/V8W0d2NrvlQ+g4u98IdXHjw44GteyO8GgOACQcL5+hU
	 lR1fdogiA5bUWXQJNScsLpiZP6teEoTF8qkwodET9h5zbowUPAmkwfzgoh0Qp3V7sD
	 cuzcKH8cPQGR1OCM78EZQl76ezPzjrBUpHcQFFdDpHgKJq748ZZRNO3w9RhU17xn8+
	 /U9YlR9OlaeK/V6OgGwPH60yqKkp0Ju6k8oEKhZydcMAOcIFBmNBuipkwgpRBOH7H6
	 7muXxZhNDblOg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  5 Feb 2024 18:55:52 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 5 Feb 2024 18:55:52 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v3 13/20] drivers: crypto: meson: use fallback for 192-bit keys
Date: Mon, 5 Feb 2024 18:55:14 +0300
Message-ID: <20240205155521.1795552-14-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205155521.1795552-1-avromanov@salutedevices.com>
References: <20240205155521.1795552-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183204 [Feb 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/05 10:19:00 #23362212
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_075611_729991_FD1F702F 
X-CRM114-Status: GOOD (  14.76  )
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 828109f4a1c3..da593130553e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index f3b5e004b3a5..429c3474028b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -215,6 +215,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.need_clk = true,
 	.setup_desc_cnt = 3,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 7f6d91e7b365..2d2777a25453 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -98,12 +98,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @need_clk:	clock input is needed
  * @setup_desc_cnt:	number of setup descriptor to configure.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	bool need_clk;
 	u32 setup_desc_cnt;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
