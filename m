Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132BDC021A5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jP/IgPpMKne2y2dg2hHy5xIfhH9b//6+p3jeQuodekY=; b=mhysJCJ5JWJGEq
	RfFIQku77A3z0n6mcrgVKIroalJXe4a2fMNuAnQTYuEb2SnJGiUn7I669hVQTeoxw9A8DjQLA+ziy
	94QDdCTVVy+5JiLcTZWwnOahX3BeN9wicVpH3diw8WLubFGN/7IUfVXgafL0zNAd02Kz+xPA5bMXn
	sjr0eZSUHDy2relSk0FGlYaaPPIUk1rj4OBuvldGwEFZjpMmZwmD8n3yxYQKbwkqBHQbe1Nw3D/h2
	PD9PgUwM7glciMTXbWOcHTaE+O6f/QA6b7VgZhxaoZ7USIBHS8fo+l085bIuhoG5xPywJzK9b/pGt
	Qku9stwnAVfMhSoRXwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ7-00000000EFx-38ae;
	Mon, 10 Feb 2025 15:02:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVI2-00000000DuB-1W8z
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 15:01:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaec111762bso1083265966b.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 07:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199695; x=1739804495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvSmMz97pOgFAWJA/y3xBPxzP0im9M8/wf1twm9E1hU=;
        b=Nz9zg4Cb3jUMeUVhWG4mNxHkq+29wlMe/84ebxQc51MrIkdNDsenVrSP108RH2fWYD
         7T4HOTvNoY0ScDRefuYPzN8TnZKbgmxP1LDfxrgYIltiL4wOPMUx3SlWiBzMyUZxKnYR
         TXWT2Ex430tRH3LJt9Hy744u5R+lR0fgivGyjfqenXIIqHaLIb4q1MQgw2ikpvVP+uCd
         XtvtXBBvYQbHFnhcwdLI8f0Mq1oK5sZjbFYQM2CZ2joKNQODBjtxfqCbcblb1yN+9mdl
         T6+Ra4yGu2lBwNJugokdS0e98VmBhyalBRFKkB60jofolkirUV5+BeVczfZ8CvY2EM78
         t1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199695; x=1739804495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvSmMz97pOgFAWJA/y3xBPxzP0im9M8/wf1twm9E1hU=;
        b=kZIrx5RSJmkwLZEIe3Pn38BA1IdTU1be9MiqNdHBJm5Pr9YtJeN4vKL13Ej+1Jp1m0
         qH1KWmYlBAShvY24at56mjZnUB8B1QRkgvIEqgV8WlUFMRciuceVcjkoLZHjPpb6iVVR
         cTgYDdfLSQPBVL517w8E0XDFNkbV5p91QMVqMNG8TtiDMLiiYZGEQ+7s6k7QykLsuHXC
         SYTTrpFcO2BQnWGXJI2qDe/UIycD8CZ6DDQpFE0ToTFptXSp2uB5e1qbmUgZKthqsSSy
         jKhx4UozmRpTXRwzlu7qpBq1XLisz3mI2oUpHRmSF4Ba7hdR+NY/kwMJ2i7/c/gTLZih
         3N7w==
X-Forwarded-Encrypted: i=1; AJvYcCX2lXrCcwP0pGF/VVtZuhgsgXiDah13QO2G/uZ8W/aj1/4xV0zGf2IGtVEmTQ8oUxHqMgUWTU+AeInMCOH+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDjqkuH3/6nkqJjfJDlJTmAN4xlrOaTPeqeNHyss4b1FJtiBY2
	Q7UyBO7Q5dQNRnPkluk8NJ+4vSGQUGvVv34877Hnr6RNpgj5Fklo65A9wI9XKYk=
