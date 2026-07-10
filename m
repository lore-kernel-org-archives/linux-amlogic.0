Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF126C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hjWvoc3WV/3oHaJ5FXjY3RCOMncLhJRQlp2JWUBtGAQ=; b=cXVphdByoPF6lI
	tP8mSuPUm//hpRIsr0f35YzZ2iG84cC6LeNRzCkAT/VvwdCWICMGP3TzLgV7IOuYb8l6N/dHtcByo
	iY2xCDSv7teoX2+lxlkN+t+IqLKiYHzIj76HfNNCHAFQ91HrQcVPH8s4UlqfsJf4yt36wc65uDawA
	I7Q1kyLsrMd8/IFX9n+ryuHbyLdbVxdqZiMlaEIxEgSY5/T/4C2+d3OgNLS8sxq9kmso/x7P0Z37U
	VEEwfoCkZSFcFzUqW5cud8nQtTL59LVAjKF9cDtkMXJwkCsz1kPsV6f4LdnVgpH2J7FcDQE/y+zyx
	F/YDCIiX5K4WTpWykctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiITt-00000005lm2-0LMn;
	Fri, 10 Jul 2026 21:09:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiITp-00000005lji-33y7
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:09:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1223814f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717792; x=1784322592; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZM1sYc8Mcx33JxG91xPslSMUoyWjkZwKm16jd+wS4wg=;
        b=DmlbPW7cL6YPdL0A9xtRjPe1APg09OyEGM7StKP9xd7QnDeO0hzga/139QkncgKgct
         gHOMxVBAsu+GhIDysoawDGB+m0auxzNFxZTNVSObPM+asPyWhf/bl4KFojmJKZrLnXrh
         CIhAao1FhD7VBfBooQyYOkdDMiru136wdg4MZTsU3LaIafhXkLpqfjbWsanG8glVb4T2
         gqvVBclB3Mfrp4SS6b2DpkLENbeSrotNItc5ZIsYm40z+y88lmXvbh2W841PfmZJID8D
         auK06AnQU0l5hAqLlykFLudLuGcz5XeCjuxc1PA09unmKsUPaYiKObG7wrMOEvO6psOH
         MzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717792; x=1784322592;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZM1sYc8Mcx33JxG91xPslSMUoyWjkZwKm16jd+wS4wg=;
        b=HYVuzI3euX9hkxhWeYBQupZ8bmtVHw8t7OfDEniSXhSefV+ZetoZtL8F0g7UO5KWvP
         v2ND/KEDxWN5DVRkGRUE44bj7e4j5TBfoY9m5J2eHozKyM9ZVLWZ+/pvGxeUOgJMfMnx
         UNVTAscI406kANeqXw4ke1ia5CJH8GkBOa2EkoyEkLVutKeT4d8JyTT9oD3z1q/jK7hd
         z9WQuYyysA5kT1+QLfLZW3RJm8eT8z8MKq4gz8/6i31h3WmeGoCcwCRRUFGWAaiLLrI5
         0FCv1sUjnPjKnCn8SJ2OpTkft24X0dWlVykoz/ZIhCzFVfeJxGGeDmADD9Is9cZOZXvy
         o6+A==
X-Forwarded-Encrypted: i=1; AHgh+RrAruKTyGoCt5xD4XPcyWvJgr4C6UwudsAJS1+cni6OTlDRytD8UrAmX86oZJeuHWcBMiHLoNxoElxyCZCJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFKOfMA4CMiJz6UpmWhs0Yjy4E/rC2ZG8RxyU4bD423gHlV3l
	sRcxTDA4GOBi0a3j2NP11QrGHhMw4sp5u1Nv4e4Qt6PkNCiL5MPZJJsU9BX5C/sYrQO9j9Vy5CJ
	RSE4aTx4=
