Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA639C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:03:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1422083B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="URqW4avX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W1sObXA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1422083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysYsNEM2MzTSgtXeQxgnN3CvGLKY+qTzXwwfpUiu3ao=; b=URqW4avXSBYvWH
	hLe1QR4Ol1CyROyCTV9sW5bl3x/uuIY8Qv5rm3RWIRwSY1IGSx8Mfe4XdTg21umpkdfFvbrOydHGF
	0Y4ZiSkqCCwjYpf3i/Li7AVFXh1SvSNBJVFqkLDTEAOADkLxOiYP/gh3iXYpLC0lDRPV1dOb4D2am
	cyVBfK0LGrv0yzZtzkzbLlkJ4DHS5uwFVXJWLmu1XmqjyHrC24bvNTP3zfKV5Pu7QGg3Kt0TOc1TL
	XtGZVvg+YXiWvbgNHwwqEzSRuN8okL2qXra6l7A5GzzQrhjcJ3N9FqB1akqSDo/4xr3s2d+fmuDEe
	zJ7Q/U8lvRlnmZ9HqveA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYeg-0003qc-DM; Tue, 12 Feb 2019 14:03:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYeO-0003Yi-Jd
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:03:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id t18so2828723wrx.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tckqtzwjj5TWT5FFf8VcTFGwnA9DW5qTKhzDQO+xdxw=;
 b=W1sObXA3tijnRtq9ZeKEd1a75IWHrsZI6GOydysmPtdFkNrb1mpavtyiNFnnj1LT29
 sGFOTlB6WBew55Q9rf/0rwjIkNKA5oTmeh9DaL+0WPj+E2hlRF1oqEZKQLLUbaDZO7w0
 vkYcM20JhjxbJqEZKmE4DFygCXGsET/WFZDnOnkjbrXqairEyKGkwcsSg5oPQ8sbUrAO
 SMWzQEVkr5wab6zZ26zYje/y3t+MYUll+lQgK1eMMjKWMkekZ5duEYNpK45ZbN9Ztjya
 v/bG7DgKK3P0N1HB/JsxPPEdiqkOvYnakAaSiNoFJLYsVbLZMbzN9fluCGJLynWw1Amc
 lJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tckqtzwjj5TWT5FFf8VcTFGwnA9DW5qTKhzDQO+xdxw=;
 b=Tp2wCyQ5TUoLhDGatiSqM6uDbymcjo99F4kEee4O6snNkTnVvQ+OW22dwmCg8a4GzX
 3tFrQpktda+UzsfgO0bj0yfPrZEAjTEO9UXO6FtLTH9etAqHFmVDXpilHucFw5GpYf0+
 /MBi7DGgYJToMCDC1T5vlfM2IV98NL40D399+gzCWz2xsT15/9e6wl/m5pBRNckmr9oR
 x6dn0GhDYONf2VytgKh6SxTXC4M/GQDt0lA6yXIXjdIjJiS8q/zE84Myc+Satpyv1FEw
 MIgXBjVLdNRANQgRW4ZRSCNxFUYYUs/iKKp6bnYtG/O60o87P/67o0ZbLoXhSYzpIVdS
 Fg9A==
X-Gm-Message-State: AHQUAuZy+iijyUKVWJHsN7wjuQ/MYs7Yen1ThcFLuclGSmR+qj2gR094
 idJOdo9d7biDx7RilhrdvMCtRg==
X-Google-Smtp-Source: AHgI3IZXFnjSZ5BPU3aN3v4F9GfPm4trRAXctnT/G05Fl6rThVrcy7XUfNNfZagCOnrgMLkrOkfChg==
X-Received: by 2002:a5d:52cc:: with SMTP id r12mr2954715wrv.277.1549980182633; 
 Tue, 12 Feb 2019 06:03:02 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g10sm23435678wrq.81.2019.02.12.06.03.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:03:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] arm64: dts: Add SEI Robotics SEI510 Board support
Date: Tue, 12 Feb 2019 15:02:57 +0100
Message-Id: <20190212140259.9537-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_060304_698270_6E19C3ED 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds minimal support for the SEI Robotics SEI510 Board,
which is based on the Amlogic G12A S905X2 :
and has the following features :
- Amlogic G12A S905X2 SoC
- 10/100 Ethernet
- USB2 + USB3 ports
- Micro SDCard Port
- Audio + CVBS AV Jack port
- HDMI 2.1 + CEC Port
- ADC Touch Button
- Far-Field Microphone Array + Mono HP
- IR Sensor
- IR Emmiter LED Array
- RGB Led

The first patch adds the Shenzhen SEI Robotics Co., Ltd vendor prefix.

Neil Armstrong (2):
  vendor-prefixes: Add prefix for Shenzhen SEI Robotics Co., Ltd
  arm64: dts: Add SEI Robotics SEI510 Board

 .../devicetree/bindings/arm/amlogic.txt       |  1 +
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 38 +++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
