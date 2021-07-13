Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4876C07E96
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9007B61361
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9007B61361
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MOT+CoXdRFkVRyXJzqAfZc26JugBphupIt01NYbLbtY=; b=MzNNk4PldK4mrH
	dVXO16+BlY1pYNALAnzcsX1j9gX4dI4afq2RiDZuuedENxFI9dhiVYybFfF3iQFP8lwQRPY6gh5qv
	OHiUlTikGd9auQcAwomngqK9DwEUXiDxuFJWSHJlJPRvx1P8f2onZ2XWZR10Z52/ymeQ42C1Q5d6d
	iIknOyCR2abvKZYBy5nYWSCEMdawBbXTd5Pnh1bxHkXfq16kPeLUNvLZ5315el4k3Xr/j7gej3tXi
	24q8DFb0OUmX/J1sIGyV74l7Mp03kBjUrB96LFn0Yx1/H07SmSPMDByTUgAzWVqqg7kt6+cMovO4w
	ZPsd6lQnZsVn68jQGp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RYY-00BZnV-7o; Tue, 13 Jul 2021 23:11:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RYV-00BZmY-JP; Tue, 13 Jul 2021 23:11:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id f9so717037wrq.11;
 Tue, 13 Jul 2021 16:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3WvoSxwfuOLBE563gnD/WfFxdtzwAqkUgPGYxOHnEQ=;
 b=LmpI7ec22NDr2SdptNqwTAK6ly3heaAtBiZoEoTRno9e3lf9RvZiuIlNOJkBngqioy
 tAkR6UqSYppCzLhbCSjwYOdMgsDNUCYxDeq14U9Ase2ZixCF7vaL2bw1iYrgF6ihD7ML
 BnpXXN5iNGEtA0TMuMzmgXg0cgHX55Eoo1ruDz+5jduDue7j95vbJsK+eFoZ9oM1Bn8H
 Ci9EhyzKgaL2KT7Wvu/kPAAuZclTAq/1S7FQpGzvx4fnBeVCkuDxjFBdjVRdktdc/M3a
 tx8XE0yh205l1XDSz4357x0XPn1I3+PnrnU5SXdS4/5YPyXpecP5ZOkePx/UqQs7FQ0Z
 qdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3WvoSxwfuOLBE563gnD/WfFxdtzwAqkUgPGYxOHnEQ=;
 b=WtTC3T2Efc8oeuBGr/Bdgd0xJTdjCa/kfQKAnoSTRyybRCnaChZUQLeUuIxIbSAluO
 VzdhQ31SPtu23T+6Y54VlqCcxT6V4tS123kDnoPlw74tlwJ+pL8nwPejbQd65HYWKXdB
 H1mHSo3Yo3euCuzvyXmFyNsZUqOmQX8FXQuN7/6V1ZGCr2jadfBt4VrCGhwfZhKvmQLm
 wu4ljhM/fdUozqXRN5i/wsiEgUB59tdT5Y7yJdaWdLeTZoBedszcpbVmNiKDhgmk0W/Y
 J/Db/8Qx9gR/Qk0yWVXZhtMjg0mL1oFEbCDWzXeZG/OQXkJ0MLE/8d8P3LFzMuXUPO2o
 rlTw==
X-Gm-Message-State: AOAM530EsYPFIN9t3CHbqw6BFoiVi1JMBekEM4PD4/dbKb7v8hnNh0WD
 4J3AdZn6gQECpQ1O+z991sdWGnUs7gY=
X-Google-Smtp-Source: ABdhPJyhSQubExHHk6TVWZrTwqMpNVKNb/QgGSoTDc6PiSUzYGLypXqVrv97Ggl7awnh5UGeINTrQw==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr8943529wrw.228.1626217869751; 
 Tue, 13 Jul 2021 16:11:09 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id y16sm3551608wmq.1.2021.07.13.16.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:11:09 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] Meson8/Meson8b: sound card support
Date: Wed, 14 Jul 2021 01:11:01 +0200
Message-Id: <20210713231103.2994354-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_161111_694858_4A0933E7 
X-CRM114-Status: GOOD (  10.38  )
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


[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20210711214023.2163565-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ARM: dts: meson: Add the AIU audio controller
  ARM: dts: meson8b: ec100: wire up the RT5640 audio codec

 arch/arm/boot/dts/meson.dtsi        | 11 +++++
 arch/arm/boot/dts/meson8.dtsi       | 63 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts | 45 +++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi      | 63 +++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
