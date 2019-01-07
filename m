Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EEEC43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E311D20859
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J1Q8nNTZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ag2NYCPI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E311D20859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB/kBO0t4/yzsKPxfP3KrHpE1S2F2LHSfzfgdAt54/I=; b=J1Q8nNTZmwRr36
	Ke51iIMUVmVtz21BfTHXKj9KFgrhTHplqb8DvZcPSJFKRRJlM4jSVKU8zzKkDMkMwhmpZOlcOXlnB
	8pyU8R3f7UFNQ2BUDMufzHeHhe1PkQLX0UdoR6+gGmeLj7s8gofxIW51HuGDVHueWfK3vZv6I/Xti
	VyIsv/SCXPRCapXXQqMwokVe+CiKZAkdpukk0m91aUVYh4Hk/JJhuL1/5yYPafJ8ILZCcfMUDRc6U
	ekZGiDwc93zhGudwC/g7j4vKMggHO2Kn5qvVwXZ9iSTTubcHbAe4cQL9w5Hbz2Z4fkO1y2EXHsEL3
	o96OR7zMgXNN4mt3kDUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggRbA-0000Rv-W8; Mon, 07 Jan 2019 09:53:33 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggRay-0000Ev-Ir
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 09:53:22 +0000
Received: by mail-ed1-x542.google.com with SMTP id y20so238728edw.9
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNlqm1X3Atjb25AV1tWHXoXpMEFSSSDH/PGAPmX/AtU=;
 b=Ag2NYCPIpVkZH2b+oJg0P28I5ij8lt4XNPUPnEO/83l2dqPs5NM4yCtzgYM99YJZkL
 RQ4S5KrfjUQIVr6VYqZ9ukssDf8laDqARiKxDJnU2TvwlwoxnIttqzL/9ci81lmexa3h
 WJJxBMIiz56vx3QAdrtfhJqehVBYzSgDx/jzBgghguKfYqEfufG7ECrNvQYXoDE+0obY
 EZECO77DEtxipxj7Kk9dztUEXRvR1asRsC7vpgifeVC7J1w07hqhdJ/rqzPkWwdF+xyC
 wdgvEw9aq1WxoxymZIzWTVlVI5uI9nSSiDX4xnJEe/B85yL1pGBPbQgTHHOaJf+WQ7rd
 QFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNlqm1X3Atjb25AV1tWHXoXpMEFSSSDH/PGAPmX/AtU=;
 b=CA3YFNZ0OKtdbMdVcebluTz+cab8A8XXmwqaQ4MJXgvKWa4Yc0SIg/W6FVG4RmYOR4
 t5lRgY+620bFOdqskIZie6zzo6/CiKmQY5ZjseujHv1vMLWFwgsnGVYLJsZAvNuv4k4g
 t1ludNcXy6hWUO0VHtICqjtkQCzYdYnTmkMND8kuwpXKigfFAONJlkMAcyPE1SSF36sG
 YlK6OzUvfBhSaSDx775zRnFlm+mY0R82sO2Ui/hS6xdcl5bN2Uu0GywwL5iZX4+z1Erj
 v35MQHjATqYCH1w4lvVZz8SsIHO0FPCNmTBoaqYcouK1C0siWeTIw6uqPCQRtn19WvFF
 7ZCA==
X-Gm-Message-State: AA+aEWZebITdlTDd+HnvSEym20BrGaVwvAdYVwC2wUCFjuNaUU9jJBG0
 Dg9FmitzuW20ZoBZBe0Bec3L2g==
X-Google-Smtp-Source: AFSGD/VB9Kh1/gVWE4gr/W1wMTPUn9+Mkxk4vTMo7msLAcnrwKTjwXOz2tN9CVZUKTeNW637/t4Dlg==
X-Received: by 2002:a17:906:4c94:: with SMTP id
 q20-v6mr46459042eju.26.1546854798987; 
 Mon, 07 Jan 2019 01:53:18 -0800 (PST)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id f6sm35737049ede.53.2019.01.07.01.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 01:53:18 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/2] dt-bindings: meson: add specific simplefb bindings
Date: Mon,  7 Jan 2019 10:53:06 +0100
Message-Id: <20190107095307.15233-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190107095307.15233-1-mjourdan@baylibre.com>
References: <20190107095307.15233-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_015320_614665_E2F19FB6 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Rob Herring <robh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Similar to simple-framebuffer-sunxi, we support different display pipelines
that the firmware is free to choose from.

This documents the "amlogic,simple-framebuffer" compatible and the
"amlogic,pipeline" extension.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
new file mode 100644
index 000000000000..aaa6c24c8e70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
@@ -0,0 +1,33 @@
+Meson specific Simple Framebuffer bindings
+
+This binding documents meson specific extensions to the simple-framebuffer
+bindings. The meson simplefb u-boot code relies on the devicetree containing
+pre-populated simplefb nodes.
+
+These extensions are intended so that u-boot can select the right node based
+on which pipeline is being used. As such they are solely intended for
+firmware / bootloader use, and the OS should ignore them.
+
+Required properties:
+- compatible: "amlogic,simple-framebuffer", "simple-framebuffer"
+- amlogic,pipeline, one of:
+  "vpu-cvbs"
+  "vpu-hdmi"
+
+Example:
+
+chosen {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	simplefb_hdmi: framebuffer-hdmi {
+		compatible = "amlogic,simple-framebuffer",
+			     "simple-framebuffer";
+		amlogic,pipeline = "vpu-hdmi";
+		clocks = <&clkc CLKID_HDMI_PCLK>,
+			 <&clkc CLKID_CLK81>,
+			 <&clkc CLKID_GCLK_VENCI_INT0>;
+		power-domains = <&pwrc_vpu>;
+	};
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
