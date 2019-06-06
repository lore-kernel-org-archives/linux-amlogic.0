Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262BC28EB7
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA2320645
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mnANKiSr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jKS+eKDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BA2320645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mauwA4X2uSPd/oXW0EWQcgdKMvIb4qRhX0tJWOXfrs=; b=mnANKiSrH8EHwr
	qz8Nh3N0gUp2wpqopAvANSKXXUhQ67nYwB3glaKYX6xWKySE3dEiQlf09tL27uLdoFAVcZgUZxReW
	lX8BdFcTRDmCnw1HInQcan8dkJD80kZX2HvfFl4h+6fTEv8DPdIAe0XG0tv5gLPPiKlZYUO53k9aP
	ZIraD/MMI9f+V1QEcE6L+Qv+whk9eZ2j9EoSb8qKwGcP6TooomUIUH9kqU9+P8xsMNp6Qv7Q2QqgR
	5BcW7CiypuOAH8GEhvzqaR/3sPzZYYZjKy0q7VhJKEJmZBFTtLsBuEvU2Y85FLzWq4kepXmY904VN
	67vBOY2r/VHGANIy1Rsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYutW-0002nq-UG; Thu, 06 Jun 2019 16:05:39 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYutJ-0002cV-0j
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 16:05:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id d18so3024193wrs.5
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
 b=jKS+eKDSrusvE4fOXgbjaJYnOOETrRi8VDvLbQHjv286fcyfl1Jf+Dr3KZBo+AkUmN
 CzhAyGvFq6wMJdudlZ9GsKjKC5gvSsb1VWIlmL+pu8EqaUFgpkjf/A3hKMxM5llDvqeo
 wBjOK5BtC1cnsPxiMa+ZkdHVsdiPVTzLR4Gh0ph3sKKClCmrsyRkEFCoQKkY+PhgLCie
 SkCKG7mzDiOfbwTbG7EprK5XtMgY9clnWQvagYN8hQcNydQkgNptpecVhxu3v6ai+S6x
 vrVHoMlGhkNoDL4c8hghYVxK2lqpZwRwYxdhd4AAkHVHBL710v0rUHAmnHc7IEsRAmTe
 4ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
 b=ZBAAqUbGTz0fwV4v8hsEfzl7CMBNVmaK6RbrI+pdl7Jfrm0UTcnx0dPi6vO9wZViyd
 pJ/Pd/M3dPCbLtN1IeF1wGaNmHXA2xXSExKYutg8UdiCMk90xRaOPRx9tt/9YQmfaYNj
 OwCHyrlsVedFcNfUytXz3vcCDBAVGaLU12B1E2SKqn7yJ6L3szgxbBwqQFrbeO0OqIwL
 2tnsD8GosXWDj02QjzAKSN6fHcG47gtTQeJ+rqxZw1azLILHVYnzJSbtK9qTQNXuahGr
 bT3KMaLrGBQhsUmXwj7SjD2XyUtbxcm6UYpSbGFkTZu70R9ZPf0wfuOmcisCJBCEB1bp
 lrqw==
X-Gm-Message-State: APjAAAWLnq8ASrfkRK6Oelv7sR4wIx122HKg+CtokzGnVLmcjLXRn/+y
 UWMEBQcfyphCGv38g7HH+Sbu8w==
X-Google-Smtp-Source: APXvYqwbFTvVJ2mShvZcluhdtrxZgL7Kyql6aeeQer/SjwvHzghqH6eDov9BoMhTRE3IsuKn5vGagg==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr15184445wrv.89.1559837123457; 
 Thu, 06 Jun 2019 09:05:23 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id t140sm2180901wmt.0.2019.06.06.09.05.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 09:05:22 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v10 1/3] dt-bindings: media: add Amlogic Video Decoder Bindings
Date: Thu,  6 Jun 2019 18:05:10 +0200
Message-Id: <20190606160512.26211-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606160512.26211-1-mjourdan@baylibre.com>
References: <20190606160512.26211-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_090525_141401_28554E02 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for the meson vdec dts node.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,vdec.txt           | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
new file mode 100644
index 000000000000..aabdd01bcf32
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
@@ -0,0 +1,71 @@
+Amlogic Video Decoder
+================================
+
+The video decoding IP lies within the DOS memory region,
+except for the hardware bitstream parser that makes use of an undocumented
+region.
+
+It makes use of the following blocks:
+
+- ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
+then feed from this VIFIFO.
+- VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
+- VDEC_HEVC can decode HEVC and VP9.
+
+Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
+concurrently.
+
+Device Tree Bindings:
+---------------------
+
+VDEC: Video Decoder
+--------------------------
+
+Required properties:
+- compatible: value should be different for each SoC family as :
+	- GXBB (S905) : "amlogic,gxbb-vdec"
+	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
+	- GXM (S912) : "amlogic,gxm-vdec"
+- reg: base address and size of he following memory-mapped regions :
+	- dos
+	- esparser
+- reg-names: should contain the names of the previous memory regions
+- interrupts: should contain the following IRQs:
+	- vdec
+	- esparser
+- interrupt-names: should contain the names of the previous interrupts
+- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
+- amlogic,canvas: should point to a canvas provider node
+- clocks: should contain the following clocks :
+	- dos_parser
+	- dos
+	- vdec_1
+	- vdec_hevc
+- clock-names: should contain the names of the previous clocks
+- resets: should contain the parser reset
+- reset-names: should be "esparser"
+
+Example:
+
+vdec: video-decoder@c8820000 {
+	compatible = "amlogic,gxbb-vdec";
+	reg = <0x0 0xc8820000 0x0 0x10000>,
+	      <0x0 0xc110a580 0x0 0xe4>;
+	reg-names = "dos", "esparser";
+
+	interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+	interrupt-names = "vdec", "esparser";
+
+	amlogic,ao-sysctrl = <&sysctrl_AO>;
+	amlogic,canvas = <&canvas>;
+
+	clocks = <&clkc CLKID_DOS_PARSER>,
+		 <&clkc CLKID_DOS>,
+		 <&clkc CLKID_VDEC_1>,
+		 <&clkc CLKID_VDEC_HEVC>;
+	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
+
+	resets = <&reset RESET_PARSER>;
+	reset-names = "esparser";
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
