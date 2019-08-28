Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B659C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:27:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B64220856
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekFZTwHp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uxdtln2k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B64220856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lmVeFVLry5t0QY8g6W4qu7inRBisW6N5tK+YkQnQqBA=; b=ekFZTwHpZ2h5ce
	dUy17qQtuszRBHy2X9JSyk/zHTTPWyrtatGFkI3F0xjhxfYkPMO8kidk4uDK6l1ea0+geo+1DuwXH
	XzrWfzdDRjPVYmcZVCojQAf3SMgBGI19oDoicAXQOZ9HsjiCcQijw82IAioAdJlpR75ACIZiM/z4b
	BCDxzNYZNVkFMjPNIEkxXms7E4iQl7JPKBgbs3Ctsf+Z+0SK2XluuhHwOSDZaLO+nRmaZK/kEJ/W9
	mfdOr6iPLLq2HAi5HRIKGmyeBshEcoaFaVZvlrpQJ5INizluu2V6kp6yH5tBMrzvGjbeioBaNhmDm
	d1a/BQPEMqqPUMQsdqFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i34Xj-0000Yu-N6; Wed, 28 Aug 2019 20:27:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i34XV-0000KQ-N9; Wed, 28 Aug 2019 20:27:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y8so467802plr.12;
 Wed, 28 Aug 2019 13:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oa6hwJmjbKjuqI8KO2uQ2NpWyR7vXRuA7cSnTsaDRIs=;
 b=Uxdtln2knW+a66Nvahu7hXNoA79NZzi/SFnD3iimU/bnbJJwkFMf2VAlfAys0QIQmv
 5EgHJcGm3vRv0rCXec46xJMD9cx5CHWlL87gsa3z2K61OXRvGmPdiLGZ8DhHQiO/Z7aM
 0H//UheQy/CrJYQMYJjnX1Sv8J0AfEJI5XHlrpRh8rRY/0vYoVonNyEcZk+Pqbi8wZ54
 kqecVYNYdkFdDaCy7iGpQXYbV3Qb8iW5Cw+snpvlcWNkD+NTmywWR9lb0JDKtEncTuZm
 qIYWwYwbgBgnI00oxT/B6w3nfqR1pyn4AVXWpQ+2JbPce5p0P0baNP0c7sYb2gQ6FLKk
 to1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oa6hwJmjbKjuqI8KO2uQ2NpWyR7vXRuA7cSnTsaDRIs=;
 b=XouWS7iu+6u3xKcB4EDpv31uPSFU4S7UFboPipBJKq/GhONbilS6ASKzA+Bnu1J8Nu
 +TvIvXgr0bMpbe0OZsUBTyuK2IUJ25XU9d/u8+v+vubpapL1WN+TlV1P42RxxFmHno/4
 +11CAUeztLXbWpYJOOt/Uq3pOI54wFsrS34NQzrHkyfW4hQRqx7GoqT+uki/TgNC4TYS
 UAY5nfesvqQ6h4yhEnyMtJIXYz2Gs4OHVhGokFptjeE2uAKsTAES2jSHyRnILJgz/Sg1
 SP3h5RIvbFQ8bEqq1nki5l33HUSd1YQMhgJvSD2Tjtz5+qJsfpxHEMM5jUQ7COY/ZBAB
 0pSA==
X-Gm-Message-State: APjAAAW78w9IXJu6sR3R4xiXox82jnirnNQ8OTANBwUrs5ia+1A/gE90
 IOvk/D3dUUeuJ7+EQ7IA2QE=
X-Google-Smtp-Source: APXvYqxuiA+0iXSqabEEiaHcDthz8NSS9AsGph/Zx11FbtNQgeEo36tT66h3LGF0XtVp+EJXHYEiQA==
X-Received: by 2002:a17:902:1107:: with SMTP id
 d7mr6091471pla.184.1567024052408; 
 Wed, 28 Aug 2019 13:27:32 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id g2sm253373pfq.88.2019.08.28.13.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 13:27:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Wed, 28 Aug 2019 20:27:20 +0000
Message-Id: <20190828202723.1145-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_132733_756979_B20C779A 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Below small changes help re-configure or fix missing inter linking
of regulator node.

Changes based top on my prevoius series.

[0] https://patchwork.kernel.org/cover/11113091/

TOOD: Add support for DVFS GXBB odroid board in next series.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
