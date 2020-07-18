Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEADFC433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:30:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A609D2076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3DZ3mh+L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht7EAniV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A609D2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7aJbOMh8qjSirIbvQJ3GoOVM2EdAXTdJqyiDAFxiqKI=; b=3DZ3mh+LQvY6D9309wQmbYbsFG
	Dackt++H5bcUBN5YEssIy8QRyM/XjGEY+Zg1qbbw61LERdsWTyKldt6unylEQ5MuhyyP7/qvmUsez
	iEYRQ5KhjHl+Ic2nvkgvpE8GBisDdIRSMhZyzQ51pCv/N4HKFt9lN2dxOSwBP3LUoxY0CRGb0Gh2P
	lPYoGd1WH4zQMCtpzfVDfDVDdcWJWpxE6R1/EEi1xc+DLAC3jJjWS38CQdDQFp3ylQ3Odo9goL6/O
	uKLnVz6J/Pw3CzO8kzeTsSSswlwFX4bYTGsY1FLIcUerhHfu9z+n1MozWniU99FYxxxiddMmsmMJg
	Bfo2zQ/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfQ8-0003F3-8Y; Sat, 18 Jul 2020 05:30:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfQ4-0003EF-2V; Sat, 18 Jul 2020 05:29:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id q5so13147000wru.6;
 Fri, 17 Jul 2020 22:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rqatcQsvNnH489JiyTckIeyzp1Uk83CW3W6g2HlZiXI=;
 b=ht7EAniV2VwVIjDt2coFsLdF0qOfytsvxoXCTyI68FZcWBFnZV300S80lysLs4n0/+
 9ps8caWmmP+IDjMuoM2YfPIlp/seCkFSd9vRYPfeY+VY0dT9liPagwLbsw9QFD5fUdGN
 Hinf5h8xRRFDUWQRV6lKNror4mZr6gZHD+ra1HNxrXKylhJ7S31dsHk1YlB7fkkyhOCW
 iOVmoYngzhC/rx0jDxoI0EGrnrr26r0hvMLWpAzRXu+bC4yg9kxVf0WNL1KfEB5iKIg1
 67JBj/hcm4AxRHm96doGfMU1Rt4FS+UM7KMuZOAQaCtzbRWC/izujaAmBhtJsnVhDo68
 M85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rqatcQsvNnH489JiyTckIeyzp1Uk83CW3W6g2HlZiXI=;
 b=HayIFdqGvS5a3H8B4670nlpo0BFqZjewhxpwD6rBOBcX5rhBIYna/W8bOBchPg11LT
 f1mmnD8W+iCxFehZ/KYOY/QqhN1dBpMNjCFNtPt2zG4YqGiuqlRJprMcbFY1xRe0k5kL
 lu/SRAN3awxyJ2W9YMPzCZFmO5aHh22jfMEvEEBKlm1EosLhbq97KgAm3KlCX8mkI6jm
 bge07yxWskEEvF0CZUEjbOofEtszGJSxOsMeV12ckLgKU/H4Q2joRQdztpEvSHfAVBV/
 CJq4LPU291KNWXQAwIv5VIu4WQqBiGHNWzGCafX/93prJYJMgZE7JZUiXTs/TOjFCjeq
 d+0Q==
X-Gm-Message-State: AOAM531aTgLwhJzwEw93FKfixpTlvqIUBIscSgtiWzoT3kHucjiIsyiM
 82gc21xE2WHkmTqOuFODRD4=
X-Google-Smtp-Source: ABdhPJxIZIk8IpaHWGoqT3B44PSmWmajAlSFxLC+YGacclYjd9J4ahr2meIk1JK0DS4HW7oSiVnXww==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr12526132wrr.279.1595050194874; 
 Fri, 17 Jul 2020 22:29:54 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r10sm18393722wrm.17.2020.07.17.22.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:29:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: misc fixups for w400 dtsi
Date: Sat, 18 Jul 2020 05:29:50 +0000
Message-Id: <20200718052950.3707-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_012956_155043_7C39BCB4 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Current devices using the W400 dtsi show mmc tuning errors:

[12483.917391] mmc0: tuning execution failed: -5
[30535.551221] mmc0: tuning execution failed: -5
[35359.953671] mmc0: tuning execution failed: -5
[35561.875332] mmc0: tuning execution failed: -5
[61733.348709] mmc0: tuning execution failed: -5

Removing "sd-uhs-sdr50" from the SDIO node prevents this. We also add
keep-power-in-suspend to the SDIO node and fix an indentation.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 98b70d216a6f..2802ddbb83ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -336,9 +336,11 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	non-removable;
 	disable-wp;
 
@@ -398,7 +400,7 @@
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
 		clocks = <&wifi32k>;
-	clock-names = "lpo";
+		clock-names = "lpo";
 	};
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
