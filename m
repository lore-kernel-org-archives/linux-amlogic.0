Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A01C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8987A216F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIlGKDHL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TSTYHZac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8987A216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JIrL7Hju6WfvsPamtVwrqcz7rF94N43VMjHQA+MmvoI=; b=lIlGKDHLLKb69/
	nDnV92lrso4lMVOfHZAgpHbkL9F6pz8hWWMGTIg7Wnmw5XnbdQCBmo6NpbZ92YRTyTXSNF53qirIY
	EM1q4gSXvNuevFmfMhsyZJ//CkTQ8DRix1lzo7Qsv8qJCXIwX1DUF25sN6+erIG6pmLe/Exoi16zb
	t95EC0pz0OGYf+NBUy9yaBJquXO1xroLQ6bdigFVWoZfqjfNDhJe0tx2v4JLDE/oy4czSP8D7/u4L
	P3VAdmHNVT9QDLz22mD3dULDINrc/WULkbKV1draLdluIpwpDXNjJpzn1LIpOpEJXrrrbaMNkkuao
	eC3wMPSrfa8lu5OWeFoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9Vz-0003S2-6J; Mon, 12 Aug 2019 12:33:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9VU-0003AD-0S
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:33:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id 31so104443863wrm.1
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nr8iX58l/pylFA11X0pfxij8SKgcdcbQ3mPsulHOLOw=;
 b=TSTYHZacvPBZRPOGOkxNmW9UwYDLYQIJpf0XtATvpOeYqCrXMPefQnRcRIJ7HPJlnb
 /3QsD43K5VNs4j/tgWMwF+admBA2wrJDJ5g4yQGP8nPI+uuDVxOiyuhxlW+nqh1XX4UL
 r9iQUW1yvHwoDz09Auy0e3mOyybZGpRccN7ORw1Ivw4LxzHWpBbHjkQYhL1b4Slsz1ZA
 by3d9kx+/1h602zfcj61H8MqdxJP6HF4QiJEfVdn0MgsH95jUI856gTFHUNiYC0Ykbof
 eFzmWVaoqdEVqaLTaQneOFEH1xhsZNY35BDL9N5aC1m4Wz/PcdYC2+mU0RCrs0556DHQ
 NhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nr8iX58l/pylFA11X0pfxij8SKgcdcbQ3mPsulHOLOw=;
 b=SXlahVd3BobnGnvK4fGnpHl2/uRnVlnrnldSp4vY+Xz0D8LdbSUURPtXFJ4lQ+teXD
 PHPosyY6J/+IhXedeowfOdJzDnA3wlS8giZjjMQ4p7+ehlxGwDnm3qtme3kBiiqxpzPf
 Koh1DMJOqIbs6QLZ6UsG0yHKs7zOROKbRc3uzxUF5Z8mtO6k6hL17LCop39X72Ns5tkP
 /y4jHFvKxlcAdG4ATDiBtAwFPfgGmamSV9fnQAEDiE5+iUTZl/p1BHDtyfsnTBhOOFfF
 LrbC0mqIB8xYfscMznHcuvzggCIzzZqVJ+dc5HZJE7h6304vcjuDsABZVOafdSijIt1/
 +05A==
X-Gm-Message-State: APjAAAWOsAMIflIRKv9KHCOC7f4Ch7pb9RnrJdCVvlTLPP+W5RaH3a8S
 oa2Jr+ufaJDxzkpEMEOR235LNw==
X-Google-Smtp-Source: APXvYqx9Q+ux5GFsRAjfYY9EDz5s7kgz3ZmgnTcN7772qjvFYGrIolvNNUxhgaoQ+kq04Vg7URWh2g==
X-Received: by 2002:adf:c613:: with SMTP id n19mr40465331wrg.109.1565613177657; 
 Mon, 12 Aug 2019 05:32:57 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z6sm15886432wre.76.2019.08.12.05.32.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:32:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/2] clk: meson: axg-audio: add reset support
Date: Mon, 12 Aug 2019 14:32:51 +0200
Message-Id: <20190812123253.4734-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_053300_050439_FDA129C4 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the reset provided in the register space
of the g12a audio clock controller

Changes since v1 [0]:
* Fix typo reported by Stephen

[0]: https://lkml.kernel.org/r/20190703122614.3579-1-jbrunet@baylibre.com

Jerome Brunet (2):
  dt-bindings: clock: meson: add resets to the audio clock controller
  clk: meson: axg-audio: add g12a reset support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
 drivers/clk/meson/axg-audio.c                 | 107 +++++++++++++++++-
 drivers/clk/meson/axg-audio.h                 |   1 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |  38 +++++++
 4 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
