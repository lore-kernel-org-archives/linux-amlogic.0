Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049D5C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA7720738
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="20akc1Uv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GG9m4KU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA7720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i63y/eWcfI6GKi8yNC7ntzasdQCV1bZgXWlsahFkPMo=; b=20akc1UvUUbLSLGu7BYtwQLVj
	0Y/S5r1vOeYQ+IwRHHNCxypE+uqfbo+Bmg1tx/NuLExRzWbMMdKKi/GFO5iVgVMfHBGyRoHN2MYdK
	DqS4Kx0PC9JTaA4cPzjUQMGVzx6qadgZ/2Lf0PqF9HV16NftreXv5yR1kfatlzfOhDH/gKVFENu/N
	K8ROHxSWcXXccuqHJ+mg2LAGZ7NwjLJi1a6QuXNBYSTHukDu4YKwgORJQYryX1q4mJIFr2htN4Cj2
	IY2GuPd+SlhDFJd5bhNzFOB3TsNxs2y/hRrQnFET5ke3BAqJgD0QVFrazTXJ+cqpQGLKQHnT+EBlL
	RyzI38Z6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfPK-0001ir-Rj; Tue, 08 Sep 2020 15:19:42 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOi-0001SD-VX
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id x23so7762581wmi.3
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0IoBahBXL8EV0Zm9JurRP5zVn3O/ezWTWYb2ZZwdoss=;
 b=GG9m4KU79FRy3Qgbny/8OL+0RnULk7UHa8hwD7IGdlg/qZhDxf7vKcI4P3TtCRnWdZ
 t6SU2EesiN0Cw098TrXyhVUAbYiefAj+KMX4mOg1eFswalgfcdxfwWFd/2OhgVTFVRXf
 g0dRQ0aec6jsWRZ846qt63PSfKpe9CRYDVyuynbySXEdwR52T3mzEDOmJpGxQlgwxhsR
 IpjPOse9s6p0IfHP9+eYD58xNRKvXxt51uPieX/UxsPiOthcKowdpEe+ob6Bpatn2wNW
 rrfbpmyD9lJLn0HetNn/Bm5glZadk3/taeSTRnHJRgtnOOemPdW3Cmkd8Y5jL0zjvFCG
 uWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0IoBahBXL8EV0Zm9JurRP5zVn3O/ezWTWYb2ZZwdoss=;
 b=jN3eP7LdOV+AV1qJE7HdYnzfw7MUrj949g28PMqVKG1X0DW8kmZCA2HkqW9BZRNDPG
 ge3pReGKJMxs7fr/oUSIsq4JaKlFry6vedNhz5v4SY0sdfZ89dFQ9U2ExL7Wn92ILYxn
 0mknP5CDpFe+4GGYAucpMuN3fmgFwi7bzIzzsXZQMLgrHmLGrZOeQ7JUuL7jGzKLI0G3
 xr16S+msKN7zFJzR+oJiUwRGUqEPDgdJSSfSpabEv8uCXfStd5ZPhQnFCyye8IUHT2SV
 G5Nlubf69+QLFo7iSnfLKXTL12WTuChhLid3SZaz7mLzSxrE72hoX9Hwb2v3q+/SjvR8
 wE2Q==
X-Gm-Message-State: AOAM530TwbvIuDah8mDG2lMCfK0h2BI1iwzXKHfK9L3fFzBVQ69p4BbV
 Vk8B1Mn7TEJ611SW48hHUn/yLQ==
X-Google-Smtp-Source: ABdhPJw6zcnIiatO6SQE5a+MzW0yXoBmBj7sAP9Cf3yM7GxqrkpZS5u2132oDAMPyj0810YP9kSkWQ==
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr73546wmg.58.1599578343681; 
 Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 4/5] drm/panfrost: add amlogic reset quirk callback
Date: Tue,  8 Sep 2020 17:18:52 +0200
Message-Id: <20200908151853.4837-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111905_114365_A0950F8B 
X-CRM114-Status: GOOD (  14.00  )
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

Since the documentation of the GPU cores are not public, we do not know what does these
values, but they permit having a fully functional GPU running with Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 13 +++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index c129aaf77790..018737bd4ac6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -80,6 +80,19 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	return 0;
 }
 
+void panfrost_gpu_amlogic_quirks(struct panfrost_device *pfdev)
+{
+	/*
+	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
+	 * these undocumented bits to be set in order to operate
+	 * correctly.
+	 * These GPU_PWR registers contains:
+	 * "device-specific power control value"
+	 */
+	gpu_write(pfdev, GPU_PWR_KEY, 0x2968A819);
+	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 4112412087b2..a881d7dc812f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_gpu_amlogic_reset_quirk(struct panfrost_device *pfdev);
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index ea38ac60581c..fa0d02f3c830 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -51,6 +51,9 @@
 #define GPU_STATUS			0x34
 #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
 #define GPU_LATEST_FLUSH_ID		0x38
+#define GPU_PWR_KEY			0x050	/* (WO) Power manager key register */
+#define GPU_PWR_OVERRIDE0		0x054	/* (RW) Power manager override settings */
+#define GPU_PWR_OVERRIDE1		0x058	/* (RW) Power manager override settings */
 #define GPU_FAULT_STATUS		0x3C
 #define GPU_FAULT_ADDRESS_LO		0x40
 #define GPU_FAULT_ADDRESS_HI		0x44
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
