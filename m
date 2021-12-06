Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96380C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KdezhkAhIf4ZIFyph+fYSzcMvOSHFKvncKYLyLdHGwQ=; b=xPE4eMCSErdKRH
	tpBRF9PAXnqpa4NE7KdpmL00NUh5YifpgwnlsnJ3Lor9SVsS/KEjw9syEnzN4rUo4l1BRe9B7nPz6
	c3R4HRxDqEYeAzWK9Ox+dVG5N4O3Sr8qrOsGvnTaDnV6pwhZ66X8N3eBxP7UEfXRjyt0JkDne6EpM
	zq83ztP+NdYMOcu94PUYiMbzb8pTghWszAteYfj1IuGKHLxeZAiNXZq8TqBB8HUyc5ONNo8mFXxx+
	0tyKpWvi4M6LV9fsuyRSsIf4Uh7hAazOyFiubFsUiyY3I1Q4nsBpz6LjFP62hfwZZUPwiQMTI2nys
	R0w7MYdNDanMU8QIsxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLDs-005jtA-2Q; Mon, 06 Dec 2021 21:08:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLDj-005jpR-9W; Mon, 06 Dec 2021 21:08:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so217290wmj.5; 
 Mon, 06 Dec 2021 13:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YX3z1j0kzxdvMhDSejpCHfZc5AO9HN6Aa+IgB+x/Zhc=;
 b=o1bTX+KHRMpwsOkiIqgpUIjvyUmvD53mDXlD+vGqffgVmm8qJ7Cf6HWOJLDXxM/95l
 /aYPybuvQecvUySKNdXWctZGD/eV4GYgJ96bLmmhZNbyopw1FesRDiGpPndIT5WDh1VJ
 YfNSt+f8NAonf0G5HVeqcq2/OrYWwADIW/k5OK3PBE4M5DbeK3EyMibyAbnOpw4qaLoc
 ype84W++66UlcV7pG1+aXsZXpSRthM/jZuMU7EQPAyEdWYWUhahVbmzReMdYpGXAMX0e
 4SrgOmaM8sBbPI4ktE1ZiUngws1yL/Q683qmB8st6ONL8wsSE3Q5W60w/HWQTtZ3F6Wr
 BM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YX3z1j0kzxdvMhDSejpCHfZc5AO9HN6Aa+IgB+x/Zhc=;
 b=cGJZltE06A1kKRxbcpKD8QHNqgNg/Ef2P+MHiVLBEIBoNoQAVuzM71oa9ZzcZNrunb
 EVT9yLV3p4uqN/vxvn3uB6//6Vp3J670GaAqL7OPnQO/z/Gt45AhTOaSYbY43uG5RTB3
 BpbMSkBnrGVm9okSHE6BHtkyDAC1g8XqQ3GR4x9L7ysF0MVeVsqsY8LC/t0XCsbudwHu
 U5ewHYNx3GJGpqMX27/nq6+RMvfSdPC7DoMRMwKNGm72z/POuKXV8Dc8W2uCDW2rwHus
 tHZO2JZiVAxll2yk0n/YsXHYmOdIIUbtZL8t+k18vLTzcs8B5g4c1K3jYJRE2YEiy+2c
 /ABg==
X-Gm-Message-State: AOAM532W3qNc3eO+BI1vR2yLQxGvpvC9aoDOhayDKZgRExsVvE313c+0
 mxCo9lhNqxcLrWBeXa1/Gz8odblr/dM=
X-Google-Smtp-Source: ABdhPJx4RP8hbzwbyl65YVzTdgXZhHlULJsQKpP1erTYrNto/KFeKGG2NxVTACIVfiteVBnE6EANyA==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr1277188wmo.136.1638824900455; 
 Mon, 06 Dec 2021 13:08:20 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] ASoC: meson: aiu: two fixes (for 5.16)
Date: Mon,  6 Dec 2021 22:08:02 +0100
Message-Id: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_130823_385485_A66F93E7 
X-CRM114-Status: GOOD (  20.36  )
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

In this series I am proposing two fixes for the "aiu" driver, used on
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

@Mark, @Liam: It would be great if at least the second patch could be
queued as a fix for "for-5.16" as this solves a long standing buffer
underrun.
This issue is nasty because it can occur at any time and it can even
loop forever. Christian provided an example with the speakers on low
volume: [1]. Imagine the same sound on "medium" volume after playing
a movie.


Changes since v1 at [0]:
- Dropped a paragraph about FIFO IRQs from the second patch because
  Jerome has a valid point that this behavior can either mean that
  AIU_I2S_MISC is related to the FIFO or the FIFO consumer (= encoder)
- Add a bit of documentation explaining why we set the
  AIU_I2S_MISC_FORCE_LEFT_RIGHT bit (affects patch #2)
- Collect Christian's and Geraldo's Tested-by as well as Jerome's
  Acked-by for patch #2 (thanks to all three of you!)
- Cc linux-stable for the second patch
- Dropped RFC prefix


[0] https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov
[1] https://patchwork.kernel.org/project/linux-amlogic/cover/20211205180816.2083864-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
  ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s

 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 19 ++++++++++++++++++
 sound/soc/meson/aiu-fifo.c        |  6 ++++++
 3 files changed, 25 insertions(+), 33 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
