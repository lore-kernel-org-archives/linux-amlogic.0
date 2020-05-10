Return-Path: <SRS0=YblX=6Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20AAC38A2A
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F31C2080C
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dARKPsn4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdRmvjap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F31C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nNV7KFG6OzbUkjjCtchC3/Do7j2OhZ9pa82RwN4c4W4=; b=dARKPsn4evuAZkSvoBN189/+d5
	sZphURIgOK2MX+uWxxfnFXbt/xUBr1Tv7fEDnNr9UpNNCYadG2/SjZhiV2J+VjMEKsBJJhjCF5U4O
	CcPU0b2H1PM62WZ+/CPHn4MrXhqF/SYuGqbtnc3u3XlJTC+ZIHCzpFj6VEwhQFu4rGXLkDI4r+4+/
	zksp47K7Fy6+Xzx5qAayuEA52zRuNyFMXAeewcZvK1nUSowLvDxF/tUwkcFUAWHABWZQCULQ+ANoI
	SCGIlDitdmmbrtnIZRGcE9MW/ub/6kTkVowuaUSWYo6U8zrJXCy+OBpIp0d74tlcHr9RFoK1V22ii
	08AuEUfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXlHp-00049h-U5; Sun, 10 May 2020 12:42:29 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXlH4-0003Mq-1K; Sun, 10 May 2020 12:41:43 +0000
Received: by mail-lf1-x144.google.com with SMTP id s9so5103549lfp.1;
 Sun, 10 May 2020 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BSj9Ea7QdyKMkOvyobV8j2yH2DQNcdVYE7WHmzdD778=;
 b=cdRmvjap2+BTgGU7Sj187JE3I7MmS1QJSnLN1+JfzYQ3IVhSpej/hlNFcmPSIT6se/
 lo7XaR5cMPHY+NkGNNffiu/E2zK3EeeRU04uXDMK24CXr6sFpFZ084ivo8WMnsd3UrW2
 RcqUvVvQGbaRcgMvZraKapkkNd1wYCZGIDP8jE2ZBl2wr+WWCA7N8Y84HAkFBFbZ2cyN
 gkUjSPABClSWcq1xd0KPWM1aekC2cIK9wSMJIZ42V5e5OooU8lK+bKeStwT0Xqf928MT
 C2Y+JB/XigsDCbMnVndJwW6DGoqEqKSw8gfEgoC4Ib7HgvXeAY7kugbe7Q+Tcm2fiFfL
 i35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BSj9Ea7QdyKMkOvyobV8j2yH2DQNcdVYE7WHmzdD778=;
 b=dQ9ewcXfJ8d/vdYpwg88E2qxXuI+klmVXlGjldsHRNoJ0ZHL2kXa05xBxPu8rub0/8
 QRr3Out9pezLebwYtmHlK8ngyE0T/M/SJlWkMBULTAPehdgjgLOxdnpR4RAd+26OPujr
 gKHIgBJ2gNRLGnYzUDzdCNXaTAAZpyIaF89ILvvjezgXZm9Rj6XpbGzsiueQa1ROLm3j
 E/kPE8wopybwyHjjoR60XMHfA2oh1ngZy1Ii8NOG+HfxioFGeqAE/Wy3RJDVEuL2EIEo
 7U7uHe06uQ2W32preehxK9NvkkYRUxasEJS+VnOctt2Z4H5a7cYWCnNrnBnpEBlNihO5
 I63Q==
X-Gm-Message-State: AOAM530DuV4DkMfix/thuVb1XJoemOoK65lWb33Pv1YaNXmO0ueYSn5Q
 OVV7sL35mIE2nfZzbRPW9gQ=
X-Google-Smtp-Source: ABdhPJzEgzJo/0DS9T6pFms2DFabK7ZYHD5s9Pv14F3Jay1UFPkwzzBqziTn/VF5sxroDedY+6jH4Q==
X-Received: by 2002:a19:2389:: with SMTP id j131mr8016624lfj.116.1589114500273; 
 Sun, 10 May 2020 05:41:40 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m11sm7136611lfo.55.2020.05.10.05.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 05:41:39 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/3] dt-bindings: arm: amlogic: add support for the
 Smartlabs SML-5442TW
Date: Sun, 10 May 2020 12:41:28 +0000
Message-Id: <20200510124129.31575-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
References: <20200510124129.31575-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_054142_079667_9CD687AB 
X-CRM114-Status: GOOD (  10.89  )
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
index f74aba48cec1..c0c0f6619fb3 100644
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
