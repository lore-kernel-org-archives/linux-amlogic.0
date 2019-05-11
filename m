Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EB0C04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAF62183F
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+nLGTqk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GNZ67Hor"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAF62183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nsYEr2ISlDjpx5pPMNpLkzQF+m7+sLR0QZ02pbLPGdI=; b=O+nLGTqkm6UabP
	Pu7kr4MPuFtuXZxxKbUzAHelMcAmldWOMb498IdKJVoUmUd8gzVSf8yLZEmt9fOdNQCiPXwnLyR3m
	ARg7HdOCOvyMzqRoeU24x4cm1Ks0NbbS4Z7VkFMJJHw0uxoDfrzojXHPUd1Iu6SMA592jLiaWOM1b
	BD4jWz2RLiHO6vjxzktrLAzopTB1UjR2Vww2vyUqyWwm3DkfGPpPULjEJpyTTaeugjFUX5Aja+fQD
	AL/TDBfgAJMduyM/22WvVMXiAZKNbtVj26bXDUDs4m8pYDr2mEavtZu8Vh/QU8Oo7QcSguzGCvO/z
	sCiPM04+UtAlnVttRUGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPW4F-0002eo-AQ; Sat, 11 May 2019 17:45:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPW4C-0002eJ-C8; Sat, 11 May 2019 17:45:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id y2so10211863wmi.5;
 Sat, 11 May 2019 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92ZA36IfdaOtsZw80t2M4+MXEzMldpioQlWAUTdSiyM=;
 b=GNZ67HorQfYfzNJYPsTQiKiEZ1u9f9aUoZ/E1qQniEFWPFzxEhxkB6iTFfKGLmCiNV
 9wViPgp4PdVYAeU7i5PBjtHyBLZ1Qas6ehl9CBX7rmqCWHbwdRg88AK9ej6MlF2NH7Jr
 FTrgMkhTdZUsvtmgGToQXOQh3i/VFjtjMM7SMUFQk+LO8naQb2HJx46EPKteI/Ksk3U6
 M+0gr59EHZTEqmqajUq3dF+JLvcdmH5f2eN8YZ+cVX3mz7xvo9u4XvB1aM+CFjoSPRnQ
 iKZ/zjq6j9vzEVscp7nT6rilo4X4L2g7oCVPrajeaP4ZIPpsW9MoBYclI5vndvwtFWj4
 lF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92ZA36IfdaOtsZw80t2M4+MXEzMldpioQlWAUTdSiyM=;
 b=NjFZo9CitH1roUJyfsmXh1g4xnfZzC59oOXElOiHZJ77R57VotXw0kDsDYf3mRFMMw
 6zafxwqdg73eYLWwmly6t0RcwzHRD0g/XYycyOB7BmPeYdX2y07isOcg8XRCQ8w4q3Gz
 kFXMDh4kr4L89QHmN+gUMyezm+pYnYlnEMcVQdh00OHiutmxQX9T07DtGBBLIhZUBBkk
 rurMUYgWwUL/N2B67Wy6xLd/Cmt+Yp9+Rc2LZ2MLFSuGUcUM9h/soVESxBegkuYCQx1b
 yrCPOBRnqO0y0Dp3jFNt7KQOf5JvFnf8Z1tfO1t3G+tQF/xaVPw0tpaopFcbJn7zR5cE
 MPzw==
X-Gm-Message-State: APjAAAXA2LsXzNyczeXkoTI6Z02Tm0BymZ04F+URdDDF2TtlwL68uONQ
 y/6LYO9aQqzQSvYzJYqNUKE=
X-Google-Smtp-Source: APXvYqyBv+xZzZ9rpWv+EUHwPoSsPYeaBjz1deSYDtLsTCx/vqUrbrwe8U8OOTlcrUM78XGzTpDYMw==
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr11140164wmm.75.1557596746018; 
 Sat, 11 May 2019 10:45:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0059E186517133DF77.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:59e1:8651:7133:df77])
 by smtp.googlemail.com with ESMTPSA id
 h188sm10309538wmf.48.2019.05.11.10.45.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 May 2019 10:45:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: remove ethernet-phy-idAAAA.BBBB
 compatible strings
Date: Sat, 11 May 2019 19:45:34 +0200
Message-Id: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_104548_438582_02DE6E70 
X-CRM114-Status: GOOD (  12.97  )
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
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ethernet PHY documentation
(Documentation/devicetree/bindings/net/phy.txt) states that:
  If the PHY reports an incorrect ID (or none at all) then the
  "compatible" list may contain an entry with the correct PHY ID in the
  form: "ethernet-phy-idAAAA.BBBB"

An older version of the documentation suggested that the compatible
string can be used when the PHY ID is known.

Remove the ethernet-phy-id compatible string and add a comment with the
PHY ID instead.
This is a no-op on boards which are shipped with the PHY that was
listed (= all known cases). However, if a board manufacturer decides to
ship a different PHY we will now load and use the correct driver because
we ask the PHY to identify itself.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 0c8e8305b1f3..767b1763a612 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -81,7 +81,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 8acfd40090d2..a99c1ba3131c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -111,7 +111,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 73d656e4aade..8939c0fc5b62 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -63,7 +63,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7fa20a8ede17..acb4aaf9b956 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -113,7 +113,7 @@
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 	};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
