Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30263C4727F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F212206FC
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bopK+kiX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BMzkdWIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F212206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SezMvoI8sNgSWRPXSsJ6+bhtqIlQ5gCJsxrCHmSjESk=; b=bopK+kiXuNqCRs4t3fW8iN08ic
	xvUP+8x53sseyzU9F3pklGrPsCN3gZzJx66hQtLC4gwUyqRNflzZ4tHFFPKY69sbv5VgO5iyOyp3i
	A9NJtcIuu1DTw+Len45NaqjfJMON3kbiVgexCt7jWBXuezGRd4DGpWD+5gj+asnqnoYnx+A3Q7xw7
	qF9puLHAtejur1bBvFWCLoMriGhe/QDywjrKvPlSbKqsCXl/sPNQbAqahpRC7Rer2/fWgCrvICCz5
	rs2SV/giIQYXxqnBczF3UpPP03oOGH8O9X3W0VfRVESD4FJiPCCJIBlAsES+JpZbzyro3VYYpHzqA
	QdCXOQpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLvhv-0007Yz-Hh; Fri, 25 Sep 2020 21:56:47 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvhs-0007XU-Nb; Fri, 25 Sep 2020 21:56:45 +0000
Received: by mail-ej1-x643.google.com with SMTP id q13so610726ejo.9;
 Fri, 25 Sep 2020 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uylx3fTiHwj2S0tEs2f1wEToSjCcCbEFHt+iv9BVjpA=;
 b=BMzkdWIwR4HBFB+pSPFXtjIxIvI8PcdzQQ+S/1EETWFoxIulTyS0Vnw+C5p0T3REE7
 ziLTSiGSYTtaS8XcNDzqoWZu6fvGLeiJAZHDx/swLAWokw7H8VZyufoT6/+zCcQdJbrZ
 V7iLhIZwPTM7ux4mzuENdDlXW1ixSjgF7XVYPRgdckmxun8Fd+DnThl7YkFmEKyEfIrR
 okZT0QoPbYn6hSduf8CUQMRg8iqicEios0sQK/MS+5q9DnpQO3SJWzNpm8LMkakWCY+M
 vrtxKDDO0MN4JRak83afS9ftG9teebZGXgONR6mHFFF3QZyzLcmePr1FWgK9gTYjBJC8
 9lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uylx3fTiHwj2S0tEs2f1wEToSjCcCbEFHt+iv9BVjpA=;
 b=tPDHmWeolGQZrHeTfPBkpXsxgGgG7esdo40Wdka4VKNxXzXMHSaZ2xzZzPKwaU7Fmh
 uo2i0js/Q1QXEFh3QcdwRYDyuiT8N6nl/oVi0zcHogVEJosGzll0mhXnqYz6+4eVP2fH
 0mahxJmt2wKxvxXU7vcCOHL+9ujTMV1vJyggpYYjQOCcltfVx/DwDrsXUsHErdoaM4du
 rsuKsKljy+9vRg4TcWoHjScUs2tJl7JL8XENvBoXVFWDr+I1zdGMUT9yCtYNwTUMcsHh
 tunClA/guvyXeMEnRmXzW4JpkTQYByQ5dkJDn3CrfpEssUrOc+3r13OCz09odd2fyVBu
 xayA==
X-Gm-Message-State: AOAM5308ZOVc4WCsRj3nKZT6lC7QN/2eoyWQ3N7hCmY9Bxv2/ESXSdzr
 AcrDe0g0QO8ggNAz0ZnmlL8=
X-Google-Smtp-Source: ABdhPJz01tYZsi1CiKNBkRckUolw1dikYY0VFjNKStNMvKWHD3YPAMYdgX2FG81UQexE3WtC4o3wbA==
X-Received: by 2002:a17:906:e24d:: with SMTP id
 gq13mr4652709ejb.152.1601071003509; 
 Fri, 25 Sep 2020 14:56:43 -0700 (PDT)
Received: from localhost.localdomain (p4fd5dca7.dip0.t-ipconnect.de.
 [79.213.220.167])
 by smtp.googlemail.com with ESMTPSA id g10sm2683062ejp.34.2020.09.25.14.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:56:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] net: stmmac: dwmac-meson8b: add calibration registers
Date: Fri, 25 Sep 2020 23:56:29 +0200
Message-Id: <20200925215629.545233-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_175644_815142_A2C6062E 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: alexandre.torgue@st.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic dwmac Ethernet IP glue has two registers:
- PRG_ETH0 with various configuration bits
- PRG_ETH1 with various calibration and information related bits

Add the register definitions with comments from different drivers in
Amlogic's vendor u-boot and Linux.

The most important part is PRG_ETH1_AUTO_CALI_IDX_VAL which is needed on
G12A (and later: G12B, SM1) with RGMII PHYs. Ethernet is only working up
to 100Mbit/s speeds if u-boot does not initialize these bits correctly.
On 1Gbit/s links no traffic is flowing (similar to when the RGMII delays
are set incorrectly). The logic to write this register will be added
later.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 5afcf05bbf9c..9a898d2a1e08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -69,6 +69,34 @@
  */
 #define PRG_ETH0_ADJ_SKEW		GENMASK(24, 20)
 
+#define PRG_ETH0_START_CALIBRATION	BIT(25)
+
+/* 0: falling edge, 1: rising edge */
+#define PRG_ETH0_TEST_EDGE		BIT(26)
+
+/* Select one signal from {RXDV, RXD[3:0]} to calibrate */
+#define PRG_ETH0_SIGNAL_TO_CALIBRATE	GENMASK(29, 27)
+
+#define PRG_ETH1			0x4
+
+/* Signal switch position in 1ns resolution */
+#define PRG_ETH1_SIGNAL_SWITCH_POSITION	GENMASK(4, 0)
+
+/* RXC (RX clock) length in 1ns resolution */
+#define PRG_ETH1_RX_CLK_LENGTH		GENMASK(9, 5)
+
+#define PRG_ETH1_CALI_WAITING_FOR_EVENT	BIT(10)
+
+#define PRG_ETH1_SIGNAL_UNDER_TEST	GENMASK(13, 11)
+
+/* 0: falling edge, 1: rising edge */
+#define PRG_ETH1_RESULT_EDGE		BIT(14)
+
+#define PRG_ETH1_RESULT_IS_VALID	BIT(15)
+
+/* undocumented - only valid on G12A and later */
+#define PRG_ETH1_AUTO_CALI_IDX_VAL	GENMASK(19, 16)
+
 struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
