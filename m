Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D7CC282E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571FA21871
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OGVHV7jC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GffHTXGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571FA21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWmMbzyaf0mv/H+eKALCHJTp0H3dwEjfFhcBVj33hlk=; b=OGVHV7jCYLyvei
	n3VnLFloJ475gDiYt7o/yP1Wl2L2wMD/YByEkWt7zmz3wtrLO9UQnWuGtYMcE3X4vnr7VbpJoO9Ng
	Ml6mo85kdP+CH80Y7qHXozsuMRgR4ehna9Efi+PL+YG1EN5/w/avvNKEGPDWhyEmBqYQii8o0979q
	pVcvJzTk/NkkazHevwd312OTqUsCdGWEXW0+jqI5lG4mKs0b6mXOPfXBL9yYi9mNeM0BLj5ICyCNg
	MkeNZMW8ypgiRrDRuGrQ+Zc4MEme4ZJdKxQEQfOygnMveJa9ukNl4EAa02pe7JDA4QdufStaVSOOH
	T5ZfeTWFLYW3zsjyU+XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPk-0002IN-1g; Wed, 17 Apr 2019 20:44:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPd-0002FA-8p
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id r4so75075wrq.8
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh/NLrobqB5mwi5oJdqhmcZ7w624es9RRpYu13HpzFU=;
 b=GffHTXGuyf7ylUhUSCeiE7D3EbMZ4p1+TeB1Krnur7r6ACKxhJym6b4jW25nB4Fywh
 alDs9gVwPRI5pkxvhxzXmdBFwN5/yFlDvKBa9mQCnlpgIAPspg2mbGoYQi2szm/1n4MN
 POYEL4poD3mqYsaywnENjHmw3o50QRbJNXA0Qi3gRLOhXjHOqUhZBqNVOA/YNbbsLHSf
 ZQeGArIs2T0YmhakQdwHartrqIYbAvVOuWjv+e8JALeKz18w5T8KecavBU4ssfiipUv/
 VerqXbFRuQd+YbjPSF86Rhqlu7iqr9/cL3hW5EzEt/AHN+9UoX1lCzzZoVOjpkk9iAAU
 8bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rh/NLrobqB5mwi5oJdqhmcZ7w624es9RRpYu13HpzFU=;
 b=nP/sxkUEThH0CJiQUWuJfLJ40fi2JNJa5/egSQ0kSskRVFlF9/GTyMEmePS2h+vchQ
 40BnNsXZyUmYGTZa9BjTy64t98dEngEfRHyvxOFPrt+AoBB0LM5VN+KaOjKSHw1CZ+TJ
 mOVEU0FSzgo9dnTH79FuJqUkeSxeL6TbeQei5u5wFsjoAlNDUyQK95C3BeXeryfnJ2Jc
 a7jfWsdqsWMffiHRkx2mg8+a7Ssj627eGZyWYDhpy+82cBRsp+vCxwyKLLmPMu5iXQwl
 /HNEK6uv5un5lMBvE39Ev9iRuLZmV8kqTT/HYQPUtBwUrWCsuAOxohzAnZoLWCvCr1kX
 F5sg==
X-Gm-Message-State: APjAAAUqW+UZiyuesHvfkT0GVVYX/D7AzZ/OpxmzH9VfZu070aUS5jWz
 BQcEJSQIdQbQRbx8bcczCNCzog==
X-Google-Smtp-Source: APXvYqzOraSx9954Y4LC4wyRGq61aX3Tq/cVz7PeIAzfh3Jpu6mKgYSU35zEueo/7GiRrxKYDi3j+Q==
X-Received: by 2002:adf:f803:: with SMTP id s3mr38690686wrp.54.1555533846081; 
 Wed, 17 Apr 2019 13:44:06 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/7] mmc: meson-gx: clean up and tuning update
Date: Wed, 17 Apr 2019 22:43:48 +0200
Message-Id: <20190417204355.469-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134409_338711_1CA85452 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this series is too improve reliability of the amlogic mmc
driver on new (g12a) and old ones (axg, gxl, gxbb, etc...)

* The 3 first patches are just harmless clean ups.
* Patch 4 makes sure HS400 can't be enabled, we still have not been able
  to crack this modes.
* Patch 5 removes some clock glitches when switching to DDR modes
* Patch 6 and 7 changes the tuning method from Rx phase to signal
  resampling. It could have been done in a single patch but the unified
  diff was extremely ugly. The change has been split in two patches to
  ease review.

The last tuning update that went through was meant to improve the axg
support. Since then, it was reported to break some other boards, like the
s912 vim2.

Also with the current tuning method, it was impossible to find phase
settings which would work on all the SoC, including the new ones.

After redoing all the tests from scratch, it appeared that Rx phase made
(strangely) almost no difference, especially on g12a and axg.
It is important to have a phase shift between the Core and Tx clock, 180
works best.

I discussed the test results with Amlogic. They suggested to use 180/0 or
0/180 for the Core and Tx phase. For tuning, they suggested to use
signal resampling.

So far, so good ... here the platform and modes tested:

NanoPi-K2 (S905): SD UHS SDR50/DDR50, SDIO HS
Odroid-C2 (S905): SD UHS SDR50/DDR50, eMMC DDR52/HS200
Khadas Vim (S905X): SD HS, SDIO HS, eMMC HS200
Libretech CC (S905X): SD HS, eMMC HS200
Khadas Vim2 (S912): SD HS, SDIO HS, eMMC HS200
S400 (A113D): SDIO UHS SDR104, eMMC DDR52/HS200
U200 (S905D2): SD HS, eMMC DDR52/HS200
SEI510 (S905X2): SD HS, eMMC DDR52/HS200

Jerome Brunet (7):
  mmc: meson-gx: remove open coded read with timeout
  mmc: meson-gx: ack only raised irq
  mmc: meson-gx: irq is not shared
  mmc: meson-gx: disable HS400
  mmc: meson-gx: avoid clock glitch when switching to DDR modes
  mmc: meson-gx: remove Rx phase tuning
  mmc: meson-gx: add signal resampling tuning

 drivers/mmc/host/meson-gx-mmc.c | 418 +++++++++-----------------------
 1 file changed, 113 insertions(+), 305 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
