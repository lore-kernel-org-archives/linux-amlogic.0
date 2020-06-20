Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A978C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B9423ECE
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRhwQtgL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="L782xA9S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B9423ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//5UhsHNyhYEIMe1GkL1BcHKykPF48vwlayIknsP9ec=; b=eRhwQtgLQqPVe4
	NUNMZntfC6s4kYUnEsdessY+dr1HMapare8Zx1mjloVI2aEoKTvvwgkvGTIRaE2kHGGLSRDPXuz6G
	qWMV4aAwkeTaJgQFvSaSa/ULW314LRdAmfI257CsLLmmQWMhurkG8f9Pr4LiPMzHn5w94Hdhe0Huy
	8LgXkr0wLBfhjjPKV7ZIpYJ8+NY0eCSqN7/rOVQxKi/YD8asUGdtysSkbLWrE1JxAkoGdEoxgmC0I
	FYrHKXlM2MCOuWgDpT7VemdrJ5Be9gvts8MvfM0HBUlwYljNiNCrdj446GZAQorkREt0Aly1Bpx5v
	QNPv+/7bSjy5DiusDRKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmgUM-00085f-GK; Sat, 20 Jun 2020 16:37:06 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmgUK-00084b-6C; Sat, 20 Jun 2020 16:37:05 +0000
Received: by mail-ej1-x642.google.com with SMTP id p20so13540334ejd.13;
 Sat, 20 Jun 2020 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8AX8R3imm5kx+XT7/W2Ts6hqcoJrB3CcjQBEmxPQ64=;
 b=L782xA9SU2KpF1LK1w+gYtX+Znhse4rPvuuUsFUWseG/ssPmDzHViftMSSWAng6WMH
 i/uElNUm27fnXfL3hbJ3lkVADEYHKMtL5H0C4CmjKju1TI9cTAUjih9BmAfOePTZdC1Y
 stoPUS3Vxw3RVZNYM6quNTVAck3MuwCI/6V1LC2Sq2uQ2ZWGXSCo4k+xVQrkRWo8QZR5
 RF3502jufoSzJ5L+jMCJgxyIlbqPabIbFAbZslW0BZa9UJDP2J19EXh+6d1cKLa5hm8e
 XF1gn1YeJk+iBUM7Vpfn6oqpp47WaQdymYr0248D3Vd++0ET5JEBMcPm0Yfy6HuHyPpn
 0Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8AX8R3imm5kx+XT7/W2Ts6hqcoJrB3CcjQBEmxPQ64=;
 b=qIZz2pg+VjAosuF9INjubNotivNOZWw7vsTD0y8jmFM1spPU1JzXzfOr5mj44I5mFe
 U/YR3ME0XHHKO3xHNoVjdgDDmVQBRg/PXRk5JoIUaGbY08F4O9LHpa/HN78yZbi7lrgJ
 f0RAHS8FUigykiMCh1aYMCEqafOMx6XQDq+uVAJGQDO9h//NtJdQWvg8k6hRvQ+YsiXq
 53O9utf00T99qan+aNTUGOP32wpPvB5KGYCIBxN5ixkFFZKyAPTgIkHNjoICH/hkRWya
 +7zFZ94N9uLTTlfEYVGwTYc8k+OH4Sve7E4JDfrvEO37t1VUl1x2ORghUEivNtfJZpBs
 Y3fQ==
X-Gm-Message-State: AOAM531K1PAAMTzcXkUhxji3xnflBdTPtg21TTlhjH8pZXHwpLLzb5oW
 4fsJULXJoLBDNb5PJ/N7qar9CA0J
X-Google-Smtp-Source: ABdhPJytB0RQ7vP5S1NwhmU5+oyqtM1RLkmVXh+LR/PgeZMXEThswjoXXPc5XI92SlLqVC3pS4MTYw==
X-Received: by 2002:a17:906:3590:: with SMTP id
 o16mr8358243ejb.506.1592671022449; 
 Sat, 20 Jun 2020 09:37:02 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o90sm7839442edb.60.2020.06.20.09.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:37:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] ARM: dts: use the SDHC MMC controller for eMMC
Date: Sat, 20 Jun 2020 18:36:51 +0200
Message-Id: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_093704_245589_AF71AF57 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson6/8/8b/8m2 SoCs have two built-in MMC controllers:
- SDIO (which is supported on mainline for a long time now but is
  limited to ~40MHz bus frequency)
- SDHC (which supports up to HS-200 modes at ~100MHz bus frequency but
  for which we didn't have a driver)

Boards with NAND flash will now be able to use the SDIO controller for
SDIO based wifi cards and the SDHC controller for the SD card slot.
Boards with eMMC, SD card and SDIO wifi can only use two out of three
MMC based devices for now until the MMC core and Meson SDIO driver gain
support for multiple "mmc-slots" per controller.

Now that we have a driver for it, add the SDHC controller to meson.dtsi
and wire up the eMMC connection on the Endless Mini EC-100 and the
Odroid-C1.


Martin Blumenstingl (3):
  ARM: dts: meson: add the SDHC MMC controller
  ARM: dts: meson8b: ec100: enable the SDHC controller
  ARM: dts: meson8b: odroidc1: enable the SDHC controller

 arch/arm/boot/dts/meson.dtsi           |  7 +++++++
 arch/arm/boot/dts/meson8.dtsi          | 19 +++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-odroidc1.dts | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         | 20 ++++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi        |  4 ++++
 6 files changed, 101 insertions(+)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
