Return-Path: <SRS0=iDWB=3Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72DEC35254
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Feb 2020 11:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7562085B
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Feb 2020 11:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/rJh1uw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wI13iTub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7562085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8vqMzPFNpDivFsWy8YvSli12eQFuWslyCMJNsDEZaac=; b=o/rJh1uwGf/Tx8
	WHD092EcN8MAE22vuh5+QtC3dyfzK/s3MFMUDsIXVAmhE4ulxvQfdnfySg0yEplbRb3ouEerFLAwZ
	X4uDdQu+TE73q34dvZasoAAfpbjQDR9CsWvlaPw6CtqEzG39edlMiF8HR+VAYojTj3CZX8ccKct9B
	D729CX+G2I+uPSa/Wb8zs9bTSUpIYLVosj5UEi0MxC57EqaoAsUWYAG08W02DLC3Nbwf3elRiMn1+
	/3+WEdxjaqIhp9juRlklUebvSxZG1q6sAr1LqAN+2JOG/byOoLmiSfkj3pKtxMQWZqzPBe7DSmAoc
	Iy+xA91/jroIYW3Jl3lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izIlX-00031I-QP; Wed, 05 Feb 2020 11:22:43 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izIlU-0002zB-3U
 for linux-amlogic@lists.infradead.org; Wed, 05 Feb 2020 11:22:42 +0000
Received: by mail-il1-x141.google.com with SMTP id g12so1567897ild.2
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Feb 2020 03:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pgwocbE6mhkA+OKhecgcAoXn10XYW3UASVoDr7OU9dI=;
 b=wI13iTubTuBMBiK5CXbDSnV98whJDiMVXtwTTvmUaPOouESwx7uSl+JRcgxKUj+5eT
 kJMfS4c0Wfmp0CUmxUH/AAmuoXPMshDoAXSsbdkRrl41dw5zes7AuPiBnqIb0t/heFqj
 vDL96yT5Z4hxVyycq/s0PPzY9Bpv1i0SR066Sd+d5Qk3fr8dxdqoiX3sg5oX36Ww6RiV
 JlYudq4/zIx+rlzxMBX20EwN224Ii5I9NfpFGhTTI+RSLmTnqzEfrOh9eyvUfI+QSbQD
 MppFNlKOlfnjy+btwdiXoyT+3vHlqJdVUHfXWn+ZXcT1KOv7iM+crNqzTlM/PYC5e39C
 aDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pgwocbE6mhkA+OKhecgcAoXn10XYW3UASVoDr7OU9dI=;
 b=pAx+8KI6VBrF79opWQcqriTiC3tzuPkontEHritRCCkjeat1cxOy/cnBEsuIWIKzu2
 wCv/ZOdYPRU2KpFufx5WXsNhGiImDA7AvkHyWGMhM+e77l5yUDwWcUV8pYUi5Da7QOZx
 F1TWn5lWpw4W8fu5sNYsansE6+4K1/JznKnlhrUumKKpMdy/jaE26fwJvfPJOdp3WwDG
 UvorywukTo7ZTMCMVEsybHGZjWgJKHwl81bBRja2ZJwvEIL31KkhgNLYsrwWoooo1XBF
 la/stIZYvzkFEFWS0ydUtC1ezhqf1SYxpGw+EYdtWZQNfNlnTQ97EpGrn8GVrDfIEdpt
 2lag==
X-Gm-Message-State: APjAAAWWZZ1mpE9KdrgnfrJgGFyo+ZYEH269dKTLXCkinhKTq6HizkPi
 5qmG31fUMs3XmyxiU6C7GSFgq47GekDBWUi19TjHfA==
X-Google-Smtp-Source: APXvYqy/kucw9v8LMt0yJ4yjVyQ+82M1lz79DGqFguBC4nALluWsrP7cO1udl64OTrIrvtxDczxczFGsY1Y1pVHmmiE=
X-Received: by 2002:a92:990b:: with SMTP id p11mr11299858ili.254.1580901758511; 
 Wed, 05 Feb 2020 03:22:38 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 5 Feb 2020 12:22:27 +0100
Message-ID: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
Subject: [PATCH] pinctrl: meson-gxl: fix GPIOX sdio pins
To: linus.walleij@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_032240_173799_6400591B 
X-CRM114-Status: UNSURE (   6.81  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
any issue so far because devices using these pins always take both pins
so the resulting configuration is OK.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 72c5373c8dc1..e8d1f3050487 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]    = { GPIOX_0 };
 static const unsigned int sdio_d1_pins[]       = { GPIOX_1 };
 static const unsigned int sdio_d2_pins[]       = { GPIOX_2 };
 static const unsigned int sdio_d3_pins[]       = { GPIOX_3 };
-static const unsigned int sdio_cmd_pins[]      = { GPIOX_4 };
-static const unsigned int sdio_clk_pins[]      = { GPIOX_5 };
+static const unsigned int sdio_clk_pins[]      = { GPIOX_4 };
+static const unsigned int sdio_cmd_pins[]      = { GPIOX_5 };
 static const unsigned int sdio_irq_pins[]      = { GPIOX_7 };

 static const unsigned int nand_ce0_pins[]      = { BOOT_8 };
--

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
