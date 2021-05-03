Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408E9C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:00:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E6F611CB
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E6F611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1s84mxOoMUDPnDeRKXWVn6/eX06OuNc9323oRL3xdeY=; b=O8ZgUifuF2ETAI9h75037xqO6
	MQYdgFzckyreVzZNbUDSmevCDn06E2fzCpVY2bYBJKyEqoLjmxKCXTaYrwllCQgcvLsWdfhAzVT4r
	SsMEg0lQaAo8eYhKjQbhXur64p5j3uAZpkWWOKqAF+zbb9ehGv8MQXKuR8UvuF2KE4mR0UtomLbwE
	vnES8GCsU6SJAlcPDnhnmeXFBWGjCnyUi3gIY4NoNqJUlTrql1z8RSVsiQPrM+a9ILRgK40Xi4pE+
	tWKJYAXio04rZXz91RyyV62oRXyZTPLk6q+Umu7AhQ0E9OOcJqEDa/nqUb2Pe2+1BI3tk2e84Zrtq
	Lz8C/c1zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda3i-00E9QS-CM; Mon, 03 May 2021 15:00:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda1w-00E90c-K3; Mon, 03 May 2021 14:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8e82Fw8ZdhiWxmWRJT09dHY82V2CPKcFuKG3LSkUO+s=; b=b1Bjv9E0WHPtDO5biT4vQ5q8xw
 +1lXpL6rkKw9Fu7mrBfizDPYv2aHldvtGDhP2yF5hMqZQiE9cRL2sSK4ZMzbmzqwNAOV8ZsxCOIVM
 AMyR4YI4oPcSZhNfkqSFKW7gMbpDmZDJOVx+yEiY80XUDQ3AW6QagBPnhe/xG6ZmOSmLea8jPoAxP
 UmHTLPKg4G0k+yB7MD27TlblPI5oKXmxX2hN8tRqCfhPwMVQBMdv/wm7KH2d7DsPJK+JLszeEQlGX
 9hY0nfSxnzwGi7nF7Yg8tX9FV1GoLB8q4usxRFiWISErvWZy2kQIiDw61f99+Q/GdSdUSANcaGXDg
 ieqzjMaw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda1u-0039Ia-3B; Mon, 03 May 2021 14:58:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id t4so2184748plc.6;
 Mon, 03 May 2021 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8e82Fw8ZdhiWxmWRJT09dHY82V2CPKcFuKG3LSkUO+s=;
 b=o/s/ipX6lhIS0rkr1BNOrxZHkysLFiZsXMj2JKwLYw5n1HbW5DuV1LytOawGwV7FXC
 TLHg7gI83DM87ny6EZnlxTIfGPogEIgj/0sE98YtARI0s0zD/NjJo4QyonIxN132LVH/
 Sw37NW0HGqPKs93MBoO9ZzE12qujiTSe3S9JtAsAC7GHgH/M2pfypBUEK7zlZUranjW0
 9WBLE4a9vjVx/VGvpgpNLe7ewI6wesroGWal1slHu8ZNPqfYz2u+vjhDZVjizw5SrcBI
 CPrNWzbHVpcvrC1Hk9vWkE99Q3Iblf5yIC2Ulth7wdisqjr5yOFdg9xh6RKqMQyIPgAn
 3OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8e82Fw8ZdhiWxmWRJT09dHY82V2CPKcFuKG3LSkUO+s=;
 b=D51c4DBq/++S+zUo2tXgVNOsMhW6sle8SPZkQ6pQWnruB31bmLkuHhS/ztWGyeprS6
 C4+RATEiUJHqKcDaH6WN8AYNo7PXzOu8tXtk2bVA6O7KvHbYzte8bS2H046a9CQP56m4
 Uh2a0b+d4dImhcxa4heoRYjRgSf/SkspgpizWoBN0/LrfiGf80elZpFh/7fqvkPry3/c
 GdUANrVF2lYYDlhIGk0vmJ5zamSHZ4vJerhPplbxy0A9hiD/hGneISjGFBlPOzERdh92
 m/2KhOiyMYIgncUQHHrWzkjSvNCXIR/50cFuW/3Lg1nhLkQqAzU578uznlzqa97yayzT
 0m0w==
X-Gm-Message-State: AOAM533L+jQIhW0OhmI58rLhgy34t4/Fx062BzTis3NNxWaCnM3mENKZ
 S695H3do4cFy/hDhJBXGbD4=
X-Google-Smtp-Source: ABdhPJwYew63gOdTQpo4q/72kTglfh0y15sgwTWm2nNlWUMZpJk2lj3OWE7N/OxC8HCNU3f2lggysg==
X-Received: by 2002:a17:90a:a2e:: with SMTP id
 o43mr30532107pjo.163.1620053917551; 
 Mon, 03 May 2021 07:58:37 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:58:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 3/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson g12a SoCs
Date: Mon,  3 May 2021 14:54:36 +0000
Message-Id: <20210503145503.1477-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075838_159834_15F7E646 
X-CRM114-Status: GOOD (  12.78  )
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

As per the S922X datasheet add hdmi power domain
controller for Meson g12a and g12b SoCs.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c          | 5 +++++
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 2e07ddf2d6a6..ec402c4ab931 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -154,6 +154,10 @@ static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
+static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_hdmi[] = {
+	{ HHI_MEM_PD_REG0, GENMASK(15, 8) },
+};
+
 static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_audio[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
 };
@@ -256,6 +260,7 @@ static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 11, 2),
+	[PWRC_G12A_HDMI_ID] = MEM_PD("HDMI", meson_pwrc_mem_hdmi),
 	[PWRC_G12A_AUDIO_ID] = MEM_PD("AUDIO", meson_pwrc_mem_audio),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index 1cf20e4e412e..900924d17798 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -10,5 +10,6 @@
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
 #define PWRC_G12A_AUDIO_ID		2
+#define PWRC_G12A_HDMI_ID		3
 
 #endif
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
