Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F58C11D25
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B819220679
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GeLVCLv9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F2UN2Hn7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B819220679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k8H1wpB44eXzixF0+2P2oe+CTwzh2L1r7E4hLBn2Hr0=; b=GeLVCLv92OK6jt
	TyZY8ZKE6BRAQKH7rDy9Ri3RRz/7Ebrcd82Y0HlGso/4OAwP63c7VNCkTL5lDsEmvHaRaHXyI8wnc
	TMH6wspOwu+Of2c1UM2ERmdGNeG8HaEDZr0s6HmdWTFe67OyD7JZ7aqalctAID3dUYVAMl0Fi1QVM
	xSIBRD+eqrIJQyQbpLfkAg/+q7M65KUIyl2lFNOcVi57spWq84rw3ftrEe39mqpnggvfTdjc0Nnq+
	Kq1J4QNUhBVyxLaui/AWgk5Pqw+o1Ut0a+XeJJnnIgiWjltgoQq2I1x8VtGnVqOSvSHwvORqTTBwT
	AmQ0XZUWGPOWkpo0gCOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4sst-0003ev-B8; Thu, 20 Feb 2020 20:57:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ssp-0003dH-Mw; Thu, 20 Feb 2020 20:57:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id z3so6194377wru.3;
 Thu, 20 Feb 2020 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FXjFzy08xMuJRMEmwBB0yy8RCFRKvyZHt3R4Qv4p1O8=;
 b=F2UN2Hn7nmxIi+cFd7snrG33JIJjswMBS3DsHUuvSbqqi8E8OVJdnLegKa+tC6gccQ
 JKh/sbaLX1ZAeU+9UddHYLmfilbTGhARmYPRE7cSVKS26auV2A0KqWkdqV5tj9V0VYbQ
 UDfyG6axD3KDMa/QyksF8EUy0zlROK63PctIj5HC8i1eqmDJv5aOjZZ7fyero/KPUuDq
 wfOVVD/1bB99njYloSBusB4CVm9CWNj0SJE4q+N8v8QsGEqNz6UOdhXkNT/K4dzNfUVC
 PD45Jx76l0Ml6UrUYOnaGDtRs2MmDO+DvUYM9Bn9bxHJr7ped37CZg95RVU2w6NlmZlo
 d0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FXjFzy08xMuJRMEmwBB0yy8RCFRKvyZHt3R4Qv4p1O8=;
 b=BSRnri+Sn12xkl7s3i5XlXC4fdpgqf2p4pHU+WDG67mORGa6+yCgUEjWzAXYpDICyr
 +ND0BpgnkYI5quCHVKMFY3aF2a+EZ4RcRhQpT8z1hput1uPuoOYDnKS+sHkj4h42jtPU
 qIVS8c5cQQff+RV4tDWoDHDwhFytMnbH9zApIRkU4OV/nj5Zq1Nc1gENOg9TMHrjukuv
 omXBg5h13KzBp9A0N0yEtNkqJAAjZJSD8hv4YC14PMAsjVdpWyUGe6TL9XYVBl8lZnwR
 Hv7l/1IGEMvHNcHsbX8YwxFAdcBVMBWEdvRMfZDSgf2sZzO8G1z8hlayLOlFVAYCwBm0
 CLUQ==
X-Gm-Message-State: APjAAAWf80ulXaw6ZzLOgytXMN3Mkh8GkS+cVfe89N3vYZ4Qn7QrYG6T
 L3R+l3ycaclleM8XfsDCdUw=
X-Google-Smtp-Source: APXvYqwTNBE8NHGbnW8Z3nYsC+iVU2OPITKzvQtdl8slWj3/kKZgD9q0JgDz86aIMPvz7Z2806fdUA==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr45704445wrp.2.1582232237793; 
 Thu, 20 Feb 2020 12:57:17 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a184sm695039wmf.29.2020.02.20.12.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:57:17 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] ASoC: meson: aiu: add Meson8 SoC family support
Date: Thu, 20 Feb 2020 21:57:08 +0100
Message-Id: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_125719_751424_52B6CF06 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds support for the AIU audio controller found on the
32-bit Meson8 and Meson8b SoCs (both seem to use the same revision,
but for safety reasons we add two compatible strings).

The only known difference compared to the GX SoCs is the absence of
the I2S divider in the AIU_CLK_CTRL_MORE register. Instead we have
to use a less flexible divider.

I2S testing was done on an Odroid-C1+ with a PCM5102A stereo DAC
board connected (on the J7 header) like this:
Odroid-C1+  | DAC
------------------
pin #1 GND  | GND
pin #3 5V   | VIN
pin #4 MCLK | SCK (optional, DAC can operate without this)
pin #5 LRCK | LCK
pin #5 SCK  | BCK
pin #5 DATA | DIN

In 3-wire I2S the MCLK <-> SCK connection can be omitted. For my tests
I used mclk-fs = <64> in this case.
In 4-wire I2S the MCLK <-> SCK connection is required. For my tests I
used mclk-fs = <256> in this case.


Martin Blumenstingl (3):
  ASoC: meson: aiu: Document Meson8 and Meson8b support in the
    dt-bindings
  ASoC: meson: aiu: introduce a struct for platform specific information
  ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families

 .../bindings/sound/amlogic,aiu.yaml           |  2 +
 sound/soc/meson/Kconfig                       |  2 +-
 sound/soc/meson/aiu-encoder-i2s.c             | 92 ++++++++++++++-----
 sound/soc/meson/aiu.c                         | 28 +++++-
 sound/soc/meson/aiu.h                         |  6 ++
 5 files changed, 104 insertions(+), 26 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
