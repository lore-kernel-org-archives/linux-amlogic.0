Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA28C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C41960F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C41960F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nou+6MoAQ0RmBOPmrKTaeaupV19EnPLOYaP+Y+rNu+Q=; b=EiH3TnCOOtTIAg
	1k0Bv4qV5puiTyl1ZNM/Ymh/kL4Plb/HRuCsz3VQ2ZSKzUFHFnV014VFjlmYZnWvMut2MkO3OZ2gH
	VLt/zf0eqHiPTmzk5SsmMZZceokOmEXamLuULaIO31b+YUJ8zLBIrYkUfEX2NXYBOikCYVgZ6sr2o
	BI/4fb88j7IKtSP9/AdUItmsgSiOdugj7JZcQXUQ5j57jj3Ra+UTvepAKofX3aibG8dZj9sD9TdFB
	1SFoQBK7w+qpa2ay9FAOpBu9+onJYAvnnAxcwL4GUJFkM8mH8OPakx0vONTe0A2AmEW4iuC1hi14R
	asT6kqJTaFGe7oNC56Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqY5-00159p-Qx; Tue, 17 Aug 2021 04:18:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqXr-00155A-KW; Tue, 17 Aug 2021 04:17:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id q2so23289787plr.11;
 Mon, 16 Aug 2021 21:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WrPbB+5M+oz2QlTFFMfglVQ9FsfsETR7zFLPhL/v+Rw=;
 b=IzBlfkAauUlpDjMMtmgcL56b6rzVxn983ktKVXmYuw5WA14jv7Sz8mZ/wFC9eFLio6
 0hZIlKatszcNOgM4pGyPfzFaXs0fp34CVSWt2/eK+ZH2faDbDZdHxWQaYcUIW/eOxYVH
 ZWYdGMYMk5lvmGKGk8GVbrNfwKhDNBxGSNGNUQrnGjaEhPkOEQrY33HBAUjKvDFKx7E5
 Fuuw3Fk2yRdwQdKT60q4LRuhnT0OM09vM2/4JxFhA2m6ksE5Tk4V0aOVPdEmb1k7D9A3
 NMAt+3T7xNAA0hmmmJ+VEe+WBt22c4IYYthiV0Xc2t2XIvwKjj/KSlelK4IUkv2eJXEm
 7wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrPbB+5M+oz2QlTFFMfglVQ9FsfsETR7zFLPhL/v+Rw=;
 b=d4391SpKgyczIWh+Q8FyFd2+yg7fSDfgbvhA3/2mSfqWpYVJBTmH89d46MeUV84JCn
 929Og2o8SNp9bKzIytw7Wi9TBFpmnslOkhGY6KHbsw64spXRqDxSe2/eEsbNo5hsdqlp
 jKvkV7iNXj79Az9kx8cOoydg2mmpzY9a8MOTL/huxVNGk4gCjIA/6CnVx573I/tDLQ24
 H0BCEdScqd90NGgi9MLUG3umVp84spAFKl7H0PQ6vbiogT3hUUYP/ZHCzrrKEpCmDbi1
 vVaOOrGHvj5zrZgYuqrhnoPRyo6MA+dpy9P5TaLCe74Cdw3CksNFmzlMa3JpZnr6wFjR
 2JDw==
X-Gm-Message-State: AOAM532iSLgxaCdgeMjPsXSOIjBB+xBtHrqp6+CRpT9Mf76E+QYwiKJT
 DvosJWllqI+bfr/IS+4AH4Gy9ZbzPFGCaA==
X-Google-Smtp-Source: ABdhPJwY6Z5H8ETjkybmV0OLdsKQHAgPwHpXa9txzJwJRXyWQbn3jyZ/VpzTqUkwJTiyNEcNhD5F3w==
X-Received: by 2002:a05:6a00:24c1:b0:3e2:1171:34dd with SMTP id
 d1-20020a056a0024c100b003e2117134ddmr1619553pfv.27.1629173866630; 
 Mon, 16 Aug 2021 21:17:46 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:17:46 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCHv3 2/6] ARM: dts: meson8b: odroidc1: Set usb power source to
 always on
Date: Tue, 17 Aug 2021 09:45:36 +0530
Message-Id: <20210817041548.1276-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817041548.1276-1-linux.amoon@gmail.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211747_720359_AF0377F4 
X-CRM114-Status: GOOD (  11.57  )
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

Set P5V0 and vcc_3v3 power source to USB to always on
so that regulator should not enter in suspend state.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch in this series.
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 30ec6a7f20c7..5e5953152452 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -65,6 +65,7 @@ p5v0: regulator-p5v0 {
 		regulator-name = "P5V0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
 	tflash_vdd: regulator-tflash_vdd {
@@ -136,6 +137,7 @@ vcc_3v3: regulator-vcc-3v3 {
 		regulator-name = "VCC3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 		vin-supply = <&p5v0>;
 	};
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
