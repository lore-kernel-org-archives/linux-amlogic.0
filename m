Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40E9C2D0D1
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA95B20717
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZH5pqHpd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FHCAjQd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA95B20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i352vMDxAnJlujtI6uy5hBZGq/xslgy7T9lxxrseb/4=; b=ZH5pqHpdaenj4T
	qbZA9DdOirM5kc/VLi/U/CgpJgaCOG3SfafHULJpCEk2i0OxHWKwcxBD3Z2hCEXVO/GmmMWeFml+e
	lkQ389idMJMCXZpRQOLQNeDDmolgEpJhafIiCxoZEj0i7fqmAMbn8faouagd0O9e/FQLnUc5Ayd2h
	bSXJfiDzCurEVNZb7icR+E5iFDMiiFWUgmkp1GHOEPhQJ/thSmztVDzzp51Oeqtfv9vg9e22mv4cM
	z3+9LrIDBwukYCcnK9PvSG9BLTFoaGePJIAYN9Mn3YkIovE1xUPFK1QaCpuQYJ/WyRQnn0xL/P7mx
	uQIbmgsO6ecb8XGQaA5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXD-00081r-Pj; Wed, 18 Dec 2019 15:46:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXA-0007zC-5f
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id c9so2803329wrw.8
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O9tdpVSfl48TElavVgqhWWyanYwTXJeuWxrfu0hiAW4=;
 b=FHCAjQd4y3iLKbv9a4+0jgFrCRVKlJcXXyEE8djCrmS1HqnAQOSIzjRPhU58PIOqSP
 qLQGfl8t/kpeSD0jjGyEVg1gzI7FEKVnZAyyu39Tk6J/jW7uzg1fwpsQc2fyyl23X2yQ
 vx2zPKIvq/gYsfcl93bHNdkA2/unThznbtJ2q2ZKLbNEnXIQ5oxLximvIxutQNUADsdL
 BwiZ4sdCrvm5dC0Eebf8yxE+oGqYOpmKb8L9WZ0aEGYZfHzh65OS5C6JY2duUiV03LH1
 CJRX/8PaypTs/svctTJXJCDjVfDFrXgCpW7vljEnXhEOYVbMN/BioNDaVzE/VFhKtnzp
 M6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O9tdpVSfl48TElavVgqhWWyanYwTXJeuWxrfu0hiAW4=;
 b=ieqiuyzx0h2oRPSjLkfRrsgUJdtoIN25WTEa9BWc4nJFlxWDMasI0GlzwsJlpDfK2A
 hNQGQP7q6TCehuZF6TSGX79RGBhXayWQ5dRNau/jdiRyMoN/26IemdsB2LE8s893wio8
 DyR24TwgRexarLYFb9Sx42Nc4LVHY/Tc4qEMRg5dFk0Q2DYR6DOJx90GIxVYOnPqgINB
 TLVK9Vg8AT2if7AMAbHF33Qkn+ZtV1woQusniNkorVduaNjs3iPk96JTdHooz1KrwIAo
 eEn31CZKk0IXzrUapMe7u/m0wUskPwIWYmw3G6omNNFRdxqtKsalGvMwYDif+xOy8G5a
 1MmQ==
X-Gm-Message-State: APjAAAXTNaxGs3aVdvEF71iZiQkW9hrfrR8psvvmYnYHtqyg30J+NtYZ
 mZ4t3waT7h8ueve+20YvdwEDNQ==
X-Google-Smtp-Source: APXvYqzuM/qSpRgPBzy3PCHjbAbAOHl0IflSqZ5d6XsQf2QHxW6iMGwcohpjIcXJFGEUXP4EJk3xAA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr3545462wrs.11.1576684001310;
 Wed, 18 Dec 2019 07:46:41 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 01/10] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Wed, 18 Dec 2019 16:46:28 +0100
Message-Id: <20191218154637.17509-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074644_209106_83127953 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jonas Karlman <jonas@kwiboo.se>

Configure the correct mtmdsclock for deep colors to prepare support
for 10, 12 & 16bit output.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dbe38a54870b..6a0b4b3a6739 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1792,9 +1792,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
 
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (hdmi_bus_fmt_color_depth(
+				hdmi->hdmi_data.enc_out_bus_format)) {
+		case 16:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;
+			break;
+		case 12:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
+			break;
+		case 10:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
+			break;
+		}
+	}
+
 	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
 		vmode->mtmdsclock /= 2;
 
+	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);
+
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
 		   (dw_hdmi_support_scdc(hdmi) &&
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
