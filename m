Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD4C3064D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uJ5FAnCDPZDU/57qiiFH3AUA1DdDOqSECr8ygfQHRQg=; b=fKPOns7tguIF+6
	c7r5j1H//wGDvANJLOiTGZ6hEM1Sp2If9tXhC+zB9hpYcD14mDY+KgYKNDtzGahgLOxK7/4k64/3I
	4W/aFnRnvzPFK0nGXHErXwBtOHi1DjIw0ogX5C+ujly2A66rhOdkNzY7kURcjYDKF7j5UWOGmWB1W
	xBdtBrIhEafXDBfqd+J+sNxdd9yfABkvDWZY9ORgEOVrsQ6na8wORD/RKO42FHDimMovcZ20LupnW
	BYYQKFQfAUGfJxIyLDj/FP1xKJeoAymTvSmMU7ccT9wfD2VCmDjUa8nD2YzRFMm1QDkRBCL+inUBG
	GYVdDnIMQcB/mjJZrkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnXC-000000006FX-02Bm;
	Mon, 24 Jun 2024 17:31:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnX7-000000006E0-3uVN
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 17:31:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5295eb47b48so5398094e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719250272; x=1719855072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPcbUebpH9a97qWXq4TA9VXjoMaci8v0q9yhJMVEHEc=;
        b=l2So1tMRrnVHmkI26IIoCcW4fkJZbw47cEG27WfjP7aWedsMb/IvsNS04qAVmYilP9
         gVK3JRaGGL7ipxWY1GVT1T1bX5E4K4dyxJe8eZfxSplNx+1DUHstcvg7LwfylnMlX0+y
         6FWKt2bKk2SWBKi+2qY1cG2u6UCmqhZLgVpINhoWE6D2xBebOgIAg7WMByZ8BvFE+QAm
         XeFuNfa8dgOi3p1+n3gGi/I2G5NI+Msuz4n/3DQm9pQpwLcT93Eb1h3aCTRg3rcbr83D
         xbHbgRzCHsrmyqitiz3Fef+9a36KnsBv25JRIPwpZ+JQTk0wMcn0QNKy0wKiJgmIKGtD
         enuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250272; x=1719855072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPcbUebpH9a97qWXq4TA9VXjoMaci8v0q9yhJMVEHEc=;
        b=MHtUOK57UFojmyVIZh/aO3DAPqe5KIg9VtW3ZX4qmRVJP18dvBs1aJpEDaGIu15Z3p
         KlqbVExdJlIHUrwDXbixWQFa0aCbj00A5bzpG5hqHj6Bbyg6g3nuVsx8P0zMJZXcLP14
         r+0LJMunHLJ+Ve1xeV1rsNTUUoGgzTemtktkfIDYxZCeCCRUoS2aBRfQBHNTqwCIKqWB
         LNvWYVarXYIvsUe2pXtj3/y/yMINgzhs3UldfcnSNl6ZJEKQbUmC/6MPJxJpfcP7YX/9
         U2k47AfhrJSXN0KVPhYrMAaupM4IxhAYFJy84jdkluAjtPBuKBHObOBKEKuBW2TiC/ah
         7nkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXStXSXDjyincIB1YOnFzrcrUTj9sriShcedU0ZJO0jwXiPd31fHkiHEG1L1pHcSQgbK8EVwZiS5nOjdsy8Y9LUC4v00EIhRpfDHAKT/2IUZE4=
X-Gm-Message-State: AOJu0YwQOYXWxmOp6WvDVUZKkVpZrH9e6fZalGsSrDqNVyL6hQ7b86X5
	TlNdJDpDW/WfLfaSsbwH+RQoIGAUxTwLeKdFeYbk6bTAHU1nsy2+3kEe6akFUIQ=
X-Google-Smtp-Source: AGHT+IEE048c9lMdvxS1C2GH7HGqg2NC8yP2EE4vRfM+rV8ty+EL0J/9Kf/sLSBChaan4EUIwSKmjw==
X-Received: by 2002:a05:6512:6c3:b0:52c:83c2:9670 with SMTP id 2adb3069b0e04-52ce0646e8bmr4645039e87.69.1719250271980;
        Mon, 24 Jun 2024 10:31:11 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e4ee:e6f8:8fcc:a63b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4247d210ff9sm183742385e9.39.2024.06.24.10.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:31:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock measure
Date: Mon, 24 Jun 2024 19:31:01 +0200
Message-ID: <20240624173105.909554-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_103114_013786_13A3DF45 
X-CRM114-Status: UNSURE (   8.08  )
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

Add support for the HW found in most Amlogic SoC dedicated to measure
system clocks.

This drivers aims to replace the one found in
drivers/soc/amlogic/meson-clk-measure.c with following improvements:

* Access to the measurements through the IIO API:
  Easier re-use of the results in userspace and other drivers
* Controllable scale with raw measurements
* Higher precision with processed measurements

Jerome Brunet (2):
  dt-bindings: iio: frequency: add clock measure support
  iio: frequency: add amlogic clock measure support

 .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
 drivers/iio/frequency/Kconfig                 |  15 +
 drivers/iio/frequency/Makefile                |   1 +
 drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
 4 files changed, 868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
 create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
