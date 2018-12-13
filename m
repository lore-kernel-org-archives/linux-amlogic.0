Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823ABC67872
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5011F20870
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6Di645y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PmWjn/fO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5011F20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jE3nzK3eSFI1tiZoldISpsWOvgTQ3JPRCCL3CAWSttk=; b=o6Di645yuXIC1p
	YVs0oQPLBQ5pZejzX7QJT6zv137/QUgCJwLx9av+VUtkuJQYXgbSpAXKuPYC5apGUlWxVg3tq9cfu
	VJYj2Y3+cxlGtmCd9YrO6bOqF6/jyMa20JbsBCrXHT1UnZbflp67HoKsQfoItc7Kzqq+NxuF8nNC9
	kk0WcKdPgSQxQ8C09cV0PIp9KXgAuI1DzgdwZl4s+ViuVhpc1kqc6XMmatZyoG9XLX+QGiFYKkatV
	UIO3GHayqAhvr3uB6bu9I5aNPoQuF2rC/gtp8SBuYBl0SqSPXhsAMBhhCydJASAsoSU0lN0qzTsOw
	hKIAcJZd1OTAkLTkcEXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXS6l-0000b3-2u; Thu, 13 Dec 2018 14:36:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXS6e-0000J4-CC
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 14:36:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so2273840wrw.1
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yb5cfE46cR4q74hmmtB9K+WQvjM4s04FZxZRpcAuErI=;
 b=PmWjn/fO4vx90hC0WuwsNwNzxr8TJuaOjKnQ/cbYTeDqciK6sUoIAPcE/c8kny3Ive
 QX+PzFXo8WQdvGNkvgK6nFmvSOxWSDm+060t65fWzWNhWCfXAe450cbRK0zkRtoZIadX
 UD6EJ20GkT3TmsvcoGg6qbtyoURwRLsRrT560Z6vRKGwAWVzj5u4+SuRVCTIhjyMJIFS
 Zj6fpKTI3w5Qbzhd+McIDEH0BIpkWZdH9Bb9MZHwtP5HB2JStvyL7Lt5kM4N128j3W9O
 FWyOHOa6+0fJwegz/uj28iX9kVuHxy0BDqTw0eCsD63CXnFIpgQcQiPZQsfEgqhzxUjR
 Cfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yb5cfE46cR4q74hmmtB9K+WQvjM4s04FZxZRpcAuErI=;
 b=Ke3PZk1o6hSXSURg9Vt5UWYzzz2N0FhrOmLBLwTIvweh+CsTgyuCPE/dpwYy0j/wAX
 7zGxYU01ZznNEOPICV4Ehxk6r27+dizeg7YX3ZT8VEYr3sGp9MKy9AgMEGOTogzVAU2p
 A2Z4nNb0nppZMCc7HRzlyCtpXs+mr6/ib9LcDMtTk4AXoRk6xsZ4NIox6aCHnTWStkB1
 fSGSpuX/m0UZBiRLOD6sGRn+MoUjruWLFwmNTlvZ/ShVnsDQwL05nkNM7L0PtUH859N4
 VLMRE9wgLLuPGm4HPLbexgyaCjAAPqsgNrMWGB1Z9mr9f60FyhXajGspKO2YcKdMEojX
 7LYg==
X-Gm-Message-State: AA+aEWaz/2zyf4/i3qwOHk9g9SYnlKzQzYW3OigL+ZEgxRWzIO4Uapmd
 ASbRUXvbAgVCdF4vzCIyD/r0Ow==
X-Google-Smtp-Source: AFSGD/XhuRllbYmOKhh97NQZMVvETuYIP8Hp8nlQaSZ4tXLsgEUKjQQVgpps95xDbqy9waYyl8PD0w==
X-Received: by 2002:adf:e383:: with SMTP id e3mr20948557wrm.31.1544711799508; 
 Thu, 13 Dec 2018 06:36:39 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id e12sm4929930wmf.22.2018.12.13.06.36.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 06:36:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/3] arm64: dts: meson-axg: add spdif input
Date: Thu, 13 Dec 2018 15:36:28 +0100
Message-Id: <20181213143631.19218-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_063652_654950_72C32C2F 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds spdif input support to the axg SoC family and the
s400 reference design.

Kevin, ASoC support for this spdif input (including the binding doc) just
got merged in the ASoC tree [0]. Until the related patches hit mainline,
you may get a warning about using undocumented bindings.

[0]: https://lkml.kernel.org/r/20181213120843.876CB11254D1@debutante.sirena.org.uk

Jerome Brunet (3):
  arm64: dts: meson-axg: add spdifin
  arm64: dts: meson-axg: s400: add spdif-dir codec
  arm64: dts: meson-axg: s400: add spdifin to the sound card

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 24 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 12 ++++++++++
 2 files changed, 36 insertions(+)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
