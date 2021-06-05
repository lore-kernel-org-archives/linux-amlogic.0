Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D41C4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B98B60FE5
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B98B60FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kmi1LtN9pwUR3dp9So04rNwn+5xZlbafi2OMtif2RD0=; b=IvyEMgcZYLQr4M
	OVZyNA4NUHMroTk95sY8gVbSQnGd4y1jQkrQFYyMvlKs77N9FEaKuhz/iwz03YtJ+35GMzibW7FuD
	8feUe8a+872PYuq7Sify1+vJiKj0cT11+wh1LBG8uabnHDqFDV7XumpCQa5vnVcfZBsFJI4370T1N
	Jx2kNEEOknIxbY0v2lc6sJcMBfTyA46t+YwtY98DHswswSQYG14VMvuCn5V3IX4/vv2pqmaoFF/uc
	hL+X+Kk4sWeAIUOZDdKnbTCrRyw4r2lbYQ9r0zzAc/pIkmY9Blc0yEyXvMfLzU8qHdNMJm2Dd1g3L
	gytOT7d4bsjEOXqUd5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMO2-00FsAH-0V; Sat, 05 Jun 2021 02:50:10 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMNn-00Fs69-R1; Sat, 05 Jun 2021 02:49:57 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso285632pjb.5; 
 Fri, 04 Jun 2021 19:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/4gtuT3qIireG3x7h44jTs73Upz/ez6wI7xxmdqwiQ=;
 b=nYrr9Now3unyQ+G1dLje0D9bKc0IFpanOBxrEabtL2X3L9MjDIfi4WskDT/jZkcQkq
 U+uDMdMXSQH67ZHLsBmXST1ThjzUtm2HEYAQhRRBwM4whhX2zrYaEJpHBpjoOZXkrF+6
 dGBihI9b9qrnfVAEgYYg7ACVKsO+dCirdXF1Y5U/42RkO8vKUQAQPIXnMBD7a/vRxk15
 uUdtFp8iZmkpb+vxofN5ma2C4giBiw0d+hOiw2vOrAUnKS22SSCbk6IsTeOgjFJ2b8tJ
 q4fDKFE+1EvVzdnmD+nRGQfxOASL95Vx6KCFWeJGoJy+57edHOfrEQK28+BBUBkgY14J
 62Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/4gtuT3qIireG3x7h44jTs73Upz/ez6wI7xxmdqwiQ=;
 b=Q6RhsrqPYU55IhlmqOcH+CNtIDuUgjHoMpUQfFFbyi0TgKGSE0W1Z0t/MWyVRaL3ND
 PqAEDsKxQgHgJSHclluoeSZYRKz5S4hY925d/ZR7kUjYqZTk7vR9qa6BPw516JO3sP9K
 YwGyz5ECBQuStkagF8WuhMuxdiQbADWEvCsKrYP9J9ShLwEkVI+G6LFe/zwd2HunCOUe
 87a/g6SctNwayLw9Mjsq7covJcU57p2oKOD4ay69+YASORW1f1QNGZwUsqepk9mnJWow
 8sIyJ0O2BcDBhmLHUmdZ117+nsxCNL0v6YF0LCbIZXHl3h2xlwubB3uc0g5FljqXToHX
 OWLg==
X-Gm-Message-State: AOAM5336Uj+XqnBtHIyHmTAY6/y2A3n+mFvOv/nDK8PC4fKJf3csbh1W
 sVA8FHx/wY/wRGc8h3wF6Bg=
X-Google-Smtp-Source: ABdhPJz02rz2AzqT1NXP1wtshu16bOL52pLPKM7O6EjXnal2UNOH3Z2JzZceQES9z7jEDd82CZj3kg==
X-Received: by 2002:a17:902:bb8e:b029:f4:58d1:5170 with SMTP id
 m14-20020a170902bb8eb02900f458d15170mr7252353pls.84.1622861335126; 
 Fri, 04 Jun 2021 19:48:55 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id a9sm3016323pga.43.2021.06.04.19.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:48:54 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim3: add i2c aliases
Date: Sat,  5 Jun 2021 10:48:48 +0800
Message-Id: <20210605024848.409923-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_194955_907713_3DB6355C 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

From: Nick Xie <nick@khadas.com>

Add i2c aliases for Khadas VIM3/3L.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 4686ea7abe0b..b285341f862a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -17,6 +17,11 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c_AO;
 		ethernet0 = &ethmac;
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
