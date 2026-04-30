Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E3ECD13DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYnMX8ijWPoM5Eu9p+ToMaUBcAs3VguydgwUkM02Wx4=; b=bl/DYWyZzp69CN
	0UUXGbzpNVlY5z86XANF3IxmuF4EX1o1blbl11XedNppnsmxqLGuLanttl8HTdTh3BwpKOSOXF+Um
	htqmY/MeQVOlihKoeWqKbyYG4ujhI1W+CMm0CDVJghrZtUH4XOTJCATKh/nSnvZwMYLrB65m3UoBt
	NB9LhZ3SEZKhe9RDNiWrFKzqON4lXfEi9Bsaokdz69EMi83W1PqRLYxXl6GBkwyvkqFXChNEafGdb
	IXeN40/2dJono+MjYN2Inm6Vulkf1FPJ4M/lq3VjKFB4yCseJre2FHZuGKlL9ZI3XWcDrhkCRYmVu
	X4rivZFdHrga78+jL6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkJ-00000005gRN-2ulM;
	Thu, 30 Apr 2026 15:56:13 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk7-00000005gB9-0Yco;
	Thu, 30 Apr 2026 15:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=19
	prBy0n5wuyUpUdXN4aPlt40TxeRc+ijGpYYWAHrnw=; b=T9pSkmCWcahkdwYwN+
	JEqB7kssGOAN2DzJVHZhlCfIHGwqag/u6OA5YBG84PumYwOKjWXE0gYavC3QB4Wo
	4akF0Rb+XZUHLduYZoktCUDw0Q3lyMcBumhcAm4B0K3FoDnR3NMB3oXHAYePappo
	5XaZO2I8ULEMUY5LZ94UxBSco=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S12;
	Thu, 30 Apr 2026 23:55:11 +0800 (CST)
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
Subject: [PATCH 10/10] spi: uniphier: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:56 +0800
Message-Id: <20260430155456.36998-11-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S12
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF43JF4kKrWUJFyUtrb_yoW8WFW5pF
	s5GFsFyF40yr4UArn5Aay8uFyaqa929as7Ga4DK39xX3WIqr1UAFW0ka15Jr47AFWxXF1f
	Ca93AFyrGF47ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi9a9hUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x9N8Gnze19PzAAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085559_614909_FDD12B06 
X-CRM114-Status: UNSURE (   7.56  )
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
 drivers/spi/spi-uniphier.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
index eac6c3e8908b..846f65ba9495 100644
--- a/drivers/spi/spi-uniphier.c
+++ b/drivers/spi/spi-uniphier.c
@@ -184,14 +184,12 @@ static void uniphier_spi_set_transfer_size(struct spi_device *spi, int size)
 	u32 val;
 
 	val = readl(priv->base + SSI_TXWDS);
-	val &= ~(SSI_TXWDS_WDLEN_MASK | SSI_TXWDS_DTLEN_MASK);
-	val |= FIELD_PREP(SSI_TXWDS_WDLEN_MASK, size);
-	val |= FIELD_PREP(SSI_TXWDS_DTLEN_MASK, size);
+	FIELD_MODIFY(SSI_TXWDS_WDLEN_MASK, &val, size);
+	FIELD_MODIFY(SSI_TXWDS_DTLEN_MASK, &val, size);
 	writel(val, priv->base + SSI_TXWDS);
 
 	val = readl(priv->base + SSI_RXWDS);
-	val &= ~SSI_RXWDS_DTLEN_MASK;
-	val |= FIELD_PREP(SSI_RXWDS_DTLEN_MASK, size);
+	FIELD_MODIFY(SSI_RXWDS_DTLEN_MASK, &val, size);
 	writel(val, priv->base + SSI_RXWDS);
 }
 
@@ -308,9 +306,8 @@ static void uniphier_spi_set_fifo_threshold(struct uniphier_spi_priv *priv,
 	u32 val;
 
 	val = readl(priv->base + SSI_FC);
-	val &= ~(SSI_FC_TXFTH_MASK | SSI_FC_RXFTH_MASK);
-	val |= FIELD_PREP(SSI_FC_TXFTH_MASK, SSI_FIFO_DEPTH - threshold);
-	val |= FIELD_PREP(SSI_FC_RXFTH_MASK, threshold);
+	FIELD_MODIFY(SSI_FC_TXFTH_MASK, &val, SSI_FIFO_DEPTH - threshold);
+	FIELD_MODIFY(SSI_FC_RXFTH_MASK, &val, threshold);
 	writel(val, priv->base + SSI_FC);
 }
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
