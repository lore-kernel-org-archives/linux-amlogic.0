Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8DBC468BF
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECF0212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjB82h4o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NMBwiOLI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECF0212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfHL0ltS1OGZnx7VlaDF90Bke7G0lKyf49sl8ytlqxQ=; b=WjB82h4oKzfKEn
	E6idebFzJMTVOnq9Nqcel2zaaXjRtpi/4kL5cw/Uy2C0dDGHMX7GmztL3/VN6OUx0OiH+ccRxPKkA
	C+AZLHa0gYpoDvX/CQVizuiDhAMQe4ZyV3E/KevZ3awnuzJvWmRvLTT36f/JAQxWvZb1pl18Y/9vX
	6/JWPlV0tzPym8ysPjfi4ZmRaJCzn4CziI1w51pO8vVbse9MTzp88+gNmSgIXr5LzplFqgbexIwI9
	5W0rA37jK+g2WD6dRB7yEXE+tKUCpPNRPYNlzUwMuYDiZCdLfb71ORfxrt8ANZSoNMtORmfXxaDwD
	bO9IiR6kyP0azZ0KB9PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfjj-0000ld-Cd; Sat, 08 Jun 2019 18:06:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjf-0000kA-SE; Sat, 08 Jun 2019 18:06:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id c2so5203125wrm.8;
 Sat, 08 Jun 2019 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUE0MVJ4EiDj/R4+UJN1pSKA+Jns9ufEuzEwI3ecfc=;
 b=NMBwiOLIzdn0IuBMvEJo7m9mr0pup/SZfwc+LTYFylMBWek4k8fb/5oanI2zRZVyVG
 ++6Ci7cqfziSdlIXVJ1lmsoWd7srcHkQSeidh17/m0biXfhKzc0ZzkzLNvLvKwbGAlt0
 pp+Q0rCjF9NGdNpsTMu8Aq3JW9wW20otUvjOozfWEbLVFHJ93N5iBe+iJvc0XSvqXsua
 cmJUDYo90rhfxOM1kisxWWpywnzVeJfanShGdBuJP5tweH+Wr5xj9Vbholo7DgBQosov
 oF/iANPXLGa0UGR2SSArlAedGXOI6Z6dZanjTU5xEgCttjydEeHf7NneO3yZRRNetn/z
 ERBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUE0MVJ4EiDj/R4+UJN1pSKA+Jns9ufEuzEwI3ecfc=;
 b=X1DRvgHe83xFdNLrceFNNOQi0y5iK09/dIerZK7xBkiJGszzkYSHBaw6UMdyV+U5Y7
 Ls9po/1FLeZoiZuxnNPzfcMxsAtPHBi4/aQoqnxBg/hWMvqIH1Lpi575UReve63CRYaO
 NEfEYyfaLzakHycfpzV9Bv9Rvtk9pPWl6pClv/IRM5oSc4BDyG8GoWvsNS005m2pQOrM
 nvm5d5tXjDmu8Yhn+/As+gWgs02g4s/hpi/qgruvizJzL5mJDUzvUiYAiuJpXCnWbjF7
 Fi3ucG+x/Q0rlUC9joOt/kd0ncczUa12A4x/0ET9dh4tQIvLFv5nlgUqYzU7jO5OPmPv
 0KVw==
X-Gm-Message-State: APjAAAWBuqq8z+poV1RVRTOps3P6mYPc1TfJdhQVfkTlxZZd6fArXou8
 CIBi5LnawC72ufdK4O8rIxwXhwKX
X-Google-Smtp-Source: APXvYqy3O37+yFg/dRFn1re7VJBCjQhw131ukejmKTFgVlkkAI9DNI/H+HB3d7RDWFCQTx4maYTgYg==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr22980982wro.162.1560017193772; 
 Sat, 08 Jun 2019 11:06:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 00/14] pwm-meson: cleanups and improvements
