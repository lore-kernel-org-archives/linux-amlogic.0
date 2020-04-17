Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D15C38A2B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D502220A
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0dUJnCo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VFWrd83n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D502220A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YkpujXjFSMW79tFjhE8YgLGng2sH2779bQd2gOcik/g=; b=A0dUJnCoUWMy4L
	Vx49/jAJlzFT7TeTLDMrK+btLq/qW/GyWRwXfXn3Wy4bIztyjOS/aPFOSS1RjHllOdAcgFteLg5Ft
	lLeBZSaY8OKiUKxRSkAPpfpAr7Fdk6ZJB8IRpswaaHVhB2bLyTetEUQOonYs8y9uG3bd/Rk1dqmIr
	s88e4KHLZarjGLCBZD+KgR2VjSYQ+oKnpYPaRIYYgyc4cOV3SPURKx5Vcxc0UfK5PAKOkPUTTpYIX
	BG5L96i4uCueuqNgoMLM5GJ1S1sRWP5aQBetO0K1XuKd+yrS+jFRsVut+LbZtfGVt1iPP3FoceuGc
	sOZhPN5y6amb3bGJLGBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWM1-00025f-KD; Fri, 17 Apr 2020 19:08:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWLy-00024d-Te; Fri, 17 Apr 2020 19:08:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id x4so3997318wmj.1;
 Fri, 17 Apr 2020 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMuvuyOtFyoLpiY9akzKJAflY+hfg2VBUUL0F5qxAe8=;
 b=VFWrd83nihPAd9jGqMjJj7mOg7uSRRuJRre/cQRjri0xNaNlduifUNSMb23hB8pK61
 aR0V7qTDd6xAXXytHpIulp6uwcM/jyxG5myWZIHq5cclm2JD2XW6jhwpsBzV6ieOc3RH
 Ywo1LCk5SLOhNLgszZVxqedyiHcB/mP0DzLD6vo6gK2Igw37afpghTZBfKlEieCq6hbs
 mxqwCuoYI0GnFfbKROnT93/1tdM245mHGpZhrcHzEQ721DuhYbQI7MkWF6u/ayUp3iav
 iLI1ZPkio2N+5P6lIoFtRrBDxmQqG7i8AftYmJwLRMAD/gCn0cNvWQthBICnbuEbgv5z
 wJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMuvuyOtFyoLpiY9akzKJAflY+hfg2VBUUL0F5qxAe8=;
 b=Cf09SjubGVYGYsBXTkf/64X3kbpMQQt3pSV6tOG8PVJKJmfCzGtOjmBVSrR7E6YaPT
 gCGXt+4EJmTDcG2aaUtxFs1rSvzKDn+LIMrRnzWDqHKvPnVpXVQVw7auNERbsGwuQ9YJ
 G3vqQx4aW6yA08YYQsVlduDTtAo2BR7F1/54fl4EbfdSzo+ONzAbSSFVfP68YoQcdyxU
 /BVLR25ZitBGfs0gj7h3kiNaypXR1CI3p48GmQi/h5bJIx2HDBxA3xDQjF+xINQjIKW/
 8SPmjWBspWW+4ObzPKQNotimGOb5d6PNSefTGzL9a2rgngQLU6fy5G+nQAO153zshSlK
 HhMw==
X-Gm-Message-State: AGi0PubBOVTBxZJ1mrzbD0+4WLS2zukQvc2rsuSN5ae2w64J0Fo25yqP
 qpCNWmu0acWv6KLTbNOtPeo=
X-Google-Smtp-Source: APiQypKLFPW0P7ews0g26VQ1VAHJSlCWTLKsKwNJUPZQRwT1ZhWrWrDunAJ+rJ+hoeml4OFa5XGZlw==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr4589135wmh.47.1587150521550; 
 Fri, 17 Apr 2020 12:08:41 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q17sm8722220wmj.45.2020.04.17.12.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 12:08:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] meson-ee-pwrc: support for Meson8/8b/8m2 and GX
Date: Fri, 17 Apr 2020 21:08:21 +0200
Message-Id: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_120842_978501_6BD1C20A 
X-CRM114-Status: GOOD (  10.82  )
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

This series adds support for all "older" SoCs to the meson-ee-pwrc 
driver. I wanted to compare as much as I could between my Meson8b EC-100
(Endless Mini) and the Le Potato board so I added support for GXBB, GXL
and GXM as well as for the SoCs that I'm actually working on. I will
send the ARM64 dts patches once all of this is reviewed and merged.

I successfully tested the Meson8b part on EC-100 where u-boot does not
initialize the VPU controller. So this the board where I have been
struggling most.


Changes since v1 at [0]:
- rename PWRC_GXBB_ETH_ID to PWRC_GXBB_ETHERNET_MEM_ID. Spotted by
  Neil, thanks!
- update cover-letter since Neil confirmed (thanks!) that the "dvin"
  reset really belongs to the VPU on GXBB, GXL and GXM
- removed RFC status


[0] https://patchwork.kernel.org/cover/11489163/


Martin Blumenstingl (4):
  dt-bindings: power: meson-ee-pwrc: add support for Meson8/8b/8m2
  dt-bindings: power: meson-ee-pwrc: add support for the Meson GX SoCs
  soc: amlogic: meson-ee-pwrc: add support for Meson8/Meson8b/Meson8m2
  soc: amlogic: meson-ee-pwrc: add support for the Meson GX SoCs

 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 102 +++++++++++++++---
 drivers/soc/amlogic/meson-ee-pwrc.c           |  98 ++++++++++++++++-
 include/dt-bindings/power/meson-gxbb-power.h  |  13 +++
 include/dt-bindings/power/meson8-power.h      |  13 +++
 4 files changed, 204 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-gxbb-power.h
 create mode 100644 include/dt-bindings/power/meson8-power.h

-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
