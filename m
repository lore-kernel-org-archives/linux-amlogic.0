Return-Path: <SRS0=+F2p=SW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6AAC282E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4281221855
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8+JBL13";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LJsLFwpq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4281221855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evaEMDIj8NwmjesFuTdKVs3FRLsEe+yXtll3HNWlUuI=; b=E8+JBL13Vsekhk
	bPpqsbzMaW+myNIWU0D20nBGX8pXtroLl3XvIuQYO8SwW5YxbK1yg/BdGCmRO7BEIjVvqrwlzj/Az
	vsyS9AtVjY8MwKx/DsKcC6eDsT2ZSUl3T5aOmfLR4lAijsJgqxV+TI9BmvKrCdg38IXiU8LgWJBNB
	FRWSYr86FMW4QT3a/tm/uddKH3EF4qBxEu3fu8Nla767LEy5F/fwloT71KcID/QVJ9hrJiC1I57qE
	4q+OFInsc96bu3+Qe9SmA69let3vsTz0QEQvKKyVAeW29jE7guRAojiwE6a5lgAxZ/ennvaRXkPYu
	vBaRSzi7UI/LJHMPTiUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHmN4-0006nJ-1z; Sat, 20 Apr 2019 09:33:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHmN1-0006mK-3h; Sat, 20 Apr 2019 09:33:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id n25so8725449wmk.4;
 Sat, 20 Apr 2019 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlwusV5xkrlPrMvp3F6BsXTUrYiLIFI2XvB6iP5cgFk=;
 b=LJsLFwpquTfoWgpcKDZr4tlhW62nbLMAZTfSrg+97SjPTIAm5ZKKlU1uMHBRBQ0c0k
 CCNT9j2z/C5+2lbW0xLV7LzipRgue8kF8i9faFB1im3XB5Z0maSXvkqOid7rAq19JFWt
 T/t9rf/ANQQFhF44q5mc6x8zKcGpYYEkNmTruJNPXlD9OjshIblHSbYZbUEXfxQUoHDB
 d24jEWSDtWkGGnfvkyZGW6JvWDaaA31UkmhD+3NZTFuXnaS3u266p+Xtj4pqAkYUbdW/
 q5+WKbXc2FkH2pyQ0Q6QpTZn+ycb8oOvIbs6abOfUskTKb86iksaeytI6wjbV6Yrb5uw
 59qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlwusV5xkrlPrMvp3F6BsXTUrYiLIFI2XvB6iP5cgFk=;
 b=KieYcWI/rNnhTU6mKSbmGFCI4AIO1XdbMTY69QacGfflfxkBFng8ZsUovaytEzdDQQ
 zd83mPYTOz9OdpxzfZacLvErpHBHN7l7f2qHVLXVJ7ZYPf1yVDufKEFmhp8oOjEOAm51
 NuVELqAJoNTr8GEfNopHvkpzaijAKGO/XtVX9DSHO12NVyQOws4cNDNqByBuMo2zYJvT
 +VZTEnQRheWlqxRYkDAd2/MPdVPmaXsC8lpPgnJ+pZCNwFgB6L4iqoogv8rMHtqyHAYj
 NrlZxhYjoxYqIl6ecc9fO/qlHD/F797aZINVZ0xBZzj3zZEpcGeluUW7/6Bc2m5GhuQy
 X+Qw==
X-Gm-Message-State: APjAAAVyW46zEKn3mwsALZvt2HBUrv3MI4MNkCxImwrJ2DG4GHuNJSy1
 kkRbRwqeeNX3MotIqxWDGApmPq/K
X-Google-Smtp-Source: APXvYqyOm16IL7NomyQEgKcwNH2Yz97yqIwRk456Tr7o8sFhFjDbNFHfsWTwT0nv8hrxqjbXNj4/dQ==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr5220402wmh.123.1555752792829; 
 Sat, 20 Apr 2019 02:33:12 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0028C4739A57449001.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:28c4:739a:5744:9001])
 by smtp.googlemail.com with ESMTPSA id w11sm12858244wre.15.2019.04.20.02.33.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 02:33:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/2] ARM: dts: meson: two GPU fixes
Date: Sat, 20 Apr 2019 11:32:56 +0200
Message-Id: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_023315_172379_22B2E235 
X-CRM114-Status: GOOD (  10.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

While switching over to the main mesa git repository I was testing
kmscube again. On my Meson8m2 board I noticed that two interrupts were
correctly set up. This didn't cause any errors so far because on my
setup the lima driver is using the "pp_bcast" interrupt instead of
ppX and ppmmuX.

While fixing the interrupt lines I also noticed that I accidentally
left the switch-delay property in there. That was needed at some
point to run the out-of-tree lima kernel driver. It's not required
anymore and it's not documented so drop it.

Target release: v5.2 (if possible because this is where the lima kernel
driver will land). No need to send it for v5.1-rcX because there lima
driver won't be part of v5.1.


Martin Blumenstingl (2):
  ARM: dts: meson8: fix GPU interrupts and drop an undocumented property
  ARM: dts: meson8b: drop undocumented property from the Mali GPU node

 arch/arm/boot/dts/meson8.dtsi  | 5 ++---
 arch/arm/boot/dts/meson8b.dtsi | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
