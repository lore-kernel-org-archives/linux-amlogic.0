Return-Path: <SRS0=7NJC=PF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A171C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF32A218F0
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qdu5BAWO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dRlA39fE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF32A218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BL9ORrZx+be/SN06kzanKGE1M0fw06nAqnxNZS/DmIQ=; b=Qdu5BAWO82RzPv2/9oXUBpuFpj
	tA0MQqifG7zK455mBOA14IY4QwN/TFbA7cISSUPHroNbFOzytK/w63EoTuYAXES3X9COrJHpjvJ6E
	akF2G0ARnm/c6hTNewFW4Y0kTL/k41bX/wrgvQglOfolS6IB7UmX49n2tnRaLDDtKPSSl+8vL5EYH
	Alr9fAOSCitfo7tW/m4TtoeAptdzmCkznyg9yw6HQ1/WjCvFRsl876e1y/kk9anjxCyvCRsthIEyT
	owZ8Xj+FawKb8MOUAyVKKpKzCibNJ2two2mT768cBHg6rH4FTgeTxlSGf5hUA85dgdkf55AarmHjB
	nMOSfKtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcpji-0001tL-Vm; Fri, 28 Dec 2018 10:51:26 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcpjf-0001sd-BC
 for linux-amlogic@lists.infradead.org; Fri, 28 Dec 2018 10:51:25 +0000
Received: by mail-ed1-x542.google.com with SMTP id h15so17244476edb.4
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Dec 2018 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gE62p5/59RTzWzc5sJxmZU4FHrcRfBxyqPDK6YvY16Y=;
 b=dRlA39fEGYGrMCSdYxMnu+56HDgaWfjlB0lpUUcTDIbhDhycuAZjsFRsBVekENFUcf
 A7PHCRAw04IH3nBfx6hy1HCoqwpMaH/9V0aM6i/wnUzgNLRrtqgCbNPMIm4E5g+0cNZx
 rPOV3y0yGLu/PvCh6gaV60LjWhDSyKb+ei7LJA1EfYadXQm4X3d+PpBT+3Ku31xaiEgp
 Sh+LTq1Gxlrjon7cNX7BquTilxJiESN+EI6SoLsHlB/J6Qeldds6ugSVX+rNv08AbSiu
 iHc2gGve9ysabdEJGEtaaijTlFiOFm2GwV/XrLLtfE1qZNdWrYUeVyHDNkNbtlBhAnZb
 vWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gE62p5/59RTzWzc5sJxmZU4FHrcRfBxyqPDK6YvY16Y=;
 b=HRBoSrG3dom25oQR7frt7sTKbmCoGuZl2onnIraYTQ5KOseaNuEPDSI/B2mvwxZmGS
 qD+pZ1oMlx5mSyy092bYdwXmp25YPSYsfVy+vKCNYYD1nGRB2Gz8HCwR01DMZHummogB
 SY/K0SgSofKux9HJ5aU8XJ5B9AKWvXCCxxGxAepDI8j6hyxx4gAMUUAC03BLhJr9+SWf
 uhgsj97cUUW3W0ZhiQjRsOx7oBmlJMm1ogpqYOoexeLJAqm+ukBw4ezAp0sedgXGPXiO
 oqi4aUoMoE8DVmptb1iNtSIo+6aa/IcOckktshHqmgcXOHYyAS1Rleo0wO/nrVwTChTm
 DQjQ==
X-Gm-Message-State: AA+aEWaJNnjUsMdjPnvlUaP2Vg9e3Vr08o0sTqWwS30KIsAbiXotU7PE
 2djqHx7GNUlMoRsu+jhyIKwicQ==
X-Google-Smtp-Source: AFSGD/UgWV6/KGWEQPJEiGDiMrBwzvlFt9oTMCNS79TdGRUIIHzmtWxHx1sANpSRzLgVnuiJr26S+g==
X-Received: by 2002:aa7:d602:: with SMTP id c2mr21740716edr.203.1545994281932; 
 Fri, 28 Dec 2018 02:51:21 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.home
 (anice-157-1-157-17.w83-201.abo.wanadoo.fr. [83.201.132.17])
 by smtp.googlemail.com with ESMTPSA id b45sm12919494eda.34.2018.12.28.02.51.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Dec 2018 02:51:21 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] dt-bindings: gnss: add gtop binding
Date: Fri, 28 Dec 2018 11:50:33 +0100
Message-Id: <1545994235-8309-3-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181228_025123_384323_45C5C7AD 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add binding for GlobalTop GNSS receivers.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 Documentation/devicetree/bindings/gnss/gtop.txt | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt

diff --git a/Documentation/devicetree/bindings/gnss/gtop.txt b/Documentation/devicetree/bindings/gnss/gtop.txt
new file mode 100644
index 000000000000..24c86703aa46
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/gtop.txt
@@ -0,0 +1,33 @@
+GlobalTop GNSS Receiver DT binding
+
+The GlobalTop GNSS receivers uses UART interfaces.
+
+Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
+properties.
+
+Required properties:
+
+- compatible	: Must be
+
+			"globaltop,pa6h"
+
+- vcc-supply	: Main voltage regulator
+
+Optional properties:
+
+- timepulse-gpios	: Time pulse GPIO
+- v-bckp-supply	: Backup voltage regulator
+
+Example:
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>;
+	pinctrl-names = "default";
+
+	gnss {
+		compatible = "globaltop,pa6h";
+		vcc-supply = <&vcc_3v3>;
+		current-speed = <9600>;
+	};
+};
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
