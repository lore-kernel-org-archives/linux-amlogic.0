Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62803C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 17:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3132620829
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 17:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Br7XGjgT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RDHfRQ+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3132620829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7o6sL6RJehLhxWlQVHgLN2HxkUe7GDY5Qh47QMAqzZI=; b=Br7XGjgTTDM9C9UnSrMYRto9Bp
	2t0I0L9/g3wcxcD41JrkT4Ny91lrdat/KJA/t580mVtRA0AZvVonRvXZF3c/VOipDOx9Mu4TiMG+I
	L0ubYjUiJ0kgTxpT2hTnawXmKCsjQ7SwloJgZGiYLcE+DjB/wGGJ8ngTMEAknci4WxIrpW8t+Pca4
	N0wkkj/VRmV2Dlomwy92f3Iy+79dhFcCeN8sHHwVhko53AigkYa6CPknnEapPIOYep54YELP0NnU7
	mpYOfwPWbdJRM9G9PQDIRAY2miz6uIforZeNfyCO6MbQ1zl7mPa2NVe2vg6EgQuEaECkZJRBO4Yli
	vP0jJ24g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1BvA-0008NC-R8; Thu, 30 Jul 2020 17:00:44 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Bv5-0008Ll-Ve
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 17:00:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id q17so14690334pls.9
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Jul 2020 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=oWQlZuTH8qNoVRooepfaddVhXRQnNQVnGxqOaUS+4A8=;
 b=RDHfRQ+NaQfHoZtTlFR9iY4RmQrPSLVv2h1mkA22Jwvv6+XVdbhr4MMkQdDzXtzqU6
 pmZeK69Tv41OuJ8A+CBLwqGMe6efcGhc9xcGUG8eiPr91zKJxy2YLnN8AigRkMK6AWNs
 fwd6bBl0U/GfbWtigWdo25iwB8Ai6PEjbnL3UhefZIlXML+KtuQsuHJ8FWnlELLpzSbI
 JU1NcAHg/jPViQAGvfiNsvceWgJ75xqxS3e2msoU0PyrQITOVsAr4Kyax3sl4DmDqecn
 nxMciy4dh4m9kaAcmYtJttFQtXzoddV7X8WBIT6mJKZ2HTvhy/Zq7s4uEXBGM3OGpHMz
 /y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=oWQlZuTH8qNoVRooepfaddVhXRQnNQVnGxqOaUS+4A8=;
 b=MC1/DAAMdT0l/l6up/AjhXvE/immdwIU7zoQgkxfl8bhJ3XRwyKdFRBV9wfeFiOKYx
 ksLmiJtMOUiljIjqPyBzmHNzGjRJzEeI1rf9/PIhWqFKt+KhGfE1+sTYhy7vDaZ4jHc3
 Fya32UCDC5xNXWY6xR+kXQMVreVDPH1uoLG+p/aMeiGYTp/7n5+f63imzfhuSLNPVrp/
 1aO2170LDRGjg5CoKp4yePwDSuHD2jor7v23X6TH/dze57W/sTKceIH4iSJtcA5C3XvA
 Cdx+/AGpjMn9X9b/PDiH9Wm+XkevOPwrUAK8GarJuDPJfkE6rp90Zh366aGqkL8rfadR
 89lw==
X-Gm-Message-State: AOAM533xBMe7hqO4z/W38I/pqIxThFtpCae4lTy8J9R65TKJEzzOSQzY
 5++vC/BUuYaOezDprrW4wlQKJw==
X-Google-Smtp-Source: ABdhPJw/ZXzd+3ys3RMA2jfdQSzMxtYDeGaeDs/yqFaq9Jb+BCI/jlFAEBY6XjSOR6pboMvEESfMcA==
X-Received: by 2002:a63:df01:: with SMTP id u1mr32387261pgg.401.1596128436184; 
 Thu, 30 Jul 2020 10:00:36 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h6sm6351304pjt.53.2020.07.30.10.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 10:00:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.9 (round 4)
Date: Thu, 30 Jul 2020 10:00:34 -0700
Message-ID: <7ho8nx2b0t.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_130040_128195_EDF3BE22 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Sorry for another small round, but it appears I missed a couple patches
in my last PR that I thought I had included, so here's a couple more.

Kevin



The following changes since commit f1bb924e8f5b50752a80fa5b48c43003680a7b64:

  arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3 (2020-07-27 11:53:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-4

for you to fetch changes up to 67d141c1f8e604a9c02d6a60f7827443d7f44762:

  arm64: dts: meson: odroid-n2: add jack audio output support (2020-07-29 12:18:32 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.9 (round 4)
- odroid-n2: add audio output

----------------------------------------------------------------
Jerome Brunet (2):
      arm64: dts: meson: odroid-n2: enable audio loopback
      arm64: dts: meson: odroid-n2: add jack audio output support

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 131 insertions(+), 5 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
