Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48617C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DB920657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/miTsKr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uCdesVe+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17DB920657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zKvPBR7+giQQAaNghjcUr8cZ4gg70V4ppPPeLuimKA=; b=P/miTsKrT1O2vg
	kO7dYnmWq7ukgV3BkR8s4Eo/KD/lmdFSq7nt4fhwOnBqa873BTFmuJfdZdzkGSNNtGk4sMWpi9lvD
	lj8Aqf6qJTDMhq3/CbNNyhlOJGcj0Y/5H/DGall1ujVaCeN/ev68uICABcmlLDRPKA3iMrsU2Gcrd
	M2KeXpKYwuT1vmT44luveK/V/JJfJxsJud2mZz/yoIVIsLnDjxeChUAk8j5Eq2LfF57HqxRcKWrWS
	46P/ncUrQ+v2OsJw71aWllL+fwfv+77XVgc4kJz2bp5an0o9gayI8VO4eTzHrZNJ3tu5VE9ci0WSF
	3jM7nmFVf8MiA2/Fv0qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQ2-0007Ij-HR; Tue, 15 Jan 2019 16:18:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPo-000756-KI
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id p6so3815787wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BneOavcJCQi7zQXagyOhDp/fpY9WUQMGlemIYRnErS8=;
 b=uCdesVe+pvPJeIZu6M95yScb0hi+saJVsMCVPPRDqN0NXa/jOkuJGeZiftutg29f/g
 q6reJKZDDgdw6fadj2q4m8belDHbPu8nHGYVEkfMu11HEBbWlg4gQQ4XwPIFWajK+CN8
 bxHJbEk3j6vUUT1RrQmYxrtjVZap+59g0MZR+mLfmVRaC4ypEdCbX2WeSdVvbxvdKlQ+
 v61LeDOeMR9aDiIEnHSa9kVpEeWhGj53BF1LBe5oIcLwUjfdq2FIksLxiqCwoUkE3oGL
 a/3d2077CsgKnzN0akFZcmSEul0yLzGnH4LTgWjOFbGmoKpClb7A3/fh4oPqzwyCAJv6
 rgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BneOavcJCQi7zQXagyOhDp/fpY9WUQMGlemIYRnErS8=;
 b=QOr+Wx1q+YHv7nKyLt9SKW1SrkEDFZa66TpOUzLiifZJ1STv/VLwoUrzF09peobKuI
 OIu2SJBWQCQQuHwk5BnN2cpvN+j2vNiqpjXgwSHKO+pCu0Lk8Vf7k5Ytx8aviBAVxzFB
 EeJJahXnHO8OG8mplsrT/KXQiWTXrVLqbO9uPevLsUSuQasuDXydED7gOr1tmDXQHenA
 Ky4Sne47iuFaJeRbz9IEj3OHUxwtH3nWXZNEjU6Nlr6FEN5UVAVQyXqzFQlTdvHqZKGx
 BriPQBFfdAmiyEOTznWxzxjLypv2jo25A/8FoK+NxBSnkq56rI/Td+p1GglAvUBAp0Be
 z/lA==
X-Gm-Message-State: AJcUukd+6osc8EcQ7b1NJYc3UW00EVgejX7NhmpMGUIzqAC9dj02auzV
 w1CwsAMluQ3BgxY1nHmjWSDYry9sP6I7pA==
X-Google-Smtp-Source: ALg8bN6tWJH7BVjtAUsI2J4S/jVZ//KJ8QE3vbpAse0TBGbItXrg2vGtVFPACoMKRzUjFzvUzDHt/A==
X-Received: by 2002:a1c:570d:: with SMTP id l13mr4092426wmb.139.1547569090824; 
 Tue, 15 Jan 2019 08:18:10 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:09 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 06/11] arm64: dts: meson-gx: Add hdmi_5v regulator as
 hdmi tx supply
Date: Tue, 15 Jan 2019 17:17:54 +0100
Message-Id: <20190115161759.1657-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081812_685317_7443D6F4 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The hdmi_5v regulator must be enabled to provide power to the physical HDMI
PHY and enables the HDMI 5V presence loopback for the monitor.

Fixes: b409f625a6d5 ("ARM64: dts: meson-gx: Add HDMI_5V regulator on selected boards")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
[backport of linux commit e1f2163deac059ad39f07aba9e314ebe605d5a7a]
---
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   | 1 +
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 1 +
 arch/arm/dts/meson-gxl-s905x-p212.dts         | 1 +
 arch/arm/dts/meson-gxm-khadas-vim2.dts        | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
index d32cf38463..ceb34afe42 100644
--- a/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
@@ -78,6 +78,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
index 90a56af967..a23252efc6 100644
--- a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
@@ -155,6 +155,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dts b/arch/arm/dts/meson-gxl-s905x-p212.dts
index 5896e8a5d8..2602940c20 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dts
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dts
@@ -51,6 +51,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
 };
 
 &hdmi_tx_tmds_port {
diff --git a/arch/arm/dts/meson-gxm-khadas-vim2.dts b/arch/arm/dts/meson-gxm-khadas-vim2.dts
index 313f88f875..782e9edac8 100644
--- a/arch/arm/dts/meson-gxm-khadas-vim2.dts
+++ b/arch/arm/dts/meson-gxm-khadas-vim2.dts
@@ -271,6 +271,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
