Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A1BC3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64CC7246B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C36yzyVv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnNZfvzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64CC7246B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S6DECYz46EHKNPOIJ+JJL3jPyaTHPcvYfw+15W3ttLo=; b=C36yzyVvYBBinAyPGQchLt1NIV
	YnbObXfMrBIzcojiASb1ivrsuF+coECi6YZ/5Sw240Y5gr8b1IM2hMFY6qUAVPNi1PWPBGcKXe9IX
	2gtAgLVSJ9+6bhHC8EGD48l9vJr35m+uqiQZ6U6VWiIHkwOul+ogtjqphivSStetYNGqA2Ola0A4a
	TZla/HkrMnmxQl4Rkhtn3v2uFiSuB0aoPQ7P+7mUYZEqfTH3rqRDPi5398+b/I2TyNvDXRHK7s1YR
	funPpjrGtMavBW7cjIqSkF/3Gn4ez3D8uWIYVJoSbwDkiENC4MJTbk8NZA68EB3VNZQLCV4yD9FTI
	jzDiKc2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j81D6-0001fh-F3; Sat, 29 Feb 2020 12:27:12 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j81CJ-0000uN-4y; Sat, 29 Feb 2020 12:26:24 +0000
Received: by mail-lj1-x241.google.com with SMTP id w1so6399616ljh.5;
 Sat, 29 Feb 2020 04:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PUiZOEdutWx8wS79TjIHPc76XzhI43CZLLGIcRxipWk=;
 b=GnNZfvzVXkoiE9c3hEVHWBQT9Ehj4Tp3VttSt+WwVK9wMm4+PT2IUIgUd0LElbSIWv
 E583Tnzqw3Y+4Bnt1o5CvqUKT4lyKxsYytWJtMOLLymZCrg4dtudO2kbnu1LxAcv96Tb
 hT7HdhaP/7+9OC5D8w1ETZtMOKqbRE5a0S56aifMRzl8nJTU05RWD4uyhRygwtZFDjrK
 CdwXmYWnTyasP+6DBmLiS20H8XXf5O4XXCF+rLBk95PTa23q+GEasNlJayf4B7asbgKH
 sp+J/osdEVYsOKlN550wUu4N0QQgZFjYej0Pk6NB29QMOYYgbAwP7L1wS9XRaB2enc0s
 6ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PUiZOEdutWx8wS79TjIHPc76XzhI43CZLLGIcRxipWk=;
 b=j254BIqNfIQb/cnm0rQ176Hj43P3ozjGs+Ayy/ZRNiyqv+AeUkTv5mVAchbfmxHwg/
 t3WXXhtwxSv5LLamW7mOLvL/G0FAKYeidiHZialSusK5RJLrrlbB26tOCwvXdXSwtiHj
 4nd3fxcHRzlQGsi+n/S2jHye4+m2twyUnl4wdVJ/vxNzihymRZtXZMHR73S0xM4AI0DE
 8b59L5Ez0nrv0JZk/lH2eBGdEK6jAIwVuCRDlLT1uFC4hDzwtDV4r87cbkBCRrmp82Sw
 HF82oJl9K9GRbn/2FBlomMo4O2n0u4xkTGWWVYAlLbUU50o2XIZcI5URmftQDZUtdIiq
 0Djg==
X-Gm-Message-State: ANhLgQ0MGfJmDexKH1I9FQfGb5t+FQytZemag68f603SijVh3v9IOOvM
 K7hPPMMWqH9AO9O2uV9oenY=
X-Google-Smtp-Source: ADFU+vuR0OA5/WFl9EmZWoqAFFlsI+4zgATJyre6DXFjFK21Tf2qFXC61QFEmGrIOKLhkTT/qH1Tzg==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr6134814ljg.45.1582979181557; 
 Sat, 29 Feb 2020 04:26:21 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r10sm8950775ljk.9.2020.02.29.04.26.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 04:26:21 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: arm: amlogic: add support for the
 SmartLabs SML-5442TW
Date: Sat, 29 Feb 2020 16:25:23 +0400
Message-Id: <1582979124-82363-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582979124-82363-1-git-send-email-christianshewitt@gmail.com>
References: <1582979124-82363-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_042623_237154_9EA3855F 
X-CRM114-Status: GOOD (  12.24  )
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
