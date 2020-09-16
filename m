Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C01CC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FC721941
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQWhHF3+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zn+OYs3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FC721941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JrUR/XJ+JlGL7gLfRDMxeYDnqWW33y/oQiFaaobWvYw=; b=rQWhHF3+WadFS5KT8tbOscGjc
	P2n8ZvyOWPMNCi02w8foZuTELWZP0nd7J79nZjqy//jnU2d/U38RtjcVbC4t6/7Kupt5tbrYKPIhe
	p7CZfo4rtZwEsjQcZF6nYj+Tjy+mceEEuggjtYSSs5ygDkNtOy9o0jIZ+C1sdMPuuTzXOHqxPPlRS
	iPiBljLJP/xsqhlug7JGVLIZQFM5g/4iIW/J4kSeb2U+7ckltfyQiNP303pQoeKA0X8xZHckGRZSY
	auneOXJ2irZpTySUZZYsdSnHViMYu7Yh6Iafdx9pRHpJv3XwKZz650hQ0q7MQfRzHzDUE842GVrMr
	Oqjy7mKGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYwe-0002vC-Cp; Wed, 16 Sep 2020 15:02:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYwV-0002qx-89
 for linux-amlogic@lists.infradead.org; Wed, 16 Sep 2020 15:01:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id k15so7265251wrn.10
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hImJ77lnVX3Gt8BtSBrQ9L58KJd7sxpK5SqbvVqBDT4=;
 b=zn+OYs3Yc6TjDeDMLiJWpLLWggFqYNeLgm6J18K4sU21Tf8A707dIRS/zJPSWEBT2o
 mOrJtvn+/XGRVorYTU1AR22L+QJt+mapeRzWYs+8v78LOCpeuWjvFgy3Ve1kCJjDlKzk
 vc6ow+f7V56/J3+1AB12ZA0MTx3oPMNEuiXq1S2mNaVT9aJrcGow+Nd2Z+dB2ii9rkkf
 aX5fRJNsu46XIPQpdADaIQEhHFm6Ix91chLutkMAfxAGo9b/yfulX/dAIMbMAliOiff1
 c9EY0xmyHleE6D1Iq2v8+pccK4susTBg181AxyOhknWw2l3AfwxxqxgLUtujtfkihSdi
 O3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hImJ77lnVX3Gt8BtSBrQ9L58KJd7sxpK5SqbvVqBDT4=;
 b=akT/gTMWCbD8oxlGijtSoscTqTIh0WSOVnU+7BV1NAjUkVTMQ29PkZTBNRS59h+GOQ
 0OZFVJT5Bg/b5D1y4fgMF/CLPlfB+sMiRXlw3Ny4NbVi+CfEQshcvj84yxlTiU21qz8X
 zsE6NDQGrKbBIaBFlVd8ZD9peBK4UsZnaaUhIUyO3dSockXlJ6l13cZssJrLmCZNB9Rk
 A2BNXt5FsiAEUbv6mbmffCFC8E4pC0BdN5AFbrAtwEPZkHcsyAEqKPbGhux0b/PNz0x3
 OrlogRNUSA2qN8uIqRxHJ2kF89300cKUIilOTjeMFe4TYajJ3KfWomI87hZzRMEgfjxo
 XaTQ==
X-Gm-Message-State: AOAM530QSOEh/wWljLky9jD2+slCdffAi0juhnYPabSQ3YaI9ojECmc+
 35kzkS5Dwo4/MBE3LTRswKV0pQ==
X-Google-Smtp-Source: ABdhPJxoLA/tx2P1IXNi1/eKRjFXPh02N6giEvfMg6DRt8JMc/aIkC7UH8raS68XGZ2uahjcBpp/TA==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr27578093wrp.356.1600268514278; 
 Wed, 16 Sep 2020 08:01:54 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 1/3] drm/panfrost: add support for vendor quirk
Date: Wed, 16 Sep 2020 17:01:45 +0200
Message-Id: <20200916150147.25753-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_110155_312533_EEBBEFE9 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers after each reset.

This adds a callback in the device compatible struct of permit this.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index abfc78db193a..140e004a3790 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -70,6 +70,9 @@ struct panfrost_compatible {
 	int num_pm_domains;
 	/* Only required if num_pm_domains > 1. */
 	const char * const *pm_domain_names;
+
+	/* Vendor implementation quirks callback */
+	void (*vendor_quirk)(struct panfrost_device *pfdev);
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index c7c5da5a31d4..a6de78bc1fa8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -136,6 +136,10 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 
 	if (quirks)
 		gpu_write(pfdev, GPU_JM_CONFIG, quirks);
+
+	/* Here goes platform specific quirks */
+	if (pfdev->comp->vendor_quirk)
+		pfdev->comp->vendor_quirk(pfdev);
 }
 
 #define MAX_HW_REVS 6
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
