Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6DBC41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hNjwRhmevqPSqiWeU2qWpSUQSPxBoV0bvFr3T2tslP4=; b=nq0JeV2Au7FSNz
	ZeUfVz6CnMl6mXIf8+IRZs+rXmX+h2KFTiC90aaicWjnij41Ask+V0OyiVwKI/cBxc9Y68DFdpSND
	YWDS45Lz3hneUrDKFNm2Fmq8UXDhGkcTRtftX6S/0yx3wae4t/7HJM7EZ7gzmQs7E7E2aDtHGczdV
	aR4NTJUAg2IrLj8FPrXXmPp6qEIHMxwwREZBwKHfTtbhpVBz4sZECe1/+n2nHJDNJ0WLyj2ttrVS4
	njJXBmBQlVZKvpcYreeo/gjv8gBbwaj/04xXfiP2UfnzX+bTVFzqALZglR8Nb/OH5q5UvrbvDtbjB
	1qKRsBzBdi1fbQJD1Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWz-005eHF-1g;
	Fri, 22 Dec 2023 11:17:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWv-005eF2-30
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33679c49fe5so1401784f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243842; x=1703848642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMtDAy1EXDszTwMTqqohVsilgzyKD7wGsQGS9hZLtqo=;
        b=EAvGAGWht6GzEaJdwvAF8qpBZ5I0rCHHUY9NGX3ODNy5LrAhYfkH3XjfbJ8x0bYleh
         84zEKPozI7kGs66TL7MSGESvPzKsJoNYL8RFy4bbVJbL1XFZvGDCQMiGP7IGqNlI7e+r
         hryCbGajj305tb/OwSCnIGk6UQy6wPwrfswiwN6jvoNSU4AQNSe7qgVKyDKynPa2d6KY
         TYqnQISijro4GNb1fiuNFx8aaYBHwlM3tu5P3aiRWOonTMobzgyCVKZ+XPat7d7Gh088
         8JBjk6Ocd8fIRDLl24i2eDotIlxDhfj+CL4WNGFp8IeajgNmGaoA1diZcitjntmB6agJ
         RhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243842; x=1703848642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMtDAy1EXDszTwMTqqohVsilgzyKD7wGsQGS9hZLtqo=;
        b=v3WWVt9jYXebCkQsB7fcyv61E32RcX7RcYhm7nwKJ90pwEnNN0d3Abx0YgraeoylI8
         55yUDL0+W3Xb0IgdHcHZ5/ATkgDaAip00ga3yguZk47ZmcPAPhoejvSrFcBO2R6/UGo4
         ZXF4UVD8FC3B9Zy4eAtYQ1noyh9WdTXyr2ZSueETIxDyindwT9QXTsr1tsj3HQbgh1WM
         DMOOM70OvthHsCWomRzNZ7edFcfKJ7noIdsDEGjuG/ONLdyGIpWKw/X5J2nkplbPK4bj
         GVMOIkLnbcani9uB7mQRYCJgODXq8TFVLIZo7e7Y8e2VnVtHYat9cDhXaVXZt22paKn1
         9obw==
X-Gm-Message-State: AOJu0Yx14JExAojMjGMf367H9G6XPnPRk8o/6FRbp3dfctZgKAkBNBlS
	fqXlVSdGLVdUfHTuGUFIHQLM09XvGNjr3A==
X-Google-Smtp-Source: AGHT+IGGUtKBAgABRxh1RQY1Fn8PPnFhYTQfQeBrQ50xlTgo3iXBsPVCM4jR12MyjYwvlX+3OKFDog==
X-Received: by 2002:a5d:4a45:0:b0:333:2fd2:8135 with SMTP id v5-20020a5d4a45000000b003332fd28135mr578985wrs.82.1703243841708;
        Fri, 22 Dec 2023 03:17:21 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v4 0/6] pwm: meson: dt-bindings fixup
Date: Fri, 22 Dec 2023 12:16:48 +0100
Message-ID: <20231222111658.832167-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031725_970773_4162C4F0 
X-CRM114-Status: UNSURE (   9.62  )
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

This patchset aims to:
* Fix the incorrect bindings for the s4 type of pwm that was introduced
  while converting the documentation from txt to yaml format.
* Introduce a new compatible for the existing PWMs to better describe the
  HW in DT, instead of describing driver settings.
* Make the introduction of a new pwm variant (s4) slightly easier.

Changes since v3 [3]:
 * Split first rework patch into 3 changes
 * Use dev_warn_once() to notify use of obsolete bindings
 * Rebased on Uwe dev_err_probe() change.

Changes since v2 [2]:
* Drop DTS changes. These will be re-submitted later on. Possibly after
  u-boot gets support for the new compatible to minimise conversion
  problems.
* Position deprecated property correctly in dt-bindings for the old
  meson8 type pwm bindings
* Reword commit description of patch #2 to make more obvious it does not
  introduce a new HW support but fixes a bad bindings.
* Dropped Rob's Reviewed-by on patch #2. It seemed appropriate considering
  the discussion on this change.

Changes since v1 [1]:
* Fix typo in the new binding compatible documentation
* Disallow clock-names for the new compatibles in the schema documenation

[1]: https://lore.kernel.org/linux-amlogic/20231106103259.703417-1-jbrunet@baylibre.com
[2]: https://lore.kernel.org/linux-amlogic/20231117125919.1696980-1-jbrunet@baylibre.com
[3]: https://lore.kernel.org/linux-amlogic/20231129134004.3642121-1-jbrunet@baylibre.com

Jerome Brunet (6):
  dt-bindings: pwm: amlogic: fix s4 bindings
  dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
  pwm: meson: generalize 4 inputs clock on meson8 pwm type
  pwm: meson: use device data to carry information around
  pwm: meson: don't carry internal clock elements around
  pwm: meson: add generic compatible for meson8 to sm1

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 113 ++++++-
 drivers/pwm/pwm-meson.c                       | 291 +++++++++++-------
 2 files changed, 276 insertions(+), 128 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