X-Gm-Gg: ASbGncu4QGYDlblMtVvORl4JF9Su7+/ZPyfD5skAjlDGEgAMbCkrGsphPnxrk+X9Eqf
	u5aSuL/AouZuxvLpSIHNok3pdO9G0S5PTsK5tRNCHRN0Q9YyJrarmOh0BKHc0UfS7W45c0Hz+8d
	Qy+vD2T8BGACcirmtaHinLbDxNByWnVa9IOiQgOdjHBJ4fU1IaiPm+apCKWTJfz2tZ82/53K2/b
	uYDiyhtzxOo+efvFyH6cjrfm5wqumJeo/HuJU9kaNwXVDQL3O/I/G75PSy3kj+B+iuF7CYzAGyH
	BH4jjrWoPCRVni8M8jaVxG1jKywD
X-Google-Smtp-Source: AGHT+IF8PHsJflwqMaSmY75s/V/366NFQJlHZHl+wdvCBt6MKVZwDXyvTAAaSuKQ3n4a1jaORAbhTA==
X-Received: by 2002:a17:906:c144:b0:ab7:b2a7:9cb8 with SMTP id a640c23a62f3a-ab7b2a7a565mr636217766b.15.1739199695180;
        Mon, 10 Feb 2025 07:01:35 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:34 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 0/6] Add support for AUDIN driver in Amlogic GXBB
Date: Mon, 10 Feb 2025 16:01:23 +0100
Message-Id: <20250210150129.40248-1-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070138_551852_2A11CCD6 
X-CRM114-Status: GOOD (  15.41  )
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

This series adds support for audio input (AUDIN) on the Amlogic GXBB platform.

It starts with a HACK commit which is necessary to make AIU (audio output)
export its clocks. These clocks are necessary also for AUDIN, but they are
already owned and controlled by AIU. Therefore in order to avoid direct
dependencies between AIU and AUDIN drivers, we let AIU export its clocks.
This export is done through the clk-regmap interface which is not public yet,
so that's why the commit is marked as HACK.

The series then continues with adding dt-bindings, driver and DTS support
for AUDIN. As of now only I2S input is supported, because it's the only one
I could physically test in my setup, but other input sources (ex: SPDIF) are
also allowed according to the SOC's manual and can be added in the future.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port. It was tested on tag
v6.14-rc1.

Valerio Setti (6):
  ASoC: meson: [HACK] let AIU export its clocks through clk-regmap
  ASoC: meson: audin: add audio input dt-bindings
  ASoC: meson: add AUDIN driver
  ASoC: meson: add support for AUDIN in gx-card
  arm64: dts: meson-gx: add audin support
  arm64: dts: meson-gx: enable audin on odroidc2 platform

 .../bindings/sound/amlogic,audin.yaml         | 104 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  39 +-
 include/dt-bindings/sound/meson-aiu.h         |   5 +
 include/dt-bindings/sound/meson-audin.h       |  10 +
 sound/soc/meson/Kconfig                       |   6 +
 sound/soc/meson/Makefile                      |   5 +
 sound/soc/meson/aiu-clocks.c                  | 123 ++++++
 sound/soc/meson/aiu-encoder-i2s.c             | 119 +++---
 sound/soc/meson/aiu.c                         |  22 +
 sound/soc/meson/aiu.h                         |  10 +
 sound/soc/meson/audin-decoder-i2s.c           | 247 +++++++++++
 sound/soc/meson/audin-toddr.c                 | 403 ++++++++++++++++++
 sound/soc/meson/audin.c                       | 321 ++++++++++++++
 sound/soc/meson/audin.h                       | 119 ++++++
 sound/soc/meson/gx-card.c                     |  12 +-
 17 files changed, 1509 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,audin.yaml
 create mode 100644 include/dt-bindings/sound/meson-audin.h
 create mode 100644 sound/soc/meson/aiu-clocks.c
 create mode 100644 sound/soc/meson/audin-decoder-i2s.c
 create mode 100644 sound/soc/meson/audin-toddr.c
 create mode 100644 sound/soc/meson/audin.c
 create mode 100644 sound/soc/meson/audin.h

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
