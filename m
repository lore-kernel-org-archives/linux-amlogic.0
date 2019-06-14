Return-Path: <SRS0=Cb+X=UN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F64C31E4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 20:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128D02084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 20:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Awr6ena7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="E34K7NE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128D02084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHnV5H7kWsf6agFsySo3NsZnBgiSGv6IN0tdpFlKCfs=; b=Awr6ena7wT8qf/
	zDM8GtdB9fOm/kRAwhjXctmFTJn8SPpK1g+4LoUWNZ7/40pnte156DddbFqVXvcHmtJVghxn/lXlp
	1ElbCh29HClZUch+xZj7aOfXx9obEoqNEfmeCUOuVy2O5C78JSRn8QZuQ8y5OUTnXukwL9Gf2Iy5G
	P3bnPaXyrZReW2sQ5Mo6ddRc+n2Uo8a+sTFbaBVhN4c0I9T+rizb/wgiGAFk1dgnSylCUdnWbxA6x
	1td39cj9r/DhD8ovwfk5v09bBnoXQP0J28CDJ0GaF25joL7er6hmq6CM9BqryoSyId+GLLjjAm3x7
	K9QIzAhBViy3PmEsqS4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbsz0-0006Je-Ma; Fri, 14 Jun 2019 20:39:34 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbswJ-0003sM-1e
 for linux-amlogic@lists.infradead.org; Fri, 14 Jun 2019 20:36:49 +0000
Received: by mail-ed1-x542.google.com with SMTP id k8so5196460edr.11
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdjzPk9kMBtnORmrw6SV223z66CbONc15QxjD1QLasw=;
 b=E34K7NE2WPXVAuiOZH4PhkUzvtjNfPrvlndMNNRMM3NAm0JvhO4XEWzd3/HdePWWiA
 wyNHPJrAuBSUdHOIP7r4e7IBwsC9dey3CP/qAjCz89uiTFfoo8dqLpobYgMguP598PLV
 eOyiZFYNmXBrIdu+UMt9hhdrdWf7lgLugRTes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdjzPk9kMBtnORmrw6SV223z66CbONc15QxjD1QLasw=;
 b=dnAB/qIdIBpZUO70/adLT18MTSJE0rDrItau1aHODtX+Xq6L+OjZYPoEgHm9EjFoTy
 n0C+zDNP+jvgUSV2Ux4W3mxPqY5JRVe/Sa2p/Wa2cZ/c7/EhGNEaL54cS/m7CoqlwNfG
 cHM7Np36rtr2WB6F7XV6vkEdc6AS3FDqKhJ9VoxHyeeowo/WqSavOS+USQAItWs1Rid3
 G3CPyzV/cMbwYUWr4lBmThPFlB6GLQWmllPOC5YpyAtGUcxJa6nyfCrPXAYkOy8GMUJR
 lpaAc5TVvPm7d7nvGUIvblXYnX5chI8ZuMTOon2rgWXuCG/ZshiXXv7QGcHDKS41BzIc
 r3JA==
X-Gm-Message-State: APjAAAW89zOVtp6UvD0FWOj9OWsn2J1X2ULq7pZNIkS+kqucqrY1oKxl
 bMGyWKC2KP/erlV2XGO083sZfw==
X-Google-Smtp-Source: APXvYqxZ+2+MykTDVtttUpRVv7sYtN3XxhiGqxwDeeUAjjeeMfXPstSFGQXgpyvqmc1NAhQSq5h4Lw==
X-Received: by 2002:a50:97ac:: with SMTP id e41mr46669754edb.27.1560544605717; 
 Fri, 14 Jun 2019 13:36:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/59] drm/meson: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:36 +0200
Message-Id: <20190614203615.12639-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_133647_182670_3FDB7196 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

They're the default.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 140363f93575..37dca83d6eb1 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -101,8 +101,6 @@ static struct drm_driver meson_driver = {
 	/* PRIME Ops */
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_import	= drm_gem_prime_import,
-	.gem_prime_export	= drm_gem_prime_export,
 	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
 	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
