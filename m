Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FEEC2D0D1
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083AA24650
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eL7pSZuQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fDwnwLMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083AA24650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMQD8YwlRUAhB7SXFeii1M3u467usm9UFUYxhm45YtU=; b=eL7pSZuQal1lCt
	EmFfmVl44A7Q3pNKhyurtLGhkPZy4XJGShpYa0Jc83Qi0fpty6fqZMXlw6/8jTFJhP3g5QCcfxIe6
	wX00ld5Djf6GMWWewc4mZ/s+jzCxsT147BlHIfaYVTZLOHxBYVmAYbrEJlnzD9ySeFLY1znUgdwkn
	r5g4CSAxJDhq6Tg0BKXFk9bXFgP/j2s1pEuz8rFx2WBm2VRkzJoucVqHNzL1v9AZVekXsyL4bRt1D
	ExQ5+mvUkW0U+DRxINZ/ZaRVZaUDIPEZ/gjsh1RSPeIHQIhl5UwghP8iVVS5Msa9Kf9myc2K16G+I
	FjGThNXsO7Qze+obPudA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXL-0008As-DR; Wed, 18 Dec 2019 15:46:55 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXC-0007zj-HV
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so2339791wmc.2
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HS90VjGTEgPLwoS07O26nuJB7gxxS9CD1cnSI1IU66I=;
 b=fDwnwLMtw3uOHsVJkA+Sxz35a/DRK14VjnfBHoxmw+sub14JCsrV3biDAx5fbrQ30n
 bzbtOHe5126TPWkHhYQKOWlwX38XHenTKd7WCgPbXfmj2geKxFlou39QgO5VHTLUbA9e
 70Si2uXmHxGHZEC9XAZZT04cy2SjuOAJrJfQb+gR3/LeMRF8RLdd7lJUNeiiPwqIYaS0
 GQ3e3jiqyoH3xcO12avGq3Yt5/6OemFDqKKrxovlc2roINAJetJ0o6urhqLfpX/oBSup
 4TF6u8afr1873ygcxCRYuey9XoBBSa25fpoijdK8HNqoXDcBjYGX8S2wgzYNT5Rikw4n
 RYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HS90VjGTEgPLwoS07O26nuJB7gxxS9CD1cnSI1IU66I=;
 b=Irdp6ct+ic6sw0AtpkNuQi89LeTsw0O6m3t+pcR7TeJGIaAPkHHJg//cZyxTV+k5uX
 iaTXgTZTmmxSdRrlYvPWq0d09W23XTIR2mZMeqe2V0sYIHBK+O9r6n2V5Bl2XMri1FEc
 JvSchW6WyeVs/O+p3X/ys6hCWKrpvLsoFf9HksJSD2LuCsD69aQsj+UK5zH7Qh/pfJYa
 0hXjjLElb5ijPoYuJjuibo5F0ClJVmWUSjvfD7VyoQ5CffumX35S922AIT48fXF6QRa7
 RjDB/JCNYd5WGuPMu9rcR64x1KFqDcKajUX8M0gft7KMnIXlmuHGojwYtWRqWv1h+nED
 y9lg==
X-Gm-Message-State: APjAAAV6VhuTbN+Cbp7zh2elqSNFUwofKp98XgLBhOw8Jbj/tbJKi3Zw
 lTmXdfgR5wPS6L9rlQWctt9UVA==
X-Google-Smtp-Source: APXvYqzMxHZU54rjVdvdQilWUCjDI7zSWqhv9fM1JYbrPdMsusPqlZYyBJj6ngYbYwqGl/RqMDtDfw==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr4119475wmb.150.1576684004437; 
 Wed, 18 Dec 2019 07:46:44 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 04/10] drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes
 for >= 0x200a
Date: Wed, 18 Dec 2019 16:46:31 +0100
Message-Id: <20191218154637.17509-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074646_624673_0162F416 
X-CRM114-Status: UNSURE (   9.04  )
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

Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
for these modes in the connector if the platform supports them.
We limit these modes to DW-HDMI IP version >= 0x200a which
are designed to support HDMI2.0 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8c1f7e5e6698..bb87b87c752e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3189,6 +3189,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
 
+	if (hdmi->version >= 0x200a)
+		hdmi->connector.ycbcr_420_allowed =
+			hdmi->plat_data->ycbcr_420_allowed;
+	else
+		hdmi->connector.ycbcr_420_allowed = false;
+
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
 	pdevinfo.id = PLATFORM_DEVID_AUTO;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index fbf3812c4326..19e30cdd35bf 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -127,6 +127,7 @@ struct dw_hdmi_plat_data {
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
