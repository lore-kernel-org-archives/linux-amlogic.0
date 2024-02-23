Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9084EC54798
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc1ek3X769SywL7k8qAtubeSHU22ChYtMkjE+POoqq4=; b=KBA8RqeyxbG2cD
	FxNoWC8ri9Caqr8WXMEV9FdRpB36S//bGkKTO5IaAkEJL1/KsEhOSD8XASlqJWpJzdlUpAOcK2/5a
	gcFHxz5OhHWd1Rmj0loSlzL7be2gcaQcWKeLOpy8EE/adYiVwO2qRooh4hMGGh9VEsP+o/HA8n7a0
	DIa1KseI0FWxqqpxyBuuNyhs+Gn1FmQU32bTAX4pDlNsIzKs1o03rkFqymZW9gmRHphOgD4ELO2XY
	rB0uzAeb0uhn32Me1fuY5quCuAdDyqkwWPoayB4LBVFIbHL9wYWLSaMgERTiiTIH0b2p5XhavJ1OY
	ufzg6ASuKxcjXrSBu8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZij-0000000Adzg-0wJX;
	Fri, 23 Feb 2024 17:52:25 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZht-0000000AdfU-3oRw
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:38 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41282f05409so4541135e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710682; x=1709315482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5asXBXhtOZ8krhmeWknGrfpLZd9XvhtRWxv+IOZLPY=;
        b=VC98c6ulb3jBl0L4g1GJCNVJx5+2XY8cpx2sPwZGQRwdaUNqMxRQCGLdbOk4WaUzSx
         BS+881rUVTepYsL7HXdoZ3A2B03iSzVfGfGFvAn/U8I2Tck2H/z7Kl8OWjBmOBcMUAcU
         Q92HM2IBabtbJ65HSP11435y3JJw0WxINfeaUkA2kH2XFWhzEpQ6X3qer37Mrq27eWP8
         ydo8I/sn+cDGRwx+KG1ww9IBNrLCKmZTYrCE+/BpvqtXiVVfmqDnbqmBFqqyDq2nEPx+
         2BYVQSbNzyRKsvdb1WheEmSo4fPd+jxsM6nUP8V1giBNidPDD27vpjzmuAbCaMoIjSMs
         SKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710682; x=1709315482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5asXBXhtOZ8krhmeWknGrfpLZd9XvhtRWxv+IOZLPY=;
        b=NEr//q6IoZZOEWclnSioeGZWBr0hjNyz1nlU9+l/3CVuCFQH+2DDCAeGedfB0mo65a
         pkr757VVNpu+Dj8sO70modBsz19nqdfA6J0TEgr5pGPkkpqIi7wUDKn7JJvWnokdTs+7
         qE6DCwhUyEuyvjdtP1si0eSoWCnakGuH50yiZWWR09eg6jkZ3oc15k2cT+a0cJshlWOo
         5/GweV08iqO9Y5wdVH/2L0g9Mqg9ZNIeqvxgyhfvpfhi+kVn2BgozW8yOWTdv+PboPdC
         tR/ZVztKVWjhdAZ+OENvVprTptclkdF7Tyg0J7Loz/pz0stFheqFgurBwaUprNLTRbzp
         bZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVujpN6+0tk8BlTmnUsz74XgLbscligHCLg0j/u+paj84rOXg4fTNgfcEl8FmvEK5a9AAfy+ISVQh9Kzg+WkzZrujGiW1Wfdz2KNJlOTXjPCBQ=
X-Gm-Message-State: AOJu0Yy4whH+Yl9yREy18bVznEoACDHIXXw1Gv1y+bFEJ5PltB7PUTUH
	69eU7YpbVruoqNJzYJY7TAXu1GoIWzQqEpl4Q+GcTDDCBUP22ZxGBbeAYeNJK4w=
X-Google-Smtp-Source: AGHT+IF55hUqrzLd0OS4Msf5Z4g1J7M8Fx2otOvbUPa75llthqZMYU+z/HGqcEn63wo2SAVnVI/2FQ==
X-Received: by 2002:a5d:6445:0:b0:33d:a440:636c with SMTP id d5-20020a5d6445000000b0033da440636cmr343739wrw.49.1708710682467;
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/6] ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
Date: Fri, 23 Feb 2024 18:51:07 +0100
Message-ID: <20240223175116.2005407-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

By default, when mclk-fs is not provided, the tdm-interface driver
requests an MCLK that is 4x the bit clock, SCLK.

However there is no justification for this:

* If the codec needs MCLK for its operation, mclk-fs is expected to be set
  according to the codec requirements.
* If the codec does not need MCLK the minimum is 2 * SCLK, because this is
  minimum the divider between SCLK and MCLK can do.

Multiplying by 4 may cause problems because the PLL limit may be reached
sooner than it should, so use 2x instead.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 1c3d433cefd2..cd5168e826df 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -264,8 +264,8 @@ static int axg_tdm_iface_set_sclk(struct snd_soc_dai *dai,
 	srate = iface->slots * iface->slot_width * params_rate(params);
 
 	if (!iface->mclk_rate) {
-		/* If no specific mclk is requested, default to bit clock * 4 */
-		clk_set_rate(iface->mclk, 4 * srate);
+		/* If no specific mclk is requested, default to bit clock * 2 */
+		clk_set_rate(iface->mclk, 2 * srate);
 	} else {
 		/* Check if we can actually get the bit clock from mclk */
 		if (iface->mclk_rate % srate) {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
