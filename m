Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC19C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC8D217D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJUhDPLi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jUvvE6w3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC8D217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f6kzpi/x8Zf/XJ5Dv5dWsFa06utCPgPbs09hR82KJLY=; b=iJUhDPLimPX3ST
	WDdl4e+ei9wV7SotmhwfQT8c2VGEXAdIwuhD9BYmHB79UqaE95EISEqbjhej1QGniD8IUDDNmUBxR
	GyoueW8ZrosX4wpnwA06g1sF3OhAfaSejJ3xJYS7eByKtNH1tTm8ZzL0wh0Tdf59UO13ZyQQeNkwJ
	u54Cg9+oHhOCnieF7Yox0SNIDIti71qUvPeFEa8Of1QRTON2LzDt9F07FnF/M6TBrqrKOOarRpRGm
	CYXAigfC8Fy9XxOykyAZ8Z5yfBPrl2Ve4AqlK/uIXFo/SR+1Q1QE/czRDTqXDd/YeeVLWS7CSXKtV
	dCva+89lXvluBNsuOQdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEWg8-0003pU-0P; Thu, 11 Apr 2019 10:11:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEWg4-0003oE-W5
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 10:11:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id r186so1579978wmf.1
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qI+ZWWIMHltYSznNw2lTgjNf3bPwadjKioiVRWZ+9k=;
 b=jUvvE6w3smmDbCVhZ4x7SPkUjN3ayQHofEjHTZXDZ7Fl3rDkn3bm6mRBUCLvzz2ViK
 B3HkbTnyyPzZoPUBUYcMcXxWwiqS5rCEseDt06tBPK89ALKPngQwbBEdFUIWIjezjoAy
 yFoWEmMof0NYXsO1KGOWBuPBlFHvg/WPa/HdgIciwbimqj5XZg0dq21/nbiKv9mmv1U0
 yYqomJ+zP1plvLeZs9YfWlH3xrOGqj+rJFIBZ96HA0HKptn37fPB1ioRDTjTGBnlhoVu
 U7zN+JtuygYH0fd5lTvbUdQ2q+8HhHwif/vpmxTV21ZKzOGYQglUN+5HcMDPFjtQlrZ+
 c87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qI+ZWWIMHltYSznNw2lTgjNf3bPwadjKioiVRWZ+9k=;
 b=lVmC5gqRbeRG600g4t5H4kDuBZoBYYk/aNNMn0qxDBg5MPTqf5V4Y4cAPMwmqwixwo
 PHUQ5ech+n8JSiLE/PPBx16NWTjOYbRFoYyv0l5jtjP9KYjv9w8yYfVFJF6bhAOSPFjJ
 0I1V0+XBByrDn3rP9gywCC4QUx4tuSaJIdVhCcu7RcgaBAaRSm1su0vnPRnSSuE/UKbw
 TwEK0+vJ40IpqeSbyXNbnAykCy+XOjLeuFR1eIxGZH3kOd4dpj2uvXPKOlwHhFBkZRsj
 DF3Q56zd2KFNM2N2V0DAgF7oEDEcR29xpblF+UODaY27szPLOEOZuT9JLBejT5sY5Y0k
 kyxA==
X-Gm-Message-State: APjAAAU2/CP58ElCrFb/pYim3eBFKy/JCqW2YsuJzwew3MnPtFO5eunz
 yg2gJY/Ltqx2GCtd+W0bngS/8w==
X-Google-Smtp-Source: APXvYqwb3+sZIsfGEr50gu0LXWxS00KYvWV+aGZ4XFruIONuzWVi/unDI4oWnMykpfkh1e6+Uy3XEg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6508663wmi.57.1554977485970; 
 Thu, 11 Apr 2019 03:11:25 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j3sm90805800wre.51.2019.04.11.03.11.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Apr 2019 03:11:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH stable 4.19] Revert "clk: meson: clean-up clock registration"
Date: Thu, 11 Apr 2019 12:11:22 +0200
Message-Id: <20190411101122.5438-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_031129_095487_08FF67E3 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit c8e4f8406842332fb55cd792016e5dac266f6354.

This patch was not initially a fix and is dependent on other
changes which are not fixes eithers.

With this change, multiple Amlogic based boards fails to boot,
as reported by kernelci.

Cc: stable@vger.kernel.org # 4.19.34
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 258c8d259ea1..f965845917e3 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,20 +65,15 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap */
-	for (clkid = 0; clkid < data->num_clks; clkid++)
+	/*
+	 * Populate regmap and register all clks
+	 */
+	for (clkid = 0; clkid < data->num_clks; clkid++) {
 		data->clks[clkid]->map = regmap;
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
-		if (!data->hw_data->hws[clkid])
-			continue;
-
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
