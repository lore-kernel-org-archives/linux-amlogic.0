Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5446C07E99
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B0A613C2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B0A613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjCYfyiL1W77ro1Kxb69zKiW0STUVApnzJAbU+aTV2A=; b=dLE5cEx3pkENxt
	qAKDsrVKwANMB0K1sg4RTLBF9x45ex1IJha27rPMuJ3yuONsrQ6U4NryiFvS2FHVUXrQfsFBYLTM9
	b4SVjhSrzShGyvmGWsWq6iBnysI9tWqlO3jtUIAfsh5PAHWxE1QheNGj6WZ0WNqobfh0kvKVJes0g
	OvxAIt+T5SD6i8RsKKPpZHFZ5Cp/fcn0PyDwvZFQGf+VWhMlnnNH9EUHFbIuWidIitfkZ2cIHma5Q
	fvjgs8ea5OGE6E1e+NtpLx0n6Y4sPOqOUKrNM9F2tZ2OV9ECGbaPuYHEfeDTZiSlE0RthyHJTP8Ch
	bLo6eGcP3g/i43Bp23pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Mkf-008lcC-Q5; Mon, 05 Jul 2021 11:27:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MjG-008kx2-FW; Mon, 05 Jul 2021 11:25:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id a2so18012047pgi.6;
 Mon, 05 Jul 2021 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g2TH5jVOBgH+4QEJTPNMHLBBgJD/0e08oBjTYiq4sNI=;
 b=Pqf4YHi/dQIZKy74e16umSQiHidGvgZVANhwc1qU9L2RqmFNnvH4JbSpbM3pyV2Qsy
 9Fuenw8HQDfXJ5YmJcNCz46yQ5GSNs9M6ZFei0JGf2ZebDSrQ9MsERHrWvngEjZA2ygS
 RnmrhwY7woCZEiKHkyBpC5hjYXuv/GWPPBIj9bRzRAALDHua0T0TseE1UNpoKHPqdjh5
 PPJ9yGF5DbBp6NqgDkwy01Gxapmgf9zywsW8U71WKSAa3yOELSdNJKsRikqXnbaV5REQ
 QIv837ATw/UUaPQOUm+qdKG3iCb5EgJCTeAKWfAE7mI9xBvQU3IeU4CCvtjkypgEZQSG
 DXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2TH5jVOBgH+4QEJTPNMHLBBgJD/0e08oBjTYiq4sNI=;
 b=JorOY6Sy3++DsVdP+pncvWKsrMLHYQbuGt6AEgaAciqZUc/ujlwiwpT69DpYk4z+ly
 tS9N19f2AHFWlpxAF0mPFXl1BxsIC4EhJ2+YALc/0r4INJTGOXYKI5OJJKy2dYR5vE9k
 xpCNBT+ejt+rTeFf1OxU+2bib8yuNPF19A3vA05ueCs8lMI3F98ISZCF6qcDPXf0TKJo
 uS3ttGk4eBeMy+ot82n8NWgdZBU6W5dLW+O2AtnUCh4R0mYil46jUPBODdbEmWxgXNrW
 ljMRDEAQkmrt3Bjmb9V2hRpH10L5WhY1Tp2u+ZS1FLeC9KnzrsrQXgx4V/VdFZEmqOSp
 JqRA==
X-Gm-Message-State: AOAM530MmnsLlGLsVR55mD1xD9AtBxjyUzjkoOOpyYm5yKWwE/yVqXff
 Kccok1Fa1PTK+lr2W8JH9J9tvKoZQgM=
X-Google-Smtp-Source: ABdhPJwvgdqwKjKXtAl9q/7P+Q9X+61LySVkfjmu15v0eYAfaJnEqFnOGvu1DQXj8kZBqzxIujxQCA==
X-Received: by 2002:a62:ab10:0:b029:31e:4a34:b78f with SMTP id
 p16-20020a62ab100000b029031e4a34b78fmr6278644pff.69.1625484333422; 
 Mon, 05 Jul 2021 04:25:33 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id gi20sm20976959pjb.20.2021.07.05.04.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 04:25:32 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv2 3/3] ARM: dts: meson8b: ec100: Fix the pwm regulator supply
 properties
Date: Mon,  5 Jul 2021 11:23:55 +0000
Message-Id: <20210705112358.3554-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705112358.3554-1-linux.amoon@gmail.com>
References: <20210705112358.3554-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_042534_587592_3F294C75 
X-CRM114-Status: GOOD (  12.52  )
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

After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
instead of dummy regulator.

[    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
[    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
[    7.117184] VCCK: supplied by regulator-dummy
[    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
[    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
[    7.118498] VDDEE: will resolve supply early: pwm
[    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
[    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
[    7.118553] VDDEE: supplied by regulator-dummy
[    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT

Fixes: 087a1d8b4e4c ("ARM: dts: meson8b: ec100: add the VDDEE regulator")
Fixes: 3e7db1c1b7a3 ("ARM: dts: meson8b: ec100: improve the description of the regulators")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1 - New patch in this series
---
 arch/arm/boot/dts/meson8b-ec100.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 8e48ccc6b634..7e8ddc6f1252 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -148,7 +148,7 @@ vcck: regulator-vcck {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		vin-supply = <&vcc_5v>;
+		pwm-supply = <&vcc_5v>;
 
 		pwms = <&pwm_cd 0 1148 0>;
 		pwm-dutycycle-range = <100 0>;
@@ -232,7 +232,7 @@ vddee: regulator-vddee {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		vin-supply = <&vcc_5v>;
+		pwm-supply = <&vcc_5v>;
 
 		pwms = <&pwm_cd 1 1148 0>;
 		pwm-dutycycle-range = <100 0>;
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
