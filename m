Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42323C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:43:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1E66115B
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1E66115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=30KhXMB6Gn3ygt434uba+LjGxmCXFNtYXRypBIPRiDA=; b=Cvwcu6MZ1h66U9x9pfoY0222N
	eXkYaDBctMUW6tq2i/+rOjY0L/DPjCOi0we+aolqpZjcmYYUlYP0AS3M1eFVUMnwtjFc/tRE1r4vS
	76p1rSr4b+nrEKfNGeg7+Qq0QX65NrBzwHu/6Mdr3xcAK9zhPPTkAOLj/4d7xr67sSQ0UlS9zNsNE
	Lz8LLLNlOOcJqgiZAnfyp/iXV1lYnGms5R1e3ZfBWQGYHBtA/hC0pX+tbMEZMpNUXBaqCRPUc9huD
	Stth23z9fe9ykpikxO7USf1M8HaItA6OIP9PpikaCFugpgZp0+sS97e/kYK30eCyA0KejA9xZwr+W
	W9xThoqgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL0K-001aYI-8T; Fri, 16 Apr 2021 09:43:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlP-001Y0k-Ku
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 09:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9BqRj0LNCA4WBYZmT+NFPaGLh8/3JIeNWN0kNZbU1po=; b=NBTcMigJwElrc3lfRiO0n+kFnV
 dhW4pcUUHZvIXu2L92dJ0iNInFIBypND0W/3xtASpnn37gZkKdfspb+7YD+HKQIob1/+VYAvwlV8K
 OnBnGEGPaD785V2h8Bk4CJsYCuigZxF9/O0qlyw8FybhmoHTWpUNrEOPNkxkqsYAhn6Xosyi2040u
 rg4bT56JFjBOrKx7ZEkS9dyS7zOq+dGyQ20DxRlIxFt4jK3Ps5DOvC0GJ1nIbNoIZPrw0n3ZsZF9W
 +8A/hevE8Yn8A+fu0TNT1Dm1GylL6i125dbFBNlbT/zUOa3rztiOOUsc0CkMY17UZ5G5wWUHi+RGG
 HfqAYpnw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlL-009Ezo-VC
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 09:27:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so16121568wma.3
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BqRj0LNCA4WBYZmT+NFPaGLh8/3JIeNWN0kNZbU1po=;
 b=p9vuhEWJ72/1jKNusXS3smwfCyriKDrf1mSy+nnr8fQsMoiNn1NKy7ZDKbn7p+wwtc
 Y7ZxsfaoIA7GjjO56ZWve3BjkwgisWOwzngPF/zdmhLZHX4ztcUbItMM/gtSAQzkeJJH
 T2C7TyUqaMAru2a88UqkUjsLOufrmb9e/Cz1fgQYBZygowAB+sMz7sHfdFhAdVksHepW
 Cr3K81jRE25GB4khUmPkhPovAMTJO9uBvP5uadZ4NH9OAdRo/yck6D8WO9EbqxW60MaM
 DpgFZsAwpIKy6+qU/6tHRjiqperbiltfKqbJycwL/cFeG+8NiguT7z+7YtZdQ0j0R+9f
 xlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BqRj0LNCA4WBYZmT+NFPaGLh8/3JIeNWN0kNZbU1po=;
 b=AU08cKBtP3Vd+vPW3XkRBcbmoskW/2bi2GZWUfGkwgylCPV2WcX7ofRE4O9jB0zhSU
 on9zTiH+6pPk/OLta6OB6Tv4BHIZqb3onvjear4mmVhr0MDDOrnGcPUUVyZa4fjhUErM
 5vxjGh1MHyxHQHjBnqiUSW1NgKK4ZobmvHVhYJ+F4PmzCeriV8d1P+tvKw3PMhBod9xN
 cXy1cBVr4X8O4wd63r+DKTPj1dp9Y6oAw7ivATWy+1BsektSR1BZuw98eGxj35f6LtYc
 9WYrz/Bky79dC+akdrNhS3sRZqGbPQ+Ay7b5rfIChl6G/vlGoHKA03gOleVajUHymqn7
 cYQg==
