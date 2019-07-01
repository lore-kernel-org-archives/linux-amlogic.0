Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FA2C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39734208E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GOG4R+qV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rYaIP9Z8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39734208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nj3+JQo0myxKU91hrTiDrZ+w03toMFvYnFmT1GUjdUU=; b=GOG4R+qVMwIEfz
	1Z7YIqPM12aBNh1SWAZy+nPUqq2ZMJhoTZCOLMaI9U9mtqASzqUjfZl4gN3OI3fVdMEZ/ednarSQa
	OsZjHAj3c+90oj95e/hvmdWdQbD0WivoaTN9ieig7IBMYO19xtDUZNgNQqfmwwTxbJ/9lVGueA2hM
	oYOWs8R/gBFiV30H87F31byXVxbd/B8v9JMUdmnGc9jIjSoDjU8iHehLuKhiz6IsLnp5NdiaJyDLP
	mRz1Uh5Kdc9eV4Pt+jV3AT+oNeQrVZekbG9paeWdZVmcF6daB3N+B0YeLQZR8MFR1g+S9KnzvVeyE
	2H9Ni/FQKoNlNYjqyCDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtr6-0007MA-Ck; Mon, 01 Jul 2019 10:48:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqJ-0006Z6-Nb
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id p13so13235622wru.10
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QoklnP0bi5VlneOSfMMO/1j0O/akzR/UGUOVoiR4zJg=;
 b=rYaIP9Z8AFkt6CFzPHllnzifEfoS3M8n6vylLz93bKjw4ukFm0EwmOLEOruJaaMNFV
 THRhW7V96RN3MeWc9jECmk0UnxywaKuuM395kQUTkVkQ91otdIVspn3NAoz1lCVoqQXr
 jIhtpPYC2GNXsA1fk09adtYfVcer1x+/YlVaWcSb4CdXyCtdDZbnHmgXa0tomJtTg6Ml
 JuaCUL3mE4xkgN07UmouRA3Rib1L+P6Sm6QkL6u5UzPEplW7vKFQJhaZKKv9giKCty0Y
 45D/viPJ7aVxT6ZfzTMack7XC03RGwNQUpVGXylbCkr7iBcleCnXyehjG0NYDfvPY+fJ
 b36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QoklnP0bi5VlneOSfMMO/1j0O/akzR/UGUOVoiR4zJg=;
 b=T4MsEx6NHqxvFumbAC+DFJF4AFbhzOq+kWiHoBeThUcq2x9EkxdWS5EY+AuVo7kQoL
 LucLnXNiTkg+50ntWgAe89Ozp4QBnR8NRyGhWlXHJLx441a+z8Bsa903DMiidd6XDBFb
 zuxSeZfCtNDIfUZwK2n9oU73VOX/fRn3eTsxKTe+f/OerDsb3wfUzoKMKx6n1rDnS+5t
 v/oTixIKTWl4+9By/uhBJyzPKHnahkIsA2oh+iyVNBMPqv3n9fIPwg/ccjKG2AVrnKoR
 Iv7zYIczmDyI4+kpmiyP3FuuupciYQHdzSxuIamQtES/njO9FkqLjrX1tgwB8kUHOQ4g
 sxTg==
X-Gm-Message-State: APjAAAVWdOQbejca3ZZ8iOYmWWAt2u2bTJ2EFbmLCc1z5Nf7Npiyrib2
 yBCiQxyVPbWM3PQeySJwGJz9DQ==
X-Google-Smtp-Source: APXvYqyTP4k0eF1dNYLfLBPz3xOUZqajJ8MktdmUINp3t0MNrFM4AUYuYE5IkIEDgwrBspHaABU2FA==
X-Received: by 2002:a5d:5589:: with SMTP id i9mr9222404wrv.198.1561978045919; 
 Mon, 01 Jul 2019 03:47:25 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [RFC 02/11] dt-bindings: power: amlogic,
 meson-gx-pwrc: Add SM1 bindings
Date: Mon,  1 Jul 2019 12:46:56 +0200
Message-Id: <20190701104705.18271-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034727_772602_74837FA9 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add bindings for the Amlogic SM1 Power control:
- the VPU power control compatible
- the general-purpose power controller, controlling the USB, PCIe, NNA and
  GE2D power domains.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/power/amlogic,meson-gx-pwrc.txt  | 35 +++++++++++++++++++
 include/dt-bindings/power/meson-sm1-power.h   | 15 ++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
index 0fdc3dd1125e..f0a1e20555bf 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
@@ -19,6 +19,7 @@ Required properties:
 - compatible: should be one of the following :
 	- "amlogic,meson-gx-pwrc-vpu" for the Meson GX SoCs
 	- "amlogic,meson-g12a-pwrc-vpu" for the Meson G12A SoCs
+	- "amlogic,meson-sm1-pwrc-vpu" for the Meson SM1 SoCs
 - #power-domain-cells: should be 0
 - amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
 - resets: phandles to the reset lines needed for this power demain sequence
@@ -60,4 +61,38 @@ ao_sysctrl: sys-ctrl@0 {
 	};
 };
 
+General Purpose Power Controller
+--------------------------------
 
+The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
+to control the power domain for, at least, the USB PHYs and PCIe
+peripherals.
+
+
+Device Tree Bindings:
+---------------------
+
+Required properties:
+- compatible: should be one of the following :
+	- "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
+- #power-domain-cells: should be 0
+- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
+
+Parent node should have the following properties :
+- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
+- reg: base address and size of the AO system control register space.
+
+
+Example:
+-------
+
+ao_sysctrl: sys-ctrl@0 {
+	compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
+	reg =  <0x0 0x0 0x0 0x100>;
+
+	pwrc: power-controller {
+		compatible = "amlogic,meson-sm1-pwrc";
+		#power-domain-cells = <1>;
+		amlogic,hhi-sysctrl = <&hhi>;
+	};
+};
diff --git a/include/dt-bindings/power/meson-sm1-power.h b/include/dt-bindings/power/meson-sm1-power.h
new file mode 100644
index 000000000000..30e17e4a478e
--- /dev/null
+++ b/include/dt-bindings/power/meson-sm1-power.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_SM1_POWER_H
+#define _DT_BINDINGS_MESON_SM1_POWER_H
+
+#define PWRC_SM1_NNA_ID		0
+#define PWRC_SM1_USB_ID		1
+#define PWRC_SM1_PCIE_ID	2
+#define PWRC_SM1_GE2D_ID	3
+
+#endif
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
