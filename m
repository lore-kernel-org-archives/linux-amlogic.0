Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A17C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50652177E
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3iImaM0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G0hT4HBM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50652177E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yRnIps+7NbFzZ9OQhOJBXGGK76LHdJrfUFMc9jTGMoc=; b=F3iImaM0tUqg6q
	2uWEc3Es1ufSYgyMj9sZ2MowipYmo4ldVG3KUelFVOw9r09FNa6LkhzZ68nvnabY1ateL56AcovYU
	JVdgWz+KTvmpWtxnJUAd2gD6oTLSBHmD06Nc7gJChmM6evRnQTucgnte7W/w8VvEsXE9sTtYw6EZY
	0TkaV7sIajZPf66faAyr9FBPJtxIw8Sqjd8WtTxUkwPRjohKS0OO8PojrvJFBPdhbI/d+whVPL5B5
	PH8vwENfbijXc4OVTkCGPvgV51vRMCRKA1q0P+gkag9Kxna+KF+HFvpZTjOmHvjidoqV7Raj4IE35
	CmrE9KTus2ChegL3T9dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44ac-0004p4-KR; Wed, 13 Mar 2019 14:10:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44aY-0004nS-Rw
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 14:10:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id w2so2150081wrt.11
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Om43o3QGlbzQeBRSo4/K8t97wwo+604Xu/lrnbkUV6U=;
 b=G0hT4HBM9kOji92JSSQnQY5hQYBt5SxbRBvSwNZJIf9gY3mDuhquZzgqsVSK2sGf/Z
 +r94dK1EF7IJlOYZNtPderfGb20LydJQNLHtt5FbSgRaGlgqXKy+Px7KUUeCUyg400XA
 dL1HtOGJItIC3bfHIHUtIc+C2QoLNMBtBgA9Bauh5pYw0QXmPNawTKCSyu/f1Uq0Mvgf
 DiD1yrChR/HyL23fDZPB1O2ThdQiZuGweP2gcasnq8jkHoas/irObXvU4n4TAQpkxOma
 NTNcP1ExjvRAnaVei++Rsk/mUS2RHSNa+/0795GKMp8Y5xnyNhwh2m/qw6yNyReGDBQC
 C7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Om43o3QGlbzQeBRSo4/K8t97wwo+604Xu/lrnbkUV6U=;
 b=VMgdnVt2WnyEkCR+ehp6fA+WnlWm3zRkKW8Ax/yp9B4/FKYn9wBSChBGgymjjmpj3c
 1MmwQeaA2KinQdfjFxP8Utsi+doNEwuoqwGxwwnEemdwSrImfuTHX5iUaH2uSM9OR40M
 nHgTcjcTC7Vw9xCbtQxrCVslcb3FoRCRs1FbwiCPH9jlv++KoWrmWmMH4G6S/WzbfmPl
 JVIoKR3+0J3llpt5lhi0P4erg6p8/H4cImQYQTdmt3IxbH53Wva77a/y6J7XFXt5zVVY
 08Mj9AGTr9aFRLeuCjH14UnSeGsxARkEnhbGzxkqjOZt3UgyoQ8NkrNyVE1m6nwAROoP
 JaVg==
X-Gm-Message-State: APjAAAXKMW5qO1+kHZ/kFl/2d35jbSilfqUBT35KzmorAgomLB/27XaU
 yeynJ7DeaMXlZR8IMt2QdiRpwxIBRvw2gJN1
X-Google-Smtp-Source: APXvYqz6rOCst2JaCzL9Yit5kUCMRU/5sLK8apQuVakVpx/da7nsKl+nl9Z70YR/pSRWFxHL7S8D2A==
X-Received: by 2002:adf:efca:: with SMTP id i10mr27846110wrp.265.1552486233005; 
 Wed, 13 Mar 2019 07:10:33 -0700 (PDT)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u17sm37300087wrg.71.2019.03.13.07.10.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Mar 2019 07:10:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: meson: Add G12A display bindings
Date: Wed, 13 Mar 2019 15:10:27 +0100
Message-Id: <20190313141030.5958-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_071034_899597_3F831778 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the G12A specific bindings for the Display VPU
and VPU Power Control.

The Amlogic Meson G12A Display module is based on the Meson GXM SoC
with an updated Plane Blender, thus VPU architecture and interconnect
is the same.

Implementation then DT nodes will come in a further patchsets.

Neil Armstrong (3):
  dt-bindings: display: amlogic,meson-vpu: Add G12A compatible and ports
  dt-bindings: display: amlogic,meson-dw-hdmi: Add G12A compatible and
    ports
  dt-bindings: power: amlogic,meson-gx-pwrc: Add G12A compatible

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
 .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
 .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
