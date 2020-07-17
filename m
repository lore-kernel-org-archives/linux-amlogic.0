Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B0DC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 17:54:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138D12064C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 17:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swCrzBPt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wM01pNSz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138D12064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5JRl7AFzrTYv1G8C4DyLlQqycgqFCxEmEoePUtEH0o=; b=swCrzBPtz28kvc3EMHYs1moMKC
	IOa6dJDJprVdzDNCljO9aOj671D5FyxSo6OX3H4uD06Ghyzu/69USm/Ro2CCpN3KhcuUTwVtUydpN
	GROAznGhw3iPt7+W+gd6zCpLovxPuIMECBojLUUEV6T+ROX2Jniwapms5aqRdCkg423+LDN5/LTDw
	LmwuFQLolj0J4V2ki3jPQiVgYKKe2ZRrMfyNiWyN/extG7zJ9lF75kMIIZfehtRVDQJRLO9bA6JoU
	TUXfqxT0Y96+fKF/B8Sax8+VEjbWVyJLXV+KWXkwTS/AL29HjXslR94uEaAI5C+/kTJIP7h7t5Zez
	UT4UJ5ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwUYe-0008EE-Qo; Fri, 17 Jul 2020 17:54:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwUYc-0008DQ-Jp
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 17:54:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id a23so4166527pfk.13
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=E9hq8CqUTj530zDCzvMGDTVcdgafjGzDVPGnVfYH7VY=;
 b=wM01pNSzjiRmCpYS7G3KVJ+XvBgMHNXAWWu/0Xl/rx7gD0Pm8lItpCfdi+PwMD7q0Y
 xCbIdARnGbtuTYL+62Es6FNu4aaRQuvuRwGURnT7zH3x45lgVqUNJ2RHduQ7K/ueyaQo
 e+jlCZzDtQL4o9/se4IihN8GDxXDF7IPpLyHUYLazUgmHSvEUBeD8nxwdQUxwq3XWQ4w
 fLSzCMvyabaGiAaI2wUER/L5keUnkBLcqxQ14WLtaM2x0ILhwLW0O74fCIEgtg5+GOc8
 L1NZVMaK6Ez3bep2B6exKpLFnYZoGoupnmHNJH8LuJo133EchbIwvCB6FVJN9HJTl8eV
 NYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=E9hq8CqUTj530zDCzvMGDTVcdgafjGzDVPGnVfYH7VY=;
 b=dAz5TFAQWtGWVE5esdxb0nGgzKRjzVP+4Jf5zm234ERP2bvDaBsvbzb4+LjMhI+MZT
 QHB6I84bU8PRMZAiish1P5l6CVqfA663yxSXk8qW0M3yeGgxin7HAPFta+9ueWWO6mFT
 GMdVIM9S7l4SmSbUMrF/j2pjtOsarZB0hntSD1DkRLFKQVzLNQzKoJJ9IFLU8CUIK+q8
 NuBtLSQL5bxWtszB70r5ue0KzVx5LTtpZ6aQhRvNK0fYdBds+FqSPpepopuxgEOJWnfP
 ONtyQRBhtloN0OdsTxUfDzpbSTLij2to51vvkh+ag33eJM9GZ1wor5UDu9YftmWhcdUe
 5PVg==
X-Gm-Message-State: AOAM531AGO6gIXEdjIuXmhB3emhMScKthd0u6CuvZazR4nGLZdvNfjDo
 28o+GwrqJxPNWuxAz3gyhuZ/OA==
X-Google-Smtp-Source: ABdhPJydbT+xhJ7q3Cu7yRpCP0d6TnCk2BSkQo9w1zj27UCfThHXvFdWFIgX53CZbdu6F77JC5F8RA==
X-Received: by 2002:aa7:98c6:: with SMTP id e6mr9150871pfm.17.1595008440370;
 Fri, 17 Jul 2020 10:54:00 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y7sm3376435pjp.47.2020.07.17.10.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 10:53:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] ARM: dts: amlogic updates for v5.9
Date: Fri, 17 Jul 2020 10:53:59 -0700
Message-ID: <7hd04uf2o8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_135402_795468_1010AD3F 
X-CRM114-Status: UNSURE (   5.00  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to d6a3873c7be6d58914ea5584dc7875f2045d6721:

  ARM: dts: meson8b: odroidc1: enable the SDHC controller (2020-07-13 11:58:15 -0700)

----------------------------------------------------------------
ARM: dts: amlogic updates for v5.9
- power-domain and MMC updates

----------------------------------------------------------------
Martin Blumenstingl (6):
      ARM: dts: meson8: add power domain controller
      ARM: dts: meson8m2: add resets for the power domain controller
      ARM: dts: meson8b: add power domain controller
      ARM: dts: meson: add the SDHC MMC controller
      ARM: dts: meson8b: ec100: enable the SDHC controller
      ARM: dts: meson8b: odroidc1: enable the SDHC controller

 arch/arm/boot/dts/meson.dtsi           |  7 +++++
 arch/arm/boot/dts/meson8.dtsi          | 32 ++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 25 ++++++++++++++++++
 arch/arm/boot/dts/meson8b-odroidc1.dts | 26 ++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         | 47 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi        | 23 ++++++++++++++++
 6 files changed, 160 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
