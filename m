Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E88C282DD
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54FE218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="geQfa0dE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WCCN9xuL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54FE218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IjexQdCVcSTMDZbaAUXP6pALuSFMi3EZHzq0l3aFL2c=; b=geQfa0dEmeLo+t6+OCOQHPThtD
	pi4Os6zHTdS6rquOHYWuDxQSmS8YRaMgAb61JNtghDKvyEXIGK9Py8yTHssHJh/Cp2muUxUc6XGpa
	VeGrRkBqTWq/UzOt56XSkOHbcPKhARhpdEg+j6b3rRdU0YZHvdvgjmBIKBVb1YT/L6xNKpc/8kN8O
	zJS/cPOcfRyFcmkveFKMebCiGRPbne63edeUMybhMjYt+bYuRGQUedKO+ZMsuEJHl2fiZcKonaJU9
	qVHlMsQ5b/tIQ8s8qr1DnZ9FemxcaaEG2JthsNcNWivD4ZIJlO2VgLFA0scg2/5yoWzltFVU+bg6P
	nT4fXYsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXcB-0007f6-El; Fri, 01 Feb 2019 12:08:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXc1-0007U0-BL
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id a62so5856939wmh.4
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3YdCNSUKBtHOG5LFF9zYYGs+CVv8TlhyA2FzgjXbzq8=;
 b=WCCN9xuLwBTaNzdv8NR04MIAT7pWcmItyO8QPXjOXcFQtF0Hl/a+gK5NZoNByo7aC2
 yvuF4hda1fpabDl3ftWB0MnuYpkzM3VSYuBn9kRAuUxTLBjE4/Hhogs8HksARMXvVrX6
 J5Y+pDKsSa5b5HwS2yB21cejOaGcQIexfSiTjrsQLdfoENnvhBGAnS6Rg4MXsw6a2H9J
 ZHmgfcZWxcvl5WEHiQMv0AgNAGcSRllarKZHUxMYkVL38x72RsT1CKptK/yZs3hWUP46
 ONoq4QDSbJT9by/GGxZbFYU77s3AitEtM3MS5qPmA2LVT8pv41oXObHn0dvJdHm6G9Vj
 LDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3YdCNSUKBtHOG5LFF9zYYGs+CVv8TlhyA2FzgjXbzq8=;
 b=D4sxe7mikNUlt18AwCtEvNNc0h6FHBDLFh6XCkpmI+QoRCyD9IGnBtoD0eBolvsVMR
 0MyOe7BFAPFeDwSfMY0J7ecNpNpfslQ/0qr2r6oN4An9VOUCVmBBB58YkpEUHZCGkwvn
 ORvbKR/mSX+N7uW3ytAAAx7RhAia0ES5+JZUDqxDsndmHYcV5vHH73H2FzzbIl6vQX0x
 7x6XD+8NQdl7uodQDcgGFwCrqjQcsbG3rirPHHaNBuzKFpLCjHBE7qzntEgaiK9J+BdC
 VmYFEl+IDn7q7N1I7OwLzAiCUuMC+uGv8QNb1rcY7qdXEJqb+MQjAAG0psBttF7+LTP9
 WWzQ==
X-Gm-Message-State: AHQUAuZV62LxJ0vHnw+HB8/EIHQm2PN0Lzw11bAPkTEbvK1hFkW1fWDs
 wWjbLMzXSUjO7vkUBQ+7AHllgw==
X-Google-Smtp-Source: AHgI3IZbCxskQWVVo1IZckLkCdMnCKjiYibX7bRjSxi2TDNBAlaCutd5qcIe2udtSKAHBsMgtlxskg==
X-Received: by 2002:a1c:7a16:: with SMTP id v22mr1997032wmc.131.1549022879098; 
 Fri, 01 Feb 2019 04:07:59 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.07.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:07:58 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 3/8] drm/meson: add support for HDMI2.0 2160p modes
Date: Fri,  1 Feb 2019 12:07:48 +0000
Message-Id: <1549022873-40549-4-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040801_381588_2581EED5 
X-CRM114-Status: GOOD (  10.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now we support the TMDS Clock > 3.4GHz and support the SCDC Control
operation in the DW-HDMI Controller, we can enable support for the
HDMI2.0 3840x2160@60/50 RGB444 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 0ba04f6..66d73a9 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -848,6 +848,8 @@ struct meson_hdmi_venc_vic_mode {
 	{ 93, &meson_hdmi_encp_mode_2160p24 },
 	{ 94, &meson_hdmi_encp_mode_2160p25 },
 	{ 95, &meson_hdmi_encp_mode_2160p30 },
+	{ 96, &meson_hdmi_encp_mode_2160p25 },
+	{ 97, &meson_hdmi_encp_mode_2160p30 },
 	{ 0, NULL}, /* sentinel */
 };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
