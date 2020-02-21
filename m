Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4FCC35658
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D2E208E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XgKU56cj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lzzPLOpa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D2E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XInrRWeV0gX8YP+YLBKzJHL6zV4QOSQXz+YY4cFfqXU=; b=XgKU56cj95HnU6
	NZMNYE4k+TAgV8Db9/xsGggSXd8J8OiDVYLhOnqLcHj8yq2Dhnl1JfNa4tp2hCx+VukuxROB5fO/M
	iIoJKEHyY3DxtmzShnmNBiDrV/ovcZAfyTQsPRqCSQnSHb7eB8qwkOX1YxnyHa26GgH121YosiV+r
	FG3G1cmmhymg4T88nanOZK0jw5JbuaQA971G8CYyzyNc7TBGffg3unwMplZUO4c7/k4lsRS/KKoei
	HgU9nbnzpRDV9kVaMpIEybFIwPbOPVmV7EFftQP26807BxFAdHMxH4PcaSkfYsG7Wnf9kHfNhkRbB
	cyFSQZYu37ARDF5c77/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5ALi-00068k-P8; Fri, 21 Feb 2020 15:36:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5ALf-000685-Mg
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 15:36:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id t14so2367205wmi.5
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNHEwFigMTNc7YIRkUZl+5v4Xtz4VgLarV7EC/Mxw3I=;
 b=lzzPLOpa00IdY058idG1naAWzavEyCoj9ZAwXmLXwzaop7ZYtD6FCA7/Tf+u9wizE2
 +QxpIzWLnPu+dVn5KZNt1nAGYXhZ4ztaqy8mL/My88k0srIG6rRqr0alTBwdFVXMNmuH
 vEwKcvHsq8xwJTW5yyOZ+9QZ58aW+16RkHwKPgNUTU+oMh3S9hjGqkcB+mV1w6Cv3BZT
 8vT8pg8d6Y2vduJCtbT3ZWNlw5adXT1EyCNVG9oXVLxSmlsgFSnrfR5KWSK92AtNmzEn
 qIo4lSIdYXBLXURdlh6n41O0Q8QD8BPrtCNl/3BW0RmY9seoAerFYelvoS3oFAfpFOa+
 Rk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNHEwFigMTNc7YIRkUZl+5v4Xtz4VgLarV7EC/Mxw3I=;
 b=fVhi5G4nntMUQd4kHsvA+yl5jefcluULVwB/v+fsvoos/SDvvQOlFyC5aAVnNuItjq
 kI24gm8p+Y5FzVQe7bhOPiNDS/HrGzPuwVYIVHUq4aKkOlq6sjeALZawxHsQvlzn/Xma
 JJTEymZbgyqM3+qX1GaA9ZTS33KWzFe4G86wKS0iFut4GuFI/+oZZdBUVosvzb6r373/
 syJff26I2HAED93sZam7Z59gziWEtBRAHYeLH9RUvDHLaQAkku2r9/MxwiQr/sr2apPl
 aY231bFQsOBp7uJPkUCsZfqFhTwFIQun5i/EtQXF3mLfukglUV+P/29ZZGzdUgbyHuo/
 vnMA==
X-Gm-Message-State: APjAAAXF835MOq+CdF79xxrq+TQXC43u0UQP7rAHPNSjQZ2Wj3FK7+tS
 08hxJ53dcQKyuUENra/fm+AEcQ==
X-Google-Smtp-Source: APXvYqyCqkZR3zDNG4VAxXvdw9Zekulra1RORCfv3lpKLj9dzld+yh6yJQE1+skfazo6TA4dUBZmJQ==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr4286552wmi.45.1582299374128;
 Fri, 21 Feb 2020 07:36:14 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id z25sm4198782wmf.14.2020.02.21.07.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:36:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 0/3] ASoC: meson: g12a: add internal audio DAC support
Date: Fri, 21 Feb 2020 16:36:04 +0100
Message-Id: <20200221153607.1585499-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_073615_744226_F15EAF9F 
X-CRM114-Status: UNSURE (   7.86  )
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

Like the gxl, the Amlogic g12a and sm1 SoC families have a t9015 internal
audio DAC. On these more recent SoCs, any of the 3 TDM outputs can be
routed to the internal DAC. This routing is done by a small glue device
called 'toacodec'. This patchset adds support for it.

This was tested on the amlogic reference design g12a-u200.

Changes since v1 [0]:
 * Fixup patch 2 which was left in an intermediate state
   after rebasing, missing part of the changes.
   Thanks to Sergey Bolshakov for reporting it.

[0]: https://lore.kernel.org/r/20200221122242.1500093-1-jbrunet@baylibre.com

Jerome Brunet (3):
  ASoC: meson: g12a: add toacodec dt-binding documentation
  ASoC: meson: g12a: add internal DAC glue driver
  ASoC: meson: axg-card: add toacodec support

 .../bindings/sound/amlogic,g12a-toacodec.yaml |  51 ++++
 .../dt-bindings/sound/meson-g12a-toacodec.h   |  10 +
 sound/soc/meson/Kconfig                       |   9 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/axg-card.c                    |   3 +-
 sound/soc/meson/g12a-toacodec.c               | 252 ++++++++++++++++++
 6 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h
 create mode 100644 sound/soc/meson/g12a-toacodec.c

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
