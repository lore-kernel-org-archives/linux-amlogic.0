Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F88C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99mSNho69sklD2NBed+vmAv04uM6KRYVEgFB8Pb3viY=; b=zFoMgU4I+K1a3l
	Htp6kSYv/ZNuxxydlYK8LRlnB7rRVpDD9uvb8G2nHQr5ToXH2qJmGLm4g4wilPB/4Q2jaWnBKgy4v
	QAhXhnVWnHPR60M7QlGcl6lGeEnSPNZ98OMR6peiHx/oDcbf0IYN5/0G2Jf+eom4Am1k0lFUhR4yF
	YiplqN7c7wPL9W1pl4h1Ds+Df3TdpyP6dvTB6RclSOmo3gHooivZs8Ddr7+IEkDAB1wVIcxjWxWHZ
	Cb+6W091GxWRgtzgQKI2jrHzjyXI7Eb246gMzJEtmAiZdNGD0MEZqr8SNDLXBbLvMI1l9bAu7n8Vv
	Ayv5htZHsp7vyMkZIUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtvw6-001o0Q-LZ; Sun, 05 Dec 2021 18:08:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtvw4-001nzP-7w; Sun, 05 Dec 2021 18:08:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 133so6494190wme.0;
 Sun, 05 Dec 2021 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF5hjb+HWpI1Ih1xwXVy9ddAAkLWiFGmzep35P6NJa8=;
 b=el1s2Fn6aF3tZlnWmb8zajw9s3UfJDaH4P7gRXmjfZ0zEuwgbQ10kfgx4IMio5hn1p
 Uu01lLR2bp1mP5HcalLld668UrcpEogLnqglK6gQCNhsPWYfbVpdwz9cJObju0IwJkgt
 2in494V04RNe3zH+i10XdrbAXd6bPXEGKLAZGg7DNpMw1IDcQNMYGoI59YjQEBOv5MaW
 xrfgtJ7jhiSODqLz00ZmPrE7MECID4hKFta7CvplgqryADVCiT3PF43MxF7tSnrgBrr0
 FB7KKHgoNBy1H004sZN+ugdwQY4TeZtSiEMQv4aYM5JaHO3omtBdMj03KvEsC5cavoC3
 m2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF5hjb+HWpI1Ih1xwXVy9ddAAkLWiFGmzep35P6NJa8=;
 b=6P3/Iaelp+LeIYaliPC3fAxPl/0g0EhvW+XQKsxtx50ft7dilMeo9Ckj+2NRVm7AGl
 jmHfjcde/c1H5OVFGF2N/O7PhfoEKPxWDnNQzTlvBLkorh+/xGFlhh59WCkNKcwLXcLQ
 nPrTXydRQ7W+9b+4UCmcoJ9Y+Ih2k+H14O3ffSQ8Dxtgg8JOVemaeCnL39B7sN8IuOrN
 T8CgTaHBs/toiz6YxIF/0Xkx13Q34XkNbEKE69rfDtHrSMWrUGVozhg+DJ1/rGJp/YgM
 G8WNRNhKNjQMNFPm18Dc4AsKaLTWS0TXkRVBRjlxHeIY+MoPx+SjrywUckQPd9EfT+Ty
 GhAg==
X-Gm-Message-State: AOAM532mtmUy6xwBgZOjYlh7utUhss2rETSWiJvVMaTIXPc1ejJbIVhM
 Cp8iwstXI8METOmrd6b0YEY=
X-Google-Smtp-Source: ABdhPJxFtMAxnY+guAh4BzBOqq0b0PVbyY4w9h4fGaJTVCB19FDi+PDoMvxlhtL74NWjjqZg6FhP0A==
X-Received: by 2002:a1c:20d3:: with SMTP id
 g202mr33026556wmg.129.1638727706049; 
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c11b-a200-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c11b:a200:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x13sm9250551wrr.47.2021.12.05.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 10:08:25 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 0/2] ASoC: meson: aiu: two fixes
Date: Sun,  5 Dec 2021 19:08:14 +0100
Message-Id: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_100828_344050_4D44D9F3 
X-CRM114-Status: GOOD (  14.76  )
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

Hello Jerome,

in this series I am proposing two fixes for the "aiu" driver, used on
Amlogic Meson8, Meson8b, Meson8m2, GXBB, GXL and GXM SoCs.

The first patch is the result of me trying to understand the way how
we get the DMA buffer and address for the audio data. I'm not an expert
in terms of DMA. From what I understand we need to inform DMA core
about the limitations of the hardware. In case of AIU it's DMA address
registers only take 32 bits, so DMA core should be aware of this.

The second patch is what I could come up with to fix the infamous I2S
buffer underrun issue, also called the "machine gun noise" (MGN) bug.
After a lot of testing, debugging and comparing vendor code with the
upstream "aiu" driver I have come up with this fix. I have written down
my thoughts in the description of that patch. To be clear: these are my
thoughts, unfortunately I have no way of proving this other than asking
other people to test this patch (off-list I have already received
positive feedback along with confirmation that both 2-ch and 6-ch audio
are still working fine. Even with Kodi's menu - which is an easy way to
reproduce the MGN bug - sound output is fine with this patch).

Please let me know what you think about these patches and especially
the patch descriptions.


Martin Blumenstingl (2):
  ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
  ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s

 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
 sound/soc/meson/aiu-fifo.c        |  6 ++++++
 3 files changed, 18 insertions(+), 33 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
