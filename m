Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120D8C4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKG1nAdTqEaC5lz412Yp84050OAJpwIXBlnMtfeQKy8=; b=XoFa4poUlawM5Z
	qBMIlUKTHN6mQLun2qUvTYgMpKZjyCZoRr/e25TuZD+LH38Jvq8ILACod0vr7SIGTLa6HT+kQp7TQ
	A4RkXIiOhx2YLkRa44ybanuB239PHeXNsb/zkn4Frp9NTCoLDUBgVItongZu2iXBaWxWAaG3Ku6p2
	fyQu2bOB9yjb777giIsXcwTdFxim+SjBkWJXJUYozhleHuEwbkg91P//Y4WnSwdSnfbQl3uZ6+Gpj
	Qi+SGf8EASmzLUzg7+EdNUWN8RuieYVuFiNPlotQXLnhnuTEpc9W3T1hn129QsD99de91sswpo4m1
	B3ora04ep241vTR1L6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tnS-00AMkU-Tl; Sun, 04 Dec 2022 18:33:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tjv-00AMFQ-5v
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 18:29:31 +0000
Received: by mail-lf1-x132.google.com with SMTP id j4so15398871lfk.0
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gjIuLbuYm9eN5Zaq7wruCJOGXBkxk9TEVxr2ELzNyM=;
        b=msr4c6dETd0XxzdYTY6W9ZWmBlM+poak3c3oJp5hQc7K1UIwvRlM2VBsa7cprd/zQA
         jzQ/8PRGd3A+ElhWXkO6twmZZxLFir6zHwGBm8UisZjmvLN4D4jS1AzP+dMMa4+69kHx
         aX8ktNb/E2zX5YVF1PBWxMsZn2am3+NSy9M4cgd/b621JlEyPONraQ49XsXeTpFGb951
         PJZEUEDu8HMthVkriHZcZmUTppE/i6Z4FHD9CYiTEJZBX1xZB/wPCMtddQSKOx66r4O/
         bda7BXQz69llTsbmmjaT9a/tTot1p/pySV6q73ie9U99cpO0jtqXSGEjTo5u95pvaXv3
         s6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gjIuLbuYm9eN5Zaq7wruCJOGXBkxk9TEVxr2ELzNyM=;
        b=nZJ2CcdKikpaQZrkyYRv1K0I4zLvn24fcfr8cKMPp4G7HXVZp/KJVVttG11WY0k7GH
         vCa5cZsxBrtaZfhdiNxXAb3zxaT7FPIb3QS+UcjXtTsrkgyQ6Qc6sDnoX/urnfDfc8S4
         ENTQxzkvJeKM6G8/qK16lhTvJaAGbbgyuuRVpwJyEXdiOhEtIZTO4cu2GTn9rI2+cwVt
         xdna6JKkLRA+mvteJhaDCsfH3sCl7TaMh6jYhXJbaTraPUW2a6hJGof+Al0w0/qFOSOF
         wbAUKst1MfTxIynbt58PFTT9mleDf00ceWtG9xDpkDfIM2ThDSoyn/HOzx4JrMTiX3rB
         18vg==
X-Gm-Message-State: ANoB5pn80D1vaEPFYqFd7qOfKJyvT4rq8HX2TwxPEHovkJ5bzqrZou2h
	TNyVRbW/22tNvg4Aefcan9DEmA==
X-Google-Smtp-Source: AA0mqf4UPCxxvMoekZXXvXot8m/zQ+q1fGTUZPaIMlMJIt4kh2HXIM0T5KqpWhb2o21ZZrh+KyfCPg==
X-Received: by 2002:a05:6512:250f:b0:4b4:abb4:c34d with SMTP id be15-20020a056512250f00b004b4abb4c34dmr24680669lfb.218.1670178561302;
        Sun, 04 Dec 2022 10:29:21 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:20 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] media: dt-bindings: cec: convert common CEC properties to DT schema
Date: Sun,  4 Dec 2022 19:29:02 +0100
Message-Id: <20221204182908.138910-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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
