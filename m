Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AB0C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35BA02187F
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvKP3zBG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWL92tOa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35BA02187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d4oVhX6ScBJ34CWiwB6vPD5UPUq75zMpJGGdMm3Ijto=; b=VvKP3zBGg5TdWa
	f7nmkg3jCtv4Vtg6oDwnQaY6DZzH4Q+vEfkeqXzP8/xmKwTv1ywAlnpSjjEa+TXOQ1ZiITAaAWtLj
	g7ZMyAfj8EwhQTf+EdQ3X/G+y+5FxgLTonY+PoVYsom4oRN5/U+RdCCxcsgBWGg0OXugnXQoCafZA
	tSbsfal1iIsFOCrsSeMeA750VXhwwUYKLfB/4u0EBrZ7s+rCWnjz4VLtNKjlNjkbXbsm/eq9Rm9Jd
	2Wl7j1DvdIJkRkUkh972zb1xy6Bf4qu+zu6GeixTZhovtmc0bmJfFxp2+aY79hQUJ/lDPb9ht4cqt
	OgBSPzb21GZDy2XkjDVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8kZj-0000aD-22; Mon, 02 Mar 2020 12:53:35 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8kZc-0000Ti-W7; Mon, 02 Mar 2020 12:53:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id nm14so1663597pjb.0;
 Mon, 02 Mar 2020 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVlIC+o1X5elmxMJP01HUn8upQiGdfU1sajDVIWbpjM=;
 b=YWL92tOaLSZeNycLdLFxyiYmZMgQecJvctiYRM5E2vH1K2tV1g9ns3RtWySc7VDcVB
 lu+I4DHw1AQLcMmiYpGfikkJAvWt1qn7EHh6VfvVcRye9+kWerZ7rtCvpfJYCzxl0ADu
 NALgrdqJNF6zkOn8LWHmNdZ2ECtjgynPfqOyiIHkWw2bXXhomNFCHlkdovnPNQgSduZJ
 SODLphzf3FGoIkbY6cygVsPUEHkEsZmf7MQZ5SZqaoxLpeiaS/2jw+KeSAL5PyQgoOe4
 3SGO2mtSja/mE9lUxr/ltkOlX7xW/tpKp0CD22DG2XK9eAYzZ06UbLs5Jx7imW9YdzK9
 LIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVlIC+o1X5elmxMJP01HUn8upQiGdfU1sajDVIWbpjM=;
 b=i6902sh++PMlRIIy0/1LD0dj7xNYnL44d7RgX5LIEXvFIuJdjiqQbCzfXAljOJcBB+
 4/DowMV5+GDaca4Z/IMAvK+nGZthGHMqrHawJcxvGK6leQixWA/lCJ4fXZHIfX1tkhD3
 WeayYAKPpaUiXUfjsTTB6ue+GOI0suBakbxbIP6srCkFC6ZIqkfXlthkmiQfumMEzsta
 YPz/wlImPA6jncE2/NbQE/dg10t6APt5K1clSQkMG3rd3CzCV/vdGe6vSzanPbTq7Kk0
 iLvvnU5FFxTfqLn9HbDCL2D6NHvhgTHOt26DMzRXqkhk3ffMSIBuohlmquv2I9tFjvzT
 YVVw==
X-Gm-Message-State: APjAAAV3ncE/D7OD09x5bTCWDKtpRU4g++/qFdbcabSgOmzD917Wvo8M
 xaCCGFi4S4jG/k5/VSxb8x8=
X-Google-Smtp-Source: APXvYqya77N8AIuo7S/nQDOfsridOc39JQclxt2ko2cBQ4x1i6EExyxwGxTkdNnrd8pZDKP8I4C6Hw==
X-Received: by 2002:a17:90b:f06:: with SMTP id
 br6mr20963620pjb.125.1583153605167; 
 Mon, 02 Mar 2020 04:53:25 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.208])
 by smtp.gmail.com with ESMTPSA id p2sm2138238pfb.41.2020.03.02.04.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:53:24 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv2 0/2] Odroid N2 failes to boot using upstream kernel using
 microSD card
Date: Mon,  2 Mar 2020 12:53:07 +0000
Message-Id: <20200302125310.742-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_045329_057732_45293639 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When we try to boot the device from microSD card, the board will
stall in between, on suggestion from Martin, Jerome and Neil it was
narrowed down to clk not getting enable.

Fix the clk driver help booting of the kernel.
Any more suggestion or inputs are welcome.

Changes since PATCHv1:
	[1] https://patchwork.kernel.org/cover/11384523/
            drop the patch as it was not being parsed correctly.
            https://patchwork.kernel.org/patch/11384533/
            fixed the subject and message for core patch.
            https://patchwork.kernel.org/patch/11384537/
Changes since RFCv1:
	[0] https://lore.kernel.org/linux-amlogic/20191007131649.1768-1-linux.amoon@gmail.com/
	 drop some patches and fix the clk driver as suggested by Neil.

-Anand

Anand Moon (2):
  arm64: dts: meson: Add missing regulator linked to VDDAO_3V3 regulator
    to FLASH_VDD
  clk: meson: g12a: set cpub_clk flags to CLK_IS_CRITICAL

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
 drivers/clk/meson/g12a.c                             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
