Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E3C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIaqcofUz3eDl5ED8gQJEiNuCLvJttMWTJy+yl2f9sk=; b=Xj47hjdon+LHAT
	f2odXHGeMc6IEWWTXYw1EYfnV2PYDhRg4+PRMAS7Q4I0xQoO4doxddyL5b+58n4TSqVmGLmoQXArC
	OgnOH9On4b32q68X6M5watTiYpHn5XjG2VjXxdK+TMMGUJUwaaTHN7RzU9HwdKbrHdnFKtTr1ARfC
	XFAOV2hSp2CZW/UjQCzPd6bKZy4CsbiLZPVgtxwYsc4L1kbaFa2qyd8FSPj8x6iBngLbLzVq63nbE
	XE9LMJ9j99kRa0oFo4NIJPKzm0aunlfuadvCpRvgEdo5QATuoXjm3GaIVIe6oaXzJCDH2X+3mYj6q
	1iwx7xgTE+mzVEdgsS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATKL-003w2J-83; Wed, 28 Dec 2022 10:06:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJo-003vfL-NV
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:05:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id g16so5974678plq.12
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XddeMIQqpQATN+V02+mnCt6s/9dpQm+lysoFjgM/iXM=;
        b=bk9fPXdUuyhpiB21Zc6lECqP3DGFcZuDaRjM9NiTQcDW49oyZnaprUVChuBu13cveQ
         +tuR2ei4Gmmks6GNZpxuFlZ48YVzWw+gkqvpwyUiSGGq/Y2syUZgKcfFTnDPhxp3VgIC
         BpOrcy7TMVP3fdt3Ik2ZrM5IVJRK9/7SH+CxvzZgWFQNNwfov1ra7ELkyAC7d6Y4EqHn
         F5nagEcXFH3dZzg3tuNpg9MQsoqD03c8DCLicI0G+mRDOd4fj51Bny/By7Ut0BsCtl8D
         J1F8UKUC0yEtzECuDGWz7qceGVaLHeKQ7RyFNkYllKcWZxwBbvn5aHZQ+miHxIV/waIE
         z0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XddeMIQqpQATN+V02+mnCt6s/9dpQm+lysoFjgM/iXM=;
        b=zNHxzGjXk+JDkehhY1bUiDCmBmpx+504DltJxtYo63LTvab9DynFP25929El1WgaQj
         8efRcFhR7VyGkSMBQ0AHvK8NKUW11pvmSPFI2TReHTPmsJYt9Png8ObgPek+Tkkj1aQL
         T3M/o25glpL39Vv2B/8tkhXzJ69beWSwyzB1hPPWutYVoft6UDmv0SPf/8dD0S97zy2b
         gFMG2BnyyWW+rPg3g+XVLn3weAgaQjPPZbSWWimy68SkDMK/T5Gp2WcHuSGAdDRMGkvo
         vUB4s/fv6N8ktbh6CHJmtmYicAzbVyZ1XH1lD3Fgg+Nsz+MnvE+xx5qb+WlH8irTQz4m
         ld5A==
X-Gm-Message-State: AFqh2kpQ2hNYfzRIXGzQV/RgnwQzzJeHP2gTmBAxkImN6gpKv/jQV6hk
	48PgTPOcmQrYEs5PGcbXIQA=
X-Google-Smtp-Source: AMrXdXsGyKPlSNurOpXtQXDm488FCNp4MXLMzNFxR/gCvJmOImwthWm4FQ5Snt8HpVO9Gw2aqoOuyg==
X-Received: by 2002:a17:902:da86:b0:189:747e:97cc with SMTP id j6-20020a170902da8600b00189747e97ccmr35072825plx.26.1672221951502;
        Wed, 28 Dec 2022 02:05:51 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:51 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab VL817Q7 hub controller
Date: Wed, 28 Dec 2022 10:03:17 +0000
Message-Id: <20221228100321.15949-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020552_832707_0F8BB098 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
features 4 downstream ports, an internal 5V regulator and has
external reset pin.

Add a device tree binding for its USB protocol part.
The internal LDO is not covered by this and can just be modelled
as a fixed regulator.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
new file mode 100644
index 000000000000..4ae995160fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Via labs VL817Q7 USB 3.1 hub controller
+
+maintainers:
+  - Anand Moon <linux.amoon@gmail.com>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    enum:
+      - vialab,usb2109
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO controlling the RESET# pin.
+
+  vdd-supply:
+    description:
+      the regulator that provides 5.0V core power to the hub.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub: hub@1 {
+            compatible = "vialab,usb2109"
+            reg = <1>;
+            reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
