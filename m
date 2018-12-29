Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AABC43444
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Dec 2018 14:36:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA5F2087F
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Dec 2018 14:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hj/xgEIS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tnuuDwY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA5F2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvO0s4jj1sXRPlvTRGkEYRiBtM8ih001GUaeujiiYy8=; b=Hj/xgEISiZjSDx
	AFX9YINRIFWrO4KcXWCl/p2JnKtr/RNYxOEG0iHnGaRbSo3x7ua9y88yeLtouzu1TSRDwtiUUbQ5a
	coaDaWeSuf/ARQ3cgSd8KXXvdkill1U72G39CVa9iefeGRsO8oomf7Ov0x93Y2L6aV6qWSLFPsvj9
	4ayN67egIIrwMPyq5nKrOITjhG7wtRHaZqm/6X7Zi3tKptEoKUsyY5c6lbzXyvJopPREnoFaoIGc0
	YId85rLHlKNM368Nhupca8ALxtWB7QUCT2Rdf9rThwSeF9Uoc/zW9m0rvM31gCfQK3blDJCCXcXtq
	SwVD5jNzoVGQXPGpJqqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdFjJ-0003jp-Sf; Sat, 29 Dec 2018 14:36:45 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdFj5-0003XX-Ur; Sat, 29 Dec 2018 14:36:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id r10so23186984wrs.10;
 Sat, 29 Dec 2018 06:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziFHL1MlO5nT5PAlUJWhLo9xWwurPRPDvozoMIR0akg=;
 b=tnuuDwY3NmRiQkLhcajbW7K9BDTQpqxyNEMIvK6vq5YSHla98DD9fH7VogQeK2+RC4
 pajjEU+5gXLvEk5BGR7W3ds6sntN8fQKl2On80xOXIq0kadwS5djFN6mztjK11dZ8yYd
 Mc0neJfP6A7QCiRpi5ia2mDUyUmQjg4YGobzMFj7yGsi+Q/iAzaSMAbbdEJDKm1PMdwl
 xyM2dUoCWSCEQCnyJa/rXuTzO6ahvvBB1L1RbBUdaVK8SDqMaLbYaKmx/mUZAsTxcJBH
 dWTO5wweSgvTdaoDSgbSpH+CHEsTieS8b227ivTtxFDz9L8hUWsXjy9pPjj1TvMmC8zj
 L3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziFHL1MlO5nT5PAlUJWhLo9xWwurPRPDvozoMIR0akg=;
 b=TU3+bzDuYyHIwRlcuHgOvRdwP5/yCvpE+R6yj8kq/LtyXv7dzbW29q4z7R4/MfYh79
 OhOuuyoCyNX6cis8FFJJzkMtEBEqencHrMDMtdM4EdsYbdRMLAEa6jYGSw+VHUHW3Vzp
 kp3dHKVsRRJSdQ7Rd9UxbXLtwmuLkmr76HEiHzqZiv2j/mX9N1N9U7wTnnBNwWBf/h2/
 HWPnU04/ed3XjbpNPQlKMo3Xm9W1NYL50u86laLTDWpUFoNTN/OvScRUuSch8fYBABJx
 dy3ClED110FygHXY/f44DnbMAnuImUTB2CUmc6octcCv7lkngvCACdAFJJ7MYCUn3vGg
 CAuA==
X-Gm-Message-State: AJcUukfCL7sRfYirNvtX7KJbKH4x3+XEOUwvu/aSnNJJbtyynJP0w0l2
 ED3ZM0GUkDygebF8HAOX5HsxS9Qg
