Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5214C46466
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:21:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5620721789
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N6OnWrOs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oUxjJdZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5620721789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHY8d/ZIa7M4mVFf9A/pzM6/AXidfhKsxVzfUUlC/vo=; b=N6OnWrOsxIjFlooDip4hwsOBsi
	AEinUNIh9RJDtHDCiABp/BpgN3AccmVihwZqyhBevpgzOdoKhCMuk89+SEAILXFNYvzTE5aaOHEeV
	Kzpw0yrnHVYUWKRZNliEQ4vlmDSTI5fNKqnv4CJftDpQCmSDg2N6YJNNeEak0UVW0lP6Zd/1uX7NJ
	aJzFX1vwlfAmokoBMght2UQzWi+kn6B5o3whiqv1eF43HoXFXIucb+/uRcCvlt6Mw2E7TVP9V/Wnx
	GvugqO28PN+CJybe4IYOYt2FI5LEkFL99ioXZSWYHBzoZi7d0QEbT+6iNF/5LszONj1LJH4hHAEun
	rRGkpVbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQcp-00084r-G9; Fri, 02 Oct 2020 19:21:51 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQcn-00083d-Dl
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 19:21:50 +0000
Received: by mail-pj1-x1042.google.com with SMTP id s14so1277597pju.1
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eub79FUSohwE0dFj8ahfzLGkvQ9Fk+p9bOJXK4fYF1Q=;
 b=oUxjJdZXc5rukEzqXzq52LHOzAaRcd9qklUwu22IenTVxJ4sRg4itRDGawvk6HNFHB
 j8tQjfMLyQcEz4xtmaWkersHR/dYZX/4W7+U3jp3Syia6FO2pFIZg3Te7oS32dwwsWiP
 hgPmqo3gvrdJSBUOh0uarbEeSpm1x/hYMdF88CqYlafyBko9BWc/LmGXEBopLNOFZT0k
 fmYNOtswjylAZ8d6IIDbY+zzvKBP1N4o96s68PMQJP+8+oDxwOaC+K86Tsr5brFe8Zbo
 ZLFRnyDLrOyoOE94AeLzhK4+ImI7fuOBufK7ReRmgo622uIXIaGs11l8Pxb8fzFxk2K6
 S8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=eub79FUSohwE0dFj8ahfzLGkvQ9Fk+p9bOJXK4fYF1Q=;
 b=riOZCNtqwFGqO/qbJPeiI1T+XkMF3n4gld+/5Qonztg7DEQzJo6mTRJdoRRf2o+Tu9
 lxTLvzlC+8WVzf/AWyMdXvdQgmGhvjTlCtNyQBwu22rGzFKE0HsufXCEl61YqwyQO4U2
 Vo7jscJrsoDrKpLlWbMaEr5QKVppeDrJpQweGeCy/cjfsQL8FuAwgY1SCkeYXF8/rcTj
 vT11KMt7zk6Lgl3cpw6tpdl4dW7T47X+B28vgLiN4A9OcapuPnyO1zkUVNKjdOkwEQlD
 Daoe4dJKxtVev957IPRdR7QWDxdnMpoLO17QmJ/mubyJAVeNRyeQc6iPVwJcdvUMlQA8
 yBlA==
X-Gm-Message-State: AOAM533RT1XgHJ7HSPfkyJwWxSq+OWlg/r8gxr9eKZZP5MGEVK2fWrPc
 SculG+EehrbbYv+kBzFJXTSRFQ==
X-Google-Smtp-Source: ABdhPJxtt1Vsbz8I1ReBZMf717vpFR6FBoUVzfn+Xu4iHgHtEACpyxm5umPtnEV3rt7DnUU3ZANN9Q==
X-Received: by 2002:a17:90a:e60d:: with SMTP id
 j13mr4383966pjy.61.1601666507037; 
 Fri, 02 Oct 2020 12:21:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l141sm2877624pfd.47.2020.10.02.12.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 12:21:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] ARM: dts: amlogic updates for v5.10 (round 2)
Date: Fri, 02 Oct 2020 12:21:45 -0700
Message-ID: <7hsgawl9h2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_152149_513614_53319A82 
X-CRM114-Status: UNSURE (   7.06  )
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

The following changes since commit 8bcbcdb7293cc24eb7b24b67ef2b29b3a45a49e0:

  ARM: dts: meson: move the L2 cache-controller inside the SoC node (2020-08-24 14:15:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt-2

for you to fetch changes up to 737e7610b545cc901a9696083c1824a7104b8d1b:

  ARM: dts: meson8: remove two invalid interrupt lines from the GPU node (2020-10-02 11:31:22 -0700)

----------------------------------------------------------------
ARM: dts: amlogic updates for v5.10 (round 2)
- GPU: remove invalid interrupt lines

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: dts: meson8: remove two invalid interrupt lines from the GPU node

 arch/arm/boot/dts/meson8.dtsi | 2 --
 1 file changed, 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