X-Gm-Message-State: AOAM533SGgd0T6cFi0Nw0ONjemE5Tx/BE9+vB2ZXLech3Aq/OTVy0kk3
 NUYUBfVFPuWBNqz6QNUdUwX3hg==
X-Google-Smtp-Source: ABdhPJwn2tFqclBip9+el1SG+TFDi6VD+1YJ7fmLPq4JrBkmfmzo8sBE62ixZffYLJeBE0UMs5auUA==
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr7270490wmk.50.1618565262461;
 Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] drm/bridge/synopsys: dw-hdmi: Add an option to suppress
 loading CEC driver
Date: Fri, 16 Apr 2021 11:27:36 +0200
Message-Id: <20210416092737.1971876-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=Y2Kp96dW3X0U27vNrMM/XkOOWYrIUuOu1Mi+zc7UuTs=;
 m=8YzxMzRM2R/oOFCOZbnFjWww/0CRXwSKJOS10A7bahU=;
 p=In2Hgqc+nqwSrOrGnpYjxqY39B1rnskpZvUG56iaipo=;
 g=1623597293b4caa25ab43c3fbd39773cfca1dd42
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB5WDgACgkQd9zb2sjISdF0zxAAsPF
 S9X840FovT4celkzqEHde6wQVRpNvUWE4KfpsyuthouG4Ogh7m+mtKyMmMmQER6NI98m6UNn3Xbw5
 Qx99KHfaJJIDzeVKrURJGlExHSEpMuPeHdJ0RAe7bLK9WQEQPtzxAOjV6Fv1laxc0C3c0dOfy8vr4
 JZX5oSKvz9oZ6X4ORBzl2Ighs0m1oNE6+fVDA/Go3PF9hK75cBWYIkms1I+K8tbvzEzZ/qZHYkJMM
 7MdZj+Z8QXTj3HtlH0D3/Ir+WsE8g6vWtPbpiCYZQN20Qba8AIbNzlVgl5W4Bp9Ui+L/fbej+SOpF
 aEBcnw6wNLiKHAL3TxQDO8vkBR+JtaUespcIgE+/lqPeRJ7hsAfbsopzmkOz7kY6HCLvbAKtSlZbZ
 DhO86B1AKA7zjpTtuW+LijHIpzcK4kY7MRwuh+pFxFjOUv35K25z56vjnxJmLjo6zKyuhDR6WiFAY
 gscXpmhObHHjk36uTWeTJr87NINY7CH0pBu9ZFSzSp01gkLMx4phDLjm0+JayYtEWb3C4TQ7JEMT6
 83Pdk0v0cAmx9Zef/LH5+R5kpZDsDpIJ7MeGQOrHUqbzKJF7K9EFKhDwaxXbSJKhCaEp+AKawxo1e
 xNymIxJyVDqU92s+pABPeTAYzotm3k9rcTGAjvOMAJe4zZlBjgZxL2N8piBFhgP8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_022744_010165_9C8B6BBC 
X-CRM114-Status: GOOD (  15.64  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.

On some SoCs, the CEC functionality is enabled in the IP config bits, but the
CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
confusion when the DW-HDMI CEC controller can't communicate on the bus.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dda4fa9a1a08..ae97513ef886 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3421,7 +3421,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (config0 & HDMI_CONFIG0_CEC) {
+	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
 		cec.hdmi = hdmi;
 		cec.ops = &dw_hdmi_cec_ops;
 		cec.irq = irq;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index ea34ca146b82..6a5716655619 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -153,6 +153,8 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_phy_config *phy_config;
 	int (*configure_phy)(struct dw_hdmi *hdmi, void *data,
 			     unsigned long mpixelclock);
+
+	unsigned int disable_cec : 1;
 };
 
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