X-Google-Smtp-Source: ALg8bN72bJOyFj/FAepVZAYI/ZAYPsCYwP409S71LoXLgLZ1IJIBrG5QjhiRzAGjI5Ws6c/se4QBMQ==
X-Received: by 2002:adf:be0f:: with SMTP id n15mr29388939wrh.267.1546094179900; 
 Sat, 29 Dec 2018 06:36:19 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7294600914F24DE1716D3FC.dip0.t-ipconnect.de.
 [2003:dc:d729:4600:914f:24de:1716:d3fc])
 by smtp.googlemail.com with ESMTPSA id
 k135sm53626412wmd.42.2018.12.29.06.36.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Dec 2018 06:36:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 ingrassia@epigenesys.com
Subject: [PATCH v3 1/2] pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3
 pins
Date: Sat, 29 Dec 2018 15:35:55 +0100
Message-Id: <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181229_063631_993262_431A5E93 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 linus.luessing@c0d3.blue
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
rely on the bootloader to set them up correctly.

The vendor u-boot sources for Odroid-C1 use the following Ethernet
pinmux configuration:
  SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
  SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
This translates to the following pin groups in the mainline kernel:
- register 6 bit  0: eth_rxd1 (DIF_0_P)
- register 6 bit  1: eth_rxd0 (DIF_0_N)
- register 6 bit  2: eth_rx_dv (DIF_1_P)
- register 6 bit  3: eth_rx_clk (DIF_1_N)
- register 6 bit  6: eth_tx_en (DIF_3_P)
- register 6 bit  8: eth_ref_clk (DIF_3_N)
- register 6 bit  9: eth_mdc (DIF_4_P)
- register 6 bit 10: eth_mdio_en (DIF_4_N)
- register 6 bit 11: eth_tx_clk (GPIOH_9)
- register 6 bit 12: eth_txd2 (GPIOH_8)
- register 6 bit 13: eth_txd3 (GPIOH_7)
- register 7 bit 20: eth_txd0_0 (GPIOH_6)
- register 7 bit 21: eth_txd1_0 (GPIOH_5)
- register 7 bit 22: eth_rxd3 (DIF_2_P)
- register 7 bit 23: eth_rxd2 (DIF_2_N)

All functions except eth_rxd2 and eth_rxd3 are already supported by the
pinctrl-meson8b driver.

Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index c69ca95b1ad5..84938bd73ac2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -346,6 +346,8 @@ static const unsigned int eth_rx_dv_pins[]	= { DIF_1_P };
 static const unsigned int eth_rx_clk_pins[]	= { DIF_1_N };
 static const unsigned int eth_txd0_1_pins[]	= { DIF_2_P };
 static const unsigned int eth_txd1_1_pins[]	= { DIF_2_N };
+static const unsigned int eth_rxd3_pins[]	= { DIF_2_P };
+static const unsigned int eth_rxd2_pins[]	= { DIF_2_N };
 static const unsigned int eth_tx_en_pins[]	= { DIF_3_P };
 static const unsigned int eth_ref_clk_pins[]	= { DIF_3_N };
 static const unsigned int eth_mdc_pins[]	= { DIF_4_P };
@@ -599,6 +601,8 @@ static struct meson_pmx_group meson8b_cbus_groups[] = {
 	GROUP(eth_ref_clk,	6,	8),
 	GROUP(eth_mdc,		6,	9),
 	GROUP(eth_mdio_en,	6,	10),
+	GROUP(eth_rxd3,		7,	22),
+	GROUP(eth_rxd2,		7,	23),
 };
 
 static struct meson_pmx_group meson8b_aobus_groups[] = {
@@ -748,7 +752,7 @@ static const char * const ethernet_groups[] = {
 	"eth_tx_clk", "eth_tx_en", "eth_txd1_0", "eth_txd1_1",
 	"eth_txd0_0", "eth_txd0_1", "eth_rx_clk", "eth_rx_dv",
 	"eth_rxd1", "eth_rxd0", "eth_mdio_en", "eth_mdc", "eth_ref_clk",
-	"eth_txd2", "eth_txd3"
+	"eth_txd2", "eth_txd3", "eth_rxd3", "eth_rxd2"
 };
 
 static const char * const i2c_a_groups[] = {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
