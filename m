Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D6EC31E40
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEDB21D7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="acJ/Xdkj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lq9x8PS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAEDB21D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0zG5JgQw9IHCuyMTT8oXETsDFOP7/vRnMl21o2h8n4=; b=acJ/XdkjmsNWlnsMq5x/Qzk9z
	fvjJr2julQtou8tCOqAifqwA01aS/BHtOXpn/l579hQBeO1S6DUXTABXDJkogfIKT1hZTEHZjii10
	b89wdtUV4Zdh8dUZlepvNW14HoQl1jnlMpKI4Uxrscja+FIehNgGej+ggzPUUkxwyj0BJRIRS/WYW
	YBAkqFjTKFB1Fis7Vqr/aetXvms/OMC9qqsMc7DfnoFXc+b6f89qcSkuijcadWG8scDrj/NHkdcWn
	z4Td/bWyEK33Z/1p0gfQNmy2gQzbO8BG2CUVxmrzrKVQlOttjcnN7c/QWCifJuoFWR9CQ9b+WVhaE
	V2EuelK5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI9vi-00075G-Tt; Tue, 15 Sep 2020 12:19:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI9ve-00072y-Dp
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:19:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id l15so7974732wmh.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=Lq9x8PS6ikykudXTzqmiSjlkw1Mv5Fjj4FKyQyXpGeeAWDF9A9ovPyTjb3Da4qoZun
 0Qo8bZXk2A2lRtM0JArOOu82jnPkup70fFXg/EEeL7/tGd/sSGimI8b8CSJ6Epc8heO/
 dW0IioLCpj/OBwmHmNCYc1TXGLCqSD/6EomeJWbxHNdQNcf0QWyxXRG/UfSnTIS9REVD
 yXDRxOzEUYAIpyaO4xRjQxrFnS+f11Gin6cKWKlip0nSwAXkI4tIdX9PcL3AgppY8tmR
 aKdTsPcHucEfk28DnxBE+2jvIqN7Nzx+Ti8b1c1mjBtsjgDQPZns2rU9G9yALoi1dnnt
 pLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=R86LPixnsSxuQY4pgkaGWKuDIMWWFDzZtt9rqVZGL2/Uplm/ercTP4T13qOb9EJMWy
 UZr9bXZDOc1/nqldHMLtlSUqt065nn6lVXle9sBEORe3gu9pZMcm9HsM4wEq6dgs5Bj2
 +P16GBaexKgDJolDOOW8u5WSu7jB9qrYryDSWxzCWiChKNOXw1qzhT0XKgHV633ny1Yi
 /PeUNesBZ5lQHNKhreXdsu7pB2YOK6ZPY2wlbnbIvew5NCAQqpByo//gv+lj/Qv47eGo
 zjdD80xtJa1y5M/MtBuwAn5EgTqX8iNrhGTAsLxogr2nkoNcmvb8nwQrH5/B+u4yL7GW
 4R1Q==
X-Gm-Message-State: AOAM533JNnFpEgI003ok1cbJiIgsHwP1qRhzX4pZNkioQONNEPXn7KsL
 mQqq6ZtYEYU0Bb3K1y5bZxDNMw==
X-Google-Smtp-Source: ABdhPJzfh8abje87LbHn4Yy3eXAdcq+orthOqFQV/rOJWuOe4E/5vFnXxQuTIYJlbMLLAVPJWsKNWQ==
X-Received: by 2002:a7b:c5cf:: with SMTP id n15mr4395014wmk.93.1600172360770; 
 Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Date: Tue, 15 Sep 2020 14:19:11 +0200
Message-Id: <20200915121912.4347-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_081922_513214_5B9161F1 
X-CRM114-Status: GOOD (  10.81  )
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

This add the bindings for the 1024x600 TFT LCD TL070WSH30 DSI panel to panel-simple-dsi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 4d08e746cb21..a29ab65507f0 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -47,6 +47,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
+      - tdo,tl070wsh30
 
   reg:
     maxItems: 1
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
