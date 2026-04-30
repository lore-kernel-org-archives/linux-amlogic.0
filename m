Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A59ECD13DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29/4wXhc1mWmiqm/gCCRNPHl6qAhB4acF753VHDJdnY=; b=fI7/TKvLhVF84S
	8pryX4DzeX6J1pfRGyt4NAF+ymFJZCWfdrwafhmHeKYAYxJs5kJjrWtJg6RbuTDrQCPyGyvI8TKfT
	3huhM4Md/C80i0V9z4MijEIdJ+wtXSq/aip2xu303m7qXlZApyidnpkVMsumGz4slf88nA4d3coPh
	6eqMl+AAC6beg9npyIjeTOM1/CvUXX3RV/lY7ZvkhQbD0NOoeQZZpWcO2cAOw+7GK/UHIe3A2N0Ol
	U6L4YRG39+bUppoachB6sIv0vAsse0l3rtbizosg6A/fNbX3sAe+UzH9tSuJSKSUaQjG3Qz4twaEs
	oxN6YWmaWrHb2C8VOQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkG-00000005gMI-0PJw;
	Thu, 30 Apr 2026 15:56:08 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk1-00000005g9v-3VIJ;
	Thu, 30 Apr 2026 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=h/
	7T1NDghetOHRJTyiGBs6dkj72nosx7Vr+gqd9IPi8=; b=oHuZOIlrbjneTkFD57
	+HdARWyQjbuM2K+9E8apm9oASe/dq/mESx9apsulDZ3FH1LjAdr/4T0qUXNtay+e
	Au3rHgG8hU2MXS6wFynfNm8IVTQBkgpU6QDAvTdQkkj+aa9u5/fykhGUuxPInofP
	gLED3vSHYcXpg7ltIVec615nI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S6;
	Thu, 30 Apr 2026 23:55:04 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 04/10] spi: meson-spicc: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:50 +0800
Message-Id: <20260430155456.36998-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4DWFWfZr4DZw1xAFb_yoWfCrb_Ca
	y8WF4IqFsxt34xAF17Ga4xCr90vrn8Zw4vvF1vgFyfta1kZ3s8Zr1DCry8GF15CF4Fkr4S
	9r93W348Zr43CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN6pBPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BhM72nze1hYgAAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085554_312873_5EBAD804 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-meson-spicc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index b80f9f457b66..682dda114412 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -539,9 +539,8 @@ static void meson_spicc_setup_xfer(struct meson_spicc_device *spicc,
 	conf = conf_orig = readl_relaxed(spicc->base + SPICC_CONREG);
 
 	/* Setup word width */
-	conf &= ~SPICC_BITLENGTH_MASK;
-	conf |= FIELD_PREP(SPICC_BITLENGTH_MASK,
-			   (spicc->bytes_per_word << 3) - 1);
+	FIELD_MODIFY(SPICC_BITLENGTH_MASK, &conf,
+		     (spicc->bytes_per_word << 3) - 1);
 
 	/* Ignore if unchanged */
 	if (conf != conf_orig)
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
