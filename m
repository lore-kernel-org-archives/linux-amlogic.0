Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B9DC432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 09:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEC920692
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 09:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="giMpS2uc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yHeksfB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FEC920692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E0hxGopYmDvYUBzzYdmcrKCymw4+0dBomh5JxeqXBIY=; b=giMpS2ucT01apiztWmhRvPV58t
	xG6gCqycuvdn8K42+r+qaBig8gl1bsnLx1TwE1DBn9DBnyiol5FYPBUQI33PD7nIDosKXbP/dft1r
	VbRDSNvKuu8Hn/5j7XGUfKY1ezRRuzcCs7JVimtaxMmdHCrbVI2HvZ/tSJncWNGglPcbKTr42C7lX
	vbMayQrKTNI6w75ZFM6W9ZIk6PKShe/vtDpuYJT9qXrHWcRdJu0JtdL9GC6+sIrmDia4NTVKPkq7d
	M0yjzxrj3ffrLPUxnVykGdCRchZJ9ZhS/Usc63OS1XuOKmTJNlMNK2pLRdmarYCFQPywz7LMpar3z
	ch5lyQ8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWdlK-00058e-Ep; Mon, 18 Nov 2019 09:56:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWdl9-0004vS-HZ
 for linux-amlogic@lists.infradead.org; Mon, 18 Nov 2019 09:55:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id q70so16615549wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2019 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=1GoIOtsIzWbvDocOsz/C2x/FxA2jWzeW8mPBcgPBynw=;
 b=yHeksfB0yCZEYO2eOK8ptMeVrZeueoVGg2UOO3ATiBA0aaaPP1hEmqdWzLWIKpumnx
 AzIer1O0dyWnixlqwzzL+pQ1hkGYLzp8LV2SQ4ot9cTiavfn9FAk9fW06DTqOLfO8sDN
 8T4MMA8HY9MJ48TR9vQzPmD74VqGahXlpKc9doJLxRZEy6IGj+DkATdKYkTDjx3CtuaB
 U6nH9b2l3Kf/bV+R0zAp+0fwePmiZc3FFkqyRZJ/94dtnOWzn8yjC/PN48OhZh7APRK4
 vuSeOZI9+/hG3r9PD/W4x7Kc23+DAM6byQLhoSFoaPBs1C7ucdIVFqtKIP8sFjUr96rS
 o5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=1GoIOtsIzWbvDocOsz/C2x/FxA2jWzeW8mPBcgPBynw=;
 b=bM9rNitF7aYKsPZzXOkHQD1WfK3mBR08iQXmoY3QJ1M3QyDC+1yI3smfrykr0bBfFe
 axAg12gpgqT4NeqUn081Cd4QTCO+kHpXZutW1ElDezQMYa3CFqbSYOkLAmdUcW5gmHy1
 Ox418yyaggScWJ8QfTjez+sTm0Xv2He7QGKGPeASQDGTZp99yFMirM7i/8VxPxA1YqRd
 p3ksPeegHKfcU2m8q2IOcJpue9MqJo/2oxT0vjxDIJy1htjWH0C/DLvYKYpcuFfAFAoh
 DbiFn7jd17fPtv1984gl5LWIuiCMmux5nyEWaT1HHKHDPKSsS2kL2oY/csast+g/3dTR
 lBjw==
X-Gm-Message-State: APjAAAW+B8s9ARZuY4N6JfY3SsJgYB3JQZ5TTiCi05RM1hB/aEaF+ZdL
 qxJgIbH8rXFG6liGYcb6ZwAdMrciTfI=
X-Google-Smtp-Source: APXvYqxLgDYsf/Ba6F+JNYjp/kbm2QlRkLDQTC8CZz5yMHMikquk5MbQttgoLDz2TMet+HxQblEKzg==
X-Received: by 2002:a05:600c:3cf:: with SMTP id
 z15mr28202920wmd.76.1574070949878; 
 Mon, 18 Nov 2019 01:55:49 -0800 (PST)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id o189sm21154823wmo.23.2019.11.18.01.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 01:55:49 -0800 (PST)
References: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
In-reply-to: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
Date: Mon, 18 Nov 2019 10:55:47 +0100
Message-ID: <1j5zjhpkyk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_015551_600484_53CF4D5C 
X-CRM114-Status: GOOD (  18.93  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 17 Nov 2019 at 14:59, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> So far the HHI clock controller has been providing the XTAL clock on
> Amlogic Meson8/Meson8b/Meson8m2 SoCs.
> This is not correct because the XTAL is actually a crystal on the
> boards and the SoC has a dedicated input for it.
>
> This updates the dt-bindings of the HHI clock controller and defines
> a fixed-clock in meson.dtsi (along with switching everything over to
> use this clock).
> The clock driver needs three updates to use this:
> - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
>   the explicit reference to CLKID_XTAL while at the same time making
>   the code much easier (thanks to Neil for providing this new method
>   as part of the G12A CPU clock bringup!)
> - patch #3 ensures that the clock driver doesn't rely on it's internal
>   XTAL clock while not losing support for older .dtbs that don't have
>   the XTAL clock input yet
> - with patch #4 the clock controller's own XTAL clock is not registered
>   anymore when a clock input is provided via OF
>
> This series is a functional no-op. It's main goal is to better represent
> how the actual hardware looks like.
>
>
> Changes since v2 at [1]:
> - add .fw_name in addition to .name in patch #3 as suggested by Jerome
> - dropped the dts patch so this whole series targets clk-meson
> - moved patch #5 from another series to this one because once we drop
>   .name = "xtal" the clocks need to be aware of the OF node
>
> Changes since v1 at [0]:
> - add Rob's Reviewed-by to the dt-bindings patch
> - check that "xtal" clock is actually passed via OF instead of checking
>   that there's any parent at all (which in the worst case may not be the
>   xtal clock) as suggested by Jerome
>   
>
> [0] https://patchwork.kernel.org/cover/11155515/
> [1] https://patchwork.kernel.org/cover/11214189/
>
>
> Martin Blumenstingl (5):
>   dt-bindings: clock: meson8b: add the clock inputs
>   clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
>   clk: meson: meson8b: change references to the XTAL clock to use
>     [fw_]name
>   clk: meson: meson8b: don't register the XTAL clock when provided via
>     OF
>   clk: meson: meson8b: use of_clk_hw_register to register the clocks
>
>  .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
>  drivers/clk/meson/meson8b.c                   | 113 ++++++++++--------
>  2 files changed, 67 insertions(+), 51 deletions(-)

Applied for v5.6
Please note this will get rebased once v5.5-rc1 is out

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
