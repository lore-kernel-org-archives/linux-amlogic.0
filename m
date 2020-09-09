Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCB0C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 08:38:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C95B207DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 08:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3D74iTQi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VNiAEN4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C95B207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EeabzzbXXOtn9y3SD9smK//lJtAkWDV6+yFqmsKKwU=; b=3D74iTQifONpFu0N3EAnxKphx0
	2g+MhcthBM+JTO6tsp8sE3ktBUxPj2qjmytquB4m45N/RIAfIA/zOixcdOcPSm8zu6PJuV05K/xUl
	PiHfKxm0uUdsyG+ucT2Oh0YSmjJNLhgLAm7FNBWf46CNqoJ9hW51pbjAhrJYdQA4/iZ0h3vOodoTr
	PEQHThgZX8L/jTspGwguEKu1pByl1yRBMZkj8yCpWfmM3HFaLMjZ1yGpaLGNJvEA2NhGyKCqP5My2
	y83aPQAwopAd0Zb7qAqLCaipeRhx9Tx0PgAl12E7MIoO+O786i9j9cZsGCmFB72w2hc/MQ1mKDSu7
	1oWoNAAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvcq-0006al-LZ; Wed, 09 Sep 2020 08:38:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvco-0006ZO-Aj
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 08:38:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so2003313wrm.2
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHQkjp+Ul8wul3YrlRDrBucDkyHt0QKEfdiQK6HCyts=;
 b=VNiAEN4udfbH4+C0R/M2mp5yFUqGIJP2zhlm05WWisyOSOFH8hDUZB7/EKeG2LMjtT
 CSfsKPwjr1Qb092qdjEVwoLDwNpPcxSfrYME4Gq8kZ3ellS0OnyCUSsf9IKqjs9GlCbL
 UdVFVkacXEiQl/Bj46MK+uGD5tUD/iJkOzAFy7IM3TofGDGH4XidqiJmcRFbhSqaZje5
 bElHkdzvMC+h94i2zrlnHdfLI+YQtRo+e0E4CyRazv5X/FXhS+EUyojN9d94cVLo6iWc
 EJxv7dIP7k9ioorDHKv7wOk3RBPKAUq4GjZkaDRAbrjy4OuCwuIAm0WZ3Nl7GOwKH0Ms
 JvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHQkjp+Ul8wul3YrlRDrBucDkyHt0QKEfdiQK6HCyts=;
 b=ijcaF18j83wZY4z4CkN2BV0HoyPYtDGgr6XEhgDH8Cvs/OeODVYr4Krjwytz5G//zE
 jTxrxjx7YKKEpOuBMonV/BfRDZbe2puFeXoS8eFrtWuIUMAhpfCwj0VqpYWd9Ia2m6Jy
 veuNkb9w5o/MBxbg3oBbQrEfbIBEsuluY9QeoLflYuOsYyWDWt+XBYxw0gbdZzc43YYK
 +M3dFv82z2CUJcSBMzSW98Rsdm4+YdiYvXPYvOWeMqA6w4u9p9ma6Mfk+/ThEpPnil22
 d3C3MwJQZea+yO/UDcvb6/eniXXuQk6aisC2kUenk1gZiYQ1T+cnxG4ngpGOBOhAiE9/
 j1Jw==
X-Gm-Message-State: AOAM530/8ahVh77DthSoTlQtpMN4owp1Otvxo0EzQtWl8nCaavkav2fE
 w8CC/QsSoe1LmBuZejtUoYga7g==
X-Google-Smtp-Source: ABdhPJy715CrU6E8EgLhwBkVRe15wumZzEjDxPVMrDaTPbg4r8wwa1dSrjfVxSI7XmOReFGD8GkYoQ==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr2568628wrw.190.1599640719478; 
 Wed, 09 Sep 2020 01:38:39 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id g12sm2909022wro.89.2020.09.09.01.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 01:38:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: alyssa.rosenzweig@collabora.com
Subject: [PATCH] drm/meson: osd-afbcd: enable XRGB/ARGB8888 on GXM
Date: Wed,  9 Sep 2020 10:38:35 +0200
Message-Id: <20200909083835.8240-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_043842_473529_38ADAB34 
X-CRM114-Status: GOOD (  10.50  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This allows XRGB/ARGB8888 on GXM following AFBC support in panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.c b/drivers/gpu/drm/meson/meson_osd_afbcd.c
index f12e0271f166..f8399e795d3f 100644
--- a/drivers/gpu/drm/meson/meson_osd_afbcd.c
+++ b/drivers/gpu/drm/meson/meson_osd_afbcd.c
@@ -58,7 +58,9 @@
 static int meson_gxm_afbcd_pixel_fmt(u64 modifier, uint32_t format)
 {
 	switch (format) {
+	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_ABGR8888:
 		return OSD1_AFBCD_RGB32;
 	/* TOFIX support mode formats */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
