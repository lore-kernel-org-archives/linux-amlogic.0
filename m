Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5692C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUg1TcuqXElz7n6dGZZoRyvsdDJP/7RVpZq/LxUnqf8=; b=FAR7y1c41ZKZz4
	2wrsz3oceHe0RhfxYPrwyXwgzStPGRn94QbCkjaulgDWNZ1502NdGTXWSMtAdfKpWMf3TkfnH+H9M
	LeatqdovnVsUuTOziC9/9/cZJU1tail0HV49we8u23S3yNvUCCYsEm5MG+QpU69xnjoC0L8PAw9sG
	UBOt23iF7slq6AIteQ1/LsHPF8LfQF042hhy+jN9rRidZ5a6RvjaupYo13LdqumVjIqt3ygPVzh2Z
	E3ozq9410E+c1fPJ89zn8hGGzw2nxu1wdVKNhvkEhEhGUBMBn9WIz+u9KlncaEL+/ERTfQidw/MMO
	yyWnK3mmjGYiU1rNlRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtzXD-0021TB-0d; Sun, 05 Dec 2021 21:59:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtzXA-0021RQ-0R
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:59:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id w1so35083469edc.6
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3AnWy+mVImsPoWfiIuMG6Au3yFCtHwQVYr21g6LIJdc=;
 b=2vQAzbnneWi/dJ7qVHsqvynEsRlHsmojxV6FboORhzrOWZLH+vfu4GDPLq1cbeBaVN
 597eGNxXtDjhk4Go6uu35rJg5WRDQwGQJQbn4h6N2bJ64tjkcpp1e09jsEm0FEyOIyNQ
 1xW1Rrehd1HzLpvaOUTd08Xpbvp+GlGjgL8/kjWQerOUPd4HLoTaEdRvLlLXZronEowZ
 h5qDzo9PttQPpVBsbdby6OTY5KsF4nzqx6DFD0nnkHa1d09Qc/euvYym+lqZ3yfQenhp
 p3gjQ8BMJztow6DjkQgwaRtyl699HwZt07eOTSecxJkC2OeinP6hiwTEDHnQTVB8LaIa
 3izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3AnWy+mVImsPoWfiIuMG6Au3yFCtHwQVYr21g6LIJdc=;
 b=HlNLJbGvWMZs/88jlC62LSNauBeIA1Q490W2+E67lnOpZUMvodVX+ohEYN8tJ+jhlf
 ygEHaWUuOkLaTx9MGEnUmBahpCj09GqPwDi1TPgZwjsYNpbjU9vRxyVdKeGBSJA2srxj
 BI9WtwLqErARs7ZZ/onfhnmPpZjKKrITsxCnYSFj8e/9m2MZYmGUIUabTRaCZ81vvsod
 MRYzb3/L2yq1oCeE2mhW1UgjC4jJQFyW3ud4sFxiyYBbK3Had7pzl7PBFSfkTOvun+pQ
 UbKUGjtSWnXSH7D5XgCHz1O4uOCDWPW1LuTU2shmZxeAqmxJO+FZp93d3MSaU5aIl4DK
 HuRQ==
X-Gm-Message-State: AOAM531pG/XctUBQmW5l1DXCdDEFBBhrWxsK7Qxx+N0YbT/asEXKJRCW
 4nBxWCKXpDhvUY6L8ke5ywNnJQ==
X-Google-Smtp-Source: ABdhPJyrdhlAej+Y0j7bVwl22/TJv/4bsr28Ql2eGHPiPqD/W7PyF7tQAjNVsjJ+K+DEkbjNOQWvVA==
X-Received: by 2002:a17:906:dbef:: with SMTP id
 yd15mr39336054ejb.354.1638741538543; 
 Sun, 05 Dec 2021 13:58:58 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 13:58:58 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
Date: Sun,  5 Dec 2021 22:58:44 +0100
Message-Id: <20211205215846.153703-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205215846.153703-1-aouledameur@baylibre.com>
References: <20211205215846.153703-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_135900_071265_3A284AE8 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Use reset_control_rearm() call if an error occurs in case
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v3:
- Remove unnecessary reset_control_rearm() after reset_control_reset()
failure.

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 2b3c0d730f20..d2f56075dc57 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -125,6 +125,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
