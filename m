Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BDCC433EB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C812076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofp7XQqI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuEcNv5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C812076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y/gLKjGnh+Cx9TcQlpFMdHa0410jUQpeh3InKmBteoY=; b=ofp7XQqIZENKCPZUCrbsgoDNmd
	YvAmEA7xO1+wB2Ehgl2tdqdXI1metNrvSwbxpbCIx+1wNuXkd3pZvbeuSZ0FqToaHao8LMylEWD4P
	h2c3ctu8IFaUH7ukVg9lfjZeT/bzgnWq9clI0XwH6N2VZhmlkoZHRSknk1aIOmYp1OuPKDwtfti78
	+q63MOICcSE6GPpc2+r2lKtk42Prf9jWuohzm47fsW7xcMOMuy17iaQlx3ygCGNJqrSlaZJqcN/iV
	DrIGEUtnUdEPIOTSN5VmVzwBJEEZ1fdkQMtLF4I99lpbmfRTxkNTr13oYbiYtu+/PX2Fg4Yf13326
	jmBb7/5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgn9-0001DN-HY; Sat, 18 Jul 2020 06:57:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgn3-0001Bu-T1; Sat, 18 Jul 2020 06:57:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id q15so17758790wmj.2;
 Fri, 17 Jul 2020 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pyjWDtKMxx4/68tXkVpiBJVCOhw66qo2kRjsgA+vwPA=;
 b=ZuEcNv5k9Z0KZbqh/KPRDsLCM6yeWEL+b4iJp7dXRBzCc45ij1G8/u9fz4MMuhdKlW
 7ZX6kuFpXr6FvTWUzPkCzngLws8K0HaiMUods4h4UAvvJSwzX/jX2Z68ccUJkNp6WLQo
 VjrgzgnmVezt0s0zwXHJyAQJ3mtPUjGOrz9hsh9B3Hiiq4G8T84q7kmcpQFy6gBTBWvC
 81udRbRsiHE03035wEkE6B/LeF26HHAM7+5tS05cwZQYRJWmFDq9YQVX8Y0WZ6phS6RI
 EOhrO/0Cf6zhSc1hiO8u2eTaGS1gKc8eZU/iV22M5PJegqCQUrYVO8eYEIaFRGf9XMRF
 cl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pyjWDtKMxx4/68tXkVpiBJVCOhw66qo2kRjsgA+vwPA=;
 b=MJxy6MB8FzW7lrlnEsN4SOIv1yZqp4zBz1px5VnrRiVFM4Oe+PF4wx3Z6ZiGIjL52E
 jazQ70LPBJgXHf9BCNYpMCauQppSUdSWIwWSGVNgzs1VfYJbC51Ja/3Lrqx73ilFTOV8
 7+AUFgCdribEh31Kf8h3UBJ1/PbsRQ3OQC7YBdnseP4QeIYvvcrb375Tkct8Pa2Kxkgj
 EqVPucEbUNFQVx30uJXFViI08gxra0I4+eOn3Ywh8g8qHsyUrkkU66I6EoTrwwPFoEfm
 pHKcCTJdt3vZcrzzVE8oKt4iSJ6nda02XcziuavQ0StslK6B/m5LU/+6hkIBG6YESsvj
 Q9wQ==
X-Gm-Message-State: AOAM532BDvCWx35g5Onkxwu3QKEPJdtQO50dp/1dTK4BTvHT6Il2sCn2
 pBdizNtKh6fTwOt6Tt8CVHI=
X-Google-Smtp-Source: ABdhPJxMqh5d+Cifnno+A3aQ3358AxXfuypnLtn+XMRwXlPwY9BWTNOeBgzdyhXgVDCffOKXu1KJzg==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr12983342wmi.85.1595055464539; 
 Fri, 17 Jul 2020 23:57:44 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:43 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] arm64: dts: meson: add more GX soundcards
Date: Sat, 18 Jul 2020 06:57:27 +0000
Message-Id: <20200718065739.7802-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025746_230993_AB089743 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: chewitt <christianshewitt@gmail.com>

This series adds basic support for LPCM audio over HDMI and S/PDIF
interfaces to GXBB/GXL/GXM devices without support. I'm sure audio
support can be extended in places (some devices have internal DACs
and headphone hardware) but this gets the HDMI port working as a
minimum capability.

I have personally tested with the khadas-vim2, odroid-c2, and both
wetek devices as I have them, and there are positive forum reports
from users with vega-s95 and some no-name P20X box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Christian Hewitt (12):
  arm64: dts: meson: add audio playback to a95x
  arm64: dts: meson: add audio playback to khadas-vim2
  arm64: dts: meson: add audio playback to nanopi-k2
  arm64: dts: meson: add audio playback to nexbox-a1
  arm64: dts: meson: add audio playback to odroid-c2
  arm64: dts: meson: add audio playback to p201
  arm64: dts: meson: add audio playback to p200
  arm64: dts: meson: add audio playback to p212-s905x dtsi
  arm64: dts: meson: add audio playback to rbox-pro
  arm64: dts: meson: add audio playback to vega-s95 dtsi
  arm64: dts: meson: add audio playback to wetek-hub
  arm64: dts: meson: add audio playback to wetek-play2

 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++
 .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 ++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 ++++++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 ++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 ++++++++++++++
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 ++++++++++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 +++++++++-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 80 +++++++++++++++++++
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 80 +++++++++++++++++++
 12 files changed, 624 insertions(+), 3 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
