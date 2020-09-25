Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A591EC4346E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6C32176B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5yc4V1U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wh8JK4jE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6C32176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjN995bGsSM03AtPoJBEk5JYKXFGuYl4iGOGFJ/x06g=; b=H5yc4V1UjitHKLBozs5W3Bi8e
	x9x5LhgHQlAVXvhDniWoVC78dB6IdnI6VoSy4AX2fYE2fY/m7nv6NhzDBH/4KFJUBRtixzvNDUM8m
	yzqkDwSW2lgeBoNRr3XH2x3k2oVRdzePcwQYp3a1Szv6oUji9vpQfVYW5/ftT7TQLkgLHQzDF2Evd
	jI6eoJ4zcMy+RloXoO0nQq6SRTpimrPCvacHCX8p+sudCYO9QDMulApwbnv+orIycg4UnJY6EGEQw
	MjGSr2voepxK+8/D4Ocq6+ZHwzZIxd4tPYdsNwgmp3ZXWYEGEKNH/uZT9ZUJ+Pyirv4EPconz5/Tn
	Y6F0FPsIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeSl-0000g0-Jw; Fri, 25 Sep 2020 03:31:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeS8-0000OV-LG; Fri, 25 Sep 2020 03:31:21 +0000
Received: by mail-pg1-x543.google.com with SMTP id m34so1358591pgl.9;
 Thu, 24 Sep 2020 20:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJuOLx72+92KqltwYqwVNl56PLsPiVCcbfEjspSLtf0=;
 b=Wh8JK4jEt5+7/CflyAiSgucZToaMllRql8LWZzAJDngHaMT/5hRNWMimrTE43KPke0
 yLrRa/FAMaNwchVbNQQVxBAfltMWeRmzwOw59XSyx9iDuJi+J6t6ZqJZQBv/A7Whx5ou
 5m7exthlnPdaOgoCIoIPQf2R4futG3/YV2mglKt+hqahvbX9lTyobKLCEl4r7ehfutoB
 04SJ7flauyEvA9bLNc81MmTdUMWZtC3UDDCmIkJOMd//R+Fc3BZwKclnc7DTYo5FuLFv
 2JfDu6TRKVggc9URGAzb9ERNKr3FmgLqnfoIRM6xWNRDUGBacHrVZOT0TtX08mRMYlE1
 O1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJuOLx72+92KqltwYqwVNl56PLsPiVCcbfEjspSLtf0=;
 b=h6eig4PtzEe0y3ZGEsgUreGs9082PN89CC9kfnNKt+p+wkTfdkqaOZXvaZ1XIriqk7
 LVqBIKScLMH5gidhhWdrul4BY2XnE1alJpP5GTts1R9ImzTsJbo2SdzDEHlGA2IsbIxB
 ImRchww6P1DgwvO6tm9/lxewNZuuM5GsWwOoV0CILYvpniyY941qQasqbykusXoYz0HG
 9/j5/6yF6nz5XqFBGKNltswDJAANvxVI4IYqvl9H5xC8jQh5DP9N7xot2jc7VsHHopTk
 /cyIKJHuYLLvvsO95kpI1Z7swjYwbywjrje41AS2nyMnet6WYW1iVYKaWLpZd4HPuqOx
 eBqQ==
X-Gm-Message-State: AOAM5307f89Qt6JMh4asTtm7CHMOrXrwLjqcIzFG3rRslxX45P+9/V5H
 kpNnTw1xbTVqqm/V6Dvuk9I=
X-Google-Smtp-Source: ABdhPJzbZJkwC+CtxMZqzP7KJm/AhFiLRJVm0zlxBBf6M3KWhAOZ2d+1frFvEwm5vseS5ug2NLDIvQ==
X-Received: by 2002:aa7:9986:0:b029:142:2501:35d0 with SMTP id
 k6-20020aa799860000b0290142250135d0mr2184228pfh.48.1601004678660; 
 Thu, 24 Sep 2020 20:31:18 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:18 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 6/8] arm64: dts: meson: disable vrtc for VIM3L boards
 meson-khadas-vim3
Date: Fri, 25 Sep 2020 11:30:15 +0800
Message-Id: <20200925033017.1790973-7-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233120_756511_71BAEC7C 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

vrtc not used for meson-khadas-vim3

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 3111bf35c0f..81bb88a76d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -284,6 +284,10 @@ &pwm_ef {
         pinctrl-names = "default";
 };
 
+&vrtc {
+	status = "disabled";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddao_1v8>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
