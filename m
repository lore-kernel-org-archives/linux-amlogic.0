Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285F9C46477
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 19:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D882183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 19:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgEr+kfz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="b5yvmRAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7D882183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O5NzuXdMxnUfP6PtPHUNnF/PQRx1jN+MtKhUzwCF5yM=; b=tgEr+kfzwyxOFa
	X+WW1bdM/AShI/rSkkJn7HgARsEBuEKaQv1oqM+VuseMap7gX/9To4qX0naNEhGDm52zgbuBQs33V
	NSp1g2M0NUNJPeiP613nRhlLHFsIlNk9YH1XTE0FUXTY0y45nfjTf39RJfXXEdcFT3qoSBZO+3Z1K
	ubY72mMvHxcNRlIouFOZp1MuTtVo+28KmHb/42vG5jTJPM69DsS003VM+1xX5Q854h1IiKpSkObtm
	O0c4XHZ2UVf/qBAQame7OijYzcr7K+Ysdy3ntNBE4pdvnfneUbfDcxjEio0qB2d+wdIAXoBkP+cXu
	cPOnpyU0NjjUqzR7lLXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9PI-0005Jd-HE; Wed, 12 Jun 2019 19:59:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PA-0005Fh-NK; Wed, 12 Jun 2019 19:59:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id a15so7778854wmj.5;
 Wed, 12 Jun 2019 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSCXfO4SZrHlREdSSaw8mmXbrGugYj3k3dCGPOAQii8=;
 b=b5yvmRACWpqZ/mN/ykGbaGobmJoGlHZekESdaJ+IMrlyyO486QMrsD9N2cimWIO4dG
 Kq+tWdh2lksKWf5OOkGBv8kWpJtVTyYTxgO5jkGDcfD3zruKUO/v+Y6hTLzpMZ3sD4jI
 3eIvzVe7KE5gFjV57z7PQ53N9aaJRubZLPgVENh/O079qENraDUMbkWeMnLZRCAZSlaR
 i7AJIZ5lJc/a+FysvG/zS0quCQKlZfchyH4/9CiNF4EhIELK80/GqmMomPJAqhSxAStJ
 RQYLZpsXBIEW2BTaYaj6aAbYNDwTNRxCkc8ke5VpzvkcTKKZKlmlEkfMAl+jm/1+vjPs
 UE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSCXfO4SZrHlREdSSaw8mmXbrGugYj3k3dCGPOAQii8=;
 b=eUEOEp/kCrO1dSRKx47oaWB17zBGbL1/a2HLEO2/gTGB4unXfnpQXuUFBb+wPIay90
 76p3Ryc0wYBCVhHMyj2iP1mu/ASMsYbUKSOmWCDJ+U1NmVZg1uh1cB8e0/4tdoBIkpe/
 wnNEmgfEJiVClVwfoebgagoOP81d6IOFhJafw0aveKPeXK+KTAtjdvApqi44SW1KohMc
 v/iXsJMvGmxHWwlX14UBZ4IPujMGuDh1DIINSVdPepo4GPraqLtim3a+9TVmFXIcYmSV
 YfSCgPpWpiSwfILlJYKiW9g1/SwZWzJoHU+Qxuu3mWN+23zf7NLM+zAlKShE+ZDmGX+6
 jWwg==
X-Gm-Message-State: APjAAAWFufaTgjTdwmPH6TYyyi/I1o9usmQSYhq+mB879SSZFP4ilQR2
 xHJiraqIohVLa5x4lOULMSEH3I2q
X-Google-Smtp-Source: APXvYqxx6WQ0Q2TthI9hcw9mcaNNk72tal9lYxSvbzj/rzuhF1Bm90n0CNI5eUROu1nDamDovAo5Tw==
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr601629wma.105.1560369569855; 
 Wed, 12 Jun 2019 12:59:29 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 00/14] pwm-meson: cleanups and improvements
Date: Wed, 12 Jun 2019 21:58:57 +0200
Message-Id: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125932_815328_30111152 
X-CRM114-Status: GOOD (  15.10  )
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
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
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

Changes since v2 at [5]:
- fix the SoC name in the documentation patch (#14). The link points
  to the S912 datasheet so we shouldn't call it the "S922X datasheet".
  Spotted by Chris Moore (thank you!)
- add the link to the S922X datasheet in the documentation patch (#14)
  because that SoC generation contains an updated version of the IP
  block with hardware support for "inversion" and "constant mode"
- put my Signed-off-by after all Reviewed-by/Acked-by to indicate that
  I was the one who put the R-b/A-b there (spotted by Uwe - thank you)
- added Uwe's Reviewed-by to three patches (thank you!)


[0] https://sigrok.org/wiki/PulseView
[1] https://abload.de/img/old-algormjs9.png
[2] https://abload.de/img/new-algo4ckjo.png
[3] https://patchwork.kernel.org/patch/10951319/
[4] https://patchwork.kernel.org/cover/10961073/
[5] https://patchwork.kernel.org/cover/10983279/


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

 drivers/pwm/pwm-meson.c | 327 +++++++++++++++++++++-------------------
 1 file changed, 173 insertions(+), 154 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
