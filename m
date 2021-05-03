Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850BEC43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:03:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A74E6121D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A74E6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1E4PNPAkXWQqvwmWPeFpGpiWM7MKepujP6CF363ychg=; b=Uo5Qqu+XMKCpAHcFOdYQwXRbr
	NWCeV43RnvC15b+yf97EU2H1E82Hyk5QYb6PpTg7LZC30/45mo6vUlDdWaPNeBwQrGVHEtnM0SKtA
	mtc8IDJY92kgkFqpIlYYevf76Y39+N8q4N7l7aFJvbKg3aqVHeFSIbQy+VYxqfo7C6Fn5u2HtO+3/
	dUokXlokQCqAZd9w6DTx7ZVE8HSyNy3+yFwLXKgnySsSEbGlhblbe3+EBcCfMD+SzaJ+/LDwOgJyL
	lRA2JslGDcwzL0iyDe81ofFScttu7VgELqR26AsEwL3Tz649qP6zB3EPlj+GNtFyAiZ9OYTvZL0Oq
	lPpFRMxlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda6g-00EAK4-BD; Mon, 03 May 2021 15:03:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda3z-00E9V4-T3; Mon, 03 May 2021 15:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Me0/8wMFfbBiWllaQC8QNsKSdHVtD76NnW7CR+YniVo=; b=D3mbS5Sx2e5qZEiQw+SM96Kin5
 15dR8PDyQ/X2AcfwpUzotJAuh2qSANQ4DCYXetUgg00eIUZh3Xjf4MD24ef26xyYmld1zZRdbNVIb
 n1u2oUM7/U4RTDEugBl2UZaFMip7L15aSC6FOfS5fy0LluXwuqC4zwkUu+1DFUi75p/ULuc6SGl4b
 VjKhTZ9nRyMORVYQN54buchT4qXeW4Tlkt4eOWrVHUmHJmMjtHQoih4SPVw7MGwQ13thBwhBKZUWC
 WrYcfqTTlKyHY1wCHZQvNdjUbsrAQtD9FEip6cujcrxMvCoHr81kP2N+vmP0oTI4nsOAD7UrryxDc
 nVDXcMBA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda3x-0039R5-Cn; Mon, 03 May 2021 15:00:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso3515764pjn.3; 
 Mon, 03 May 2021 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Me0/8wMFfbBiWllaQC8QNsKSdHVtD76NnW7CR+YniVo=;
 b=VGdvX2Weop7QRB/TM9J7p48OMZbgZdlrwDC27bf+srOMUSE4I/Rt1DMgj1wuVHFKnM
 u0PkGoxIuFs/NpnF7IPGniu5QD5nLbPe/mdLy1f4Skr4I82gy7jcM89/SkCCNCL3Ocxt
 DfUowqM0RfFlc2D0U0YE6HgViejRPoyLSGg0A95zgCWhHqENUAcfnb32F/1yqSH6tzKQ
 1kN8YsornF4InndpeZ2VL6w0sKz0miu2pS6AkQ9HcQ3VaktrqodvQTJi30vxF44roGle
 IFtVBTX8t1nYw2+RlxgeNI7DVRCV+khsMFmYGpB/FXeTJAzgobny4dfrgrYYeTog5Gpp
 pO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Me0/8wMFfbBiWllaQC8QNsKSdHVtD76NnW7CR+YniVo=;
 b=HkJm4S1EE2ogzvFOJAue2z5NVAo+LacJhSh2GQzKAuIimSWZwHvE5SKS64NtBiXzwg
 UartETx6ATcMbPpgV3X44PgrxW5TSNP2QKsyBBAIEj8k3d7wanjtRPfOxIJUlkBr9oDH
 0PGKgOQ3KWz/AJz8RDFM8paYwvLNjF7kgtTUXWoShU/Y2P0ucXcsYCZMCe6kanYS2O/W
 1s7Ea49kQYeCcnpL23vLYWQJHhUwervml6dWdU+p/TflimQi7y4y67WC3yKR6QOh9qZF
 TGJaRf3nYkeue65LZApSrVYqV/7mu//UoWgUFofQYoDAKr/ZOjE32eE746i2NJg+1DZE
 XbfA==
X-Gm-Message-State: AOAM533gGzpqd53lLtnD6kC+uKJ2PetJvYSt0qVAHZDWtDO/NWtufbN4
 tAmrvZR0ejtSgwCabzeLlJg=
X-Google-Smtp-Source: ABdhPJwyjIoeQq8BCEUBxiuksyZ7uSber5kmEZBqOvk8KpjIdFU6rrjD5629sb9k++p1tUZigcwv+w==
X-Received: by 2002:a17:902:7444:b029:ed:5334:40b6 with SMTP id
 e4-20020a1709027444b02900ed533440b6mr20583031plt.35.1620054044230; 
 Mon, 03 May 2021 08:00:44 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:00:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 8/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson gxbb and gxl SoCs
Date: Mon,  3 May 2021 14:54:41 +0000
Message-Id: <20210503145503.1477-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_080045_451302_F677572D 
X-CRM114-Status: GOOD (  12.15  )
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

As per the S905X datasheet add hdmi power domain
controller for Meson gxbb and gxl SoCs.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c          | 1 +
 include/dt-bindings/power/meson-gxbb-power.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 062b2488f932..23a748ee9e68 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -268,6 +268,7 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
 	[PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 12, 2),
+	[PWRC_GXBB_HDMI_ID] = MEM_PD("HDMI", meson_pwrc_mem_hdmi),
 	[PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
diff --git a/include/dt-bindings/power/meson-gxbb-power.h b/include/dt-bindings/power/meson-gxbb-power.h
index 1262dac696c0..eafa92eb836e 100644
--- a/include/dt-bindings/power/meson-gxbb-power.h
+++ b/include/dt-bindings/power/meson-gxbb-power.h
@@ -9,5 +9,6 @@
 
 #define PWRC_GXBB_VPU_ID		0
 #define PWRC_GXBB_ETHERNET_MEM_ID	1
+#define PWRC_GXBB_HDMI_ID		2
 
 #endif
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
