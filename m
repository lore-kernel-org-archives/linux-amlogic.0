Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA2EC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C42D2070B
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlXlclPO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o4g5APBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C42D2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=72oyhZOWTpFOcUHnsxM7BxvAlVVm+sbNuLB8G+mRVUc=; b=DlXlclPOSUgv+P
	fRGi+bbdwsUqQ/cBrPO2/DYaYw+0v1fGO+6LKt79csr9Dhwb0oeujluETgPCsCs8H084wzV+Usilv
	MKs1JdnarFKaeTezrpzegZ6e65ATZfd/iiwcoTXbKOCLjvJ/bFRTVFJ+6GO+F/nhOkmqgrsybY/kt
	g0PQHEo0e+LRNMgYhkUzWifnJN/coPn7/N69h7sgKlxFR1oZo+bPqtZ2/g6JZQDqdzOq5fmmL7fSf
	vew1t5mayOlmhRU5r+3gv1BJZAOti7ORVWIPjPHKiLH15jDe3A0iYvQp3DJPpkrWTIDPiqJnEnpeW
	kFJRhx8RE/zQhqdvQRNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9u24-0004qO-0T; Fri, 29 Mar 2019 16:07:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9u20-0004q1-HW
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 16:07:02 +0000
Received: by mail-wm1-x342.google.com with SMTP id a184so3069106wma.2
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCTUbKrBIzwZK7i4F3iyqIemr9Qt0Oo1bG7f71jNIlc=;
 b=o4g5APBzpMItecjvqZQk6zPyuisef3kZhlLRxTYpaQpxs82NebKm2AiD0va9/2QBhQ
 OYDwU42Grn4P0D7PgD8zGH8n9mhT21pmUSNkc2YkF8Hwx7Es8zpbIDEqRcGiiUrVsL76
 HbSvMh8b95fz6DMieoSKZGtsU5df23zs91atAErhuTAC8Z85eH0xzOaH8blA834UMfhv
 erSQSoZX0p0LVM2759Shgnu+EWY0/nU5rZ6tstQx4/6BYMipMVvmovcS7wjJ37LgMSI6
 NcjdFSemgOzzcSPpIIHyputZ+1rH1AtFzLRu1o/8GuhirQgG8/TbEfjwB41PpZFDpBHD
 yTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCTUbKrBIzwZK7i4F3iyqIemr9Qt0Oo1bG7f71jNIlc=;
 b=LqYKSp7CuMBuaLoSZrM3T7VcUpU87Z8WPSyWcSl5d5YtSCh+8z5xT9/S+mtgBrYOfW
 8dS6nXit6tptpyRcO1bOtgDewT/eQwvQZXT1NIceAcqGHYkgSPaasV/ksMcMADlzETH7
 +ngO8RLsKzIMl0snRNW0HF9A3+tg6+hnZ+jyKbCoDIYIzCbEdpER2ukl7ZzBhbBfo8kS
 WGmLlxEQskSa2dFbVp5mFEX0IANMN+nUZPBySJGy8zvzr9M966C0EJI6cZ6h3QJw8CSk
 RJgSgpDJN3AMgrdG3AWwY5SvChqclgO4wnk9MIKCU3hTgjQ6HUueM8o+pqEcftgpjmxF
 2UbQ==
X-Gm-Message-State: APjAAAX0Zw/FOtxrWs7otjIlVOCtN91+bLsfUoE1l2FdNfkglKKu/vLG
 nh6LzD2PyiAOBxuNHa/tvUgdfw==
X-Google-Smtp-Source: APXvYqxmjLzqna2DG01+kc4RUY3h0WrjjA95K3GJ2AWxZq+lIcLJnr71FcSK/XGCVdkMvy16B+PJ4g==
X-Received: by 2002:a1c:804c:: with SMTP id b73mr3989566wmd.116.1553875619010; 
 Fri, 29 Mar 2019 09:06:59 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id c10sm3329527wrt.65.2019.03.29.09.06.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 09:06:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] clk: meson: g12a audio clock controller support
Date: Fri, 29 Mar 2019 17:06:45 +0100
Message-Id: <20190329160649.31603-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_090700_591332_59AA8C35 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset updates the axg audio controller to support the audio
controller of the g12a SoC family.

Jerome Brunet (3):
  dt-bindings: clk: axg-audio: add g12a support
  clk: meson: axg_audio: replace prefix axg by aud
  clk: meson: axg-audio: don't register inputs in the onecell data

Maxime Jourdan (1):
  clk: meson: axg-audio: add g12a support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
 drivers/clk/meson/axg-audio.c                 | 1219 ++++++++++-------
 drivers/clk/meson/axg-audio.h                 |   36 +-
 include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
 4 files changed, 736 insertions(+), 532 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
