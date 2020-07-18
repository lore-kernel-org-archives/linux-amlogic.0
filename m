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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CD6C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 09:44:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F4E20691
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 09:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iRCNLIE7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTjGxonL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55F4E20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=giq9jtMtVwec5hmGiN9K3I7kjPgdoyrQ7eT0yucZlfY=; b=iRCNLIE790zO28QE3peJEjLH2Q
	4OKjGGH0f49OE8zBorFL4dfG1Tj6D3yXnDLDJtDDS0hTQ2kO+Lt4hD1pFnncva9Hi5UJJLk+05UGp
	Db2/xO21Q1yBj2Z2YpN7SMt2GVR08YE3PmcqLBJ8lmNX7FEmlxg/ADf6lGb8+u6Q/UZvSCMvOPDR7
	Onct068evwa1eV8TBZ2kgU+XvHpJzJIxV72zDBEBC6yhKcE0ZQ8R3RM8hjlbZvdUYvZgUPKZA0yI8
	cfDSnyX6xP/7PD5x0Th2h3E2Woj88QjARddSrNNM06+QZPiDxW5gGbGm8smAMHM4+61v2cVvRjPwH
	pchxUqbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwjO7-0004tg-Cm; Sat, 18 Jul 2020 09:44:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwjO2-0004sV-Mn; Sat, 18 Jul 2020 09:44:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f18so20686216wml.3;
 Sat, 18 Jul 2020 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=GTjGxonLjkWGrMuLbbJvKhXcTeSeWvXJqUELgSwAm3OIwyFFfCMC/UyPFzebhhnUn0
 IboBUh0Rqf1XqDDnCLZtrj6lxn1veK0X5ks95qXwH2KjgmlGoJoSwqbgITA5+a636cma
 v3GO6xYfcbgr5cMdh9/vtDtgNj2nchoao28sNBLkhjh9KxoiH4qkW8Dc+KrWngqyjbge
 j76qKpZdBtcQyVGZCrpDuUDZkt4/kr3Lx8b0Bg+coweAUOao7E8q1F6EnytYK1A+7SjN
 XZdgEAu0+rUElcQeGli2ySDP6BHm1Ifoi8IbVBUlGmyxp1or5pCVjb62xIKftAncg0hA
 EcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=TFi2rpDb8e6PH4zcRcSyQKugdZ8nYT+MVlBm88zB5JW2SO8zWL5zRkJj19i4mJJm/K
 EvdCuB1LBrzYtZVrycVYFigil6ntTZTnKFCS5ojB4pyO97X7fg/Oz0NHQ+zBLAZIluEq
 lp/iVA4TiEwtGV60061DmPa1KcuJLM2LRoW50pUqGFPwG2TDgugMks+naDZgON7nDP3G
 IKXKQALhQYArPRbWy4s4B5Xrn+fkEn4mX3Q2PqIH3CXhVuBvgdpAh8azpG4lR7LrUVkg
 VwhS6pIQzZjA6yMN5Kq0r+fEKzhRwN1+8/UZ0BpLZn1QW8/ecWpc3tNMfRFMIwLU+3ml
 qyvA==
X-Gm-Message-State: AOAM533N022zAQ951IzhJvPMmFdQKl+TxqYWSzXFJhiqE8PClRoOsFcW
 MV3/hqh4s2I7l9v2sX+fZ0c=
X-Google-Smtp-Source: ABdhPJxGFHDqfM/xtoygZRnkiL6JT1wqGkfnbCWi4IOx7FgEddgf0xEIgvpiJ7+QBPUxTJI4o4DxhA==
X-Received: by 2002:a05:600c:313:: with SMTP id
 q19mr13662362wmd.9.1595065445206; 
 Sat, 18 Jul 2020 02:44:05 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id v11sm16764554wmb.3.2020.07.18.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 02:44:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for the WeTek
 Core 2
Date: Sat, 18 Jul 2020 09:43:59 +0000
Message-Id: <20200718094400.1185-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_054406_781508_DE9D2D9A 
X-CRM114-Status: GOOD (  11.83  )
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
