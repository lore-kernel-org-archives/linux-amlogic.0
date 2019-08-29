Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF50BC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51302073F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXmvg2gk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g/Pf7qGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51302073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHdFy/ayo8H/5IRRw/UnJHeKS/tT6ctiOlRil0UVzvE=; b=dXmvg2gkLzOPvJ
	NB6i5HsZiMi2FydukKeZ70OSP1mrTfcdOOXKHR6dq34XgWU5Rm4Ivo+KQz7JDoVctliXszg1K9Vab
	KBXmL5t0l4Rsutm8RVvFK4TBFl+D9681r8yAmhreoOvDUiKpYzJOIzvJtL6NFj05UbirzUY/3t8+c
	WaD9G6Q86hjW5adpSwsJpBVPiZjjEfQtCWxIidtWAxE+UQLI5bBz4FlGJ5Cq34SV4R+xw8gTaHH7P
	J6HLp1z8byhvUy9Dpl3/zdJyYqq/oy0bpsqJTLpKFVo8TIL5UqkWIkfSLK2V4wtwh1v7nYHe+cQ3Z
	SxCInU3HFtBYO2FFiKkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MN9-0001W7-M9; Thu, 29 Aug 2019 15:30:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MHB-0007Se-35
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id y19so3879297wrd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoSuBXb+WvTUkGUKlAVpxjkPTORJSjTu3jSNV90NLlU=;
 b=g/Pf7qGIV7KZUR6RVpbTE9J9s5HaK0A+KsHIIhQGMF5QX/NvYm0sNV0Rz+sBtwB2ZA
 cGw7eiJ0+3KbxdKaXBfjBXUqq4qkfeifLbDIPrdJbrBP4oHTS7MV/S5YJnQFtiWrpdaA
 CE5yP6Wx0wq1viw3Lj9w9zUTlVdUmgGRi96ij/A+slAy2UE9m4kYDpzDhJbEpg1OieZM
 U6AJDm8SxP4wur9sYGenDR0ijU0orx6FOLYHDHgfuy3q52lvHXHyO/LUeEDcTUekypls
 bMqybSeeNw31pej3rr9Q+fGWxFidcyodAztpAOFmfA/2dvCS3EP8EOEBse/pXLI44X/8
 FbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoSuBXb+WvTUkGUKlAVpxjkPTORJSjTu3jSNV90NLlU=;
 b=txTAyBSVYf92Ez950ghvCY91iCvPdM1C9RlFasE8u2eK4Z82zBfYGfQDHYl5721ulq
 Q2XeVdNxqiE1uuoHDUjzxpbT+9GnbDAKUHdrI1MYqXGgEcw3fpKDGH8LcWfGRkH7Xtl4
 E1FiISG3fqwLirxACsCAgESKziK013rpjFGOuH/PGwv9Oo4sD993tUJkr7wXYK5Rlga5
 T5iGRNw6NiSeVMELj5c1hAbviTQGYinEYqQEBDtKiYKiW6NqA7o7QDTrI+Ifr/50sQ6h
 +UYMLCZjU7TFiHKCH/Y4hZ7PDvlz+26wFbuz9pLWq8c8y4Nq5iGn2hJEVEG13xGJ/9Wf
 e5Vg==
X-Gm-Message-State: APjAAAUegLLSNnMB+Od+104EYJgV438F52tpVzxTXnYPk+bfSWL9PFUZ
 R92efePN8YB24DpB4wjXmwOljw==
X-Google-Smtp-Source: APXvYqwNdnYUMuuMpA81ydAVpyhFFcztV8yWQ7nDKB0YZRMplk7ZmJWOz9Hobv0twRJ4rfQ1m7uAyw==
X-Received: by 2002:a5d:658d:: with SMTP id q13mr4854956wru.78.1567092231782; 
 Thu, 29 Aug 2019 08:23:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 10/15] arm64: dts: meson-gxl-s805x-p241: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:37 +0200
Message-Id: <20190829152342.27794-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082353_830952_60C7A9FA 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index 3a1484e5b8e1..a1119cfb0280 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -165,6 +165,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
