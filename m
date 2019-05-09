Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4CBC04AB3
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B952182B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipmusv4R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GTmpYoVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B952182B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o3/I4fl21O4APoRJoLwN+ILyB/jjZMNY5WECFHAVWkA=; b=ipm
	usv4R649VnU9rlA7SkjD8dvFMiv1JkaGXx3Mn0Vv2TbtWKLPB4wOFnuBJatvYSSB0phmMpkT2Je0l
	ooMQb5gngLWKtQ6Rvt4vH7LKT//5h6R24yRkZfoSaGu97EDWmGcgfBlMxGksdEJUG/ts9VPFQ3jog
	8uxiwl5UfSygXSddCno2WC21iW3OwD84dddWOhNis7bUb8ZpfqJ32fvBaDrAqVgWt8QJoptSx0fGd
	JkR91P3OJBPXpEO+/twnEHHB9mhq50i+nX/WNqD9JUExErijTQsIzLnrvOj8qm0k7wui6cfoXecDm
	oouOAQb2aiim/wI4L+YSmPpPsPPk0JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOlvC-0005wN-9D; Thu, 09 May 2019 16:29:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOlvA-0005vH-1B
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so3954605wrq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
 b=GTmpYoVkiFD9q5dllN+UTANfhfNppEO9k9r2mtPKdiNTKlSo2/K11Kc1DoLO3pzGzo
 +8oadDWMMF73u7uqsEZVKantnFEz5I1jvg8q9diJ6h67xa9PwPRxZeqN9qzkghbTPqKl
 Ejxg9meqYwvs8CCfmixifG+k1qEOibJwAnoXDZK57nBxIMlP4YQG/mYlfIVdmMxX9dWU
 MppYB4r7h8KEEcJBJndg79YL+AZwelfMkzB3PCvXTx5vdbxegozXDdM4wuWT2uw1nlZd
 ImyV2grmhzXcCDroeRpOWDhTsWt1pRy5VwtgGikKnh7mlrZDfohpGp1+5w9OPq0yooKl
 270A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
 b=pZBQcatB+hs3nMmmLqKETA17kInGCsIEqaCmo3awhUZO0QecGK2N4LvgKetdFuJrOT
 ei2EHCHlZ6hZwFGEAhjr7uMMCvWtZfFEH1JZvAapTJG0H7VAYvNoOTR0Zjkawkttse7x
 qBbvT/yr66iIrXPR6GSlocdKLm7WuHf8Lm0EexPZxVumsjRhb41vfmoWi05iH5wtrHlB
 DzKSHQbOnWJG/eX42EkjMCecrnm2jAyimWCNAQMs69FUVq7jI54+Hs/pWdaWcHvQ/35z
 gRrQz5TWOoUma9A6tZ1XRsMBs+kPcJkvmooe8m9zoP/Bny4GWWFvPmTsM6W9Ox4vWHK4
 WmsA==
X-Gm-Message-State: APjAAAXfj9LHn3d4RzVfSLJgUlCt1xji9KKJ7+5poNpt0scqL7adnei2
 khUOoI/E6SOMyUqW0ZmE3XtCZQ==
X-Google-Smtp-Source: APXvYqyiMcEGk177HRPJlCRGpEKkfOvFY/t5LFvZZuyi6ApMgWQ/TqSREiCeGqHv1iD451gqV5gHBQ==
X-Received: by 2002:a5d:4a92:: with SMTP id o18mr3791996wrq.80.1557419362487; 
 Thu, 09 May 2019 09:29:22 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:21 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
Date: Thu,  9 May 2019 18:29:14 +0200
Message-Id: <20190509162920.7054-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092924_072233_AB6D5387 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-uA". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- update driver-strength-uA property to be compliant with DT documentation
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
