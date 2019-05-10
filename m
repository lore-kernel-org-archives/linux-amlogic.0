Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAE6C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CBC21479
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lcfY9Mui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UGuWEwh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CBC21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN7wNKzlHRo+lnMvgCcgavMvVqh0w9nqr/BEntnoAuw=; b=lcfY9Muiyw0EUG
	KOBS25B2+OE3CmSkK/Qx3mzQSRwrgbTPanF4FPLA0/NJ9s/cr7XCpaqwMSPiWKos3ZTOotTgYZ4Iz
	unUT8T7vgVSl7xH9vvwreH/w96yTL6DasHA94NghQVbR2jaXxNeBhBN4pV15pz8lcRXb2f3Zo7Iif
	aouPzonzL3fSwnCecnK6L2spoEyEs4bcGPt5TxjHMYkDETN1Wv8w4sMSMciarsQS37PUnYa9Y7QXt
	x4tuMK+J1xC/K4iI9QS6ssq27BdyGxMUbEkyS6weTH4b3viW3aZJ+/Wzc/KXEOMXfhwCH23+oyGGw
	g4kSdl4PrypjtuRK4LiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP8ib-0002da-8s; Fri, 10 May 2019 16:49:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP8iV-0002UA-DT
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 16:49:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id y2so8245687wmi.5
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BDD3hmUAw1/iP5j6nwICYc72W1cM/z0tCme8wuLJEM=;
 b=UGuWEwh+n7QT3eNyNvwq+0cJsZpDzpWwk7FnpGGJzka745/PRluZ87wATPr+YIhf5X
 NIbdGp9PkKLuCsnVK8imrw+fnf3/VN/dgzhdB0stTpRHOv4PE73NDcLnrlRt7kScNDzi
 BJEf2aNfJJlqZK+A48FwJAFtZa+qbuqUe2kdrJb/96Ztx6acYNSgeGtccr9ajHYBH4hl
 +kMA6aloAG37PoAZdi1P9Cw0OLX37bw0uU2j4upttKDVzvLG/Ww1SP1FMiGddkmV0z98
 2bYqDDscoIPwAIdURSlGiU2BQtg0drPV1OQ1Q3gcsMCDWxHHqRt4mDum78Y3LuJLAYbs
 p9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BDD3hmUAw1/iP5j6nwICYc72W1cM/z0tCme8wuLJEM=;
 b=RODrI2hU3alILfA+uozOcpwkI4sX06U2/Mfm/fymJIkJrZs2gSeBTH4xlsUQdlz9of
 iNsr02cAQKdIgt29ys5/YofnLmGiaqS42Bn7ZQI2r5+hXlJ46rOzdHvRpS9aZ3X7Hlt5
 piqZODlvDZidZKRpnHTy3EGwSWMThnBP1ulMD2/u/BruxN8BBgXt0ZdAIiC7z9yyO0AT
 QkaENqRoLWAaDgiNJErIphAwwb6yuq6w0Ol4kCSdN9sr/37nPN+NnTwmK+BLY1t5LnsC
 s14/awPyKb1N2KcokOla3LUQ5EFzoGdbTlans3oiyVcj6v3Z9Sr1Y7O1YrEu9tKXg9Sg
 H6LA==
X-Gm-Message-State: APjAAAWtdEhsCMkbx5I8BpFIBAroupVxaHxpVN8DSNHL11cL/c3bIVkP
 j71wTTFyhW9MZ4qSrAmQ7oDoNw==
X-Google-Smtp-Source: APXvYqye0FKsYqlWU/uVGSz/EJZu+vBKxrCEygY8OeyP0/V5umSe5NGclz0nWvUHmQTkQqn4VuSmWQ==
X-Received: by 2002:a1c:a550:: with SMTP id o77mr3275926wme.28.1557506990139; 
 Fri, 10 May 2019 09:49:50 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q26sm5114308wmq.25.2019.05.10.09.49.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 09:49:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/5] arm64: dts: meson: sei510: add network support
Date: Fri, 10 May 2019 18:49:40 +0200
Message-Id: <20190510164940.13496-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_094951_679265_8BB328A1 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the network interface of the SEI510 which use the internal PHY.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 61fb30047d7f..4a785b17c1af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -29,6 +29,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
 	};
 
 	chosen {
@@ -144,6 +145,12 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
