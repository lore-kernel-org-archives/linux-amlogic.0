Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC6CC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18541206A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ylGHVyTH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cA7HaW9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18541206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gnvrxlX+OiAdT3p/eKlo3LfQgfbZ1xG/3Vfv8mWblDE=; b=ylGHVyTHVRmsf/Xtm0+EBCcwV
	yWpynSfsmc5xbwLeDM/BHDU6G7+Z5jBa9F5gxBbl4+XcjCQau8ZdRc+1F9tnDxJu0AvpMIpPJiwZ3
	nUudxHrCbCQEajQVq4+FAmmI0V96SD5pIcFsHMilZfN8fyLAyDVq327GWspX/1jh1S8VJ0WC9Kqtd
	cKvCiu1ZpPqZcnwge8Rgm4B9wi51nO07UME618RVKGnXKjuEmszZIBvkYpBuFCt2FVS0tCMX3clSP
	5cycox0nTWMKiC6iVby5e9ERT7bxNIPE/r3gUCd21DUNUus+thW9kbwEZlXUb7/HQ+XISwDXC8Af1
	wHrDcX/hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGju-0002OR-MX; Fri, 03 Jul 2020 08:08:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGjV-0002BU-CK
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so20649581wmi.4
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8L2ymad7uoE5dUtck9cxUKwpycxjoxw6UPplO4++sw=;
 b=cA7HaW9ozERboAuFN1YKyL0eJ9qTEfjabd73QLZYCr8JYx4MDRAY4sr1CrwKxd7e+0
 +2qaUWTyjHD2UNG5edk+loEfOfALbhN42YcMZ/HzDyzRfYTcE3DWKeECrUeImTL7sw92
 peWipbKkC0KxjjZhFz9PrenW0V/O8wWfGbqQAbdzpq3Qhh1rssa2psDvVD55QUHEgwNR
 S8c2J0nmpdi7VQ9sA2PLt8EWyzDUaevnN/BQXHjDxCA3GiJ38FzcoHPP7SYKwtvBy21M
 14LF6HL1WcbbI0QlLreutc0zQ6IazLYgG0CmG8GuCLt5n+UiUF06HupOpCYd+oGaLN7H
 RAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8L2ymad7uoE5dUtck9cxUKwpycxjoxw6UPplO4++sw=;
 b=dQBk7NHcZWlhcs7/EZoiHpGrVvh/nbEYsN7ja5PHgTeaFbMaEvztdxt0EJsr0zZ2jo
 B47mloIQNp8QKnFQscx/8coqpcIt1Kd26S04w/KmwtFw6n+nmg9xWk5GIvmlRmnW3VfE
 o5ExIEEjlGr9AOnIXvCgTo0giBuRAdQJcL2z6arhPo6AR1Y6J1DJwjYkG/lRM2qp/ang
 CO3l32TzDkk6Va1qTa934zY0fCaHaqnSfbKXpKBHuwrtVLgOPwOkltS037wi+uOPR0xO
 sFWuWMM+ePiG7nAoH4bU8BgZuAlfuBDBpAZ7ry5H9WpOL5cM6ipMzQyhzTjaODEyIkfE
 sHcQ==
X-Gm-Message-State: AOAM532Nk1PM//N9OFD5iOQ6nh6TOhLTwj4JYnw5N/sBV+6tVVNk9EUO
 CNTcSXkByn1rmFXdfCVJ41IIyidnFHRLcA==
X-Google-Smtp-Source: ABdhPJxFqjpvl3b0UJve6c0iOJ4MjwZ0scn2Vk9ofpstuBtdKJs4JuNzymRK6MsAmFbBysjHmny/RQ==
X-Received: by 2002:a1c:a70d:: with SMTP id q13mr34051103wme.55.1593763660377; 
 Fri, 03 Jul 2020 01:07:40 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 2/6] drm/meson: add Amlogic Video FBC registers
Date: Fri,  3 Jul 2020 10:07:24 +0200
Message-Id: <20200703080728.25207-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040741_480034_B5532A1A 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
register.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..08631fdfe4b9 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -144,10 +144,15 @@
 #define		VIU_SW_RESET_OSD1               BIT(0)
 #define VIU_MISC_CTRL0 0x1a06
 #define		VIU_CTRL0_VD1_AFBC_MASK         0x170000
+#define		VIU_CTRL0_AFBC_TO_VD1		BIT(20)
 #define VIU_MISC_CTRL1 0x1a07
 #define		MALI_AFBC_MISC			GENMASK(15, 8)
 #define D2D3_INTF_LENGTH 0x1a08
 #define D2D3_INTF_CTRL0 0x1a09
+#define VD1_AFBCD0_MISC_CTRL 0x1a0a
+#define		VD1_AXI_SEL_AFBC		(1 << 12)
+#define		AFBC_VD1_SEL			(1 << 10)
+#define VD2_AFBCD1_MISC_CTRL 0x1a0b
 #define VIU_OSD1_CTRL_STAT 0x1a10
 #define		VIU_OSD1_OSD_BLK_ENABLE         BIT(0)
 #define		VIU_OSD1_OSD_MEM_MODE_LINEAR	BIT(2)
@@ -365,6 +370,23 @@
 #define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
 #define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
 #define AFBC_ENABLE 0x1ae0
+#define AFBC_MODE 0x1ae1
+#define AFBC_SIZE_IN 0x1ae2
+#define AFBC_DEC_DEF_COLOR 0x1ae3
+#define AFBC_CONV_CTRL 0x1ae4
+#define AFBC_LBUF_DEPTH 0x1ae5
+#define AFBC_HEAD_BADDR 0x1ae6
+#define AFBC_BODY_BADDR 0x1ae7
+#define AFBC_SIZE_OUT 0x1ae8
+#define AFBC_OUT_YSCOPE 0x1ae9
+#define AFBC_STAT 0x1aea
+#define AFBC_VD_CFMT_CTRL 0x1aeb
+#define AFBC_VD_CFMT_W 0x1aec
+#define AFBC_MIF_HOR_SCOPE 0x1aed
+#define AFBC_MIF_VER_SCOPE 0x1aee
+#define AFBC_PIXEL_HOR_SCOPE 0x1aef
+#define AFBC_PIXEL_VER_SCOPE 0x1af0
+#define AFBC_VD_CFMT_H 0x1af1
 
 /* vpp */
 #define VPP_DUMMY_DATA 0x1d00
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
