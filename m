Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E6FC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA7420639
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hEgn6FOF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MWcvAepi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA7420639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WeIwoZh5pyZZoKQEJcZBmMYbNVqlaP0FuignFStypIU=; b=hEgn6FOF3S3NpgAIYamYu2X9gR
	F0/krvHHF0sJppy4JpU/raD83kZJwe6ofWc1cVB1k7sMNXDL5FLTHlsK4BA6X3yjBtFqVgpkHy7zO
	0wJ/03njqfxvAGNUwp0GWg+hY6V94qjWouegF9bdgNvFFT3zkvcat+Sc9uS97ZWLtd7PmdWk3vn2f
	IHs/zItBCrxx0rF2vWUeb0k7wJVL4D78dt/k+sANIUpbkThs2+WrI/eecwsslbNU9eCpDp9+JD3N9
	vVA3/GjyjQ6OUjq8PykdW4Bd8CkHzY+B2b6NOXkKtxtQuiyGvFJkERC0KrWbLU45g6mOLWyeAWF52
	Awbd+OYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2a4-0001q3-C5; Wed, 09 Sep 2020 16:04:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a1-0001oG-Cq
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id a9so2934995wmm.2
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fqHDfmvrn1k16mVJQ5+b/SIXRz53SpIEt2htZWi6LBw=;
 b=MWcvAepihDTzFeQEhYY4dmVrfX1hYZrzB4rWEGRs4dmjdbtUj+2Qif01qedSuWuIzF
 pTWkOigok9A72v58KpF1HrnrSkw/q3gV/pNBzM6lsDcPtpzwJCjXF0KuVhlOMqmAibM4
 BNvWlMPLHGrYmjmq9cFMO84V6elPjUgSJ8rXi+n8phF5NJ/1ifTr68u4FfK+28F7B30F
 KG+s1lHKyfT1hW3fITFNV+T1cPG6rE7Dz2jvtP+F4NxMMDki7qWh6xf8J/yJzRRk5j0J
 5siS673YwqOMAvBMZZELYYn9H1wEUUvN4WMzsE2eYMOtKM74f29o/BQN8TPAj51/dUHU
 ikTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fqHDfmvrn1k16mVJQ5+b/SIXRz53SpIEt2htZWi6LBw=;
 b=jiuwik1dWWUCflQtZfTX36EBkkrKt7q9v9C26rhg70UckO7TEdPkQNC2AIXRXbI6Fg
 7yfBcRL5WxjDT0aG74Ny/FZqdohofIyfoPoqDsgNZUNXRWxDXsQ5Xtp6yS2HyPQ7ezjV
 +MmKc6CJSH914H1CGDXqz78ni0IoWd1sIOxuiLrpev7GM40TR6Z7rROCc8A+ZrFkqarP
 JN1EMaAbwglNNkUvbVprxaLPYkU4fm989bZZYmNutVgszFf4IYUId1Mg1+xgBW3cjAhZ
 nKlIgAHeU19JOW/y3if1n8yOLOq73kuJya4Q/KhNTuY1/QgMyPY1fSra3TFsKp0Mjrm4
 liEg==
X-Gm-Message-State: AOAM532i5ywKd+ITisZr3s7C6i7l00BVDLjuxcwoQ4NamDiC9fVyFU7V
 8bspiY71tgaIyc/icINaN7BXXqeukVwPP/my
X-Google-Smtp-Source: ABdhPJwPM+/b2ZDI+b2lSlT6ZtTWsjPKk0PA8OlwP8p9CqXazyikXgs/36KZ9HFCJYOviAo2mF99NQ==
X-Received: by 2002:a1c:81c6:: with SMTP id c189mr4178443wmd.124.1599667455779; 
 Wed, 09 Sep 2020 09:04:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, kishon@ti.com, balbi@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH 0/5] usb: dwc-meson-g12a: Add support for USB on S400 board
Date: Wed,  9 Sep 2020 18:04:04 +0200
Message-Id: <20200909160409.8678-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120417_561089_7AC2D700 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

The Glue driver reuses the already implemented GXL & GXM work.

The USB2 PHY driver needs a slight tweak to keep the OTG detection working.

Neil Armstrong (5):
  phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
    Families USB Glue Bindings
  usb: dwc-meson-g12a: Add support for USB on AXG SoCs
  arm64: dts: meson-axg: add USB nodes
  arm64: dts: meson-axg-s400: enable USB OTG

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 +++++++-
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 51 +++++++++++++++++++
 drivers/phy/amlogic/phy-meson-gxl-usb2.c      |  3 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 17 +++++++
 5 files changed, 101 insertions(+), 2 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
