Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BE3C43461
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A0722403
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1cunRaS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oIn4JOuC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A0722403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1czPUdvBrBanTkaVpdvY/Zg3C+yOGMoRSNOzkK3llQ=; b=P1cunRaSJFWusRIdE5khEu1P2
	k6gnYSPsX2BCIeJWrhgpHh6ijCSJnIgY5AMpIzEIoKcH4LsIafCAa/npbphaocEkKVV4s8OQW5921
	i5D0lmrrR2TLTywekwEh2XcrlsCqCA2eAD0FLGmOFqkHqxE0gSlbKqVSTR2LcdcpHAlQATTYsiWDD
	flq1n+MEY0SsFYz7cUUWxQnALRp8Zng7VxT/eC40jbc6YVhPqt8hlDmIjSdJFyaXA0/9nYdkoInUA
	r1VaVxhzF8qFBLfykpPguLjak72w7PwsMsV8zsWGFPkU/HJWpbpjmWPG11iTMtnbvkR9buS3/GBwk
	fzjCgKbaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYwl-0002y9-8c; Wed, 16 Sep 2020 15:02:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYwW-0002rf-Qv
 for linux-amlogic@lists.infradead.org; Wed, 16 Sep 2020 15:01:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id s12so7237238wrw.11
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gidsKX2Zswr/VwhkhQMTK3wAIhUubsrLCvk0z38r4n4=;
 b=oIn4JOuCOy7CHb5ZQdtF3SJH5FKQ9V2Z7+N3zKF9SyHuINlifIlQheLnsDTuJweddb
 RIgMxn2Nr3rwOljGIi2sVO5CNwhrMCZZsTGqAvA1IKT3Lc2nLi7W2OhbZE8moxDZt4Ho
 gkldh03HHGorLu6oZnd++T6Up6ED/0pWJ/ur+k9AJ/zu13w+veYC95XwTrGyI0Opu742
 98fJ5+Yo2BTZTXWqeEmf7AZ33nOSIM7nmZ0me8nG67MIVt9tP1vRYmhfjm0rbV1eKTzf
 Za7Q8WCnYAR7OIq4H/fdU5pY3CoX11T41lH+hSWhMlUr1Ll++wjeka7Ui00Jd1KitB/O
 RkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gidsKX2Zswr/VwhkhQMTK3wAIhUubsrLCvk0z38r4n4=;
 b=tKdTVkGP2UpcImqGk0nhjYxr2yE6oX2QF5Hk1IHWFi5aeaVVVPBLbDS436AFhke2/F
 KUFhu0gmYjwPDKUDEK3rp8KWModj2j9pRyeXU31vXbX6Fi5r6QHw0dMbY5EaQXecfZug
 1KGNzsjsGqjW2DZczpQmbsTrusNo7p6k6guZ4IpQx1ENOcBr3reD9mlSMdC6bLAQbSZr
 5Hi01wPzZU+JVyK/g9c7InK/g9BLwC9zAuSz3PPH9BDe5GocmC52+AkEsW8Zuz15v/y/
 ySQiQNTAm0fRSyjKaaV8vsTC9bBsZK8RWjZEnAbXtjnevaAQcwsOAhdbmkwtYrXyM5RR
 OttA==
X-Gm-Message-State: AOAM533XAR+bR68hk5usLgjhUOwhRUBGgI6FAnlUI5sbZYI6RBK3xFrK
 m9FMnI/EYqalZ44D+ULEeoPShw==
X-Google-Smtp-Source: ABdhPJzi4a/WO+NRp20+3sYyly2vAAt3B+yfSFNlTW4Qddgxuygr8mJVM7RDXG3HBkLI4jtZ9O/c0Q==
X-Received: by 2002:adf:f7ca:: with SMTP id a10mr26806103wrq.321.1600268515849; 
 Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 2/3] drm/panfrost: add amlogic reset quirk callback
Date: Wed, 16 Sep 2020 17:01:46 +0200
Message-Id: <20200916150147.25753-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_110156_887907_230500A2 
X-CRM114-Status: GOOD (  13.04  )
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
SoCs needs a quirk in the PWR registers at the GPU reset time.

Since the Amlogic's integration of the GPU cores with the SoC is not
publicly documented we do not know what does these
values, but they permit having a fully functional GPU running with Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 11 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index a6de78bc1fa8..e1b2a3376624 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -76,6 +76,17 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	return 0;
 }
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev)
+{
+	/*
+	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
+	 * these undocumented bits in GPU_PWR_OVERRIDE1 to be set in order
+	 * to operate correctly.
+	 */
+	gpu_write(pfdev, GPU_PWR_KEY, GPU_PWR_KEY_UNLOCK);
+	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 4112412087b2..468c51e7e46d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index ea38ac60581c..eddaa62ad8b0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -51,6 +51,10 @@
 #define GPU_STATUS			0x34
 #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
 #define GPU_LATEST_FLUSH_ID		0x38
+#define GPU_PWR_KEY			0x50	/* (WO) Power manager key register */
+#define  GPU_PWR_KEY_UNLOCK		0x2968A819
+#define GPU_PWR_OVERRIDE0		0x54	/* (RW) Power manager override settings */
+#define GPU_PWR_OVERRIDE1		0x58	/* (RW) Power manager override settings */
 #define GPU_FAULT_STATUS		0x3C
 #define GPU_FAULT_ADDRESS_LO		0x40
 #define GPU_FAULT_ADDRESS_HI		0x44
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
