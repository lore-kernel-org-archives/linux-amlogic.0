Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31666C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC85206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DD+FjT4C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U+BzZHbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC85206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZcTOVHkdNLGkX06IqoiORv+0+Wdm/CWkSRH3NnuNe8s=; b=DD+FjT4CvbPeJk
	uJlGFXzmHhCReyCgLnC1CiOl1Xxhf4mMPjtpwMUeCqWtcYve49zL5KocSICH2nV/cl8NXtjZlDC5B
	dSZbhkAfPRJ+gNoIMSD5HYXmVuGkxTMpQvS8qCJWhuXMGyUl6AKhs/iRs3v4KsDuIxi5jq0c1+eh2
	y5NI6s5UXfayPIcC0M5Bmrq0sp7wFDFire+oQkr/C7Th+v5UeXLn9OTTFxHSBBLlRjrWd2jNG53sx
	6rjZw+DeQM9LaOvaB08ArhHMeMvEP8Tgv9HWLaffYquZHT62ELKYWJb/aNYe7nHCH4+Jpv5qv88G/
	549G2JMqVtUUG0+erhWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoCf-0000mW-7W; Mon, 20 May 2019 19:44:09 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoCc-0000l7-4w; Mon, 20 May 2019 19:44:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id b18so15867515wrq.12;
 Mon, 20 May 2019 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVta5xB/O0QdvUGc5eYkdvpzELli1ZpHwr59R5nENcw=;
 b=U+BzZHbeO1KY+dPmw/oGi3XSWlv90ycsDjx9KXI1IOImK13sc2HFLTbDBRkR1LHxH6
 +if9w9trTLebLbFzw3M2MkHFy67mF0vIIMh9//saXEcs78CYk6pfEuM2T+Yo/SbreWdx
 AUUgrkT+kPv4wm0NkTZmHzygH6OHSaOC0iGu1JsRjSWS8IK6o8lKSygaqCQIPSB9wnCd
 SQ5+pRE308Avd7zKs4DRKUUYXogC/Ay3rtZU00hDgCKcErpndPWlTi89LYl5r8fVPjvi
 O6X8lAzlYYv2egbSv9M2ilcFmWDuOVKlX/BQGBGwc91NrmxKpNuizf6i/JBen7cCTP7l
 BPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVta5xB/O0QdvUGc5eYkdvpzELli1ZpHwr59R5nENcw=;
 b=gH1uPBggScn/eJT7/L3w6kugZz6gqJrqX68ShKGcVi31hYC9OBe24wsIN9uUj4G0mU
 Xtd4b1dsprpi2Fcq2KJT4D5okOyXuHNNIcKf5/UFsQonxes4RW+10hHB19vST+dIsnaJ
 asoOoG/ehIwgI/lNKMO8f/4Ca2HC4/BJ0PiZD074uMatvBjJB9HuzN/vhLn18aO+cVfE
 rPCTJjGPJTnIZtmcCed8fVOk4dB/33JWO4KmsLod7+DeIwYIYmT4YWkWK2C/4zv5it5h
 lredRYkXKAvjUE+9OzcJH+4lWWCelGlczMZ+Z5V6djUIUp6/LPlQ6bDZaqtzK5kJ3X6r
 3JkQ==
X-Gm-Message-State: APjAAAUwujuHLeR+U58+IOaK2mEqU66oWUAxs2jROGtNDVWxjVgrJn3j
 A5XufpjzejGw6FtDOdsw0Ast+B2S
X-Google-Smtp-Source: APXvYqynMyqoH9GhYe+AN/gAgwqbO94OY9y/bT/SijzrVrRAbf9a6+TW6auDD4ShFC3FSuOOiz30pg==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr2725642wrw.309.1558381443684; 
 Mon, 20 May 2019 12:44:03 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id p8sm9135352wro.0.2019.05.20.12.44.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 12:44:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] 32-bit Meson: add the canvas module
Date: Mon, 20 May 2019 21:43:48 +0200
Message-Id: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_124406_215969_7AB9AE1A 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
IP is used by the video decoder hardware as well as the VPU (video
output) hardware.

Neither the VPU nor the video decoder driver support the 32-bit SoCs
yet. However, we can still add the canvas module to have it available
once these drivers gain support for the older SoCs.

I have tested this on my Meson8m2 board by hacking the VPU driver to
not re-initialize the VPU (and to use the configuration set by u-boot).
With that hack I could get some image out of the CVBS connector. No
changes to the canvas driver were required.

Due to lack of hardware I could not test Meson8, but I'm following (as
always) what the Amlogic 3.10 vendor kernel uses.
Meson8b is also not tested because u-boot of my EC-100 doesn't have
video output enabled (so I couldn't use the same hack I used on my
Meson8m2 board).

This series meant to be applied on top of "Meson8b: add support for the
RTC on EC-100 and Odroid-C1" from [0]


changes since v1 at [1]:
- added new bindings for the 32-bit SoCs because they don't support the
  "endianness" configuration (new patch #1, thanks to Maxime Jourdan
  for pointing this out)
- update the driver to reject the "endianness" configuration on the
  32-bit SoCs (new patch #2)
- patches #3 to #5 haven't changed compared to v1


[0] https://patchwork.kernel.org/cover/10899509/
[1] https://patchwork.kernel.org/cover/10899565/


Martin Blumenstingl (5):
  dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
  soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2
  ARM: dts: meson8: add the canvas module
  ARM: dts: meson8m2: update the offset of the canvas module
  ARM: dts: meson8b: add the canvas module

 .../bindings/soc/amlogic/amlogic,canvas.txt   | 10 ++++++---
 arch/arm/boot/dts/meson8.dtsi                 | 22 +++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi                | 22 +++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi               | 10 +++++++++
 drivers/soc/amlogic/meson-canvas.c            | 14 +++++++++++-
 5 files changed, 74 insertions(+), 4 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
