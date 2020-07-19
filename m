Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60D9C433E5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:15:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9558221741
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Hf/v45z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shJGdMFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9558221741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giq9jtMtVwec5hmGiN9K3I7kjPgdoyrQ7eT0yucZlfY=; b=1Hf/v45zXYoxJouqBWLT/ucHLC
	hZ6ajE3XRQ7dZ2Xtp0RFMCUWflqsZbjqz3dSCyF/MFrfJgbFtQxmRXu4VKdrn/S1eYFuqVRy4Hnwj
	wkpCMVaIIYJTCeYcVQ1s0k4oY2QgC0vkvyHDrblYF8maZD67eesI5nZ6wBAJBEJm0VW+YdUH41XCc
	iu2i1ZYBYPEh0rkBhhOJnsVP2cmuKgnd0IOQ9lApctw3zkF7rN1Jqwo56rb5LDt+GxSqJ+sWZVVT9
	wICwO5+P3c8VwTaL54vnPJrdA0mjXcVxriMrLVFK2VWPt74yzvrwqCQWWzUega+cIytmFa+LyCYli
	X8/wPcZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwyqm-0000xo-KQ; Sun, 19 Jul 2020 02:14:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwyqa-0000v6-9d; Sun, 19 Jul 2020 02:14:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 17so21913137wmo.1;
 Sat, 18 Jul 2020 19:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=shJGdMFSrIFx2UkV3EqrEmoYnfAE0XXaMRbOkQJumHnk1GOebQDX58vtRnxNlPzAj+
 GXoI2yffkLZ8QVeGvMCoWtWwdPp1gOVxG7p4+Y65bCztkhNJpNA0+y2Nu4hL32LhI2CH
 dkqZR3UG3IJWShZKVD/41HMY8fR1ao/Kn4MYQ/PWkUCOuR1lKc0N0bQ8wQBvHtl8ZEr3
 rjP3QQN8TXokfi5uFsNngkjHGXh/pxZNzHXPjraVZS4o5QFar3tRMOkQDVqrH4pdFpho
 rnsmLwcClk2dUo3SwiLIPlXkEHgQsAaeneRs3VDzgjCgKD5/4y8WeaM+erM2hYcMbsML
 yD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=Mnos/7M5MPWLgZe2iyoAqDAHiQgLVQJv32lbDRUYIJHgZD/Ul6XGvyeCWi9mghCBN7
 xfsORKt5pOLwq3sT2FkSljnj/JvNXO+6GodhW7LieKr3R6ossK4ug3g40ymuSzNSd4pf
 0J/hJvALWJ+hiTaUeaCK/+V66s3uhAk2oVcJLYYSJRBo5T5q8u+Ybp3cze75Xwfmc1VG
 /3vDl6r+NkCCTjSg22fddbz1nPZlQD42vH+sXfVsGh7C3MdR9pTzCp7JBrHCp9BAHEsY
 /3qjBRa1nVfL7bxOG5Rm/hnejFNWDIcxMdNodQKODZQdgS67UptFNL7NfEp0VKG78ATZ
 QTuw==
X-Gm-Message-State: AOAM533shT6r+M06uKEEMPgPX1fY4dVYJ3yylo7aGkVGqTQWwXEED1vm
 OiHIJF9lIzmrPqPkQyPz2Zs=
X-Google-Smtp-Source: ABdhPJwbx7zQAyjjmZbD7WUHvgisDzdZUs/ei6PvMfz/Lj+pHUKEG43rF9MZT7hZxXK/oQbf7Fhv0g==
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr14656801wmj.80.1595124868889; 
 Sat, 18 Jul 2020 19:14:28 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id v15sm22078103wmh.24.2020.07.18.19.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:14:28 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for the WeTek
 Core 2
Date: Sun, 19 Jul 2020 02:14:20 +0000
Message-Id: <20200719021421.7959-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200719021421.7959-1-christianshewitt@gmail.com>
References: <20200719021421.7959-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_221438_381485_F04E3A43 
X-CRM114-Status: GOOD (  13.44  )
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

The WeTek Core 2 is a commercial Android device based on the Amlogic Q200
reference design using the S912-H chipset. Specs:

3GB DDR3 RAM
32GB eMMC storage
10/100 Ethernet using Realtek RTL8152 (internal USB)
802.11 a/b/g/n/ac + BT 4.1 sdio wireless module (AP6356S)
2x single colour LEDs to indicate power
1x power button
1x reset button on the underside of the box
HDMI 2.0 (4k@60p) video
Composite video + 2-channel audio output on 3.5mm jack
S/PDIF audio output
2x USB 2.0 ports
1x USB OTG port (internal)
1x micro SD card slot
UART pins (internal)
IR Sensor

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 378229fa8310..5eba9f48823e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -121,6 +121,7 @@ properties:
               - libretech,aml-s912-pc
               - nexbox,a1
               - tronsmart,vega-s96
+              - wetek,core2
           - const: amlogic,s912
           - const: amlogic,meson-gxm
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
