Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F33C10F14
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2062084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ROm/vows";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F8FLvJUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2062084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PUiEyRH9i5BY9kWHNZYGULmLCAilaARLiAGpqHes5nI=; b=ROm/vowspMzk2H
	0170R8NTLHejtZbOMOmZLrFBmHP8NeUSTou5qwVUVBleXkb5bJZZMnUDBr/h+qu0yVsu0yhYPYyWm
	D8w/rBFhXkOU6aib8DGKHmj853auYSkf+2QW7tu9tql1W8w3m61ut1u160if1kxhTK3JVf7lArpCr
	x4EpQGNij42AkmaUb3hMvzYMjR8Gwx9jvovoajafE4fXBIDHHyc7dBK4zklEtoghkn13S43QMeV0a
	e69UnPcvGuCoXKm2/NQfXWFnGmQGgHYLk+RZS4s2piZvPV8hKO8Vm+GtvC+vlcbP02gFVWjWgJVH/
	AQ7spJtvLoKNVdtg/EhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvep-0002qw-IO; Fri, 12 Apr 2019 12:51:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvem-0002po-DP
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:51:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id k17so7134129wrx.10
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfDuX/79NFdFqCR80hZUxxRjvBqa8fy8pulUwrDToic=;
 b=F8FLvJUSr4HXdDldkNIS1ZdSVgA0IiZmKEYxVPwP4xaeVkuBC6JVb7u1QdkvyWFCUu
 nfG/4MEGihyHDffwU2b3MbGulH/HkiGzietA+SvMQLeRFKS7suwT01qlTCLKMbqtFpH8
 ecYTd3Q6KWG1BBoJ7EftoK0vhGbSmpMCcVsPPIgQ9nGmDtjhle5KMSJ6xghsfDfgKlPz
 cHGxAKaxqvTg2+UKcASB/L3VNoFNBS+cxbNRgK82M9CKcbN0aP0lHAYC5PdmhrDnGTC2
 PcF6o0v9tTvdpYD2FJpH7J5Iycr7fg41ysxwZoDo8TwmW7+3EvWp7rReXHcK6J/HtW9O
 FUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfDuX/79NFdFqCR80hZUxxRjvBqa8fy8pulUwrDToic=;
 b=ZlXmHcqHSF2jUeHfuBI+/2hO9Tk/Kt0f+B02i79vcQR5QMSXWOm/kt2ARrIDtRSSlt
 /Xr5yXL/LHOv+gC10Zds24ZS0sUh9R7l/cE88xofU8DvVXVstLyXzLRhU5x8q5MGnVnG
 PeL3gMvNyy464UmtqojaFUFL7RzCYK+ujxulJck+cmpxbGr3TdgXUlpfiBx042k/KqAA
 uLO+C/goxKA3aInUxqv7l2tT3I6taZcxuulzl6ghEkzDyb4xlAvdxtzcGvfQ7zk/pAXR
 OxVSjZ+9cubgD7xkfl2LDFxczQgCSR9tTPR2e/PCgfRGp+0v/jtkt9DXzu79BHG3c5qL
 Ve5w==
X-Gm-Message-State: APjAAAUvRVbwUBAQyfew7gDPB+Aod+eIE0qlL3OcroKGT53iTYUoD8KW
 kwygwutnGWROhDxy80x7HXO0zg==
X-Google-Smtp-Source: APXvYqwK5ad6q492XTW2yCXmbXoJXz8OIOd8yZKEw9OmBjDyuhpBQokhVmG3Dzc1WqdKL5h96uGyUw==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr23048981wru.125.1555073506833; 
 Fri, 12 Apr 2019 05:51:46 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/7] arm64: meson: g12a: add audio devices
Date: Fri, 12 Apr 2019 14:51:29 +0200
Message-Id: <20190412125136.28232-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055148_450920_6274FF3C 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds most the audio devices of the g12a SoCs.

Kevin, couple of things worth noting:
 * This patch depends of the new audio clocks binding recently applied
   by Neil [0].
 * You may get a warning about an undocumented compatible string.
   The related binding documentation has been merged through ASoC [1].

[0]: https://lkml.kernel.org/r/20190329160649.31603-2-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20190404111733.28705-2-jbrunet@baylibre.com

Jerome Brunet (7):
  arm64: dts: meson: g12a: add audio clock controller
  arm64: dts: meson: g12a: add audio memory arbitrer
  arm64: dts: meson: g12a: add audio fifos
  arm64: dts: meson: g12a: add tdm devices
  arm64: dts: meson: g12a: add spdifouts
  arm64: dts: meson: g12a: add pdm
  arm64: dts: meson: g12a: add spdifin

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 304 ++++++++++++++++++++
 1 file changed, 304 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
