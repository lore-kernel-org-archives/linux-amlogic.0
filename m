Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29851C34056
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F0220801
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+PAI2GN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X2e0sx2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F0220801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mzoi466IwoCLu/7cEzYZkyJVzxwtfN8umAL/SSnn6Yc=; b=i+PAI2GNQQwQU4
	1l+k4tCmf4L3D2eNu/IKt08dfIz8E1NPxzCvG/vFZ0+5WZr1X0D7Uglnl1A+KfJkfJoKLKgneEwfC
	WKh49a3HrK8vuljSPTkI2QWZLxsPx8uG7hxF/MHgYXHEB5yaClsa5dxV5R/cEEP2mqRqzub0vytbY
	M9DLKfYbtHlZhUP3h993ITzqW/bPVcX7oZ+fpytWC19PQG8haYX0JnEQDIBmlviVKEffRHUD/Pgq0
	JihD8kJ22SjkvGIPuPCt9ZxHbiv7RK8PzyvkQIQWlHQdkZX904VVm82wQUQ82eMVTTEjcFiODGouD
	9JBPmhdL7DZ804riBjkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4TFh-0004Ds-FJ; Wed, 19 Feb 2020 17:35:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4TFe-0003wW-Gy
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 17:35:12 +0000
Received: by mail-wr1-x442.google.com with SMTP id t3so1509976wru.7
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 09:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKZ1ddDPfUYCjUQ7kAF3t+orQ6m6BZIYkrSaotWcAmM=;
 b=X2e0sx2O23WHDyj+CdogMOZnhLzlHGUY84Cw/1358tG4/lp0p4QzlF4gTn0S3FY5aF
 wlKpLxS0Pq7GvSWtJJZlnc1/BhuJaSmmxc957ERCeTZfWstj/7P9ynHWGySHKdNut72W
 OixpFUrGD9ADXYh9sGhd7pCeG+MDemjlpISXz9n5guTcFXHwC4ltNKQPsv1xZyo0nH/6
 oedY9idCZ394g4kRJLT2t10k1kTREfbTfiWs8hohLdnCJxCwkXRaSe0izO0rYPp5W3V3
 9d0Pm7TJCz+eu+Qnazm4qvj9KIpCTIg+eKRCDKN8gdAj8G6lYG+tTsbqRHk2AaBkxfcw
 YygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKZ1ddDPfUYCjUQ7kAF3t+orQ6m6BZIYkrSaotWcAmM=;
 b=XyjA3gjwZCmRLIkC6RJWpZK0hrcdoSVg+6HnSsVgDdj/P+gQ79o2lHp3LZck5UkE4a
 LrhF8NAbkgdr1VaTFcDS/LKrBSuXQ/z9BqAdm1AQiBY5jwc1fxXW630TdBAFY9pncpUI
 d1XC8UdiPpyc6FvgFxoUp1ptM3ieoYcSISjXxiWhwMe2n0E3xHG+OZAnV1VuR8oeTS0F
 HRh8yo7U3B+oRjcsEDduSTopt6U1khwhzu4XCAxzrlmonoEY+IdhGJW0JtwAeModej0t
 gjSaUuolxEOsz7HGv1dHPdHqauSh8+NvdCW2MknBWQaVR0TOoK/KpReyIQ2TMiYec1Wp
 Dk8g==
X-Gm-Message-State: APjAAAXu6/man+plmFdt4QubAmXc9nVnm+GA+z8P6YfN3IKU7BD1WdrO
 jhPvI+UkYcf2SaIfNzY90SkKsw==
X-Google-Smtp-Source: APXvYqzk6aYz8GK14PUd7/aAq+BxUqQaODL7ymtKvwWlFXfp7QfRzdYohN9IJrf2eOWE2Tw9MfdveA==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr37515585wrm.107.1582133708455; 
 Wed, 19 Feb 2020 09:35:08 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id v15sm648120wrf.7.2020.02.19.09.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 09:35:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 0/2] ASoC: meson: add internal DAC support
Date: Wed, 19 Feb 2020 18:35:01 +0100
Message-Id: <20200219173503.1112561-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_093510_571749_2468FEC8 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the internal audio DAC provided on the
Amlogic gxl, g12a and sm1 SoC families. On each of these SoC families,
there is glue between this codec on the audio provider. The architecture
is similar to the one used for the synopsys hdmi codec on these SoCs

Changes since v2 [1]:
* Fix Mute kcontrol name

Changes since v1 [0]:
* Change some kcontrol names
* Move DAC sources to DAPM

[0]: https://lore.kernel.org/r/20200219133646.1035506-1-jbrunet@baylibre.com
[1]: https://lore.kernel.org/r/20200219161625.1078051-1-jbrunet@baylibre.com

Jerome Brunet (2):
  ASoC: meson: add t9015 internal codec binding documentation
  ASoC: meson: add t9015 internal DAC driver

 .../bindings/sound/amlogic,t9015.yaml         |  58 +++
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/t9015.c                       | 333 ++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
 create mode 100644 sound/soc/meson/t9015.c

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
