Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC24C28CC6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:48:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D987128040
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZV+wYiWl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jZRdLLd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D987128040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHS884nNgiZjasf8TNqLWKmcSqJ3G4ILdfXgEYiqc2Y=; b=ZV+wYiWl+oANey
	yAgsrb7+8vXHg95r2vqfFLjBoDCcMrcKf+U3WQkSRTamReNWpOaWXHlnasKBzMbLwD91L4n2aSk7n
	JAonpFaq4bH4EW9/9yLcrJaWjAyYMrbr0NmM66udUYvHyaX4YfEzMjAd4lhwH3hHLwc8b1xwGFvfH
	uBYZmtAXuh7wKwqKcTe2Vrgyq6AzFd1htwXrwo3o59PpwRt/lzAX+If/emI+tvdxQ6p7FhbPpnP98
	KAwmAuTNBc3dQmiwRfGJjGTYyHF3mQ1liG44jjzp2h/bGsmSTwIDZKddo1BFm/XcZBoEb5uW+BXI8
	MoJlPWJttDCwal8QKqqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjZk-0000Dt-PS; Mon, 03 Jun 2019 09:48:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjZH-0007z1-Oq
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 09:47:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so10316296wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9Ny5N7xcGaPs9PTlrreMwQ78swu8eI1bqcwr5eO4vE=;
 b=jZRdLLd/0Cwb2WksjvzB5nfmewOs6XQTiqgY3942FTJZbY3otyh522qliwYQUxB80r
 tldzgHNhJJDUtVqZqbbUaurGWFIWMjB07Tbpi2Nr2fXQbwTBScqSPtUEzGg/REKu8y74
 96r+RTtykcM+FmDC49Bf97j7ggNKk0RTHUuwghW1TiaWe9aw9eVSzVAoxtuj+vxVomPN
 tE8aXdcslm6uL7cb4sB09Tn+q496+67zaoL3zQAiyh29M07k1Qg3Rxo9T99jVmXQrivZ
 e5NouXydbCRiZ+Waa4lXIO2rqDLnEoyHPxG/FtOnB3HRl6PwFtyvfszgfY8tbh8F0jq/
 nGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9Ny5N7xcGaPs9PTlrreMwQ78swu8eI1bqcwr5eO4vE=;
 b=WtQ09nuzilel2JLgO5FtJw1Q3ylpqzLbwGoVZduQcCziNt/bnmtqJvmNpFsDry7twf
 vBNiUuY05vhee1k5u53lS926kBVdWWdy+q0f5rHaCmUKkppk97NcK0y12b0f6mfDd7WM
 a5Yp5mRL/93vGbI90Ezzs83KpHA4vvg1Sgt+4LrFuMSRyCGoPBjI/d7PCO28TLqlUDhW
 gvlJsYVKxUFUnOWNHOqlx8rzVYsyJQgtXBlUD8y8haOe1wFSFrO8ReDJAA+k6XCy7bl8
 8QJmczb2kVn40fuc+ouFkVJb4tFsslzjs2JEsmmhGN8QsDNlh8KA9Af810G2G/+7Qx+7
 46hQ==
X-Gm-Message-State: APjAAAVgFK85bR+/6Srr9yDkOJ2vbNPcSvWZmnGaC5TjL5Um7OOxXh2d
 7gSmbRFyoBXRPUs6zZbQXmhR7Q==
X-Google-Smtp-Source: APXvYqxYgQQ6aKW2VVH6+UX/ZVBFLY7/jEsZhudyesWCvOJtNp0VN66G3eM04FyN/tjpGKCky56o9g==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr13747212wmj.155.1559555270333; 
 Mon, 03 Jun 2019 02:47:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm11235375wrh.86.2019.06.03.02.47.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 02:47:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/4] arm64: dts: meson-g12a-sei510: bump bluetooth bus speed
 to 2Mbaud/s
Date: Mon,  3 Jun 2019 11:47:39 +0200
Message-Id: <20190603094740.12255-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603094740.12255-1-narmstrong@baylibre.com>
References: <20190603094740.12255-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_024751_807727_F46EFDBA 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setting to 2Mbaud/s is the nominal bus speed for common usages.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 3e0e119c13ce..4fc30131e5e7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -530,6 +530,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
 		clocks = <&wifi32k>;
 		clock-names = "lpo";
 		vbat-supply = <&vddao_3v3>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
