Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6615C433E9
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4D264EE1
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4D264EE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c044tbNyUqopH7ciAsIYOLbfKoXY78VNfoeppe872Hc=; b=hmOGZfk/vwNWFqyL9+PzgLKi/y
	h0qjWeZPA3tnfh5zV6+d2w33J/oa4YfAA3vCFWw9vyVXHlxcWVjdH9kypYkV1UnJ2aiHbPbp0i+JO
	RkjIxKaOyllw3n8s1wby/1V3ail7qNTQCroCGyBj6UCDPsQSG6kAFLC2q2BIhOCV4mdVN7qnp4cxj
	/MDW4MyJkP6mHEefM+3cqT+2uiSuP/B3AqOMVZ6+2J50ApFYqCmptJcAf3TAPKzJu/3FEgdvfYJS4
	F8/jSPuf8kt0dmX4bJuM7wlE5Kwzg1e3Q3QFLTDlMPV2j5aEXsqHL/192j0Jc8SG5di5j0Nf+ZrSe
	DkN+1rcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6l9I-0004LU-Dm; Tue, 02 Feb 2021 02:10:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6l9D-0004K5-DT; Tue, 02 Feb 2021 02:10:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id g10so18744500wrx.1;
 Mon, 01 Feb 2021 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HtKg2mQ7AbqX2dbubhJvxGnJfUMSZejUtnrYl0NAkaM=;
 b=S2RmV+iHo6KF/P4gwUPKuZ82XVQvbKK940YWK3r8RIH8Hqj/JNMwmJHeJn2F8r9GVm
 i0jmCMTjE0AQxpPtVB6QnlEprXd/lEC2PfzS27qc2h5jsO3l6rRqO+6kNMumGd4E6UBU
 H+dxPhaXyq4x3+MYY//1gfuOCpwqLAI9SwSLuieA0R7Ju6PNGn5sxBuPI3ywUrxQJ++d
 Dqj5lwdcMSBiDo0CJDBtxeRQZXRNyBKwYwRPzvLSVNOBtFXLxDdHTTcVxX6+yBZ+gISI
 d3mEDTQnZqJ280DQtGL+aW+oMoh9+QkSAb64dyn6ngrrU6xY5aRqgWgZaR7crs/fapL4
 6ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HtKg2mQ7AbqX2dbubhJvxGnJfUMSZejUtnrYl0NAkaM=;
 b=t6c5/hpqTd/pKwhmaMnbJP86HfJZNjyvDQT/QpCkGP5UP+V5UZf7hEcRILMH9cbl+g
 xb5WLHJFrA+a9WAT+Pl/76nSHTl+R9yGqvtW+QZ3Wcg9rJ+j1RBdSALC3lBIEXWEJbnP
 J9zwghjGbQ+jzqGJsFnMFi3kmb49ui1gZb6MckCfPzBFvDNDtKTJac2iz3kx+EqjJhqV
 +JT6FczG74qkkdiwFvkLBWyqJ0DsN1du2tywtT93BWKWnWcB/ZeBJCfJ1cTQBITby7nI
 b5mM0lkoaO2mNuN6xLjpDOtV9TyVz4xtMNc5Z39qSGQgcBKUN9DbxfZ/At/NCT6pt067
 w3bQ==
X-Gm-Message-State: AOAM531Lhxa5zEipD/CtH+Ny2mQ1tpO7MWN0Rm3SgRb3RduNBpXkorkk
 VWs/bpHaz9NqC0F3cH+SgU8=
X-Google-Smtp-Source: ABdhPJwDOKB0Id5giF23/zSBauSGZO3ItHfy03V46n6Tq8lk7NMbSQm9x6d1GxNbCypfgGZofrIg3g==
X-Received: by 2002:adf:e807:: with SMTP id o7mr21867281wrm.308.1612231830277; 
 Mon, 01 Feb 2021 18:10:30 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u14sm990570wmq.45.2021.02.01.18.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 18:10:29 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] arm64: dts: meson: sort Amlogic dtb Makefile
Date: Tue,  2 Feb 2021 02:10:18 +0000
Message-Id: <20210202021021.11068-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202021021.11068-1-christianshewitt@gmail.com>
References: <20210202021021.11068-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_211031_479263_31EAC81B 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the Makefile before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index dce41cd3f347..f3c8a85fe987 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -45,7 +45,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
