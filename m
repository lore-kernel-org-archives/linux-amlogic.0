Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B14C43461
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FCB22403
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 15:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="coKzdtWM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aIi8RU3G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FCB22403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UhyRAx5LEArakQpPIzmo9OM4uSUwdjME5pbQMITghqU=; b=coKzdtWMdsI8QPrRJQSVShMLZ
	WsgGeOweKEndEdLDjfolNGuTdPLWourgHxEs1YVFKkgB5Qh6ozNqwkYAGPnHj1Q9XTzOnwTlALW1f
	wdkqqbU2H3/Brpvs0kfo6zv34IUd5JR0EE5ceQtDvrr2Ole6UyxkGJIV8Miofx0isHaCQlUh6VsQE
	GHlDZEjDh+8zsY3XNLhbxxNGdyf0KrjEcfwUX9lC2LFe7RR5gUqoBO38I65pezLEkgG3PE7v7hOD1
	QRMW+IDtW9zYC1Vulw0+BLQJQZSFa64YS01LeaK+f33EnpZltv5DGo9moz+XDXUBFge+FG169IlxW
	RQKgDWyPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYwy-00032m-CO; Wed, 16 Sep 2020 15:02:24 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYwY-0002sc-Ew
 for linux-amlogic@lists.infradead.org; Wed, 16 Sep 2020 15:02:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id s12so7237341wrw.11
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvushcHgW5x8Ci13qV/eVljqWihhBxbnLqYrlJGnnQM=;
 b=aIi8RU3GfifGkaYbMW1MYLTxAkS9nN6U2v50gcwQKZKksSLDZajirW7gQTn2LLnktm
 CyI0tpHPNTv19Qc5/cJj43pTaueffg0aGDYRumwLvKkRtOHUAMiREXV/heRedSuF6bWi
 NKtLgvbCgtSXb0fVCOqvyo4yoEHswt6g3uH95KDxuMtJ43vxcihOQoHgi+oi7fMYQmsp
 PORvN1HxIp9wQj9v8KwaJh/G4mvc4xhXRlymBrmVNwN6Dc1nER9V2ceAKr/nKyre1STa
 LxAQLCy9ECvJfm8GVhR8ZEAjgdg1Z7VDe2nYFT3HOojjlMjRmblgctWj9erSX2AImZ/6
 y98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvushcHgW5x8Ci13qV/eVljqWihhBxbnLqYrlJGnnQM=;
 b=AVuCj84UgH7G0emkZ/ShkfaqDAnW4H0kmru29dDIXI5h5XsAluU0pHlr7fUpp0gpSN
 BvHvKQ9xihKMnM/zka0WKSawLiP+GQLr+TflBC9XrwwAhL0zvlBPJUy+tJoVKEoh85+I
 maRLR9hH/AwXmvcqDVYyCsaLt00VDYg+815aUcU2MlOVvbvPNw9OLdJ/E64QAc3RaoQ7
 UIQp6SLrVfydfyvplDkzN0eIU11xfUm4Mqx3SvPSCbV7MB+lwH/4i0x/mFP0B1DnrG/w
 DaKVNurnJS6RfDdj6PROaj6BiH2ttCDlB2438d8YxipYZks/8Rj7FgqN0ZNfAY3gO4pw
 MGUA==
X-Gm-Message-State: AOAM532aXZuEhB67FuDf+reovowFZTFKi6yzjXjhEyI4aIgv3VU5qA0h
 446wnEAjDMMUcUm8w147qfGSyg==
X-Google-Smtp-Source: ABdhPJxoKhG14BSFQVVyTSDxEWd6rrCYlRRTJeLtOKT+FsHY/62gPCBcNexsNdCeXVc2WChrJeebzQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr26961296wri.256.1600268517315; 
 Wed, 16 Sep 2020 08:01:57 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 3/3] drm/panfrost: add Amlogic GPU integration quirks
Date: Wed, 16 Sep 2020 17:01:47 +0200
Message-Id: <20200916150147.25753-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_110158_561389_809A6334 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c8a87d164c3..6e5dedacb777 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -658,7 +658,18 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible amlogic_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_quirk = panfrost_gpu_amlogic_quirk,
+};
+
 static const struct of_device_id dt_match[] = {
+	/* Set first to probe before the generic compatibles */
+	{ .compatible = "amlogic,meson-gxm-mali",
+	  .data = &amlogic_data, },
+	{ .compatible = "amlogic,meson-g12a-mali",
+	  .data = &amlogic_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
