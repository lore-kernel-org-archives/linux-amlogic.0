Return-Path: <SRS0=RHkW=ZS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C02C432C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B23220727
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zcb2pPt/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUeyWwDy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B23220727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=517c4o3k2inPMZEgGRTKw8njPHTyWCs2q3hMRtRbKKU=; b=Zcb2pPt/YX27ZL
	nWNu7PT8pJAIdzOdZUAZD+IsWxbvorloaOmMwAoutoEbt4ZrrWNd+1Q0uhJFSJIYfByLVvq8ppWYt
	b+htVy7AK0JsZhFrISAJFVmwN2uYoEiLLSqsCeT2KZx0I8dhlN48dqjnxPTf0YqznSSE16wKjabZ0
	sOn8q4lpMxROBxhcU9orw5++IIV8v3r6DRbDkq4rS+pvQi7fwO338DXC5NgcaD/GDdWb7AayGeIlV
	WM42iPcrr559DJILGjE9BAqJjToJqN5dhYbM00vx63q98c9rYG5cgwerYdkrU34ClbgybqLtmcuR4
	j6d/bkGcPLecnQHig9dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZYvb-0001h3-VG; Tue, 26 Nov 2019 11:22:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYvY-0001Hu-MH
 for linux-amlogic@lists.infradead.org; Tue, 26 Nov 2019 11:22:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id s5so21974410wrw.2
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Nov 2019 03:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2u1YuOaCIT9IPgSCCv6B83qHSO4LlBZZoVaYs+UiMo=;
 b=OUeyWwDyQlgr5cEtxpmk3oN06gWuDism/XNnLtDrS+E6xrqBUy1V/yS51YsA9A8yXY
 B2hzD3qkUfV8kD+hmPnAfb5tjf0dIHrdYZUBLg7XffKg7geOa7kz3RzV1X2sJC2fwFse
 uCmaMkoPwGF0sgKUlSHMEVH7Q+MA3rbZXN1PLpFuj2nEZdfQsvnBYhyW/BwPih/OmQjN
 Rrv0cU+w5Pa5scFdQ5AMfnsmtqmHFSmpqQXtZBcmE9IsENEmy5kU2qMX7Di0cFHrPzmb
 X+jkpqVizS6KZVVKBMN2q1/rYKDKo5knUnHCLMgfwMx2es5h3PBolPiFnJsLDwDOmB+Z
 3Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2u1YuOaCIT9IPgSCCv6B83qHSO4LlBZZoVaYs+UiMo=;
 b=qC+hb2yiagVC6sadWTwzh3K4BY7yuJ+zo54XZDBAOurHVLx3DTTfVnmWBnIMoCOZFq
 AMdGmRCG4zI6MdpZkCIswy/8hkSTFfq44QaS2AxJd3XXZTTRKCbsOBIXUCtdVHBB0n2X
 b/nZGymZVKJFM6DXT61i9gC5kykP7e+7g80qCu6z80we7SjX0FadsGOgvJ10Yvo+Qwad
 nfew+VJSH/8OpIPQHJp+NyebC9QY56JlwJOk3sIE1Va9FZFZIUelRkh+I5Xuo2U5Mn7Z
 CuWFwp6RZngkXQ4McyBYtP8nbswzgvcHqXunnu+XspztvF41eZe0FTyL72cqJwjN6K3s
 0LZA==
X-Gm-Message-State: APjAAAUzgtDnG68zyLdYA17Al2sHv4Oj1pS3KjXXoubq3lkoqmJDYvZR
 LHLm5Mo+1kqsPMrCQRb5nU9LptO9
X-Google-Smtp-Source: APXvYqzXolr9IywwigwSca1+KQHyoJnn3pQfkjRQiubs/nxn596TkXB6Ywf8tNV/JvhH5rNP5IzyAw==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr20031396wrt.219.1574767358836; 
 Tue, 26 Nov 2019 03:22:38 -0800 (PST)
Received: from localhost ([37.238.189.12])
 by smtp.gmail.com with ESMTPSA id c144sm2714684wmd.1.2019.11.26.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 03:22:38 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] add support for videostrong KII Pro
Date: Tue, 26 Nov 2019 14:22:33 +0300
Message-Id: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_032240_796029_ECD91E83 
X-CRM114-Status: GOOD (  10.62  )
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
-Misc:
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

Mohammad Rasim (2):
  dt-bindings: Add vendor prefix for Videostrong
  arm64: dts: meson-gxbb: add support for Videostrong KII Pro

 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 58 +++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
