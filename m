Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C256DC04AB7
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 13:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FD821537
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 13:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XtWacyjQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="srwoGdM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91FD821537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doE4NKDmn0qq4lBghP3/yWJDNvj+ecuNjrMd1H0u+tM=; b=XtWacyjQzw+Ilw
	dmBEA9tH6GaaX8N3izsdvNocv2Wp/7ABKrIqsSz9NKuYijn2VQPPo4SDGiP1MEd+0ei9WPS8258Vc
	IO16sHu0EVfQxdKHZRBWsipBjjpw1C3Hoq3Wex5Yf5vuXLirCtpbKGjPVubBQ4gtPAXysdfLMRRZ+
	cBwOEtQSmulK6IeB6be9xcFW/OJTwaVogbkyW4YO9ewHsV6DtUEDyTKOHroPTAQJfTCKxDnuv+rwU
	MUGqrxzxkdQKA8GqeJUUrh/zOaZHb4ktlElq6Pervzho4car10l4fckpGv4OKED+prl+Z6Mt94zbw
	2+Pbq1eDHJbWDWrECgNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQXvA-0001Lj-HO; Tue, 14 May 2019 13:56:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQXul-0000r6-9t
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 13:56:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id e15so6942096wrs.4
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Z3XkroftFEOZ+oKRERn/ytHnCEs/zdgDA4cYGSY7DY=;
 b=srwoGdM2pi3FUKVWb1bVPrzv+PX1GFaTRXsw3dRT8fB5USvGoV1sYMg53QdODFcxno
 Q0dQocvYEG5gARTTaO4iSMlbRUw5ZFHdIjykqvm/sK+VgDNWhBLVYrpWGt/VpfiSU7L1
 feo74fD6wjwCBdVYIDgvTwfDVDbfS02dmUaA8PZUv2D2A5SxpCtrd2ZsTJlhZs0E71C4
 XjYy9KGfSI+p2m6BHcAB5HvvtmMu81IckC0kmMmOvOB7mANygS4KrcrekKkjs4bJjqyW
 agiikBfaeI4Ee70Qu7YqT5BhX02BPGcNvWkzxUtuRfIr5n9xl+YCHs4tWyp5Vv/xUCxJ
 uOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z3XkroftFEOZ+oKRERn/ytHnCEs/zdgDA4cYGSY7DY=;
 b=OHZxuX/mZX4UV5r7V0HA9TuBLB7Ugc/i0eHEWn969WqJ4EPTB6UsOe1SiaoiYg0Ceb
 zQFJU5K96zwTcXJ5l/mEkASk+9fJWKDGkGBVSdckGqfr2CXe1mhIiBtvqsSvtCzRuQWS
 oJ36K0Q+MuI2GuRwS1t/8W5EcdJJtEIRsIY0mYkYZ/PdONocz5RgBFKjsZH0BKdLCCer
 DXg9gpr3hjteEvs0Bv1ZSEr/3/XP8kB5QJX7w/GAqoMVWol3H/ZCb2EuZRGwnMFya1gA
 84MPGI9SYDscYItlShcGexCxrQqiJrCSlJBwd89xMz7ZwDkA14MpVeTAovYuQXXOG7Fg
 TdhA==
X-Gm-Message-State: APjAAAW2LuSNeNpTs+4U0bRg+1/1p9AXMzOWfc7V0fnTutFbo88NcsjO
 cZOeaL9y6vyp9XZRzrlOgSTcBw==
X-Google-Smtp-Source: APXvYqyzK4kQnCJQWuc1QqSsGoqGq9pNNeIqQotMC679d3W+STr2oaNTyTLUAtjUp3koLKbf/YLfPA==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr3451395wrn.108.1557842177761; 
 Tue, 14 May 2019 06:56:17 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id d72sm1375764wmd.12.2019.05.14.06.56.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 06:56:17 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: media: add Amlogic Video Decoder Bindings
Date: Tue, 14 May 2019 15:56:09 +0200
Message-Id: <20190514135612.30822-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514135612.30822-1-mjourdan@baylibre.com>
References: <20190514135612.30822-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_065619_353221_435A3E8A 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for the meson vdec dts node.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
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
