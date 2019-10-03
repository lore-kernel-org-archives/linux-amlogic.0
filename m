Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5A6C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 13:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5BC2133F
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 13:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrbTmgDI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X/kzO0Mf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5BC2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JutFO1wYqbkxDznUAmcS8HQ9LtiZCTHAed8qKtQuuTY=; b=jrbTmgDICZVs61
	UYdrSPNQTy3dRiEkPRT4f8WeDobY6QX0zhSMFX5GZ/ZzuyAZHFnA8K0wk2ws4BX6jN/Q5KZjPofwf
	8mbUY2Ceghb2760WMbUxWzIHfLTDDBTt5B2clem8/HCe0KlrQnzdCsnaVEyL5Th9H29WLer2HbLfb
	5dn+O2duEW8lqZBdCbsJzWJkhYDFj00UP8Rdv/gNrJw/7BByz1hDxOiw/xss71lD5lPldioaZoNyU
	zbkYO6pY5RzABNGNgQIiLPtrrz6KucRdGC91z1yGLoJlmKK7AQ9Gg+KhNygDMLYP/cd4i3P6XrQXR
	Loz+VymDQ/Y4r221LLDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG0qf-0002EL-Cv; Thu, 03 Oct 2019 13:08:49 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG0qb-0002DT-HD
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 13:08:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id y19so2850852wrd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2019 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gw44OhLwQH/CUylU7AC4CHwJnvlb/yfwJWpgjG0sVUc=;
 b=X/kzO0Mf8rp6JZbTiG3DaCWVH2uV5D1spjhSzxDM04qlnvV1ZoRN3QOzZ/9nqxa/zp
 tdwHcsd3l+4EYuqpn5cBFbk0o84KyVO9d7lERByJbO2rJAbm0BLvjt1ldyaFFMLdgN1X
 7UZTdiJbnxHzLwGG6IWoqiwEb98+1sTYoA6VT8l08diTELNCv8xpUGcv6hP8ma1dPbp9
 X31T1cBs89lfR86fvQrZRVc6/q6zxcxMFFlhrZ0yjs75d5fPTvbzdsLnNonrvRSICnv0
 nXhT6m+ns+AObjmTCJL6XiI5tCPE6iFFqow3usBNluC+056y/CLuizemf28eEXii3L7R
 QBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gw44OhLwQH/CUylU7AC4CHwJnvlb/yfwJWpgjG0sVUc=;
 b=I3tPzWdZ8O+6MI5xxAVY8Zf7sItf1u4fh6M/XehXsD1A94cvvSIsiFiAGQjN7PHBb+
 uUVcISnKasx1RkskR4xhtM15KH6KZ8rEk+Zr+3hbWR2N4DlQJ6fzyHwdikPT9nzekH9i
 Y06RWrps1I+/r0XNNZbv84z/DGfEI7iMecNsEY1ZpJePKZn/02Qf//k9neQ3L1yIasz+
 a5bEgrQTsyjbWVskxMa5VHtnlJsfyLo+DiSaU0amtpygELtJQiyJWig25hEgl59wF5SJ
 Z8gmxXwCmrHD7rX0pwSQOhbDC7jzRc2Y6l0LTDluvK0IOAY8wQjMNdjnKzibUg7gCXim
 aBIw==
X-Gm-Message-State: APjAAAVYtivle5xaHNRMkdffrse9r1V5o5h/oYPTn8dSjriJyvcuCFZ4
 pNkboFpuYQQUY/bS5JW8K1pAgQ==
X-Google-Smtp-Source: APXvYqyeIE9AetKtVnUHsr637KtU42j4dmzDlDnD4GEC3YwDwFMKDCM+icveVvh1Nm7BM1NCsLRREg==
X-Received: by 2002:a5d:458b:: with SMTP id p11mr7388306wrq.196.1570108123645; 
 Thu, 03 Oct 2019 06:08:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 90sm3868870wrr.1.2019.10.03.06.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 06:08:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-g12: add support for simplefb
Date: Thu,  3 Oct 2019 15:08:41 +0200
Message-Id: <20191003130841.8412-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_060845_618894_FDBCA1A4 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SimpleFB allows transferring a framebuffer from the firmware/bootloader
to the kernel, while making sure the related clocks and power supplies
stay enabled.

Add nodes for CVBS and HDMI Simple Framebuffers, based on the GXBB/GXL/GXM
support at [1].

[1] 03b370357907 ("arm64: dts: meson-gx: add support for simplef")

Cc: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
This will be handled in the in-review U-Boot Video support for G12A at [1]
and the simplefb handling code at [2] and simplefb removal in DRM driver at [3].

[1] https://patchwork.ozlabs.org/cover/1155898/
[2] https://gitlab.denx.de/u-boot/u-boot/blob/v2019.07/drivers/video/meson/meson_vpu.c#L145
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/meson/meson_drv.c?h=v5.3#n158

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 26 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    |  8 ++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  8 ++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index f76773cabdb1..21c155f4508c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -16,6 +16,32 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		simplefb_cvbs: framebuffer-cvbs {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-cvbs";
+			clocks = <&clkc CLKID_HDMI>,
+				 <&clkc CLKID_HTX_PCLK>,
+				 <&clkc CLKID_VPU_INTR>;
+			status = "disabled";
+		};
+
+		simplefb_hdmi: framebuffer-hdmi {
+			compatible = "amlogic,simple-framebuffer",
+				    "simple-framebuffer";
+			amlogic,pipeline = "vpu-hdmi";
+			clocks = <&clkc CLKID_HDMI>,
+				 <&clkc CLKID_HTX_PCLK>,
+				 <&clkc CLKID_VPU_INTR>;
+			status = "disabled";
+		};
+	};
+
 	efuse: efuse {
 		compatible = "amlogic,meson-gxbb-efuse";
 		clocks = <&clkc CLKID_EFUSE>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 0d9df29994f3..d80d8a982917 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -342,3 +342,11 @@
 &sd_emmc_a {
 	amlogic,dram-access-quirk;
 };
+
+&simplefb_cvbs {
+	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
+};
+
+&simplefb_hdmi {
+	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 1fdc5af5ae23..f89d744c9648 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -147,6 +147,14 @@
 	compatible = "amlogic,meson-sm1-pwrc";
 };
 
+&simplefb_cvbs {
+	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
+};
+
+&simplefb_hdmi {
+	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
+};
+
 &vpu {
 	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
