Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7CCC3F68F
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4A622314
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQN2Yyh8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nuTjaVVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4A622314
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9om1bilWeKCTMTYsvP1a5ffEzz0dAyAw2GFApcq/G0=; b=rQN2Yyh8wRud2o
	3tncsR6CsZHeI5eb3e0i4UFRrKXVx9tu4jQvjvTZw7OmLq0Lp+o+Pnruc2qL0EksmGh7b3CKQ+rtC
	bPvWGy1/6fsPQY1HQHCaBSFs4TXhlbF/zbGKe2EVO0qMs8VGhe2veFVpirLexnhVXRpXNRsHIhw85
	EjIjD5tJIoZqDbW7+in1vP1bMhNiAn3s2/+jpj2hLEJWTfjq4+FcOdJeup1rjCGbsyCLnBOCCx0QO
	z19YHsjPpHgzUwsHErXNe///AtU4d6SBs42tgFYms1seO+XBguKO0qxFDQxXJbrtZXO1Z58tE7JDY
	8SRkD3p2GWYKyPbpPNRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfk-0008H8-Uj; Thu, 06 Feb 2020 19:18:44 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmfh-0008EH-C6
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id t3so8560466wru.7
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfwwSgZBSRjQLTS6nz0OrfuIbfyqmaLe46Sq7iiWS8c=;
 b=nuTjaVVr5wcwTnZqfAsI/wPKCTvbOASiVjKWSq+spZCIb/y/vJbnCq+XxMnO94worw
 qTVv8ItgHInBYZxkuBb/xU0IMMKcCjbTWGgOGj6R2Swso7EiJ62AnQ8kd0txkrFL5Xza
 4lC4yHORnPNZAidzUdIjUxguEKhwQpHvzNqvL1EY5tZutgTyuQYoSWnRyK128d3SVFcN
 vGNAPcxUtj4bX4NPnB3omZAAd6OF3VAD2MhGdSSGRwU6Xdt9h8aCV4G8X8XcZKAKaBhG
 X2HyyUfCnjXm6cwzLGYZDjwDTmevBIGsDOHRckrHSdSYDuFdMIyeHYZ1kCzOnHPhgTCW
 giLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfwwSgZBSRjQLTS6nz0OrfuIbfyqmaLe46Sq7iiWS8c=;
 b=LlMzR2izGX3PPR33xXkNapUL3BfxdfNnnteWQls7LKNiPv1MN0Wf+qE6X41+uXazlV
 n4H9aPSI7kJNYfYKs2ZLGitrxhzqWafvKXllwOy/2558fSqKXH32zVzRhsbRTGCO9uWx
 Imsn+UHWDdG1t5WO47AVRqUpLo8bVefSeIXXpGq12hYKqwCtielsbHpZT+3koeS844bF
 vXUMag9WWmh/cedW9P+cO1Yvxq3PEYvOBFdxFRDsj6rkEKZbvx7Ej+UAibGcQSlidKmB
 gA/OQr455t+grzlpRO8kiNxj5hsWoSpiaevtnRL3IPzKqQZyejOt19KfE4Jw5+vDz7pL
 /Y/g==
X-Gm-Message-State: APjAAAVqjWsrZXjpJFq53CZWCvoUz8deuDg6yXoj5zJGvXObQSPiyYQh
 0sZfgZtw4pb5mtmFMkkZ3RdYjA==
X-Google-Smtp-Source: APXvYqwVZMBEfqGjN2j0fB5MXvXxRI+9+Sp2L8ylMlDIx4Zc4gEKynwt2gn9sTqQNabIC4jgkHTQmw==
X-Received: by 2002:adf:e906:: with SMTP id f6mr5259501wrm.258.1581016720052; 
 Thu, 06 Feb 2020 11:18:40 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector property
Date: Thu,  6 Feb 2020 20:18:25 +0100
Message-Id: <20200206191834.6125-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111841_407580_FAA298A7 
X-CRM114-Status: UNSURE (   7.33  )
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

Add the max_bpc property to the dw-hdmi connector to prepare support
for 10, 12 & 16bit output support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9e0927d22db6..051001f77dd4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2406,6 +2406,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
+	drm_atomic_helper_connector_reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, 16);
+
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
 		drm_object_attach_property(&connector->base,
 			connector->dev->mode_config.hdr_output_metadata_property, 0);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
