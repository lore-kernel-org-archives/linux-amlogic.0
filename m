Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EA3C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE736198E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE736198E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgHqINXB7WLxsC2rKDKOw2+6zFwGZLR1hlmG79fF5sQ=; b=XsHSnI5sdLp4OsnToN0Wq5G2A0
	66Uq1XKJs9NtnSZEidiTpiWcCacJCdK9dAV50o76jX6HyjwdlTMqXNfl3HXpZ9Kcqczb/bwi6G/r/
	241Qi3Y3xq3p8UVlQ5sqwjZ2h9bNxh5XHIOKaE97UjCltl1SuCtTdJViI10TOZy3WoYMkyIyDO7dp
	qMfZD3jhmcmNCRJFyF8nviDP7w5biP17/ioqcz/vF8HFY36uN1SGHll9nw6lJvZN0rIAGp4alZVAL
	hsG5O+im+/pcqZmS+KD9zM5vgSXlqdnP532QR7r0MZiNsh8h+sTM/T5UtxKWQpcTac5ruzhu5/wvr
	ocSORfbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR17X-001snE-2T; Mon, 29 Mar 2021 23:16:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuVl-000knQ-69; Mon, 29 Mar 2021 16:13:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso8812332wmq.1; 
 Mon, 29 Mar 2021 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wZUjAxwgBomEWDOBGCx7CFg3YXNAPChJPs3ok09Sv8I=;
 b=dGlhqkUAbofYPup/KNOVG6vo988vw+dJfr8f1F31H2UB7hmOatj7nEMWs1MYRtR1/W
 5pLk9Fa3cu89LVVswDh3OmHCEtuTd7U9YnGBv8GTQlHoBmqcCRhT2AIeZxOwRxcn2dCP
 LaHRhqlNj9Voixnc0H+f9TYIQqx0psi6BSjj/KbigaS2FQG7+LPFgic8Y4rIqH+W9mWf
 veItZTUKn91UnUMJyReNxIJtw4+hT/xk9/EG+czABBQhyg7hE7igNfNALl5UWhsxieAM
 VINNBKUxgLZoQXPytnwMjdmQqNi+L+5/jHm4+/wBamnpTm6bsn+qRyB5C++KwctSeWpD
 2IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wZUjAxwgBomEWDOBGCx7CFg3YXNAPChJPs3ok09Sv8I=;
 b=ArGKrZF9q4zvSnr/vBrjyDbRJeA5qxc6at7LmKo7x2B2/D6OTzAU4oWSrGKWBvUHiR
 90vLXOJOgfpZR4OMleln+YDZbgGSrqSrc/SKurZ9R4xWNjE1TEKqqOtwadmBrI35Szw7
 MWp69lTq+MZ4UR2EBoqGw647iOCSAHSWA43zkUJy5DUAQQzFoT2N27wNKQXHSvNXT5ft
 JQHD49ZHSOJmJg1udSa8I8eZAqrp6P+KUkL/Lc+GfTtvpFJ6Y3m2VyBFuUFLtl4KyFDh
 0MCSFikYy/GACICgc8l2wx2ikb5NMsd3x9CgkyJUKzLHgPo5rSeWt2kv05POdBnGrtd+
 UgTQ==
X-Gm-Message-State: AOAM532OlNceYCmeEVl7zdPAN7m3u63Lq5ssXTDju+/O7qJWxJhBl16L
 8YOLQ7J3m7HFG8IY6FOfQjA=
X-Google-Smtp-Source: ABdhPJzrHTwy3Nqnk+UDvJ7lpqMzVeSoBd13Q/dafjA/wrf27/w8YNOZfulDXqbsIVc67HnSr/rwsg==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr24994430wmg.26.1617034384884; 
 Mon, 29 Mar 2021 09:13:04 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a6sm28570964wmm.0.2021.03.29.09.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 09:13:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Hyeonki Hong <hhk7734@gmail.com>
Subject: [PATCH 2/3] arm64: dts: meson: add saradc node to ODROID N2/N2+
Date: Mon, 29 Mar 2021 16:12:55 +0000
Message-Id: <20210329161256.31171-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329161256.31171-1-christianshewitt@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_171322_815304_0C914766 
X-CRM114-Status: GOOD (  11.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Hyeonki Hong <hhk7734@gmail.com>

Add the meson saradc node to the ODROID N2/N2+ common dtsi.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 2f8d574c30c0..139c12cf9f66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -508,6 +508,10 @@
 	status = "okay";
 };
 
+&saradc {
+	status = "okay";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
