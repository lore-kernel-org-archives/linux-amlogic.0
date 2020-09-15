Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9CBC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B2220B1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSCJ3IXk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ALUSvXEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B2220B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/WM1fX57xrfJjX0f1V6dGoJ/ek0k6VclXKv8gkf9I7A=; b=kSCJ3IXkFRglx9VltCx5X4BhX
	0klIuhSAoGLEY/JBAo4t4Xy8VbKIrL5wO9U0arAfJHUrOtgve0T1KjvDUjf+4cF/LEQb6Iz4UODn2
	Uv3BP2v9KCgoqwiL/aPu3owMjEec5pUzJpkDV5lTCz9CggaX2rD8A57eYzDHI00btG2O9zDNWKZyP
	rYnoK/1K8M2IQTiqFUfgKNSQbgPKTVaG5z5LJkyXe5VAZCLxcxhHqrMQVEWJsFkPl71i8ZPHt71fo
	S39PIC4hMjrXx2XIkPnXd7IUgbXAkigfFtr/qZ7Wr9eQbiMou6sjbS38S9AiEAYO3JMuLBX+lEYxQ
	dHSzO6UiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI9vh-00074q-VO; Tue, 15 Sep 2020 12:19:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI9vd-00072G-5Z
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:19:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id b79so3218676wmb.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=ALUSvXEave0lkRZzUeEbGO8h2GDfO0EU1AiDTv2SiPlJ4oOGdkbhRYuv9hFUcMyGSO
 alirB7AKsTW6bTsLpcZ92Ic+b9IriMXONlINaxSKzFIhfodhg/IoZo/6QshxxDEFPQF9
 +z0PYAL6PDisRD661B16WsycbbcZ61BeLzcMHp1/DvhmU7DKPBTRMHjtHkMn5RmafR2Q
 s70bVvvdGwrgVsJxh0OiBJnXJwxMlOn6mg4OI+PW/l4Ap6wUcG33kZiGkZP+yBlpHoqh
 dmfDxhWB79y7cZntYKBsS+i/WkkYB0rizS9oBJEauiIWy4wyfvIo6eZjTzxlPGxabafg
 ikHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=Zab2ulItzS3AhlJk7SeGMwq5k1nZ2e4yqCDX5sYnocJhcWe454vuNkbbub5Wf+gWO9
 0h3caVChCT1YnOS/TDdWCukN7OoMNn5uA16y9J0963K2Qc2gAHOJrXxXd/hJTtudQZnY
 nXpRoMi4JxE1svrByDg5DnivcDGKQON8nPMbrzd4b3zhgb16LijPWW0roATUHaUMGeqC
 jI0vg1o0nVPhjQSo5reAqrksEdsvgJ2FUVQ2NDOrCecTqs1BOsjry0gmgkqz1wthELot
 X5xD/8XYTw0+usKGvI0EgZ/mozUUyorzjC3X0OBw5RMP0U6f1vcl/8s8URIri9Zl5HuF
 Ju7A==
X-Gm-Message-State: AOAM531fXngJW1DPIRIgrwsNbh4TcpvfWkzMiz9kpBARK4rw8r8k6kU7
 vCEZQ0lqVKwhQuqpzdiIfr2iUg==
X-Google-Smtp-Source: ABdhPJyu3ypcdWMW/OyELVvdkIVANM6RtWY9v4+qY/DqA8slXt9wOmWk6s4o4g2lz7Q0ucEvuSK83Q==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr4634653wmb.155.1600172359411; 
 Tue, 15 Sep 2020 05:19:19 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: display: panel-simple-dsi: add optional
 reset gpio
Date: Tue, 15 Sep 2020 14:19:10 +0200
Message-Id: <20200915121912.4347-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_081921_252003_4E65DECC 
X-CRM114-Status: GOOD (  10.54  )
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

Simple DSI panels can also have a reset GPIO signal in addition/instead of an
enable GPIO signal.

This adds an optional reset-gpios property.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index c0dd9fa29f1d..4d08e746cb21 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -54,6 +54,7 @@ properties:
 
   backlight: true
   enable-gpios: true
+  reset-gpios: true
   port: true
   power-supply: true
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
