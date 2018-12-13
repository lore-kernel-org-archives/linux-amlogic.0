Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376DDC65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 08:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BD52075B
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 08:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGrEP927"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BD52075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82UDZCTC89otbyuQY82Ck8gZdT2B/durF4v1iItmsGU=; b=tGrEP927I/XhwM
	ufPVJ9o8APalLrSDH6hXVwsS7DZZdNWEQmMrP0BXL4cFwt+6dHHKCc3TpyXh/eUmnlUJkfFr6hNPR
	1/9HQORlkvdwxD7SOF1y/VmxDJrChbtbyYnAUZcjXC5x4SnlbhrDXAS/1c69W/rTWj0+/Vz07CLej
	V5HgpzgTfvNs/JBm/jQY7nVvRUjCxG63igoYDzYgQCrXIEBKUt5R3zLyUcBhoAHbLb15qUPhbiM+O
	tv2m1jbz54o0DeB6Xdri4fUmAyZ6qxxQ+ulj8XR6zr/2SUG1dymBXp+IoO8ThzrufnHbi0No35jTS
	3MJjlM0vcTDHOByMh/6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXMZQ-0006Nu-RN; Thu, 13 Dec 2018 08:42:12 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXMXo-0004Zj-HB; Thu, 13 Dec 2018 08:41:08 +0000
Received: from localhost.localdomain (10.28.8.16) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server id 15.0.1320.4; Thu, 13 Dec 2018
 16:40:02 +0800
From: Sunny Luo <sunny.luo@amlogic.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/3] spi: meson-axg: enhance output enable feature
Date: Thu, 13 Dec 2018 16:39:13 +0800
Message-ID: <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
References: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.16]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_004033_203269_E32C2783 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Sunny Luo <sunny.luo@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SPICC controller in Meson-AXG is capable of driving the CLK/MOSI/SS
signal lines through the idle state (between two transmission operation),
which avoid the signals floating in unexpected state.

Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/spi/spi-meson-spicc.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index b56249d..0384c28 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -115,6 +115,13 @@
 
 #define SPICC_DWADDR	0x24	/* Write Address of DMA */
 
+#define SPICC_ENH_CTL0	0x38	/* Enhanced Feature */
+#define SPICC_ENH_MOSI_OEN		BIT(25)
+#define SPICC_ENH_CLK_OEN		BIT(26)
+#define SPICC_ENH_CS_OEN		BIT(27)
+#define SPICC_ENH_CLK_CS_DELAY_EN	BIT(28)
+#define SPICC_ENH_MAIN_CLK_AO		BIT(29)
+
 #define writel_bits_relaxed(mask, val, addr) \
 	writel_relaxed((readl_relaxed(addr) & ~(mask)) | (val), addr)
 
@@ -123,6 +130,7 @@
 
 struct meson_spicc_data {
 	unsigned int			max_speed_hz;
+	bool				has_oen;
 };
 
 struct meson_spicc_device {
@@ -145,6 +153,19 @@ struct meson_spicc_device {
 	bool				is_last_burst;
 };
 
+static void meson_spicc_oen_enable(struct meson_spicc_device *spicc)
+{
+	u32 conf;
+
+	if (!spicc->data->has_oen)
+		return;
+
+	conf = readl_relaxed(spicc->base + SPICC_ENH_CTL0) |
+		SPICC_ENH_MOSI_OEN | SPICC_ENH_CLK_OEN | SPICC_ENH_CS_OEN;
+
+	writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
+}
+
 static inline bool meson_spicc_txfull(struct meson_spicc_device *spicc)
 {
 	return !!FIELD_GET(SPICC_TF,
@@ -453,6 +474,8 @@ static int meson_spicc_prepare_message(struct spi_master *master,
 
 	writel_bits_relaxed(BIT(24), BIT(24), spicc->base + SPICC_TESTREG);
 
+	meson_spicc_oen_enable(spicc);
+
 	return 0;
 }
 
@@ -610,11 +633,12 @@ static int meson_spicc_remove(struct platform_device *pdev)
 }
 
 static const struct meson_spicc_data meson_spicc_gx_data = {
-	.max_speed_hz	= 30000000,
+	.max_speed_hz		= 30000000,
 };
 
 static const struct meson_spicc_data meson_spicc_axg_data = {
-	.max_speed_hz	= 80000000,
+	.max_speed_hz		= 80000000,
+	.has_oen		= true,
 };
 
 static const struct of_device_id meson_spicc_of_match[] = {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
