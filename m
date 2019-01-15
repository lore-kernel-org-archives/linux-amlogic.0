Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689FAC43444
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3699A20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4Fi4Etv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l9JYw8dH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3699A20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRG6fUJH47NMFi6MTLMTkIjTkwdopnQdZDNitpZUNLY=; b=p4Fi4EtvZbPTz8
	GeiWLgte5jkGvpPVh01dxhtD57G9N0Tkv7ABUK6sm1mN2SaFSr3EtM61fTsspezlYVeWK9oHbmEYq
	F6srEuLrqbAML6P1djGn+kLfz1n9ScxcdAVzOR+GvXYOaY8t8MQzOM1+41mX8o6B3NBeBckjG2ATt
	0HQBciKUuikvafvB4vTr6HpOLgrQbSnnDfsK/kshx+cUddBFa9DBwGLZrTy4Ptc5ul0BGgfn617IP
	K0DonqnasPLcK82cofufOab1GTR5qZJZlm7tr6Cp/AYlA+g4G7Zy2OoV7504QEv0exRLxxPSm52jH
	t48p9w3o3aCE2lGrgd2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRPo-000764-UT; Tue, 15 Jan 2019 16:18:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPj-000733-HZ
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id z5so3589028wrt.11
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xlk127u6yv6tDpzzp87xEmww/OG7WSxfXPaRtZH0xYk=;
 b=l9JYw8dHE+JjJ4TBMz+xhqTJ/KWBwH25/yWbAzdY2dVUSDrFNsYXfY/S3ddeOv7bBV
 +L0glgTWfS0xGrvEc3QiXYBCFp0N3NJQjmnzOAsYSd/3HW0gDXTZ28aWUqpuB4+//TWi
 E5BVnOSdXnB8/558RHDSR5RKPNKvH6JaSVQ5mvBJ3nD3fBsqvAl9HZcNaVv0T+6aljS0
 Ic8Gu8f1oiO0Zfp8/02wKfZg4xAob8LZEIWWwu05LhIvl96H8GTSAAhl8byo59WwOqlq
 XEnYVdJ5dcsBmNhu3tRI91kXwVXYtkGE0p6Obdizo+cL32aOVZFkTEDWs5UHtY5zO4tR
 6F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xlk127u6yv6tDpzzp87xEmww/OG7WSxfXPaRtZH0xYk=;
 b=fmd4Co+NkzPEdsfm32Nygvs5Z3uk3CyZOO8vCqvzMkyic8UtrN8bHoC7RWCLBZXVWW
 P5+N3YiDzcqfRVHTlsZIVutR4hJR2860eEN0NT4GC6Pe0nhkEmO/Ps3q65ryDpYEJoSC
 ml6kDm/+cXdIbaP6/81PtNuRCifjgME3xrQuK2R7BqEjNPBSzMmRMsfyrjmPGkOOqRNw
 AE0XalzHqu1rEV6FeLmGHoA2Mg6hVudWHok5Mw+qhIMGLVwCaQv+kAxhme5XvKClPNwr
 f89df7hXRYKi1C1sLf/sknz2a+FiP+NV/7l+0hXfaDNMxF3Ta7xU51cTUQZOOQNw6Iwv
 EI2A==
X-Gm-Message-State: AJcUukfM3M1bp5b7RH3vRdgGMXwVDq34S2dI9Dm4svkCIdsqZgY7sZjs
 Lo1+Re0UxeBL4JBjlisaG6JpB7N96i37Hg==
X-Google-Smtp-Source: ALg8bN5kovdZt2oHacITosUuNxqNCmNMsWytEXSBq8bPIwzYSHsJpZFavDLMN9dEfD0yhM9u6N1GUA==
X-Received: by 2002:adf:e9d1:: with SMTP id l17mr3583232wrn.73.1547569085591; 
 Tue, 15 Jan 2019 08:18:05 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:04 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 02/11] video: dw_hdmi: support SoC specific read/write
 ops
Date: Tue, 15 Jan 2019 17:17:50 +0100
Message-Id: <20190115161759.1657-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081807_576701_8A0961BC 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jorge Ramirez-Ortiz <jramirez@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jorge Ramirez-Ortiz <jramirez@baylibre.com>

Some IPs like the meson VPU have a specific way to write to dw_hdmi
registers. Make it configurable.

Signed-off-by: Jorge Ramirez-Ortiz <jramirez@baylibre.com>
[added commit description]
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/video/dw_hdmi.c | 14 ++++++++++++--
 include/dw_hdmi.h       |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/video/dw_hdmi.c b/drivers/video/dw_hdmi.c
index 229bd63c97..e03f24fa98 100644
--- a/drivers/video/dw_hdmi.c
+++ b/drivers/video/dw_hdmi.c
@@ -52,7 +52,7 @@ static const struct tmds_n_cts n_cts_table[] = {
 	}
 };
 
-static void hdmi_write(struct dw_hdmi *hdmi, u8 val, int offset)
+static void dw_hdmi_write(struct dw_hdmi *hdmi, u8 val, int offset)
 {
 	switch (hdmi->reg_io_width) {
 	case 1:
@@ -67,7 +67,7 @@ static void hdmi_write(struct dw_hdmi *hdmi, u8 val, int offset)
 	}
 }
 
-static u8 hdmi_read(struct dw_hdmi *hdmi, int offset)
+static u8 dw_hdmi_read(struct dw_hdmi *hdmi, int offset)
 {
 	switch (hdmi->reg_io_width) {
 	case 1:
@@ -82,6 +82,10 @@ static u8 hdmi_read(struct dw_hdmi *hdmi, int offset)
 	return 0;
 }
 
+static u8 (*hdmi_read)(struct dw_hdmi *hdmi, int offset) = dw_hdmi_read;
+static void (*hdmi_write)(struct dw_hdmi *hdmi, u8 val, int offset) =
+								 dw_hdmi_write;
+
 static void hdmi_mod(struct dw_hdmi *hdmi, unsigned reg, u8 mask, u8 data)
 {
 	u8 val = hdmi_read(hdmi, reg) & ~mask;
@@ -754,6 +758,12 @@ void dw_hdmi_init(struct dw_hdmi *hdmi)
 		  HDMI_IH_MUTE_MUTE_WAKEUP_INTERRUPT |
 		  HDMI_IH_MUTE_MUTE_ALL_INTERRUPT;
 
+	if (hdmi->write_reg)
+		hdmi_write = hdmi->write_reg;
+
+	if (hdmi->read_reg)
+		hdmi_read = hdmi->read_reg;
+
 	hdmi_write(hdmi, ih_mute, HDMI_IH_MUTE);
 
 	/* enable i2c master done irq */
diff --git a/include/dw_hdmi.h b/include/dw_hdmi.h
index 23088ec768..35edc189c0 100644
--- a/include/dw_hdmi.h
+++ b/include/dw_hdmi.h
@@ -472,6 +472,8 @@ struct dw_hdmi {
 	u8 reg_io_width;
 
 	int (*phy_set)(struct dw_hdmi *hdmi, uint mpixelclock);
+	void (*write_reg)(struct dw_hdmi *hdmi, u8 val, int offset);
+	u8 (*read_reg)(struct dw_hdmi *hdmi, int offset);
 };
 
 int dw_hdmi_phy_cfg(struct dw_hdmi *hdmi, uint mpixelclock);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
