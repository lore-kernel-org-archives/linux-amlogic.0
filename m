Return-Path: <SRS0=unGP=RY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF14FC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Mar 2019 09:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF51218A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Mar 2019 09:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zv4Lyr7N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NxT3grqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF51218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tpp26La+T53yqd4bWxk0bpLJ4Na/PnYj5TK9lsjqBjI=; b=Zv4Lyr7NdfPfGy
	r91/SgZNioj3DYVF4q+FqgDJEEmi2g4OGkg1/+jCX3Hbf3Jxww0SuDJS7IXZF0PNjkcgVoolQ4uVk
	RscKiicJFSFKvjys4iCfNkosTUve87ur/8VM8JF5lXXXl1cEKPLyKc7Aq2Lypz/9cY7BzmJAInJJS
	6Jm1VYUaxJbXJ+CwQXtbRh6b39cxSSCBi6K9lbHf1659dSx7ec9ud3+d3Ik+plogkcFvAKd7cxRGh
	QNJSHw454akikkP9YEhBnSfl3ezflNQTs7p2imbeKmwNWznov03gn9nMzD9ocHTgcTDOWJnOX0In0
	BE7NJHL4FrzTphIu5LvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ts6-0005za-JB; Thu, 21 Mar 2019 09:20:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ts0-0005oB-P5
 for linux-amlogic@lists.infradead.org; Thu, 21 Mar 2019 09:20:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id u10so1875032wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Mar 2019 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a13ZCqVQ9Qq8CVb+4cp9xxMfE1waIVXpEmAmUnocBdY=;
 b=NxT3grqEnyQWOciiShXMcuRe1MBTnyKTPU4eU3RssPUKhXonGAfEiDBZb9n7JUWt/H
 bi5Y35WBPaklECD6WGXLU1Ib48SKmXnXWQwgZr3/nHVhr97oJ40OMDZlIbB9bj72G8UY
 RCQkHx0NKqBxWPcNAq1/PAVVcuHM1nLU1ZVSUkK0ElaDIckBdzoKbrTMh2XAAfpxzRfy
 JhNsx1lDH0+Uo+e4hnvMzurqFYB2SjTYvb/mZyC+pbbGIWOwy+gttzntFr4DYMJOk3X7
 bQoVz0nI1lbptgzB98mAA6NnpIeYDIJX2uCbs7tYgzFH71mLueto6ug0nZJwHOoZ2zPa
 LqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a13ZCqVQ9Qq8CVb+4cp9xxMfE1waIVXpEmAmUnocBdY=;
 b=l/X8ILboEdEIL281e+59Jm+Y8THhPbvS1NXGXQcPKeUhNBnI7fpZliBifOV0feMCPU
 xV+/sMMOW0PP7dTfLExsRtqlzZrjpoWiNqKT2Pt5093JiYGYdmVlWAiz8gqrF2qNhsgq
 fG3UZ8j3edBTbekV6kuRC//K/7T+DQabE4FNt2uaN2CC4K4MeK5mnkFyBcAiKRHR0pBD
 k42cJDkDx1Ox8Oti9UY+80+FhZckxdOp44lvqSC3+DLYN1t/AgC+ePefI7sZ0G/fO2I+
 u3T9c0oOFNRl6CXeJx3CPnMrWAuttugfwovIs6T3QG8jagsMO47HP7+8oaAkuAvvjn8r
 t2Vw==
X-Gm-Message-State: APjAAAWlBh+XC8Syyx4ovagpKFvel2h7BLEqF+OjxpjgTfNoMbhbz6DC
 Icpo6woXsb6vOg1IrWhO9TWCGA==
X-Google-Smtp-Source: APXvYqxu8US7yXzDevwqVfT6B9zqri5df90reiZceECH0E7xSyoESY5nA+pytEpdD6luw8g4GZz4lQ==
X-Received: by 2002:a1c:c013:: with SMTP id q19mr1614303wmf.93.1553160013851; 
 Thu, 21 Mar 2019 02:20:13 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x63sm6883959wmf.22.2019.03.21.02.20.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 21 Mar 2019 02:20:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH] dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
Date: Thu, 21 Mar 2019 10:20:10 +0100
Message-Id: <20190321092010.14382-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_022017_216926_252DD46F 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When submitted v2 of the G12A AO-CLK IDs, the CLKID_AO_CTS_OSCIN was moved
to the internal non-exported bindings, but this clock is necessary for
the second AO-CEC-B module since it embeds the 32768Hz dual-divider
clock generator unlike the AO-CEC-A module.

Export it back to the public bindings.

Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a-aoclk.h          | 1 -
 include/dt-bindings/clock/g12a-aoclkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 666b4493822c..a67c8a7cd7c4 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -17,7 +17,6 @@
  * will remain defined here.
  */
 #define CLKID_AO_SAR_ADC_DIV	17
-#define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K_PRE	20
 #define CLKID_AO_32K_DIV	21
 #define CLKID_AO_32K_SEL	22
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index 5ac66a2eee0f..e916e49ff288 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -28,6 +28,7 @@
 #define CLKID_AO_CLK81		15
 #define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
+#define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K		23
 #define CLKID_AO_CEC		27
 #define CLKID_AO_CTS_RTC_OSCIN	28
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
