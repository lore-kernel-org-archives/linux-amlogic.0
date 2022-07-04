Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F9C43334
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jul 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nKI0EbYZksAhGtzP95VaNEL0E5kJ9foWXX3rymtUFzg=; b=Xvzp6EQZNiyZIr
	QQQsL/ZIlNT39/IdCKX1ne89jbhnMqMUBYtVz2iILZmiKPgNbPZjQJIJH/Yo+qAwdz7FIfenFRvFT
	e43SQBSZwAgSKyJzJ23at3nxTnsq3VaQvSoqyuJ5Wmq1j0NXLz1ffGZTc+VDxqXA1Ua4/WZWIRyZq
	XxNfLLdGXZxc5d2pwPQMoVc9MsHgCVnwm1eFSBIbPsQsiyiyMdddK66qdQM1CBgS2f6o6T9hdQYHN
	On0ZnnvBNFoWeE6HKSfRwM6E03N915mOsxqz98KHMMYkRKf5cTwwlFx4raZtl55lC7T6YusrdzvRg
	Q6oy/0gAIPr6eSYXF0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KF0-007j9L-DX; Mon, 04 Jul 2022 11:27:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JhY-007HPe-74; Mon, 04 Jul 2022 10:53:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso6041217wms.1;
        Mon, 04 Jul 2022 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4weMpjvNiH7V9U3sbXbzJxXZClEc9I2GMKVTP6AA2c0=;
        b=P/c9/IGQEPreCQ0nHotpRmWlzk39e7XMKW9T1rPAbMMpTnQ47CZMILeQACoGFMJqXj
         XqtSTeHGSTDhG21kzL36QiDSkWLlqw0l3u/wHq535AB+7dEIByE6VaRgseGxScnqzu3a
         AynlarYdZFNfiVu9g8fw1POFreKLUKD+tTkT+baijQlbwAMytXb8Ye7LUyNOchS4Yak7
         l7Dwawiw/vOv0Cw+muKgJmPI2Wpx/MONt1B82xSSAXi7euyoPQwEfgHhRun+sLzMIZrJ
         rbR/fcrwD1D+hmje51P59xSsw5xq/0AMNGa/4PlyV12zRbhTchJcOfYVxFgotRPgNINp
         XX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4weMpjvNiH7V9U3sbXbzJxXZClEc9I2GMKVTP6AA2c0=;
        b=XbF19S1mUARD03pWl8wHqd6wSvC7AVsQsXgSdyyfokcqQDRPdj7b2Gf0GJA/Me4LGw
         FR2muFmBRHUYm8wNfLi5r6qDAcxBDxZN0XlFa5mQb3qIeeBFqFTYMlq3hd0a+vnRSZFF
         eni282cFFJMUf4jBK8WIXzJjjCcayMsRx1mu+5rJpo3TwpMZajYhCLq6hGrv7psY+pfd
         CAuU7lAX/E2IG1oSZhoq0aX4NHn2O497VBd1EgfDSFMAKHW5JxMuBRwgOtbhMQnf39aB
         RZvPXKAqmYtBp8HTYqP4JjQZ8Qy65b1fA1aOnt8hI7JDNl5//soO7EhZhFG1hMnyNK1k
         X2YA==
X-Gm-Message-State: AJIora8bNICSkaI2FrS0Jp5lltOuDfq8ZAwh4DdJw+RSbQijAkdQQ20W
	MNbrZOUKabPqo1PlRpJ5/5Q=
X-Google-Smtp-Source: AGRyM1v3rotBr0o2IFPa2Oszpyd49EUK6GjimhNUEb5xJaX04pIc3hhz3Bnr2maVLeqLXFi2YAsyXQ==
X-Received: by 2002:a7b:c410:0:b0:3a0:2d7d:732a with SMTP id k16-20020a7bc410000000b003a02d7d732amr32454903wmi.113.1656931989088;
        Mon, 04 Jul 2022 03:53:09 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j31-20020a05600c1c1f00b003a18d352893sm10907140wms.42.2022.07.04.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:53:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee.jones@linaro.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] dt-bindings: Fix spelling mistakes in documentation yaml files "is is" -> "is"
Date: Mon,  4 Jul 2022 11:53:07 +0100
Message-Id: <20220704105307.552247-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_035312_322380_EC2A2341 
X-CRM114-Status: GOOD (  13.96  )
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

There are several occurrances of duplicated words "is" on the documentation
yaml files. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml   | 2 +-
 Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml       | 2 +-
 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index a4b4452afc1d..a04882e101f3 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -139,7 +139,7 @@ patternProperties:
       the connection between the motherboard and any tiles. Sometimes the
       compatible is placed directly under this node, sometimes it is placed
       in a subnode named "motherboard-bus". Sometimes the compatible includes
-      "arm,vexpress,v2?-p1" sometimes (on software models) is is just
+      "arm,vexpress,v2?-p1" sometimes (on software models) is just
       "simple-bus". If the compatible is placed in the "motherboard-bus" node,
       it is stricter and always has two compatibles.
     type: object
diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
index f6cac4b1079c..3549a32452ec 100644
--- a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
@@ -26,7 +26,7 @@ properties:
   '#gpio-cells':
     description:
       The first cell is the pin number.
-      The second cell is is used to specify flags.
+      The second cell is used to specify flags.
       See ../gpio/gpio.txt for more information.
     const: 2
 
diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
index dc5a29b5ef7d..43a3f7ccaf36 100644
--- a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
@@ -26,7 +26,7 @@ properties:
   '#gpio-cells':
     description:
       The first cell is the pin number.
-      The second cell is is used to specify flags.
+      The second cell is used to specify flags.
       See ../gpio/gpio.txt for more information.
     const: 2
 
diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
index 012d25111054..373c4f89c4ea 100644
--- a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
@@ -28,7 +28,7 @@ properties:
   '#gpio-cells':
     description:
       The first cell is the pin number.
-      The second cell is is used to specify flags.
+      The second cell is used to specify flags.
       See ../gpio/gpio.txt for more information.
     const: 2
 
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 608e1d62bed5..3eb0513d824c 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -149,7 +149,7 @@ properties:
       - description:
           The first register range should be the one of the DWMAC controller
       - description:
-          The second range is is for the Amlogic specific configuration
+          The second range is for the Amlogic specific configuration
           (for example the PRG_ETHERNET register range on Meson8b and newer)
 
 required:
-- 
2.35.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
