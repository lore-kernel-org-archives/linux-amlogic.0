Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6117EC47423
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C736521D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y93dEm34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaT5wJjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C736521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNN7cRDpvvdoLFS2escDCJxWWSLkBMi3/gc9T8b0Moc=; b=y93dEm34Yk8ZUb7ytAns5qbexk
	nzIN2BXqZNa4Z/N6091nn+S/iVIq6xSI/Uy7OMo0u0LeYcvYWzmOO/cu+P6NAaSRSXVMGiJObp7Ul
	60Nurl2TC1xMa+mLICubwNdmx4TxuWvkCe4Skhp0sW9WO14izNa15v6VEk7Sqt/DOv/BK6PiKoxIy
	aMHY4d8Dciqn+VnUx55A1y0UAWmo8VSEsD7JxJY7p/voIF9ylY27dQoj+zAk/7trfNE5RHCNBMzGA
	gEyK+TavhehH2Fz22FREnN/P15diqEtIKtGKtqANfBScaMQCuljVBAMq8SltmYRByn+pgGYElJFii
	vw/y6tnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeRj-0000G9-7G; Fri, 25 Sep 2020 03:30:55 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeRe-0000Dc-6s; Fri, 25 Sep 2020 03:30:51 +0000
Received: by mail-pj1-x1044.google.com with SMTP id jw11so1081633pjb.0;
 Thu, 24 Sep 2020 20:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aisBv4MuoAdzRa1YD5k9n2OvoHveOSiNe5rPI2LCylk=;
 b=EaT5wJjyX/Ce0/9nXMsJp0rwxCSTxdPdB2U1zZBfHUi1lMlkauqKsZgTS6FPZ1kwL+
 POQ3aNGnfR7wOYyDNm3i568OSqGoDNmxCRUrvfx4FzJG4DBDzuUdu6zGY82Ah/3BVvpQ
 Y4jyCr7Z4a5iGDV9RfU+WnD+naUhjlJWiGUgm22UXEG+vPBH5ibn70QxZHrzuGjdOaT5
 wysW5rx6L7N4ryYSNibEIsZC7ESwZBZybFfc+as/GGvbGS+A8XM9ccPoC5UevnzOIPSH
 wN4U7AdaAjRdmr6/RkDs0GvDppnb2cLLW8W1BFF2/KWcnixxBqafYlLkXQDK0Pvin0fh
 p6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aisBv4MuoAdzRa1YD5k9n2OvoHveOSiNe5rPI2LCylk=;
 b=bAmsq2j7scDZfyyj6d2DKDP1F4EZSRUqldi6OEjCz1icSdP5drtygViKY93VOhaHuF
 TdnWFs6aH6Ms+wjbC//Y3yiQvfwTWQxZITktTMl5rTWJWMBY8ehZICs3kb2dZS2hy/Cr
 h6s5S+Lof/zZLTCbIJqhObEkfWYshqUbecgaM4DKJBuq4wNCsIVa8P9CL5zfyPPvQqGQ
 HEYH+LOP/7gIfgBrmKgKjz2NdGIujpk/qvMukU3TFtSMvZHym0O146/FP/Lx13HV4i8t
 NJIRJ7/KG/xYOH03BrfxpwGl5bb/wpXXJ5jRfyNBxztZ+V3YeWIanUiabn4ANxBJgvqm
 Xgkw==
X-Gm-Message-State: AOAM532NBoZ2bR+epgGxp1AVVzCZOgU4oW3Yu2dvIIwF5hsj5LOrVJnd
 v2P1wbO1oTkbrpikht9Xp6g=
X-Google-Smtp-Source: ABdhPJzsq2lBfR0WYt1JwMFaDdGzuVNV17XX786+xa+9TS7JCcm6xRPC3A7NqMzy2pso/BBq2OM0QQ==
X-Received: by 2002:a17:90a:6e45:: with SMTP id s5mr745620pjm.12.1601004646462; 
 Thu, 24 Sep 2020 20:30:46 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:30:45 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 0/8] dts updates and fixes for Khadas VIM1 VIM2 VIM3 VIML
 boards
Date: Fri, 25 Sep 2020 11:30:09 +0800
Message-Id: <20200925033017.1790973-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233050_263872_E49CED95 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dts updates and fixes for Khadas VIM1 VIM2 VIM3 VIML boards

Artem Lapkin (8):
  arm64: dts: meson: update spifc node on Khadas VIM2
    meson-gxm-khadas-vim2
  arm64: dts: meson: update leds node on Khadas VIM3/VIM3L boards
    meson-khadas-vim3
  arm64: dts: meson: update leds node on Khadas VIM3/VIM3L board
    meson-khadas-vim3
  arm64: dts: meson: remove fixed memory size for Khadas VIM3/VIM3L
    meson-khadas-vim3
  arm64: dts: meson: remove reset-gpios from ethernet node for VIM2
    meson-gxm-khadas-vim2
  arm64: dts: meson: disable vrtc for VIM3L boards meson-khadas-vim3
  arm64: dts: meson: enable RTC for VIM1 meson-gxl-s905x-khadas-vim
  arm64: dts: meson: enable RTC for VIM2 meson-gxm-khadas-vim2

 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  2 +-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 10 +++++-----
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 19 +++++++++++++++----
 3 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
