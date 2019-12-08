Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB01FC2D0BE
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:06:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AE6206D6
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SFezlMgc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tOtvps2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AE6206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ku3yHbsS3ywju6oFHgXYKwHE0qyam/aHPxdpkvEFIo=; b=SFezlMgcjF9avw
	QSqf698EYdpY2EyIRY7roBe53fW8o/nG39HsfK1Brxn+9Zl3yRiL8MipdLXv/JFKJ7+c0Gdl1njTs
	6rmIYzfcjIcitoXMwYUL6xJocg6oUU3PrqLgKqQrmzkAohdkijNI0dpQ5X+JWuVvPgogVLQGiHzCC
	ep/fRad04h1pefLlffYtUi9PD//hGN+EEOSMPva3aCH3JBE5I2YsCtwt74cv8PRIegrmOtxH8z5fF
	e78CoTMyEHjBnAgIfYq9dCPKmx5r5JfZT+HOXtTt9KsvlKiq18FMgcJEflM8Xow9YGoJmj5FTL5A/
	tStq12W/j2ZSIQruVOiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0wU-0003cs-9z; Sun, 08 Dec 2019 18:06:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0wE-0003J3-Cc; Sun, 08 Dec 2019 18:05:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id w15so13521688wru.4;
 Sun, 08 Dec 2019 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrbyKEPUyhJODwpL6MZk6uOXEO7AfKjtrzxgQThGJVE=;
 b=tOtvps2xdgPd/1jyKlCLBio5DsXVEy3vnppk0Yv/f9a3OJdDHkwvYpDVY5qbjyvXVl
 ZYvaKRXUqKo5flNBkkKapRk46BE25YUTqqqwoh/s8Ax+2iJjbyoOQ/aXwKCFiuGUZvUs
 VDjSZfIJI+ndzu6URsxwSuNzc7nmD6Cy6Hw/77UV0OTpKVMy10Kx/3qn7e83fIt8v9jm
 1j6aJURXBrU0Wi0kP5I81DZ4Qk2g/Gwreb1Tgm4putx11K8ElxKiftuFRuCpUsorAduP
 dFZjdyw01P4z/hG+iC/jCQAgGyeRIdTBLlQmQ9+hDEdN9G4gYmQLkwq3RngID9NkuybZ
 GxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrbyKEPUyhJODwpL6MZk6uOXEO7AfKjtrzxgQThGJVE=;
 b=rf3TU5n7mRMwjm1+pZHs3jP5k1Blo3+gv/pOG2QFbuvzMGfMrWcvRqb4kVCf6Lj8dm
 oftprBRUTmnXaTD8ao2anduy8poKnQRecmjrXbysRhNfQcAFyaUrkqv/ZIX5YA3y+IXt
 BLL4+GVtJN+SO4VftrNexdedy5ozhbiMZ2llr0CSz1+bGPNdvdR2vy7zYm2LtdVr/wsu
 480YjkOThjxuMWPaZFsLbR9OkgQwbR+k5UF7DVae9U/285YCxjsy3d67nupyUBtoASpw
 FQvRWQ5ijpM16W2P0efp9CAKrrGSkwuy03Lz53E+KJ2p7/ce/Xq17vy2EXy4F3P0xqzb
 xHOA==
X-Gm-Message-State: APjAAAVlOPXfIJHc8V+ljyrKBbaHXeXxReXwJyYTkTidownbNARe0AL7
 lXYK0iInEl5O2AJMWloILeYgMs7U
X-Google-Smtp-Source: APXvYqz9wd7kfXtCdLV1zh29Di2rYYLEmHEcb9PsQ0KjiqQTKyoqQa9+1756o6yKsX1N8clbMXTGtA==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr28615833wrr.266.1575828341552; 
 Sun, 08 Dec 2019 10:05:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a64sm11797687wmc.18.2019.12.08.10.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 10:05:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com
Subject: [PATCH 0/3] ARM: dts: meson: clock updates
Date: Sun,  8 Dec 2019 19:05:22 +0100
Message-Id: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_100546_424676_14A315BC 
X-CRM114-Status: UNSURE (   8.20  )
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

This series moves the XTAL clock out of the main (HHI) clock controller
because it's an actual dedicated crystal on the PCBs.

The last two patches add the DDR clock controller whose output is used
as input for some of the audio clocks.


Dependencies:
- patch #1 has a runtime dependency on my other series:
  "provide the XTAL clock via OF on Meson8/8b/8m2" [0]
  Jerome has already queued this for v5.6
- patches #2 and #3 have a compile time dependency on my other series:
  "add the DDR clock controller on Meson8 and Meson8b" [1]
  Jerome has already queued this for v5.6, but you need an immutable
  tag for the dt-bindings


Jerome: can you please rebase the v5.6/dt branch tomorrow on top of
v5.6-rc1 and provide a tag so Kevin can apply this series?


[0] https://patchwork.kernel.org/cover/11248377/
[1] https://patchwork.kernel.org/cover/11248423/


Martin Blumenstingl (3):
  ARM: dts: meson: provide the XTAL clock using a fixed-clock
  ARM: dts: meson8: add the DDR clock controller
  ARM: dts: meson8b: add the DDR clock controller

 arch/arm/boot/dts/meson.dtsi           |  7 +++++++
 arch/arm/boot/dts/meson6.dtsi          |  7 -------
 arch/arm/boot/dts/meson8.dtsi          | 24 +++++++++++++++++-------
 arch/arm/boot/dts/meson8b-ec100.dts    |  2 +-
 arch/arm/boot/dts/meson8b-mxq.dts      |  2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts |  2 +-
 arch/arm/boot/dts/meson8b.dtsi         | 24 +++++++++++++++++-------
 7 files changed, 44 insertions(+), 24 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
