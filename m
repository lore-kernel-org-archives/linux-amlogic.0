Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A799FC2D0E8
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7571C20748
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqb+kedZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WFIzC18k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7571C20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vdaMcjN2o4nz6Xqs8bwSWOIxjRb8TcjhvB/EvyojMM=; b=jqb+kedZkVpFjt
	tWD6szE0FBZHJTVO7jXooe1nJSEsQMk96AHzWqBfTi1ETGPLkK+Mk7YOGJvuhvIbBUiZ0BTOm5WL4
	XD94XgqDBPIGzJRq8N0GnXZTCWzEsh4/ize09myRQ7medAWY12kXhga3DmCQV2iXCrtC4xNS/BoWT
	+PCna+IWM5D1jDZ3KhugFAmZa0dMGrErD9M6qb/XM3l27TG66j49nQH6AFCBIoLCMmCeqrBpzsQrH
	uU2lJDn2YYGcto295trkvHT3yLf/ZIKz35VQxANNccG2Ffa8tzjvOysbpjHpeYixuGfauOw/tZK+7
	mws2RAG7X+pzY615mKtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHSsx-0001PM-IB; Thu, 26 Mar 2020 13:49:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHSp8-0005qc-Bu
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 13:45:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id m3so7067450wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
 b=WFIzC18kvsFjgIJ4FAaGh/U0e0VcyLOupRhUbB4tyLL65yxfgasTs/rTmfpo/K+C8r
 PfCapoDbaqg61p+hAHE7MW7uwGmcPNN0d3wQ/3UWumCMIsY4I5Gu0s4TQqOEeflO4HDm
 Ttxvoii4MFFwJXu1wNm5hk7cnRzqx10VF998dfGBf81edsilQuIw7ybIwSV1XlVG32Wx
 rp9uaoLg/EeTOZni35QERf+9CqXseJQnfGe8h5UtBa65ktyqDSGuejQiF+iGS9Vdm4Ve
 GSEu8/QXFsKWm4phRr9YycLomXzQvo9aVbJTThCeKu3Hvs+yExIEH5hDMK0Tvf21dSaZ
 O4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
 b=EdveO6pHgtPPK4mdTMov7ipf6M0aQ8r1qtEXC+lYeOR2Ni0nvkEZHgyGoCzb8h5YuI
 jn5RzUYjB380sn3apuVEiI2lX2gJYutcXfzMQ7y/KTUiCOcYp+kjeZgFSnmzaNUGIvog
 dBMQe7EJCygX/RMgpgqB2OkNSJFmC/qJnbKl+EXJ4ZLLy36/fNGYL0mFyAE8E4FHWdkG
 +8WWA/eaYW/GItzNgGGibIiHXPY7JYToZBLFWcM4KX6g+PBTp134eK7C1ijMxzUkwpqi
 iNgTOBmcmZqb1UkWD9OxpmkjLWm9EPDX6af8KRsexwOXK8Krpl3M+Q6qmXNH6a106ybG
 oVnw==
X-Gm-Message-State: ANhLgQ3hsdk6+HCkzUaZTfmasGYV5JJTv11NWebBSeOToLMVDw+Z9gCp
 n8nmFPwuqvK4supenWc0N3rZgA==
X-Google-Smtp-Source: ADFU+vtDec2EyGWkeh0RHipBALtSpkGygZ/tofT3qFJR5rH8aahV1B9w9HjqJoFyqKyUoc7AtWokQg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr70540wmj.12.1585230328275;
 Thu, 26 Mar 2020 06:45:28 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 06:45:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH v2 13/14] doc: dt: bindings: usb: dwc3: remove amlogic
 compatible entries
Date: Thu, 26 Mar 2020 14:45:05 +0100
Message-Id: <20200326134507.4808-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_064530_586298_D0F7757D 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..2ef0bcc30648 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -14,8 +14,6 @@ Required properties:
 Exception for clocks:
   clocks are optional if the parent node (i.e. glue-layer) is compatible to
   one of the following:
-    "amlogic,meson-axg-dwc3"
-    "amlogic,meson-gxl-dwc3"
     "cavium,octeon-7130-usb-uctl"
     "qcom,dwc3"
     "samsung,exynos5250-dwusb3"
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
