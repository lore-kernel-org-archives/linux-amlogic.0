Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F889C43215
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBD320732
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6TpsEAk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frQ7mGtb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FBD320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4aXRYSL+Dbj2DUkPV0E+WvDVPUnjSVorvRXvEPcLe9g=; b=T6TpsEAkeWJEm9
	CzTkxZqGLvaKqzvjY9BNCMOTRJJEpz6hbTBBLZV+OUSGSQbbeMLgcQl1o7Nf8a8a4L8o+pGyKMsTi
	WWdjwYlVvSrIYQ9kAHG3neyUy2vMROZqsWOdK4lmzAmR/iim2ImCMKVEWAWXCp/7gZ2SkclZ2Tnzl
	Vs1uHuipiIEIU4ZpQ2LroaQe45awAyiWd2DcWtdpPmYzy27d46HokbmFsY5xfbZYXFN6iD3bwNHoW
	wibKkCyBnI13YcX2VMwDyVWRYIz2UbH268ZK5dQAPTIW/mrx3oG6GgNM8heKXt4Bt4Auf8/WUtlbu
	4tKt9tNH5OEwEdvyxosA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib8oI-0007wy-JJ; Sat, 30 Nov 2019 19:53:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib8oG-0007wR-Go
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 19:53:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id t2so39033829wrr.1
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7yQ1pXud5xfvukRd66sTCV9DjvykOyowhyzh04Os9A0=;
 b=frQ7mGtb/bdRZ12pzETvuXNtESFOx6KZJh2fE/LtmbkUagNikeE7I1zHYDRfRDHf6f
 hQJrzLxanDjgRE+3u9RvsEzwCYY1Rji+jD2tyheVCXGCKZvkGNYSQFDDU5CZqQ7s1NYK
 h6WaEAVZWTEnYFoRiZxz2RKGsbx2EjO7SJQ1qZojZs+Z56e30Odf+22126bQ6rl6KF4r
 +fAV37XM3JzkIW1kVFTZHGsnj70owSF8Vs+TEngoFDC/zpzBdHGRntwS5eERjKeGetJQ
 cDRBhQ9SxmqLuyqGcoFjOfgZW0F7DvMQDngqG9KKG3hDU8Nh5Y3YiBhvv1a0XspnIxde
 Kq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7yQ1pXud5xfvukRd66sTCV9DjvykOyowhyzh04Os9A0=;
 b=XkeMRih+oSDR0gffPTPQU+snuRwvNPi7HcUCRt2vflA/3OBwFdyNs9Clo8/zjkRgfN
 hVG+0CkRfQDa/h9EOnSBXB7lGSPhzegoydEcEPZzrSo8V9CFCi9gcIfoEbyeVhN/D7fE
 Ve+euo3255hwwZFPtbd1fW2KWglfyLjEnU6fajebsUENC2S5tPWYp8o9+Gy2lpqnRxwc
 Qvc/hBDL9uXQLzqKhmcU5DeD9J/OhJsI2EKeCyAqiKJgJyfcW1v6xFru/HKp7IVBqUOl
 k2D3tzPwsAM8H8yUonZlIjg3kfihuMTJ1LEK6o7NXwvjEr00+JT2wK6mq/uZ2HdSBK7T
 y5bw==
X-Gm-Message-State: APjAAAWbKwZygIkWkaW+Yw6fmiH29ywTIXmzW6Y9n7ryah7CIm3OTbe0
 DbtvW7Yt963m5lAZM9n1/oXBcnfMrQo=
X-Google-Smtp-Source: APXvYqxV64zAys3tTZunnPyIT5Gh6A1L+rljNJRNRuDo5AmCwmudvXnvjGyhxCYmUjpGWpPdOy/NuA==
X-Received: by 2002:a5d:4b08:: with SMTP id v8mr57931523wrq.338.1575143618413; 
 Sat, 30 Nov 2019 11:53:38 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id z11sm3604348wrt.82.2019.11.30.11.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 11:53:37 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/3] add support for videostrong KII Pro
Date: Sat, 30 Nov 2019 22:53:32 +0300
Message-Id: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_115340_559726_8DA79F54 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


This patchset adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design.

Device specifications:
- SOC: Amlogic S905
- RAM: 2GB DDR3
- Storage: 16GB
- Connectivity:
	- 10/100M Ethernet (IC Plus IP101GR)
	- 802.11 b/g/n/ac Wi-Fi (Ampak AP6335 BT/WIFI combo)
	- Bluetooth 4.0 (Ampak AP6335 BT/WIFI combo)
- Video out: HDMI 2.0 up to 4K @ 60Hz, and 3.5mm AV (composite video) jack
- Audio out: HDMI, AV (stereo audio) and optical S/PDIF
- Tuner: AVL6862 DVB-C/T/T2 + DVB-S/S2 demod and Rafael Micro R848 tuner
- Ports:
	- x1 micro SD card slot up to 32GB
	- 4x USB 2.0 host ports
- Misc:
    - Power button and LED, IR receiver

Changes since RFC v1:
- add commit description to the cover letter
- update bluetooth bindings
- use lowercase name for the dts filename,vendor prefix and compatible
- add copyrights to the new files
- include "meson-gxbb-p20x.dtsi" instead of "meson-gxbb-p201.dts"

Changes since RFC v2:
- Fix styling issues

Changes since v1:
- add leds node to the device tree
- add gpio-keys-polled  node to the device tree

Changes since v2:
- use phy-handle to describe the phy
- The blutooth compatible is now merged,change the commit message
accordingly

Changes since v3:
- fix typo in the binding commit message
- add device bindings to arm/amlogic.yaml
- remove deprecated "label" property from the gpio-leds node
- rename button@0 to button-reset
- add the device specs to the dts commit message


Mohammad Rasim (3):
  dt-bindings: Add vendor prefix for Videostrong
  dt-bindings: arm: amlogic: add Videostrong KII Pro bindings
  arm64: dts: meson-gxbb: add support for Videostrong KII Pro

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 78 +++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

--
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
