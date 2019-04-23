Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17567C282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D638521738
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iblLkkBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="w2KEZVK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D638521738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ldcJwAmk1TtsZ4czjVnHuPvO8tOQnXp73x6cpj2/5o=; b=iblLkkBhYpLuUg
	03+OQWz5+EmlbmrTm3TUBvv/Y+aTFn5JKM2LLjBVYfQOeidp6Fam3Vf31AJ2u1vbwNFki6sIvGLBS
	8L8/nburyCg30xJNnYyA7MvhkIiBEOJ+9hZ0d0r1pK10NIWSIlWV49qUQcHoUHUiqoEKesRTbuEJy
	n+pLrwqWwbWdwM8YL+UkeqvhRk6WQ7MYiHIXlQg4kul4lzJTeD3ulqrFhYVIyQ2Ya7HAHzi+v/7KY
	NpIV4CAPXCXkeXrm3+Psn8b1SsBZ3rvi22KP6G7l0wH0zDYk7rLb0r0YNCWoYN9WgE9GjVIJY0mUx
	6OukCtX/xpkBLjIXVqUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKF-0005ej-Ld; Tue, 23 Apr 2019 09:02:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKA-0005bn-Tj
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:48 +0000
Received: by mail-wm1-x342.google.com with SMTP id j13so2036482wmh.2
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyL5ADK3nwxHUDhFNjCi37nI3TDxQUy8c72Bnz6n+18=;
 b=w2KEZVK+BwdjPFCdgjID66L2FGqc2zRlZxbbfLTRwYH84oFyER2j8p1qEdsnV/7gNY
 Wz9HkOorsiTL7+3/rlUBp0rXnNzeU93Y6gDIkKeXIoPjAB6wqwiY1AemP0u+myYSRAu7
 YDRbQdykDawAHuJ9i5pvkN5l9Yv5Ul2nQFDLfn7j6FuQhrNgykwHKpWAw4dOxnGhUhxR
 33z3DGvp52l3QG1UABb/mk+auSj5kqGqsXwZ5yLtT6+WEFmZVAi3EnAPHDR0EVgiB1pW
 GpZNwS1ryg8x/EHFkzdxGidIfCWoW02Y2b+dRSSVpGz63auqJq0geYcqDOLT049czoKz
 /YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyL5ADK3nwxHUDhFNjCi37nI3TDxQUy8c72Bnz6n+18=;
 b=aFCnbZ2L7CFgDso34e4+3/2+sKvmDRkD9rNXDxQjhuyAzT3AUKOSHpb5lFkmADJFn1
 Vzfxpm9GJVPuoQKjsCILugHILR+J4sbnfVOuStPp4lFfei5snTZPCyDD1SN7ejM6Vk0O
 V9N8qQGuZaUECKro1igTr2C7zZWp5Xw1mPwSzxB4k/i+9xUr11Bfbie8AXjVXecXF9QZ
 JcW8xl41t3tWKNZ6A9zhfu42xu90c8CdZOiT40cLPSFycU7tZJh/BOirCK9Djtiyf9YA
 PhNVtSecKd/0pfraK+HQUrcGpyliFvTEmenVdHMWz8LdPR7KQpgHbkYVbXpwzW6diED4
 O3DA==
X-Gm-Message-State: APjAAAVPB5QlBL++FJk3pf1ZJ6xUMcFh6GDo5hYN/76zBlSdS26qeP2/
 NGHiOhmIHLJ2Q7guQa9Bqthczw==
X-Google-Smtp-Source: APXvYqzOWXJEFc087s1D7PMjjtkb1ZCYkDnO529wjOgLfT+0GLZElRaqiz0ubFu7jY3QZRZV7MlqwQ==
X-Received: by 2002:a05:600c:211a:: with SMTP id
 u26mr1535558wml.74.1556010164784; 
 Tue, 23 Apr 2019 02:02:44 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/7] mmc: meson-gx: clean up and tuning update
Date: Tue, 23 Apr 2019 11:02:28 +0200
Message-Id: <20190423090235.17244-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020246_961486_3C3C5A6F 
X-CRM114-Status: UNSURE (   9.99  )
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
settings which would work on all the SoCs, including the new ones.

After redoing all the tests from scratch, it appeared that Rx phase made
(strangely) almost no difference, especially on g12a and axg. However, it
showed that it is important to have a phase shift between the Core and Tx
clock, 180 works best.

I discussed the test results with Amlogic. They suggested to use 180/0 or
0/180 for the Core and Tx phase. For tuning, they suggested to use
signal resampling.

So far, so good ... here the platform and modes tested:

NanoPi-K2 (S905): SD UHS SDR50/DDR50, SDIO HS
Odroid-C2 (S905): SD UHS SDR50/DDR50, eMMC DDR52/HS200 (16GB module)
Khadas Vim (S905X): SD HS, SDIO HS, eMMC HS200
Libretech CC (S905X): SD HS, eMMC HS200
Khadas Vim2 (S912): SD HS, SDIO HS, eMMC HS200
S400 (A113D): SDIO UHS SDR104, eMMC DDR52/HS200
U200 (S905D2): SD HS, eMMC DDR52/HS200
SEI510 (S905X2): SD HS, eMMC DDR52/HS200

Changes since v1 [0]:
* Add missing writel in patch 5 (error when switching width)
* Change patch 3 commit description

[0]: https://lkml.kernel.org/r/20190417204355.469-1-jbrunet@baylibre.com

Jerome Brunet (7):
  mmc: meson-gx: remove open coded read with timeout
  mmc: meson-gx: ack only raised irq
  mmc: meson-gx: correct irq flag
  mmc: meson-gx: disable HS400
  mmc: meson-gx: avoid clock glitch when switching to DDR modes
  mmc: meson-gx: remove Rx phase tuning
  mmc: meson-gx: add signal resampling tuning

 drivers/mmc/host/meson-gx-mmc.c | 419 +++++++++-----------------------
 1 file changed, 114 insertions(+), 305 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
