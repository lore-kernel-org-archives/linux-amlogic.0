Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEC6C47423
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:31:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D61D206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLeQzxjx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWIB0bev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D61D206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PQwTGo0FwTRbmtYl8l4bif98oD6S7vAQGRQkCfgQEo=; b=kLeQzxjx82CNeQjSppu5YnDoz8
	zSGOXgKf4mVEmzinP6dUJlBVwNjVIhjaN3QjD9atkeB9df1z+5T+0ciIb1MYa71NZcI6BietC55dg
	+yTXbIq5RTPJue/8R9F1q/51q631BolX/fnquHgUtnBqfU+SjizN3QAJ1zsQp+6wLvfEWu3Lv9rNp
	VAEQB9r/jw9U1S5qI/iSU93CMChkWaV5oHBhADi2Zq58uTGQsRm/d+qRH5Tok17mZGBpgNDya4Kev
	tKM7tsAj2OOyfcOm+foIkeCuaOUBS3qmTFI+AF0S18yOdggQDUIDAyb0ePzLRtoIxFSg/OB1Ethsk
	JpdAULpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6B-0001Ja-BC; Fri, 02 Oct 2020 14:31:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM66-0001Hx-Vd; Fri, 02 Oct 2020 14:31:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 13so1916822wmf.0;
 Fri, 02 Oct 2020 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6o5jHfcjbw5X3IGqgGWdir89nONyuyUEchA4DUJix40=;
 b=UWIB0bev3xg2tOPk3cOSDdcEz35DItpIA/02YLXLns/QR3nPDr+Tn39FOEQPVdbFd+
 H6phd+DbKxi9Og6/8DlAVr/cJINOAME/KlKKEOiHlEw8ZMe9blKOKcH3Je8ctPioXUtG
 aWoGwPCw9B2YqX5g3aIFpwZ01R4An0lCCQcYwqIkAdsBPzDgkD/dV+SEHIXFkB2y5XIp
 rEKqcjohlxMfwkCtJ9GgRCaWxsqURiAg1R/vXCdwIJqcxBoEEFGbdsrRxrZH+z4ackeI
 KGqfwru1urBy2/3llsa0sq3L4Jyvz9RuyGB9pgwKjMDVIWCvXhp52JvzF6vz4p5QwOEk
 Yz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6o5jHfcjbw5X3IGqgGWdir89nONyuyUEchA4DUJix40=;
 b=IiOLjBj16j+68AEBChsPkDc/+oizVEvjMHfV3YHkAfYdBUzCIreoUdoliapXHXroOs
 QXU3sXGV3C4WCdtQ7a900HWb7dTLPODAnQtSF9rFh1qS4eGEnerk5pZRB4lI0bxDQMPh
 nazIX2arF+MqyXDy2dL/XwST+AQq0u5r5XQIAVTH89z4RF0Oc+sGIYWKaK8Bdz1LaBPB
 wf6N0RBaE7KSAXifqqAd43eSkaTiBdTJCje9kejdkkDF/1DRGeK3E0r05XRfHq/I0bWh
 53PE3wmuCNCMrHfBJ1FudTl7/5qdlNk7CFfQ6hbXpEqmXhqpMO6WVKJiom29GfDe2VDM
 TwKA==
X-Gm-Message-State: AOAM533T6Da1hPg0zWitHQ/Ox4OsAN2S6j0AFN5OzSxb6lUdXBfczQI6
 aXZoTrQLl6l9rDlNiznaV37prMRmWCY=
X-Google-Smtp-Source: ABdhPJwcBhx8MfW10XshdbWBrBec7TjBSbx9dXWZePPSkzyIMzN21tQ8bYJtJsv7m27t0JkHLjwlUw==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr3234029wmg.74.1601649105740;
 Fri, 02 Oct 2020 07:31:45 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:45 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] arm64: dts: meson: add more GX soundcards
Date: Fri,  2 Oct 2020 14:31:31 +0000
Message-Id: <20201002143141.14870-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103147_051096_5A3D9530 
X-CRM114-Status: GOOD (  13.35  )
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

This series adds basic support for LPCM audio over HDMI and S/PDIF
interfaces to GXBB/GXL/GXM devices without support. I'm sure audio
support can be extended in places (some devices have internal DACs
and headphone hardware) but this gets the basics working.

I have personally tested with the khadas-vim2, odroid-c2, and both
wetek devices as I have them, and there are positive forum reports
from users with vega-s95 and some no-name P20X box devices.

Changes from v1
- Drop nexbox-a1 and rbox-pro changes - the regulator changes are
needed to get the dts to compile, but I do not have schematics to
validate the changes or the hardware to test with.

Christian Hewitt (10):
  arm64: dts: meson: add audio playback to a95x
  arm64: dts: meson: add audio playback to khadas-vim2
  arm64: dts: meson: add audio playback to nanopi-k2
  arm64: dts: meson: add audio playback to odroid-c2
  arm64: dts: meson: add audio playback to p201
  arm64: dts: meson: add audio playback to p200
  arm64: dts: meson: add audio playback to p212-s905x dtsi
  arm64: dts: meson: add audio playback to vega-s95 dtsi
  arm64: dts: meson: add audio playback to wetek-hub
  arm64: dts: meson: add audio playback to wetek-play2

 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 +++++++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 ++++++++++++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 ++++++++++++-
 10 files changed, 464 insertions(+), 3 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
