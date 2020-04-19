Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0FEC38A29
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE352078A
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZfIRjp2j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOg3j33l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE352078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Y3L2EWrAs1DMSmDQd2oCLABahpX09u0pD9cXW2xof+0=; b=ZfI
	Rjp2jHME6y9NpcqXi/FGRK5i1FjfiZUJ13+6iZHXrjG7CBLeYpB9BtjrX306JzP1u1vAM5l00bvCz
	kKyM9aCM2YUqA/+Z26PtAzVIgwz5eXNEUnw3K0BwJmLePA9+fQVPm5QEkWk9i5AQz1mNaZ9ab/hfv
	1SX/w0mR8p9FW/dF+JiBzvan/pUvpyoGDu58PT/G9MsPTeUEfHNcb1mNfCWMAg+eK/ofClaqK8uNw
	U0+GLotJdoJusgm20hLL8g/Xh8sPmMW5JvsNrgfxn15SChCPz3XZXD8DFnN6PKuza1bWyGNR6jytt
	jH4yBcikUcszYemuCsxwZ2X3ZyEJ2DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2fC-0004wO-Bk; Sun, 19 Apr 2020 05:38:42 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2ev-0004jT-JA; Sun, 19 Apr 2020 05:38:27 +0000
Received: by mail-lf1-x141.google.com with SMTP id 198so5205676lfo.7;
 Sat, 18 Apr 2020 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OBR4WRUFWczbdU3xVNyI9eSmEplhWFtGL1aInpJgtYg=;
 b=BOg3j33lf0c1vwAylrk6BloplwvTcJVopaTfJJW8VS7+c3Ci6b7inILZAdbYc5mnk8
 XGtvrM8lmm015naWOdVjMwegO0if7vKhGNYz3whOG600DGl4oWQtBrvIHm+mE2jA8ZE2
 BgHKc+R5aOvXVJj0t63RUZxtkwPAB48izeY3NBFjxJZhL7nkbwc5KUU/1TsaZf40symU
 BEgu6/OEFpF+O38KEuhUNNCSoIreE0SS0KDsrRt1+q6WxbEND4qahP6oyDBTvbuFmxG4
 ACTq34ic/Am83XYTRQG23VNELMQJvHTEQrSP2LH51A9+st+NPGy9MuO0uyxJxIorGZz8
 LjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OBR4WRUFWczbdU3xVNyI9eSmEplhWFtGL1aInpJgtYg=;
 b=OJqqZ/5hCET00KC6gBIh6ZeHwBQ7Hdgn9ejNQ8353+SPTVC67XbK08L3D628mulbx7
 ysAkUO2T0ovkCbC1SkXnKNsGZoQAkwp1Q9v2YH1hB+Y6KSwe0m7we/D3M7A4+TBaVJdI
 nDvu6SmGBqf9wxTGyv5j9kCOsKohUHOrxN+jgPPRFD6DYg8cmrf+2nh3reqo6xOb7wbp
 oI8DJ9xbWHpXcCcug/ofsmQtFHCIopiOX4ctEgskG0n5yZC2y6a2VkvH4nyo9ZMGtDZ3
 3VadHwkU5d5dVWneHPmh50DuKGK7BmuqjTiyL1qmaEsjsFfG4l93qBlRzQqpxicpTzQk
 H5Aw==
X-Gm-Message-State: AGi0PuYpUaQGYdaPucltun10bp+gP1tgeKSe23YyKh/memyDagQlYhfq
 /jP5cMrLX/b9BlpEgAliV/Y=
X-Google-Smtp-Source: APiQypLzklkGqk/+BSxL5MA3tlAC2LLW/5YlG90c6OQMMnWUKLZmZTC7oeElzqGG73Y6/Zw9AmOLtw==
X-Received: by 2002:a05:6512:242:: with SMTP id
 b2mr6816508lfo.92.1587274701603; 
 Sat, 18 Apr 2020 22:38:21 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r23sm20416619ljh.34.2020.04.18.22.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:38:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: meson: Simplify G12/SM1 Audio Configs
Date: Sun, 19 Apr 2020 05:38:10 +0000
Message-Id: <20200419053815.15731-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_223825_656514_228493A6 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series creates two new dtsi with the HDMI and HDMI+S/PDIF audio configs
used in most G12/SM1 Android box devices and some SBC's and switches most dts
to use them. I have not touched the SEI510/610 which have extra hardware
in their dts, and the U200 which does not currently have audio support, but
will likely receive an 'all possible routings' master config when Jerome
sends his next set of changes (looking at his WIP branch) so I leave U200
for him to address later.

One advantaage of common configs is that distros that need to embed alsa
conf files as part of their userspace support now only need to include two
confs that will automatically support more boards and boxes as they are
added, instead of needing to track and add confs or card aliases for every
new device.

Christian Hewitt (5):
  arm64: dts: meson: create common hdmi/hdmi-spdif audio dtsi
  arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
  arm64: dts: meson: convert odroid-n2 to hdmi dtsi
  arm64: dts: meson: convert khadas-vim3/vim3l to hdmi dtsi
  arm64: dts: meson: convert x96max to hdmi dtsi

 .../amlogic/meson-g12-audio-hdmi-spdif.dtsi   | 139 +++++
 .../dts/amlogic/meson-g12-audio-hdmi.dtsi     |  96 ++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 131 +----
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  85 ---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  89 +--
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 541 +-----------------
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 423 ++++++++++++++
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |   1 +
 8 files changed, 663 insertions(+), 842 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-audio-hdmi-spdif.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-audio-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
