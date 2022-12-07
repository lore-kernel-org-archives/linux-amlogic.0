Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A03C352A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSi8SHJbZaCPEb42oqrGPcxYwPUpUqnHpWAq0ir61Os=; b=pQCZYx6Ib4VTOe
	D5+DaNPQDjKq/najAgMJ3OkdZoXrxPxOGNNkWJOnEEzWI/wdhHeRrDGsjPS52nCCuB8IjPPxmSr/W
	0pShcrXvcRAy+eXM8Sy+u/REpy+AeR94mwzE73oq80yQWUU3bF98zOoAsz+Dlk96kQqIErkDrfm/T
	v/zhfMmvlyWuhqlt+UVE/zwWfZdQPecfYqaRsPTkVmGRQbwubF1wwM11bgq/5EjLoIduSsxIBNOTY
	R7Qtz/PLO8W7uKYL40/njyQbSRQDqyAfV/YPfIq5PT0Fg1AOqH+v6Gsjr0h0aQiTwdkpJ/jjTlB1H
	vTLXC875Ey8xdlPG8MaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rba-00HCQ5-Jk; Wed, 07 Dec 2022 10:24:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZv-00HAd4-Vt
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id g7so28000463lfv.5
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftjSB9JJ8yBkXE+8vCPq7doIFKzD/Pbisdda5DVy8ec=;
        b=WIyixd4HXawkevgN9swStc9TJ6yWZGGmbayM6ArIH6QU1OLmhpDd3KxItyoF9x5zw2
         uKPZvAEgvbygXM3F2LJeDNdN4q/aofkOilIlQaHVR9k9Be7josKZNuB23lQVsEX51RNE
         rhfPr5IeWj/ByE3TGRnjcfyHF2GKQsHUl6m6/X98npaeg00dn/b8r4Z2nUV5X/qpzGBZ
         cqORDrRBpgt9P1uXgj5rQEDdmHXgYysSvfzS5UhoD/Q5NxYJ+FRVSix3EA2iUjwJ+5dD
         ud+j1hZZq0/0U3c2ajWUDhgq/ztWY0Lj2pb/+HTI8UebDMqThOTFut+exVMuNlVGkC8Q
         8xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftjSB9JJ8yBkXE+8vCPq7doIFKzD/Pbisdda5DVy8ec=;
        b=l0dOJAKp9G0wjhW8Q6D/CICB0l4JkbvvfigRKudxILXHE43uoHFghEcOuUItESTl23
         72JVbxrzCAmOeGIb5Ryg89KLvo5Eg56tnbD/g8m4dFGf3GWvDrPqfdo0VFhCjcM1QFwG
         kUpBSw10EXwMv6dfWhqNu5VDo8cWL61Z37m3aHLnLLfgadd6ofDYvS4GDN8HPeQinq/v
         sVhtvYbxcp0KQqVw51oacWE6XCWmL+S3Ffd2U5wl9CFXI+0cVj/rjOCZxelfLekymMdD
         8L+HIc+kisch75xrrDpnVAowGOrRLrA97vuHfpKYUtU2E9GR8Bhss5Ip2/0MOYmXFdrb
         aWIg==
X-Gm-Message-State: ANoB5pkt31pIZ9u/S4U4WmXkB/mWXYe8Yi3VUVlen0jGounU8XFui0bh
	uljL1mu4A7CotjEhQeqytP1Ymw==
X-Google-Smtp-Source: AA0mqf4om2ZDcm1wROjWKvlDZ4YHUcOqiqFmBIx5LemQjgt2gr26PuNmCDHVgdcNxCeZZI4G2HTlGA==
X-Received: by 2002:a05:6512:c9:b0:4b5:9055:141 with SMTP id c9-20020a05651200c900b004b590550141mr1145685lfp.200.1670408581624;
        Wed, 07 Dec 2022 02:23:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/9] media: dt-bindings: cec: convert common CEC properties to DT schema
Date: Wed,  7 Dec 2022 11:22:47 +0100
Message-Id: <20221207102253.26663-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022304_036125_BED86F78 
X-CRM114-Status: GOOD (  17.89  )
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

Convert common HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/cec.txt         |  8 ------
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml

diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
deleted file mode 100644
index 22d7aae3d3d7..000000000000
--- a/Documentation/devicetree/bindings/media/cec.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Common bindings for HDMI CEC adapters
-
-- hdmi-phandle: phandle to the HDMI controller.
-
-- needs-hpd: if present the CEC support is only available when the HPD
-  is high. Some boards only let the CEC pin through if the HPD is high,
-  for example if there is a level converter that uses the HPD to power
-  up or down.
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
new file mode 100644
index 000000000000..af6ee5f1c73f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC Adapters Common Properties
+
+maintainers:
+  - Hans Verkuil <hverkuil@xs4all.nl>
+
+properties:
+  $nodename:
+    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
+
+  hdmi-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI controller.
+
+  needs-hpd:
+    type: boolean
+    description:
+      The CEC support is only available when the HPD is high. Some boards only
+      let the CEC pin through if the HPD is high, for example if there is a
+      level converter that uses the HPD to power up or down.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 07cb85cac4c3..45402e03cda5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4832,7 +4832,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
-F:	Documentation/devicetree/bindings/media/cec.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
 F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
