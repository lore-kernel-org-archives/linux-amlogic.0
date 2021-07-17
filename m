Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2C0C636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE5C4610F9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE5C4610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFGI16NXarM5X55c1mdTXNAfuSNrvCt/RHwvY15eAN0=; b=nb3eNam3MFJeB7
	y/0oKnuMnHqJwhj8xHTWgBjr0l5lgDYKJuTqVqtkL0fOrx/eeMqHS+eD4mcz7J/L/24+KNpMHbVU8
	OG2RpBOZoBMTrNkoN0Srap6DqjN1OhSdfzPaS2gmUYQ4RfYM6oV9SiovfROt9h4y0GqdaBbXL2X/e
	itTCoLlmkMQhyVie3dqz+YM6gz/TJXPpj9+vMqXgyUGpjKfvtJnitOr9g4VIMppemXJfYF3YWqQHd
	epmGVG+C2TrhVUXHA2FBtR4TqVTSGtxAFWZVr3XiA7gP14kHGGFPZFYdTHD2bF3sf7m+d0JETyP+o
	FA+zfbl2s7bqo+04wQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tlY-007817-Gz; Sat, 17 Jul 2021 23:30:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tlV-0077zz-UU; Sat, 17 Jul 2021 23:30:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m2so16552201wrq.2;
 Sat, 17 Jul 2021 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xkxt3iyAxj9INcBajX2r0UFT3eJBxPbJGH4oT44k7Og=;
 b=SAfsJgdoPyUlpznyaSaNDTFpbFaFj1VabR+V2sdUgYQ5C1H8XBtVe04b7Gd9Pfg0EA
 +gStx9xSXOcy5PSjpYCedpJ1VFpMGgBh68Vm6od5GKHgcuESVYNn5Zn77CMGZ4CiEviq
 88IC9Utlk1kMKhh3FtgbkB1h745NEg22Ia3dnFqVnj0j7FUJgWQQ4Ueht5zshIj5f+jH
 w22Yu4PRuvKeUBFC/58JM8Zsz7zF7SfeQfQQffp1bzscJxixJrYVBpATbrR5OcW7j/4e
 o0zpuF/1KpLlxcubbKjTYMNv1xLQn0taZGS4jgGlbcYWzh17FhtqQLC9giJrFU6X3g/X
 q7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xkxt3iyAxj9INcBajX2r0UFT3eJBxPbJGH4oT44k7Og=;
 b=kOo94Xj/caZsNHNSFTIB8tSDg4QhDxaYR1pmx6oghXv4zJbsvkyJGGXMTzBH0O8jud
 scELW1cxvNMhGdFAHzyOZZA36a8M1ltRVOtnYWO05KIiSqrrUL+fDMP7jf3uWm6Pp21h
 /I6w+CuWUZvbJe4PKOlHZzt4N5EvnosrT/PVu3XG5H2hmOdhpxumlmYtu8nkShKgpxyJ
 dS1PqmN02VLmh0FCSYMFgtAIYvf7KDB112+cFnfaGTD9UYQfaORrrwjnZMm68t4uxQEY
 TuJp3CdHZ+49HJNno2LuJv4RDO2nfXhGyKVIP4iy7qzu2ab+gPH2QJmNRpnqzIBBV8Oc
 2rTA==
X-Gm-Message-State: AOAM533XXYh165KR77Lr2JCNQhNLF8fa6KEfoEr+poI9zTqV9j5vabwW
 dQvw6xtqc7aoLvimd7lV0T7P/rw0wCY=
X-Google-Smtp-Source: ABdhPJx2vG1xT5/8TvIJ+TR25Q4Vj07jSRMGfdJ+EoASteOiqg/fOSx5EnSSjjdB9bEVeKwIxcL4oA==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr21798564wru.1.1626564636046;
 Sat, 17 Jul 2021 16:30:36 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q19sm14824051wmq.38.2021.07.17.16.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:30:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] Meson8/Meson8b: sound card support
Date: Sun, 18 Jul 2021 01:30:28 +0200
Message-Id: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163038_038473_6732AA6E 
X-CRM114-Status: GOOD (  12.41  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds the AIU audio controller for Meson8 and Meson8b. The
AIU audio controller has been found to work fine with out-of-tree
patches for HDMI audio (over I2S). SPDIF output also works (tested with
a scope).
Endless Mini (EC-100) has an RT5640 audio codec. The driver for this
codec can be selected since commit 08c56cab302a05 ("ASoC: rt5640: Make
codec selectable"), which is part of Linux 5.14-rc1. While support is
not perfect (due to us lacking proper support for configuring
GPIO_BSD_EN) audio output still works fine.

This series is based on my bugfix patch "ARM: dts: meson8: Use a
higher default GPU clock frequency" from [0]

Changes since v1 at [1]:
- added sound-name-prefix = "AIU"; to the first patch to make it
  identical to what we have in meson-gx.dtsi
- drop audio-routing property from the sound card in the second patch
  as it doesn't appear to be needed


[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20210711214023.2163565-1-martin.blumenstingl@googlemail.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/cover/20210713231103.2994354-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ARM: dts: meson: Add the AIU audio controller
  ARM: dts: meson8b: ec100: wire up the RT5640 audio codec

 arch/arm/boot/dts/meson.dtsi        | 12 ++++++
 arch/arm/boot/dts/meson8.dtsi       | 63 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts | 44 ++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi      | 63 +++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
