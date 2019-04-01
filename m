Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA97C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FA02082C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnuyWLg+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eIPaW3Ah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FA02082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doE4NKDmn0qq4lBghP3/yWJDNvj+ecuNjrMd1H0u+tM=; b=GnuyWLg+8jhupT
	PUngaS4fhTuIm4kuahZfjgQzdtak9r0PD9xboDqDsocnH3z10L7fbYrs7Zu1posQyW/mdgrzcSEvt
	ut3+3D5ze5Q98OEkEo8WTkEs76k+w5cfjsURVWI07c0msHTEFmQdbrDFOB/9zljuffJ7+ERmdaZVo
	av1cA4lQjreaCmcUreLOxw56gtrhFvM/NzznY9AYXPxKsdSCZhpmlEWTzjGfEJ/kCHK/y+yiOVFIy
	liJWPRFZ5w3dCi4ufC/YoxIT2DNqJlbW6CELseKiy5JdIlh3conEwlxPSJtR69TYLyIuo3amy1xOm
	rX52Syeh5Dl9IFb6aQOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAxA4-0004vd-BB; Mon, 01 Apr 2019 13:39:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAx9R-0003rr-Or
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 13:39:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id a184so10475010wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Z3XkroftFEOZ+oKRERn/ytHnCEs/zdgDA4cYGSY7DY=;
 b=eIPaW3AhGstj48p5E8VufgaCSExLZ2GXmlZZvTXR9ULIGxQVvxPHxtgqmwGCrIeAq+
 RV8QlRvJlm8EXyOWBCB+onpIV1i1xmODEckDYcEXHHtMLugPoITawuE5FBw3xyxjsIcg
 6Swx4aOUBS0DSkdWbebbA0cS+YHx9bcNONAhVge5fh3U35mU9h93cJJQaIoc12rkAF+K
 Bbouln78t4NI9220mnFwfJwGgoWuBukMcOImiK38TVP7cakOiLUkMH9mg1y6efmDQe7B
 UAjgKW/PkDK9w281bm969lijO0M64K5Nk8YHr7YpKnfVbvOuJ+vRj8XEHssW4LFiDY6E
 J7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z3XkroftFEOZ+oKRERn/ytHnCEs/zdgDA4cYGSY7DY=;
 b=s6ufbTrr63m5IlPy8lhXBHquSMH6VAc/oQwzss6pLQaPWNOYitWrWQym1QXY4pdFyd
 zY00pp/LOFowyGnTRij6mGuVK7eXKC78oNRNBeqnfiKFYkYZ0I8EhmjUctLQSNK655Xf
 uDG+k8ZpizZzxmYR39j+vG+msUQgnYhC654B+GfCuRhHxH2LE3q4hCTAtSvunRD+UrsI
 KDjJFzop3h/oRi+Y7JJSSjkrHxfrNUIGeglbKVvZQAmaw1YaZWitH2KmUo96xHKwQeCA
 opxhSdUmjlxQiYMtaLGBe+JQTXoSjvhc+uMzUnDTldCl3Iw9RxSQssjTmG1OInO/e1j3
 nDxQ==
X-Gm-Message-State: APjAAAWdWCMZwPjWTPRK7yEVPfTrjrSsM9v1LGqd17oi+Ci+rKoQWgW/
 L08jmPtELZVe33+9TjCQKyDXWQ==
X-Google-Smtp-Source: APXvYqyeHEv0rTN2wKOsMuZTuRwwa8N7lhGDMCngE1lzgn6On26UIBktvwJmkCLQjYS7ly3qUC04dA==
X-Received: by 2002:a1c:f014:: with SMTP id a20mr12278697wmb.122.1554125940162; 
 Mon, 01 Apr 2019 06:39:00 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id v184sm25205996wma.6.2019.04.01.06.38.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 06:38:59 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: media: add Amlogic Video Decoder Bindings
Date: Mon,  1 Apr 2019 15:38:42 +0200
Message-Id: <20190401133845.4171-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401133845.4171-1-mjourdan@baylibre.com>
References: <20190401133845.4171-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_063901_832622_66FA423A 
X-CRM114-Status: GOOD (  10.94  )
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
