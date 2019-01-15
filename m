Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4635C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9636B20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/NRMsPs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1LDd12hj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9636B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUu6YFrvNO1uPk+VPwDbOM6qRi/LflDEVH7dgtbIo9s=; b=h/NRMsPsUECMj/
	7MU4MHTFV1/N7Nkb8tWx/EcXaWR6vV2AeRJRiXy4wg5zHz78JqFGmebSN6Xh/03iTmKw1BMAoiYC1
	yxY870nx6ovg94buFeruEBYFWYwq+sFGutoLnZYzDjsmgGifm+2nkr4oGkm/Rjw7OxS8PFt77ZWip
	jPf+ax1zAb44iYj6EXpop1qLLOEqRNgUikWPW2d88Omauh5yBdIcRbM0ATVkvz+B7IjJzxGxDLmUh
	2qoYpfas3a+gJtKfXwN+oEDCRMALwExLQjK9zb7ufxQr4xW+bP5VffF46LhxwmPF8XWYMD2F/2ito
	QchiOcJUlBYaG5mxESWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuU-0006sv-St; Tue, 15 Jan 2019 12:33:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuK-0006i2-VP
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id u4so2780874wrp.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpVvc4cxqC3ayWkZN0dkgRpLIy6RZ4ccQ+3oekZQGTI=;
 b=1LDd12hjCVpOIfI8AVplQD6FWhG0ubYYyY7PTvIX2V1Hgce5Nusby60ke42mOM6cLp
 1c5YBW5zPn9UIrPYMGkyMfw8S+wslw9GxxSywpn7Yk5j4HKOss15xWyyr2S5cT1xVMJA
 mFsNvq7BV4+zoPvuRVhn6nlCEJ66eVQOZAhcToS2L7F2gz8vclkXj9xCSk7Yf07v8IwH
 44MajIicDCpsSQKJDe0T4TlyADWUcvwyb9zQ2RquuWV8tZbTWQ1WkNR+nQ+Irn/RMcUQ
 /jXCmmMQ/0n6iCJ4z9060gzHw0OlinGgJkiRoZNhTXgCTGQjW+ziWPrW1DAWZ1ka34dC
 3SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpVvc4cxqC3ayWkZN0dkgRpLIy6RZ4ccQ+3oekZQGTI=;
 b=b0Z+Sw7diPWXXL3hsfx9Ji1HRL4MjKoQFZUeZsj5ZAW80jkmYF6ZvTM/+be9qar3/J
 oRgLFsP8Y61SPz7mHL4Rg92G/web49ZBLqY8BdKRLJuCXLgPoPnmnHKEF7al4FGMb/UK
 IISjpy9YDnjk/pDhSygefzexsJlgdLNRsfNcRNm+4K6x5QKP2MHXtoas8kfnKYW4EjV2
 Y3d6AzsmqJ+n2u//fZGH30AewfbxoURdBU0a1Ph4fKav+GSH8zVv84FFu7PBDtYn0cLM
 Z1bWObYdXtZZyJci5JdMBn2rHnVPHq+LvB11nQNReMEH0SFGSZyxVhtmTjoGFFEIT5l4
 hTMA==
X-Gm-Message-State: AJcUuke3rimkqrCAy5z/lZjXAUg2aA+2OmY5VoxkEmqUHkxJgCvH1NH6
 6nptdVI0psd46B5vA7SktPn4lQ==
X-Google-Smtp-Source: ALg8bN6PQQnNlB7PgRuVdZQ24LStXWxprznAVANtZajshjeIzeeK/QSfgzluKSB8aZu0L7Y+KwpG5w==
X-Received: by 2002:adf:ae1a:: with SMTP id x26mr2921990wrc.0.1547555607480;
 Tue, 15 Jan 2019 04:33:27 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:26 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 maxime.ripard@bootlin.com
Subject: [PATCH 6/8] drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
Date: Tue, 15 Jan 2019 13:33:13 +0100
Message-Id: <20190115123315.11069-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043329_456792_C7B70660 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bd564ffdf18b..b6987d97f892 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2612,6 +2612,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (hdmi->phy.ops->setup_hpd)
 		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 
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
index 2e797f782c51..3768265d7a5f 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -128,6 +128,7 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_mode *mode);
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
