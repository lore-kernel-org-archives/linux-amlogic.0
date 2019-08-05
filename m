Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB00EC32751
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A167A20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igAXybp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f2kDgP14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A167A20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNTwuRjOoWoTi3GLYFULNkZOTyxX+iulvNzsS0k4XXc=; b=igAXybp7+/spzw
	Kq5bTb90vNKherb9Xm5w5Xjewuot6IRE1+VpDhp8b1gM5OombQpdaWG8hlyDGm6kWsuoueW/QM7x5
	u+3kV1Euui4AOGYwy4aZOjYqjfZqVXb5q4GXc4feIXACspA3KfR/j4KE78RnsoHIaBoETym34D+G8
	H4dBVmEz1+Lhy9w0vcoqIaOnofUD4qPs/ND5CP9cGht1uzGJO4z5eEuBRjWMcwJOybLr8xwQXZ0pU
	4/im38GfyroBsQ0Yt45rec6NhCmGzZjPfJK9VYK0KWtQOkhqKHu3q7wDINylSR1MPm8Czbf6fFfmo
	H+/d89/sJvDnYgauHSJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEn-0000pv-Ti; Mon, 05 Aug 2019 13:41:21 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEf-0000dM-Tr
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id v15so74808036wml.0
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVzaYwLQ0IyryucLyxiH/odxXJQTMSx5Nh4LY6yGL/I=;
 b=f2kDgP143d0HrJANosipnWVMoq01I+69xpPIahSbB00o59IrM6ocWRY8N8/9bj7/r/
 7Uk7JljTqjtYeSAgptE9vL/QG3qBzfbzMUwGvWDITSnZ5bS/CFvai/L1kZl3KAgNUydc
 wfQRJzatabV0duadNUeHxb5UbJ/L+g3hbd3XvyesDOHOYBnEflfp5ZYTY2bBRxmw1d9c
 kAvctaIY0WFROtJ3UZs2ChJ1EwKa/fgxo3taxsCN4XaadvYsE1qia05ZI/KlLnLBGpjF
 AuM13Dt6JP/0YB+USV+ZRAnP+tS3fouv2TTRnf1QxrelQhADnQPvu6ut5QpSdBSV7BJa
 NHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVzaYwLQ0IyryucLyxiH/odxXJQTMSx5Nh4LY6yGL/I=;
 b=LbA1/SA5DKMckz4DyRE4Ae9HKcRoZfNNdMUkOFay1JG5yYbGk848j8ASkrbyQ83y9W
 qr+wvkBGp7F1I3GDUd8WhdDy8+30C+W9iGCl7IYLLKCVxbBDxUs66+LIuZp5EntFL8ps
 0Vvyl6ZatH2GhkAATtw0QP0A2InFn2EkVQphXwNghHMSgAHQ/JK/UvdrpV6Gcdo1tVNb
 k23EJ7u3Rjibvzyy9YabXNoyUcXJzUXByMt9n/YPkoRLcLXLvv2sA4OI5qlX7kZXZY4X
 8+nHYqMNWORBHvOWlAebDnxPfjypGBpX8wKjm5l3c2ToTuPun+bipD/d/N2jEQltoMgH
 kcVg==
X-Gm-Message-State: APjAAAVz/gJFfcYJ+1yK6p7/NFqaX+cW0Vk4jdg1WmgJBqawjKBrU+8f
 2nBsnMReZOJbEEy0Oy58XXFvEg==
X-Google-Smtp-Source: APXvYqzIdxmXDup/BxNDb6FeOvbs8087+YAEORHVdQ2WCPN0OwAzp/Wh/rJXlQk484ET/UdwuJ5/Qw==
X-Received: by 2002:a1c:a8d7:: with SMTP id r206mr19116418wme.47.1565012472683; 
 Mon, 05 Aug 2019 06:41:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 6/8] drm/bridge: dw-hdmi-i2s: reset audio fifo before applying
 new params
Date: Mon,  5 Aug 2019 15:41:00 +0200
Message-Id: <20190805134102.24173-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064114_066572_6524E070 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When changing the audio hw params, reset the audio fifo to make sure
any old remaining data is flushed.

The databook mentions that such reset should be followed by a reset of
the i2s block to make sure the samples stay aligned

Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h           | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 0864dee8d180..41bee0099578 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -49,6 +49,10 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/* Reset the FIFOs before applying new params */
+	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
+	hdmi_write(audio, (u8)~HDMI_MC_SWRSTZ_I2SSWRST_REQ, HDMI_MC_SWRSTZ);
+
 	inputclkfs	= HDMI_AUD_INPUTCLKFS_64FS;
 	conf0		= HDMI_AUD_CONF0_I2S_ALL_ENABLE;
 
@@ -102,8 +106,6 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
 	struct dw_hdmi *hdmi = audio->hdmi;
 
 	dw_hdmi_audio_disable(hdmi);
-
-	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 091d7c28aa17..a272fa393ae6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -940,6 +940,7 @@ enum {
 	HDMI_MC_CLKDIS_PIXELCLK_DISABLE = 0x1,
 
 /* MC_SWRSTZ field values */
+	HDMI_MC_SWRSTZ_I2SSWRST_REQ = 0x08,
 	HDMI_MC_SWRSTZ_TMDSSWRST_REQ = 0x02,
 
 /* MC_FLOWCTRL field values */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
