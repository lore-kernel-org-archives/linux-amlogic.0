Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9AFC3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9cs+dVIhEEqonZ7c8lUixoL1SZc14D3nxiWqcSrg+U8=; b=Ji2sHJMEUxXyGR
	RwUGJWQ1hD98V81ebsC8B+OTwEIKyNLMpdTCmSF1KYsls5NckqqPmVu9QPq7tsh1BQoWsapIPNBiW
	NLzMyFqA/fFJ/mgFRuVk2VjWPHkHK4VU3SZi1qGDaVGKCIHfz/O2aMiYiow/pGV8pY8gz9thcLg4T
	arYMYZUnESbc58DQrWBkWXl4hfu+AaVSetI/dAirZ1gs0Jm3yuTgdjHybe4GCMIispx3G9MyRNWPR
	pRunoTGvSF7+WhaFqpkVo1EVH9egvPB2UCyfKtfBGFmGpdvy9GTchjpBuXId4tMJRbevgzA87a0he
	HrDDmzx/pc9ZT9ivlMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBtO-000000045G9-16af;
	Mon, 16 Sep 2024 13:35:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBtM-000000045FS-0HzR
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 13:35:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-375e5c12042so2431946f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726493746; x=1727098546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3MfcAsu1c2hdhyAAOmP28fyXPeBaWUwx//Su7PrkeU=;
        b=lxJwFk4HbDXENnrQNdwAusd3sCbjhwWY75zYocYnETDiKpsRmA0ZO0YPCaFlBrcSnR
         3BdkFzmHPj4O/U2Ot6d1Dl4rNFW8BLbT3MuDBQ2PGs5UVWv9d1kLzihGs5K364Ym4WsB
         NB+TnHHaUBLXFZsrjWTIdgV1uV+eQCjIe5OUub0LS9HLlmySj+5V3mGfMedeRBrf8lNt
         tIC73rihmO5hmmvaNveqvujJBMHS3Dc9oSL1bodVVlQg1gQ/B4L0kxD8oiS0E3+RdOa1
         ecg9sEAt/Mvtp4BX9ZyqhkQ9lAIiBuanzyAy0bkJuh6W4vlRd7wrak1yUR/odsn+mwci
         6Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726493746; x=1727098546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3MfcAsu1c2hdhyAAOmP28fyXPeBaWUwx//Su7PrkeU=;
        b=ghu9Sk/Rd68ZgjQUArsu5wK/7u4+gcA3/MyMQcWYXKgpbVpXe/YyPWnEXt5YcQ9wOo
         wJHJ/8P0i32DqSQ+do//wb1LB1EAMpvZJD3fcSdzEB6d8T/d5k9xto0ReYYUVvVNrWk0
         NAlAo/Nkyp3fFCqAbcVK+WurN3Kj/0idIu6fNcQy71lXz35iJv8b5AxxCFFoYZrkGgPP
         Pv17A7zZk/fKC5rrmR8cOQFK8sYpZKHCdIC4nLheNg9+sobjVU8Oadhi7d1lT+nlw02F
         RBQYVO2iUNhyGqpHdpha0tXdWPmwv5tpsDh8b2+Yw4dAJxduO9PtgATLVXMmZpPhKMEz
         o/Sw==
X-Gm-Message-State: AOJu0Yw+l1VVmr97ZbdFtKvy8WT0uOc2XnvsCRquJUylFQxhqkcoFCdm
	0eiptv00lyEraiPxMtUVyhppd3xGtySw8QNG4ZQTFIJlhAiDnQLZAKmaZw==
X-Google-Smtp-Source: AGHT+IHjIMjKfpDCW8Im5JQoHjl+8sIQFGGIWH9DkXR4vPt9Ce1vPYTWk4MxSaCPUw1UOUFrm8LOmw==
X-Received: by 2002:a05:6000:184c:b0:374:c022:fa76 with SMTP id ffacd0b85a97d-378c2d5ab83mr9319081f8f.37.1726493745757;
        Mon, 16 Sep 2024 06:35:45 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f06a4sm7196199f8f.23.2024.09.16.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 06:35:45 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1sqBtI-000000006hc-2rVs;
	Mon, 16 Sep 2024 15:35:44 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH v2] drm/meson: disable line encoder before programming the gamma table
Date: Mon, 16 Sep 2024 15:32:02 +0200
Message-ID: <20240916133530.25498-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_063548_129670_45F3BCAA 
X-CRM114-Status: GOOD (  11.68  )
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

There is a very rare bug, where the gamma table can't be written correctly.
It is possible to write some entries into the gamma data port, after which
the WR_RDY bit isn't set anymore. This causes a timeout in the code, and more
entries will be written into the table. (each having their own timeout)
There will be an image produced, but the colors will be completely off.
The number of entries that can be written seems random.

The issue seems to be solved if the line encoder is disabled before the table
is programmed.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
Added Fixes tag.

 drivers/gpu/drm/meson/meson_encoder_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 7816902f59075..15fd9df58ae4e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -66,10 +66,11 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
 	/* ENCL clock setup is handled by CCF */

 	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
-	meson_encl_load_gamma(priv);

 	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));

+	meson_encl_load_gamma(priv);
+
 	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
 			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
 	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
--
2.45.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
