Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866ECC04E30
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505D32080D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9bvD1EP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bgdYUnoM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505D32080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEx2owYugAKU6QKxvqQQwqCHsbx1oglLNASMIhYh0IE=; b=E9bvD1EPcGYYtn
	jIJWQMCEOFt5yhqlq0ArsyTgurLnchrN8gfy+J2VE4bBz2T6u2CtcDqdwEC3x79B90WZuDpkxEjAf
	qE/3zaL045ZZMJrYvQvqCJwVd4Wl5HbDrbOmSpjPAxkc/9zy7Uk39WSqKaMrQcT4TurEDYvpDmwuE
	mJ4EIxeGBKc18uLjFRsbyzYzXlsrE2xEBIJQs7VlxG/k2eGqHIenkPL4qQKQ0BgBUyZ9EQrF+1/6/
	ncyzlDlGj0yi0NtHNUToBGgyPxHexsHudM23STRc5B+M45xCH1UJpn1zQQGAd1WVgQHB4nrslF4eI
	S7JOoV0BImJu72nhGI4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieKBT-0001ui-Ab; Mon, 09 Dec 2019 14:38:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieKBO-0001qx-4H
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 14:38:45 +0000
Received: by mail-wr1-x441.google.com with SMTP id b6so16497916wrq.0
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 06:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
 b=bgdYUnoMPZDXdsjX/9vcHHh4AhMHDgfVrrvAupKUML77jRaoxL9/NvhdiA3ZMmipmy
 Jh6GBd+LNpkSvVCmEGegBET1wLZw0BGK9Tf8TS2FLVhkGSfHNLIpn26W6/OgYaOdurJG
 VkysX2RbVaBkWnuKrsZRUov3ZPgLSqo/GUQpC+Afb8P8yVRSwt/JYF0wlRT4H13fsMGz
 u4Bp8VjvzY5uiWzn2ryHEgBegOObNFvbvp+qgxK+tgosahySidgoDmY/xsNQYoq3UbnH
 XSrKiT6mYb6DVgB3Ia4ihZO3B8DtrFosvLvyu6HhvyOepkwabmgVVvYivjmVmGvr7tkC
 3GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
 b=BO0rClIx2cxt5uJE0Cqj8/4Y+MJiaxxsF4G8DPNpB0Cg+9qt2wbIqCRVl/Ciq88079
 dE3fjL66d/SY+eRSB+K6AtGZjOfwPhz8nwd8T1q/8ah5OMdDD+ECBN+gCPtmLMLwNIX6
 rzf6g+zyfLSRumgIbXMXUC2eW3U/0gjEiWTDClZzN/XzdXkF/PeuA9yQAjfsSPwedGUS
 rU+Idzf3goU53lv0ic4WwGaT/GpEwRSfqoHeRbqxJ8IycPVpj9XUl6Yaegv+yQUZAtnR
 +ChgveXDv4t/kGGiqQFFauRXPAY4+a+qYlfT5t3qpF9jA2x2mOVY2sAqtvpzPwh4Xhyb
 PfxA==
X-Gm-Message-State: APjAAAVYispWyBonQxSecO9pwdn3m3o+Gr5Vv5k2x6H51GzVg8Z+um8h
 o27hKIP/3ZLovW/IJ+liFcywkgNp2Ts=
X-Google-Smtp-Source: APXvYqwEPo7H2TrDvEZ8PxznGxvq+VF5LH9ZGRBvL7oA+alaSnWJwD3BYypna4Isdo45BDTa98Z6GA==
X-Received: by 2002:adf:c145:: with SMTP id w5mr2529815wre.205.1575902320859; 
 Mon, 09 Dec 2019 06:38:40 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:38:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/4] arm64: dts: meson: gxl: add i2c C pins
Date: Mon,  9 Dec 2019 15:38:33 +0100
Message-Id: <20191209143836.825990-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_063842_174927_5C52B4E4 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DV18 and DV19 pinmux setting for the i2c C of the gxl family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed33d8efaf62..259d86399390 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -533,6 +533,15 @@
 			};
 		};
 
+		i2c_c_dv18_pins: i2c_c_dv18 {
+			mux {
+				groups = "i2c_sck_c_dv19",
+				      "i2c_sda_c_dv18";
+				function = "i2c_c";
+				bias-disable;
+			};
+		};
+
 		eth_pins: eth_c {
 			mux {
 				groups = "eth_mdio",
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
