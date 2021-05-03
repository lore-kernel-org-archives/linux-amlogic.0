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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE28C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 14:59:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032A761166
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 14:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032A761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c3dXklFeF0BCbAPcetmP79DMBcuv85zSzMkSWH72P54=; b=eOhRoj6uMTusMdZnPl7Gjis/M
	AkpgcEiQ8gBG/K9/RFkmZHtTilG4jokQkQbZPIIJnYD3EiNc2QcD52jOxTYt/66xLHOZsabbEwuhw
	etpDLxAt8OM9YgHk5PHK6ELtZfiP8fALFXyCRr6w6d+u5pTOTV+L9AUiecDAvSu7yL9hECSf0xI13
	zIZyK4tKOKMNlxMvQ0G+YsKuIuLGdiadFnpnUlx5uVIx61rq/Yv0P/HEfZ+ChvzDfWheHjkb3X0IJ
	NOGucq4Qu+VhB6weqWid0+TqNjb+S7m+q6YliJ3cVuSq92K6r8TjiVRoh3Q2PUnN6mFrQf/LT9Fny
	R0OeKhgMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda2M-00E93j-2X; Mon, 03 May 2021 14:59:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda18-00E8or-9O; Mon, 03 May 2021 14:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=a1fdsn/UqipHakxIGXIN7yVeQcOHlVqXqVo8GiLuBOY=; b=wbOFdt8oZTb33N8J08Ub4GdcIi
 BoP+dENMLL70FYxcE9992T/lJW+WagKIMewNStplMFMxiN4wSBBTxWJgISgiSMPFpRfubzUsDqgkz
 D/hd92BFGspaLqeRoF0LoLQ7U155SFm/5eHwmy4JDq8Le8X5nDP5wv0PLjNt8cRbj471COrFg+Aek
 Gey1SxEYbjVHemn/ubuICMLvjkLdvkcJJ7LnarHMdgV44ldvOG5QuEx5q1Qr345/Y8moQX5awxmxo
 hcw/f06BJ4rZm/6zDNhOxLbK7MAi4cYAwzBXgLhBG7/B8LENZb5Tkuf+Zd2WWMj+mexlbbeJSol0i
 5sRUxK2g==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda15-0039Fi-QC; Mon, 03 May 2021 14:57:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y30so3811447pgl.7;
 Mon, 03 May 2021 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a1fdsn/UqipHakxIGXIN7yVeQcOHlVqXqVo8GiLuBOY=;
 b=sK9V6pUTJjDj8PitUOzz8v0oR3NrpgGdQSiWY+mIZkQHOd4JDGv2mlbSzWzfQEGXkv
 NvX0haqQB11zldQr1PH+nnlWGCQ1hWVPe3zWNq3SVmAX75l7pZNAQnt/zCRnNqcGCBvx
 SKMC2ny41vH1kHP7dAQGKLoc8uSGmrP8Vb8pRDazdxi4yhPNMOQSA6S/rw7J1kGdiJdk
 UKeYNGcr3mQBdqPqqmc1SGPK0Jri12G3eWjJ/0wSdSbd7BXCDLRjQfNXRzqNhAQoX1BM
 9xfqY7Ygn5luvURPcajJqOs5QeZg3SAIz6Py+RKtSujJmOLyecA8y9Sjqsb2oburd9W5
 133w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a1fdsn/UqipHakxIGXIN7yVeQcOHlVqXqVo8GiLuBOY=;
 b=lFTSW9DkzUhkc+NdanT7s0e6F/+XjLdszbrZjpMZoIJhkt+Jc1zLYD6Bca9SXT1m8R
 dQEN58znbevrjS52n3aaXk2u0avgj9Ho1oSRyJbDgx5rqXyP8kVpj+t9HHlj1qzC/Ypg
 cPcN0QCwoWtf8zbxlukIJtZj4iiUIgzDCvrSfATvUKts7sAn6iaCXjeVemxR4ETEhEzQ
 KH+ABic7xStifdZehzutlRwglx38BZAdc8ym+a5BlsVrF7mUQRl5bWvK3b+oWxjbPr+o
 H4F560xuX1KXIZsWmMZroXD6fD1Ehkz1ZUEQKbfl4oK6MPOF+5N8eM2plPXKs5pnPaBg
 bOQQ==
X-Gm-Message-State: AOAM5316byyyCoerGevhxstPCbkOs8/2nWQtZtUNvgx83r/Zo/2pHTsu
 uxUVXO8gSGWrIOvPkupymS8=
X-Google-Smtp-Source: ABdhPJxWCYkbaDXB7lShNp5YSQak8Y4u1zB4HvVTJzzZ533GuVksci3JwIe/BUdFxMrUyDuTb51u0A==
X-Received: by 2002:a65:4c89:: with SMTP id m9mr18333911pgt.330.1620053866701; 
 Mon, 03 May 2021 07:57:46 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:57:46 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 1/9] soc: amlogic: meson-ee-pwrc: Add audio power domain
 Meson g12a and g12b SoCs
Date: Mon,  3 May 2021 14:54:34 +0000
Message-Id: <20210503145503.1477-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075747_867882_2BCF487B 
X-CRM114-Status: GOOD (  12.92  )
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

As per the S922X datasheet add audio power domain controller for
Meson g12a and g12b SoCs.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c          | 5 +++++
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 50bf5d2b828b..2e07ddf2d6a6 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -154,6 +154,10 @@ static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
+static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_audio[] = {
+	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
+};
+
 static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(3, 2) },
 };
@@ -252,6 +256,7 @@ static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 11, 2),
+	[PWRC_G12A_AUDIO_ID] = MEM_PD("AUDIO", meson_pwrc_mem_audio),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index bb5e67a842de..1cf20e4e412e 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -9,5 +9,6 @@
 
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
+#define PWRC_G12A_AUDIO_ID		2
 
 #endif
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
