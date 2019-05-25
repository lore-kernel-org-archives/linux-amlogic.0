Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AEEC07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1734020863
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fah5GGn+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DA2XRAo4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OGJNTZfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1734020863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEdawITmRii5FcEphMVtsjDmZxiIWdBm2fbhxCLUoBY=; b=fah5GGn+3Q3xk4
	W0Ul/9tEzMwTURBOSnrYeZDrNAORjy0MrkhtbI/TyUH0F09qIQeKCHR/zG/3qyo+xddT49vStE+Zm
	CpSABwAbiKJlKL15dN/fIgBIik3W3Rj5g8LHpNYs5ARbqsaJEL1Eforq7YGuB+YwTkKNXeBz9FIsf
	LrVG+Eq+w24H9LMNLuwg7Gb/1NpxUTfSXKIvB1zoDvz1uszVhMRRjxj9aiQYKP1EL4TPIE22mfW35
	ySk9v3DlIgTzOlUU7IHxT3E703ZwoyNAaR/vcQ9/yy6gKDh/yZs3TDzkl/Ykr910BVnqQDOZs6Fgk
	zfh1wW3j78n6RYMqPefg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbQL-0004Qu-BC; Sat, 25 May 2019 18:29:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbQ8-0003yY-FW; Sat, 25 May 2019 18:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Yb/S5cquO/qD7cZ8y/Ty2KEWw38/es4qeSEZUyR+jc=; b=DA2XRAo4/42BjE5N25wrSNegWJ
 3m9X/DkXpaCv8XYfkDU6rb9zWF/lpYhavOckzBVx1Mvt/C4X8PqXGTH6rXLipwB5Z7Z2TsH9KeZyh
 vJqhm+7TMmhMCfBsMpEv9h9C3B9Ih6SDQLk0eGLlIXuEI/WRLUw92G/1dpP4fzgtJRv6tC8PEvNtz
 juDSL0cyydQ9Bg0neDwZaLFxI7N8yseCN/Z8S3qnoLd0W0Iy+jpnnddXpE4e96KX9ePFoP1qGZFcr
 2pZABig6sZho955oufOCMq+36S8WMOckYIohXEk82s0+5+EyUk5DNup8HrfQY175pAZGaPk3YEDaU
 909Y9GVA==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUb90-00024t-8A; Sat, 25 May 2019 18:11:48 +0000
Received: by mail-wr1-x442.google.com with SMTP id w13so4590523wru.11;
 Sat, 25 May 2019 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Yb/S5cquO/qD7cZ8y/Ty2KEWw38/es4qeSEZUyR+jc=;
 b=OGJNTZfDrBzPN439RB++aRKeudPMkKmAnuPSKbCnLRPL0eV+S2U2ujtLWuKIW3R1/V
 tR+Vi1PNTFdC3hGP5egqzB5KZrLyec9thl7qdXa7ZIVQeM50/fuANNeD/xx2+zjavcfh
 Sot/dtNJhrUJ3CN3JWpD0bZEgn1Xr1TDXlo4Y3rXszL9ELsilnxHcpQutZ5dmQ95q+da
 O+cChUMRweL+GBgKmh1Swu+H8mtFOj4Ri6QVjHAt5zCjyhpT6mXWZBSD+SU+1eh04PNv
 rZm1iK+/8a/D9sCSzxE+GWi1gyxowb2WaeDIN2BLFZgY4xFUTPexkmSwSdQnPV+9iF8d
 jSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Yb/S5cquO/qD7cZ8y/Ty2KEWw38/es4qeSEZUyR+jc=;
 b=T/jXCIdXQTypz8prJ5KQej6nuSh4IXjXYplweZuhd4fxMPU9Kg/Emsl7b8p+HM4XqL
 qRoRw7pZO1aDsMrxALUmWQUEO0n1P1onyA40wWVLUus5xk+8p4wYTvtXNcXW+wIXAtId
 tfPOSx0YYviraigLd7zlkSIe9RMDPvU7PEcVmR/1stRTbHG9lXUyDMLDWA9YutK+phx8
 aEE2bkAx4HyHJrkkR5LadTpDRs8scwD23/4A21toQh8IdLhlc0U7oUXFtbanC6necQ/I
 cN/NnDVIvJroRt+zilOjAswBO/2Y/D8puQ1i5xugD/swhY69O2n3CorcQxGCoHH+Nrbs
 fhCg==
X-Gm-Message-State: APjAAAXp7P6Y5BK2CjDs7Tj5gGPNzRUO++bp+u4Vum0cyhkAE1Hvmowa
 5S33wNnbVnmF3gRfzJOqIZGS3isW
X-Google-Smtp-Source: APXvYqxBZiRxV8q08TSMKchVl/GQr4AJB1E/7X1Qboxu7UaF1qNqvJ7pwpHbrpQvTRZKOmexP2cjYw==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr20308734wrp.220.1558807903867; 
 Sat, 25 May 2019 11:11:43 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id o8sm12794540wra.4.2019.05.25.11.11.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 11:11:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH 00/14] pwm-meson: cleanups and improvements
Date: Sat, 25 May 2019 20:11:19 +0200
Message-Id: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_191146_361004_0E39DDF6 
X-CRM114-Status: GOOD (  17.89  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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


[0] https://sigrok.org/wiki/PulseView
[1] https://abload.de/img/old-algormjs9.png
[2] https://abload.de/img/new-algo4ckjo.png
[3] https://patchwork.kernel.org/patch/10951319/


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