X-Gm-Gg: AfdE7ckHVqe71z2rQmxehgGH8RE57FkT+quppGnKYTwwLOISYKtbmosdSuaiCOZbgUJ
	iQ0rdxxrsrYJ3svLq/TICVXbXt4jZd/AbwYG97oN3gGmCcriiM7oWnb2Gb6pLCAyalxE/h28bp7
	wYIyGzMnxOuhspEJt8xJNwmPOyFK9eMhGfNlMflTn9mJc5p0yfBr9LxmaiQqgsubNJCtOWtlivq
	eJwg22+Jiu5gH4IJ4m8dPINyr9blrctHiaZ0/bzfuQKInx6aWzt/HXg4S5zZ3YAzqBAOyqZcZSN
	6Eo6+trjQmKtuM4mZlXNXj7PN5XccqIg+O+QZ1SL2/nJOoV0PV9qgQ3r8nuZre4z8OPdf9zjtOL
	p02uiJNze1dVedn+bkKvipE1W6AS6lfbMICT7Q212lqw4ORD2oFLucCx/F24B2Y1fZUgCuZS8Yy
	FraSPBnGdkVw==
X-Received: by 2002:a05:6000:4b07:b0:460:d18:865c with SMTP id ffacd0b85a97d-47eee0f3afcmr5999929f8f.1.1783717791925;
        Fri, 10 Jul 2026 14:09:51 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:51 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/3] ASoC: meson: aiu-encoder-i2s: improve hw constraints
 checks
Date: Fri, 10 Jul 2026 23:09:48 +0200
Message-Id: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJxfUWoC/yXMSw6DMAwA0asgr2spDj+1V6m6gNSAQQXqEISEu
 DtpWb7FzA6eVdjDI9lBeRUv0xhBtwRcV40to7yjwRpbmNKUWElA+cw6rYzfIDqg69gNaOvc5ER
 0TzOCWM/KjWz/8/N12Ye6Z7f8dnAcJzF29Z17AAAA
X-Change-ID: 20260707-aiu-improve-quirk-check-2b5051119341
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=su4eVRqd91qk7OtvutfH5sLq2VmfyLE2Qn1mHmMHJ5I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fP4MtYdNvoupb1/37q7FVWTNUtuvc1sWdbh16XZt
 mDBvEm1HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIsd0M/2OC/0y6sVxkc+vd
 Tf++PWQ7ZnlqwsSCwAVrlfmkKwR3L+li+CvTk3Hs550sb63/X53iXv6etJ31nVriRLbIM03az/5
 snM8IAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_140953_794676_1590F14D 
X-CRM114-Status: GOOD (  12.15  )
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

This is a follow-up to the recently merged series reshaping the AIU
driver following the same design as AXG [1]. During the review,
Jerome pointed out that failing in hw_params() when two streams have
incompatible requirements is too late from userspace's point of view [2].

This series addresses that comment:

- Patch 1 fixes the existing bclk quirk check first: it only rejected
  one direction of the mismatch, and its interface-wide flag was
  cleared too late, making a legal reconfiguration of a single stream
  fail. This is a standalone fix and it's preparing for patch 2.

- Patch 2 is the actual answer to the review comment: the quirk
  incompatibility is expressed as hw rules on channels and sample
  bits, refined against the committed configuration of the opposite
  stream, so it becomes visible during parameter refinement. The
  hw_params() check is kept as the last backstop in case of concurrent
  refinement.

- Patch 3 applies the same philosophy to the interface-wide rate
  symmetry. Instead of manually reimplementing the check, take advantage of
  the core's 'symmetric_rate' handling.

Jerome's comment also mentioned the error returned when 'bs' is not a
multiple of 2. That one intentionally remains a hw_params() time
error: bs depends on the mclk rate, which the DAI only learns via
set_sysclk() from the machine driver's hw_params(), after parameter
refinement has already run. I don't think that can easily be expressed as
a constraint.

Final note. [1] has not been mainlined yet and it's only present in
'broonie/sound.git#for-7.3'. Therefore this series depends on commit
c7852d2dcf66 ("ASoC: meson: aiu: align I2S design to the AXG one").

[1] https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/
[2] https://lore.kernel.org/linux-sound/1jik7pebk7.fsf@starbuckisacylon.baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (3):
      ASoC: meson: aiu-encoder-i2s: fix bs quirk incompatibility check
      ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints
      ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling

 sound/soc/meson/aiu-encoder-i2s.c | 154 +++++++++++++++++++++++++++-----------
 sound/soc/meson/aiu.c             |   1 +
 sound/soc/meson/gx-interface.h    |   6 --
 3 files changed, 113 insertions(+), 48 deletions(-)
---
base-commit: 8e5a6599a38e5515cd2b5f34fe8a8ac476f8b127
change-id: 20260707-aiu-improve-quirk-check-2b5051119341

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
