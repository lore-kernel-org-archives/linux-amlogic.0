Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C7C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g+SfLl52oFa40EShCDTp7GjxamXvYRcxefVjgNwIpnc=; b=qVernTgdyzxbtb
	4ZAHkQTqdamZy7zlAy2buHAB2b3yw9FITUQx1PZSufyt1P/mLNXzyl08S64uJJfASPicL7B6aDQ1o
	sVvpbmUnRQ4Ln5ub22iW5K6A/yq7btu60y8UMRCXxTWvaNRRu6pw25GyAGLkHD4ZbQYRVgIC3SZ9/
	r9t7wkPoGLZpdUecHjcZocW8c4ENkaqa4+eoXxsSi7QiapsRYW3xLR19fFsuwl4j1vL4JrzF0pdTu
	v+ZLEzFEWAodi1A3C9kZFUglErV8BUJCWDj+AO+ntxOjUj2sQwIF1RmeXqeIBPsCPavc+TceF1wta
	OdGAOGprFN71C75ID+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8V-0000000B8gL-1PFL;
	Wed, 10 Jul 2024 16:25:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8R-0000000B8eF-0Hmk
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-426685732dcso24070175e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628737; x=1721233537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Itoi30as1ngZorM3ajNlP04W8GNqyHTX6dO5FHlioKM=;
        b=G+0CRSa96qR8+opQb5Fcn4btmL/aAVCSjxFc/R4XUK+1ZXCc8ozkVIKwqkPk5Jyzj/
         ACTScsDSXxRv6h2pd50szxZEIPL5BSyex26c7UGrvygCzesO/X2P+MQFRKddtNs6RaP4
         dXmMf+S/Rh60fYrkcy/5Qnhq99tMciu3bBm/baU11WL4N+avDrW6WLmJ5xD/OnfuwwO2
         HL31fLdIblGKmoA7ZW2az167q1BzY7DmfX658Cj2KW5Bq3juAhMh+H1ezDmhXIibq8/L
         TrQacxsi/pdUxrX81x8NNU97uepUtilyZPjJ0qA2rvDCfYuF6zBWDqvBOd0UK6hH8n09
         zqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628737; x=1721233537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Itoi30as1ngZorM3ajNlP04W8GNqyHTX6dO5FHlioKM=;
        b=tmqcVIrrVwLoCnGEith5ubbEK7bgBl5TNfAjrNx3nThC01xo6VuK8lnebuTGusp9vN
         4kv8HP+B439uEO1j9DEHGg0UKnDKLwJve6eFpb21hjNTnrrTGIlgRknqTxvHa8Q9xT4H
         jVnEsVcA2cToAnTUa6bl2T6Q6OvJQTNhIpucQtnu2V7jB/WnSjAwRTIFBbYRvfyT5/vS
         uSp1SNXjsrIWh5dn3MXPHmqh3oR7n3JI4Q5le3KAjq26wQul/4t0HpL9rVOiD51iIWAn
         HoKNfv13N1mWcZcC8eo5MVi4t/te/pZNM0/u2DwP1odZXPTfF8Tj47vWyLcGiyxdWDiB
         dxWA==
X-Forwarded-Encrypted: i=1; AJvYcCUQyEECRgAz+QSecyqKpLuin1VSxmFDEoh6wHnZu6TXXsaQRJJRB/PhpEJ/qf9HL1tH7OWniFwiCCdmSJ5HHAdx5WstzCgJ0EIfBtvcd742v6A=
X-Gm-Message-State: AOJu0YzzyYfB58A8TUrdix/XN9hN7RlotKWKoJwx6N4f9aIzvwq/Efni
	ISEC4XfZ4oWVdHOC50/8LzJxH4vVHIPVxbDDxDPdfQMMm5CjFNKKqD6hpnA1aBo=
X-Google-Smtp-Source: AGHT+IE1axe6GsiYtkMrCX2P5tM+A5QO04JhIFS46IYKujHwCFH8Z6rIpT9i8hI5EvL/mtX58GBxMg==
X-Received: by 2002:a05:600c:3ba9:b0:426:647b:1bf7 with SMTP id 5b1f17b1804b1-426708f151bmr40115925e9.32.1720628737303;
        Wed, 10 Jul 2024 09:25:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/8] reset: amlogic: move audio reset drivers out of CCF
Date: Wed, 10 Jul 2024 18:25:09 +0200
Message-ID: <20240710162526.2341399-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092539_127886_37516B86 
X-CRM114-Status: GOOD (  11.29  )
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

This patchset follows the discussion about having reset driver in the
clock tree [1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2
trees and could use the same driver code.

This patchset moves the reset driver of audio clock controller of the
g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

Change since RFC [2]:
 * Move the aux registration helper out of clock too.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
[2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com

Jerome Brunet (8):
  reset: amlogic: convert driver to regmap
  reset: amlogic: add driver parameters
  reset: amlogic: split the device and platform probe
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: add toggle reset support
  reset: amlogic: add auxiliary reset driver support
  clk: amlogic: axg-audio: use the auxiliary reset driver

 drivers/clk/meson/Kconfig                   |   1 +
 drivers/clk/meson/axg-audio.c               | 109 +-------
 drivers/reset/Kconfig                       |   1 +
 drivers/reset/reset-meson.c                 | 285 ++++++++++++++++----
 include/soc/amlogic/meson-auxiliary-reset.h |  23 ++
 5 files changed, 271 insertions(+), 148 deletions(-)
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
