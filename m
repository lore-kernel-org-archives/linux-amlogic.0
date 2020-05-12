Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1194C2D0F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5DEF20659
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3YTwK32";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="roj0ycig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5DEF20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDhb5ynxXs+TlQRjwEpsh8jSF3fOffoJrelp774cgIk=; b=N3YTwK32XpxwMv
	f7C+ni+oBJwNS+ITxOZpMzc4mmbL3PDGwqIsS0JbwM36SPVzB3IryUv3EVRRIUo8QaORMA/Gnwmkq
	ufisph05TzDNe5SWHdz0tPM2VofFbo/xVZWqjfSDyILydGl2sqebpDQfT38m/yQ+v5VsvxhlqFd8K
	TyTbgFPLp6IrPyJbd7Mx4fgQxABOyjFazse4OA7LQygrbMuZrB1bJQjQjD4xUWRQNMHVYJ981d+i6
	6ngoUPXVJfGgRLcKTbPyN76KUXKd0yuHbtZUZKk4TowUsErxATjD07f6UPOjG7GTyOOENjnDroAck
	YoZfe66faIoyMR4x08bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcCb-0005xt-2D; Tue, 12 May 2020 21:12:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcBP-0004rw-5T; Tue, 12 May 2020 21:11:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id e1so3774300wrt.5;
 Tue, 12 May 2020 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjlQaP6Pg6Yvwq7DW912bqutMrQVbTNiK7xq5gHpuE0=;
 b=roj0ycigj6tQpVmbhT3jMy7/bvzkqodh/XKde1bJcDq8Su5gcZDcm7zLr8gdt1bPAk
 g6x90DldhUlWdT1PBS48kD5RXetpXcNc/eHbsfufeiGHipzX0E9wjr+TphFWQnr7SDpb
 Xm7K9cF+fp2IDhkP9lNym+BixHnCNStlxvFAqVJFvw6emDyQ8VT5GEScIX+vwtIQCtX6
 JNfzeR6qGKqrY4zUi2lMyQnWve+b2zgGtJkscILNbP+VxR1I2hFQO24nrHSt/G7eIapF
 ApuothyXDI9r84McHgKdSCJGozqmmGcc+BRDGBYXZuFrvrWvu48XpMTyalcsBo2dctp2
 Dytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjlQaP6Pg6Yvwq7DW912bqutMrQVbTNiK7xq5gHpuE0=;
 b=hEdfhUtYXG+gtVTla1W3WVFQQrBfDPRlCoeE6uqVrBxjsV6bdkMJwBxXs62Z9TACkP
 PAKgNQbKG4p0tpkWOJKNC7LiGdhh9+E1wy4c9SGw4V8OLzcTn5gUm80ysB4xtNw0nyqc
 mLMcT38fP5KHs5Tbd8jvG3SameeH5bp+RkXgYlynFaDEaZhFu18HKWCnhjyRTV++rDrT
 wa8Wsha1PgW8kDDrr3tW6Kf3IIgfMGYUNnVw8fZoiIzPJK1cBfYjDeb0X5vnXWojUIlY
 g+4OuEygA5jBIZtdXAJieu5w+1/Q/B7Jlq4Ga8iYtYEee4XiRTWbuHYplDU3rm05FpKk
 I1rA==
X-Gm-Message-State: AOAM533bguzat8CezggPSOLdmTojdKFpaTsy72jDf1SxhJjz30Aagj+5
 z99rkA+G4wNese2JvuNvGfE=
X-Google-Smtp-Source: ABdhPJy8IBNIga3u76iZvWIyKVklYTAzmaNyRda+NSuJrgm3ui7QhnMf2uVqDc69Bo88OkngKLdAvg==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr5282727wru.55.1589317881655;
 Tue, 12 May 2020 14:11:21 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r3sm9724228wmh.48.2020.05.12.14.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:11:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 5/8] net: stmmac: dwmac-meson8b: Add the PRG_ETH0_ADJ_* bits
Date: Tue, 12 May 2020 23:11:00 +0200
Message-Id: <20200512211103.530674-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_141123_242488_EEF147D1 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PRG_ETH0_ADJ_* are used for applying the RGMII RX delay. The public
datasheets only have very limited description for these registers, but
Jianxin Pan provided more detailed documentation from an (unnamed)
Amlogic engineer. Add the PRG_ETH0_ADJ_* bits along with the improved
description.

Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 1d7526ee09dd..70075628c58e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -48,6 +48,27 @@
 #define PRG_ETH0_INVERTED_RMII_CLK	BIT(11)
 #define PRG_ETH0_TX_AND_PHY_REF_CLK	BIT(12)
 
+/* Bypass (= 0, the signal from the GPIO input directly connects to the
+ * internal sampling) or enable (= 1) the internal logic for RXEN and RXD[3:0]
+ * timing tuning.
+ */
+#define PRG_ETH0_ADJ_ENABLE		BIT(13)
+/* Controls whether the RXEN and RXD[3:0] signals should be aligned with the
+ * input RX rising/falling edge and sent to the Ethernet internals. This sets
+ * the automatically delay and skew automatically (internally).
+ */
+#define PRG_ETH0_ADJ_SETUP		BIT(14)
+/* An internal counter based on the "timing-adjustment" clock. The counter is
+ * cleared on both, the falling and rising edge of the RX_CLK. This selects the
+ * delay (= the counter value) when to start sampling RXEN and RXD[3:0].
+ */
+#define PRG_ETH0_ADJ_DELAY		GENMASK(19, 15)
+/* Adjusts the skew between each bit of RXEN and RXD[3:0]. If a signal has a
+ * large input delay, the bit for that signal (RXEN = bit 0, RXD[3] = bit 1,
+ * ...) can be configured to be 1 to compensate for a delay of about 1ns.
+ */
+#define PRG_ETH0_ADJ_SKEW		GENMASK(24, 20)
+
 #define MUX_CLK_NUM_PARENTS		2
 
 struct meson8b_dwmac;
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
