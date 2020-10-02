Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4ACC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:23:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746A7206DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 19:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJxpOPma";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VnwfJ4yw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746A7206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kg9nbPKt0A4jLADg9FaB8Lx+KD2Z4NakpSMxyywbBc4=; b=AJxpOPmaE/Z7STG2hrVtbaANjb
	LKlZENw6idLm0sCvNlmLbM0fyrk411ff5LlU+SSVzI+sNebANN082ab5ZoSfQI5cSTiqwnfVSWy6U
	e1hgK7datIfuuyQQaB2HLYB2Q4v0hmlfXG+bNVZtuCJ2jq7FCfjLK24I0WZQENCg3AEG1VQw4WowR
	cG0hAVmiYvuW5hTu32mjnI4nfWpfOfKoES2Tmi1o1diG0WQ9eFRLBFX/6+/lb787O/u8qp9h3eS+D
	JZhN7sdCZP+RqGdhl1e7C2OExislpxOTxWNcbCGJd9/arKo4S/wNkpN5Iaesy2PzARIiHJPiKXay9
	vrqXb+mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQdv-0008V8-D8; Fri, 02 Oct 2020 19:22:59 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQdT-0008Gc-5u
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 19:22:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id d6so1942655pfn.9
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=i7AAFggjVDCD/yhT2kO8R1V/GFrnlOiKpopAeKAARPs=;
 b=VnwfJ4ywT+jgR8U9m2/pjOyMHX7JwsNwi5UDttT/YtPYNDzh47QgawZCJZyt4J56dz
 GHlmjTrFzQO4tX1efrHr0K+AN0D7i+ehROOIS5WqSHxrliGzzZ8bcnhi4HKezzWC+6/d
 pLd0+J3xNv6R+v7n+WdzDfTrQV6ErtDZ8QS9KPj8Nudjiuw+V9gezRmybtO10CZCT7Y2
 T83Uo7Lzj06ZgnkE9/G0nLAHTutv/ZCHfGasAplejkexeUxzpk/TyeTUvvVfJ3JpWqZI
 xM+0+fwVAD4FG076sQvu20B8TnJMZG/U0/+hI0C+wMsSKnyBcUAVXB/uaUQqxMQFsU4W
 UanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=i7AAFggjVDCD/yhT2kO8R1V/GFrnlOiKpopAeKAARPs=;
 b=pssEffsCky3OYGyL/bTWN9y0vfBfOh2iC09n6BSGZb8xOfXLDBElkT1sz5f0EeAI6L
 rcpjUVm51obFfzD64DXd7VRH+j614EimS/LUXFWvpU5aez8ipFc5AvTtFWcExXmWAAKn
 huoqakjk/Lgk4mY1lCfWFMwNAYRGUeCnqcdtLbiV70GmDg4SgNG+wWzHlplpGY3fKRZt
 N7gs0aA4siPJv2XS2AwWEAENqAZk0HN4UJSgNfGI1Hf7ouAdQOFVicD9KYkM+pbKkWAj
 sWjv+TzKv9a2BODY2qTLgZZxJnrQQEzs5M0SelLpKijR0LijaRQmEOQR7iDnTzxo4dyO
 NS6Q==
X-Gm-Message-State: AOAM532arwQZr/heVC9/+SqUi+G8bff1UDjw3oBCGX2YxbRk4iz9oQdL
 kSUCt+pt/pShHCqgacpc/5i6mw==
X-Google-Smtp-Source: ABdhPJy93spsnt+/Zbivd8Ik31mGKKBcSQ7BjueRa/x1jrvPq2aje9fSW7dcv5xvwf45DRZD/Z+XGA==
X-Received: by 2002:a63:c052:: with SMTP id z18mr3679656pgi.103.1601666548705; 
 Fri, 02 Oct 2020 12:22:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k28sm2853825pfh.196.2020.10.02.12.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 12:22:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic: updates for v5.10 (round 2)
Date: Fri, 02 Oct 2020 12:22:27 -0700
Message-ID: <7ho8lkl9fw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_152231_381377_77704FEE 
X-CRM114-Status: UNSURE (   8.32  )
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

The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:

  arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to c0c6f8e527a652d4785cb38ac82be0c95913349d:

  arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible (2020-10-02 11:32:17 -0700)

----------------------------------------------------------------
arm64: dts: amlogic: updates for v5.10 (round 2)
- add/enable USB on AXG SoCs
- misc cleanups

----------------------------------------------------------------
Martin Blumenstingl (1):
      arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible

Neil Armstrong (2):
      arm64: dts: meson-axg: add USB nodes
      arm64: dts: meson-axg-s400: enable USB OTG

Scott K Logan (1):
      arm64: dts: meson: add missing g12 rng clock

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |  4 +++-
 3 files changed, 59 insertions(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