Date: Sat,  8 Jun 2019 20:06:12 +0200
Message-Id: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110635_917694_67C49E3E 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series consists of various cleanups and improvements for the
pwm-meson driver.

Patches 1 to 6 are small code cleanups with the goal of making the code
easier to read.

Patches 7 to 9 are reworking the way the per-channel settings are
accessed. This is a first preparation step for adding full support to
meson_pwm_get_state() in the pwm-meson driver. Patch 7 makes struct
meson_pwm_channel accessible from struct meson_pwm because
meson_pwm_get_state() cannot use pwm_get_chip_data(). Patch 8 removes
redundant switch/case statements and ensures that we don't have to
add another redundant one for the upcoming full meson_pwm_get_state()
implementation. Patch 9 gets rid of meson_pwm_add_channels() and moves
the pwm_set_chip_data() call to meson_pwm_request() (like all other PWM
drivers do - except two).

Patch 10 is based on a suggestion by Uwe to simplify the calculation of
the values which the PWM IP requires. The nice benefit of this is that
we have an easier calculation which we can do "in reverse" for the
meson_pwm_get_state() (which calculates nanoseconds from the hardware
values).

Patch 11 implements reading the period and duty cycle in the
meson_pwm_get_state() callback.

Patch 12 removes some internal caching which we don't need anymore now
meson_pwm_get_state() is fully implemented. The PWM core now takes care
of not calling pwm_ops.apply() if "nothing has changed".

Patch 13 adds support for PWM_POLARITY_INVERSED when disabling the
output as suggested by Uwe.

Patch 14 completes this series by adding some documentation to the
driver. Thanks to Neil for summarizing how the hardware works
internally.

Due to the changed PWM calculation in patch 10 I have verified that
we don't break any existing boards. The patch itself contains two
examples which show that the new calculation improves precision. I
made screenshots of the measurements in pulseview [0] for the second
case ("PWM LED on Khadas VIM"):
- old algorithm: [1]
- old algorithm: [2]

Dependencies:
This series applies on top of Neil's patch "pwm: pwm-meson: update with
SPDX Licence identifier" [3]

Changes since v1 at [4]:
- fixed MESON_NUM_PWM vs MESON_NUM_PWMS typo in patch #7
- add another example to patch #10 where the pre_div has changed with
  the new calculation. the generated PWM signal is still the same as
  measuring shows
- added Neil's Reviewed-by's and Uwe's Acked-by (thank you!)


[0] https://sigrok.org/wiki/PulseView
[1] https://abload.de/img/old-algormjs9.png
[2] https://abload.de/img/new-algo4ckjo.png
[3] https://patchwork.kernel.org/patch/10951319/
[4] https://patchwork.kernel.org/cover/10961073/


Martin Blumenstingl (14):
  pwm: meson: unify the parameter list of meson_pwm_{enable,disable}
  pwm: meson: use devm_clk_get_optional() to get the input clock
  pwm: meson: use GENMASK and FIELD_PREP for the lo and hi values
  pwm: meson: change MISC_CLK_SEL_WIDTH to MISC_CLK_SEL_MASK
  pwm: meson: don't duplicate the polarity internally
  pwm: meson: pass struct pwm_device to meson_pwm_calc()
  pwm: meson: add the meson_pwm_channel data to struct meson_pwm
  pwm: meson: add the per-channel register offsets and bits in a struct
  pwm: meson: move pwm_set_chip_data() to meson_pwm_request()
  pwm: meson: simplify the calculation of the pre-divider and count
  pwm: meson: read the full hardware state in meson_pwm_get_state()
  pwm: meson: don't cache struct pwm_state internally
  pwm: meson: add support PWM_POLARITY_INVERSED when disabling
  pwm: meson: add documentation to the driver

 drivers/pwm/pwm-meson.c | 323 +++++++++++++++++++++-------------------
 1 file changed, 169 insertions(+), 154 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
