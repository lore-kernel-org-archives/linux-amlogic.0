Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD41C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 04:40:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFD920737
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 04:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9bJQUxf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRo3nEHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFD920737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2ppPsksxHt0Jt+sNb+z1uJx3OAEf4GQy9lt8Ghs+y/g=; b=q9bJQUxfc1OVG2RSHVLPkV1Dxx
	4S5XKO3SP2Q4q4s0y4yKKhF4EHIjUkTQEWg9h3yzAX/qcQNuTaS/GiktOGH6yljBIrGKTb4Gq3Ujg
	AaNCAs9OHhqabfwlzSrR+TaTYZwLOk8Z/1N9QaoK2nDGo23Ol+Nk8xEzF2nYNGMP3UKvXxm67vCMm
	81HgW3ogADZJpIwxoCtxjlR5/aRvCdTVzI0mvNschQZsC4D5Yyjpe+Jt/CNQNioYsuo9DSWF+tcq2
	IQ4DMsnO+wPryZIMwV96zo6Y+XsrLY3PRKe6rJXJ7BVunk/XZBQQT6xYWAGXsghgvvMXuilih9CEb
	l2UHGrkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCFdh-0005mo-Op; Thu, 12 Mar 2020 04:40:09 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCFcf-0003lu-0U; Thu, 12 Mar 2020 04:39:06 +0000
Received: by mail-lj1-x244.google.com with SMTP id w1so4849718ljh.5;
 Wed, 11 Mar 2020 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=09qgIR6K1m5xPP1D1m5YyMuzVQzcRYUfNGJ9cyL/AI0=;
 b=WRo3nEHEG77l3hYpIWxPEfMGMwI9N1w0FhLaz87sLOR8tUhT/QvdNCy6kdKfS71Tgx
 DXv5k20N9MtocO6d1uleZYGrrt1+ucK30YXOJ37/Vf9trANUd5vgtRgLg3m3npZvNVuZ
 IYLEvc4t32Jm10P9ASCn7crxTYzgye862PgxD3BaxtpKz3jZNUWqhz9Kp7DmRUF+RNx8
 CWDUoeVJpoDAmKrFhIa+PZpFvf3ylinML+No+cAUygylzHhiRyCQFIeLU1m7RjXt05VC
 dBeatRz4Bos4MCVKL7I3MXoc2P6ztlv024/oIz4c2ecXnmkBlB9wubX+ZBii9Lj1h5OI
 Uv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=09qgIR6K1m5xPP1D1m5YyMuzVQzcRYUfNGJ9cyL/AI0=;
 b=eldGONDsbq3SZXV460Sx4iD0JhpCIpH4mTbeqFn2DfT7CjgsZb1NpN0HiAHCGyhV6h
 pcoZ+zlGW6P0kB7YBdbN1KVEMHCJtEjIC5YyrBU/+Qbm3beDxoUx0tyXuvN1pPIUgjFa
 LrOBy6cCSJ/hq5XuDnyaA03aD++Zd/rFlA54Zs/RV+SNyhkTxcREz7m6ncTQOJLKPery
 4cbufmWlT43oIhrZBOmMGnteUOpQJeHoyi7uce4YJbDbCtbFTuNVv3gA34VtEElP8gdC
 35YXC8uKcxDO9M4Rlpz+reN5TGHBXTn40Rd7gSOjsYZmRZHb88EIpO+skz4gBIniFp4y
 OhPQ==
X-Gm-Message-State: ANhLgQ3aZYizIrUKWdkrVVDib19/OZtqgWGiNV5bKZGw3MVxqTpl8el0
 Ak8oKyhy7gShK2NXggqdIbA=
X-Google-Smtp-Source: ADFU+vtWPwMvPxuuiPxqKAGjDzCxG3AYSqn41J8E1bbRtfPfeYr9/eq9Mt6OagpHP0ULDiLczBlENA==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr3887908ljk.140.1583987943214; 
 Wed, 11 Mar 2020 21:39:03 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u2sm8872866lfu.3.2020.03.11.21.39.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Mar 2020 21:39:02 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] dt-bindings: arm: amlogic: add support for the
 SmartLabs SML-5442TW
Date: Thu, 12 Mar 2020 08:38:05 +0400
Message-Id: <1583987886-6288-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com>
References: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_213905_054251_29FB84F9 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SML-5442TW is an STB for O2 Czech IPTV/VOD and DVB-T/T2 based on the
Amlogic P231 reference design using the S905D chipset. Specs:

2GB DDR3 RAM
8GB eMMC storage
10/100 Base-T Ethernet
802.11 a/b/g/n/ac + BT 4.1 HS sdio wireless module (QCA9377)
2x single colour and 1x dual colour LEDs on the front panel
1x reset button on the front panel
HDMI 2.0 (4k@60p) video
Composite video + 2-channel audio output on 3.5mm jack
S/PDIF audio output
Single DVB-T/T2 tuner (AVL6762/MxL608)
2x USB 2.0 ports
1x micro SD card slot
UART pins (internal)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba4..c0c0f66 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -107,6 +107,7 @@ properties:
               - amlogic,p231
               - libretech,aml-s905d-pc
               - phicomm,n1
+              - smartlabs,sml5442tw
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
