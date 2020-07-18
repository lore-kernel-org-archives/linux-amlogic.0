Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F025C433E8
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2542074B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CA8bo9vE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hULWg5e/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2542074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f4S2mv0EvoK+79GYcSWW2MEpS6kN2vNnCc7uY2eYJwQ=; b=CA8bo9vE5grv4aVr3I9ZPQYiXy
	PMlieDvYucR51tFrhTXrDECD39HIzexydO02+eywJ9M2EWPldAwbnLqWDlr/kc3Ut+R2q4JldIPIj
	ll42amhNKnWLpef/YvG2Jnuj6OmyASRXy6VT6nm0sYBN970Aqu+SEkqYaudUTdrHGByIawmkg/Igf
	e3fl1AxyVy2yYmZ5l9LCZZEs2DPcK8o92MvFVj53m7C7TkcOpX4FDdCz68wW2/TZYlK8D607Jw9/S
	9nn5u0PgG77bI08eWAniA0apxQOOmaGtroDOiY+Hw1XiLKxmB6XrcgQDDmllwE7uErtKvApJHbgHQ
	rsoeAxPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwhE5-000755-9i; Sat, 18 Jul 2020 07:25:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwhE1-00073n-Iu; Sat, 18 Jul 2020 07:25:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id 88so2996542wrh.3;
 Sat, 18 Jul 2020 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dKmmlTkJ/UK1rBdA5rLoQaKVO8RXmU6FeHJYL7jfrss=;
 b=hULWg5e/Woha7mtNXrFt49+AHIYkexrt8rcI6w4zndMhKK47SrMHwi6pnrPAyK1Psu
 kCLBz0xef4+bP40lXPyUiS5WCoAC/P2bsQweER7fSNS3iHXe9kxASVFcHgE6yOCB2wxj
 GvEicGY4ef1tPo0UCkKgF2VctGxdbcE1RQ4VX/rMZm+NisDTDuonBBo6fDXCrdDVYXPB
 vHIx/Qynek5hbd+rdZZBoGwnFej38me6BkyN5vgkDBrHIta2+avlzsV9PkWOVkJFT1xD
 Pyq/9ZL1sKhbDPbzzwoUFVmQ5smIKvh9Z7KZ/73QJ7pkVnrcx+n3416O+y3AjFdBf0UN
 WXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dKmmlTkJ/UK1rBdA5rLoQaKVO8RXmU6FeHJYL7jfrss=;
 b=GjuJSiiBfNuOLFpPCBTpXfUVrVZAdgFywUjiCR+k9Ul9oO2WE/CG3qM7sAvWgFUpFG
 pD7bO9JgEC7D9JddVzz5SpIqm21KdudN4ef1b0j9tg1/Hz6LTr3U7anNpyP0SMTasKAa
 BE1THdVLDIxfxJ4nYN+7wW3WLa3xiDa17FSJi1ykgSfAVwFwbfuLZ/3UqqS66la16G7W
 X9jmBzu3x/g23eaacikaB6htyvULgMU22DHQcDKbn1DjuZgESjGVPfq1xIFIZkEnozjg
 wk6SO0YQpD1C3MUbhMOp/VkTKoZgJTZpTSXob1qwbowasvrIuMIaLl7iH6ZmwkH0ws4Y
 EBJw==
X-Gm-Message-State: AOAM530DCjsqa4p3vFrVsRjJB7KtWqEF1c25n2TwdOZug8bPfFEGiYEa
 R73sPfSD1kbn/4ORHpRg30s=
X-Google-Smtp-Source: ABdhPJz6pZ2GZOEtBjMTXW3ONHReL3SZ/nRUksYF8p5JqWsqUrczP2SwHKfQ+DWsmLkyh+WFUFUZgA==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr14502799wrx.166.1595057136678; 
 Sat, 18 Jul 2020 00:25:36 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c7sm19550192wrq.58.2020.07.18.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 00:25:36 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: meson: add more SM1 soundcards
Date: Sat, 18 Jul 2020 07:25:30 +0000
Message-Id: <20200718072532.8427-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_032537_811109_CAB5C3DD 
X-CRM114-Status: UNSURE (   8.85  )
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

This series adds basic support for LPCM audio over HDMI interfaces
to the Khadas VIM3L (reusing the same config as the VIM3) and the
HardKernel ODROID-C4 devices. I'm sure support can be extended to
include other hardware but this gets the HDMI port working as a
minimum capability. I have personally tested with both devices.

Christian Hewitt (2):
  arm64: dts: meson: add audio playback to odroid-c4
  arm64: dts: meson: add audio playback to khadas-vim3l

 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 88 +++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 88 +++++++++++++++++++
 2 files changed, 176 insertions(+)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
