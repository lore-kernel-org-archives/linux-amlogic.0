Return-Path: <SRS0=h6Hi=ZV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842DC432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 15:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F01215A5
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 15:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNgk5BH4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fybemh1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F01215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cd2bIP1ZKh5AFrS5PQsOR7p+UlFeSllryQCUlcIBWgM=; b=FNgk5BH4QeazU+j/78x6Rl3Dl5
	FJAf8p4QSu0+h3ek4iqJztGLMhlz1mNcFEpDrajP/raO9DsdNGkv4LkfZRuCACAmRMVe1tVNm8H9U
	bdqLf3uRw8GTE2Q+2wavKX7jmBbqMKR7GaSKggUI5MqTKBZSmtQ8gCn6ecixx41dsn2jjSVRuFj+/
	nKoFP4qnM9IcAGmR2Vt8N5zpfnhLbvUQVeG5o5rpbkM3wGSLX0D5ClHFepx/ogcY4NiC1z3qJVxI5
	B+KlXZbvmyi3v67SEALIbgx31xVA+9vJxk5dNjBZvQLW46PpxgISXQZuj/rh4qFGPeefTB00VyFRh
	DuVOEn1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaiCM-0006R9-K1; Fri, 29 Nov 2019 15:28:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaiCA-0006IG-PB
 for linux-amlogic@lists.infradead.org; Fri, 29 Nov 2019 15:28:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id c14so11060819wrn.7
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Nov 2019 07:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=QBYK1E+SFEUtR4nuF0Hq1/Zl0vxT8rcgdq12kebEYCw=;
 b=fybemh1fl5FELIMmoJZnWKoGU6gkjl55CTvBtsMkTjKBe9+9q5azX3vK7CrnWlD4+m
 ATTa/+yYn808n2UnMe0zSU27V/ALJzcfyewxcwoGDLMpE+3nRgHaRQI6DA94AukXUiJB
 hjsqV4+jtcmEmj/BDh8dLZ/DRjse6sDrT0bCl7ecTrNNyYBw6BwzfFzs7Ti5p0v23MnE
 +fDRYLnLSJ559SpDXDxTsKfDHmPdDwfAe4/MCFncI1Wzvl2k8yyzbCe3Y5158WP0Gpt4
 xntmd2a+Rl7Oonw3WrC2tR2S9zGYEskSnvLdMeDrEhklUgWbep0gTuvPx0qYaX4l87Lz
 Gxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=QBYK1E+SFEUtR4nuF0Hq1/Zl0vxT8rcgdq12kebEYCw=;
 b=LJg5bRMuBEwoHzRjbgdqV3lz9bt4JTfMUbRuBGh710ZiwwTKyqRVZu1m1EiaoPdDKY
 wqBDgYBUGivyQ93XTxqVA9xmh85dQ6zLnFezIGzRPxnve6BMIM5CphUdqBANBABK9QKC
 rf45cXxZiUcBNnSFcSpABGuSeQaYlw35/d9XpHduBHpPF56DdwkuLjU0/by5Z+lsExcI
 9I3YU+tNUMZ6u+A9+VhWg9WvGhsjZWJpv/LNayg+tQKFP1N5LXd/IMWdfw3V91esqBLv
 HUoipNLIusK4xpvAeVB5gRGiYQJqD9AJIxGt6qm9+pfBnjBP7lfAoqOV9KKjHTJfHdH3
 +1HQ==
X-Gm-Message-State: APjAAAWJCifkrr67BDsJizRtZdUfXzp2/hQQVgS1TJxEAKTRJKBKszSj
 badm72L6wYwSzkweiaU6qQpOkQ==
X-Google-Smtp-Source: APXvYqwp522ZQItIPDw0UZZeNpADWsIPr6wHnrqJzszsiD5Ngr1SfU1KzHkCvXFfBFKhk2oWIkEzYw==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr10405744wru.6.1575041310867; 
 Fri, 29 Nov 2019 07:28:30 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m3sm27328570wrw.20.2019.11.29.07.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 07:28:30 -0800 (PST)
References: <20191129144605.182774-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/7] add Amlogic A1 clock controller driver
In-reply-to: <20191129144605.182774-1-jian.hu@amlogic.com>
Date: Fri, 29 Nov 2019 16:28:29 +0100
Message-ID: <1jwobi7lcy.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_072834_822058_B295F35C 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 29 Nov 2019 at 15:45, Jian Hu <jian.hu@amlogic.com> wrote:

> add support for Amlogic A1 clock driver, the clock includes 
> three parts: peripheral clocks, pll clocks, CPU clocks.
> sys pll and CPU clocks will be sent in next patch.
>
> Changes since v1 at [2]:

v2 or v1 ??

> -add probe function for A1
> -seperate the clock driver into two patch
> -change some clock flags and ops
> -add support for a1 PLL ops
> -add A1 clock node
>
> Changes since v1 at [1]:
> -place A1 config alphabetically
> -add actual reason for RO ops, CLK_IS_CRITICAL, CLK_IGNORE_UNUSED
> -separate the driver into two driver: peripheral and pll driver
> -delete CLK_IGNORE_UNUSED flag for pwm b/c/d/e/f clock, dsp clock
> -delete the change in Kconfig.platforms, address to Kevin alone
> -remove the useless comments
> -modify the meson pll driver to support A1 PLLs
>
> [1] https://lkml.kernel.org/r/1569411888-98116-1-git-send-email-jian.hu@amlogic.com
> [2] https://lkml.kernel.org/r/1571382865-41978-1-git-send-email-jian.hu@amlogic.com
>
> Jian Hu (7):
>   dt-bindings: clock: meson: add A1 PLL clock controller bindings
>   clk: meson: add support for A1 PLL clock ops
>   clk: meson: eeclk: refactor eeclk common driver to support A1
>   clk: meson: a1: add support for Amlogic A1 PLL clock driver
>   dt-bindings: clock: meson: add A1 peripheral clock controller bindings
>   clk: meson: a1: add support for Amlogic A1 Peripheral clock driver
>   arm64: dts: meson: add A1 PLL and periphs clock controller

The arm64 is for the DT maintainer. Please send it separately after this
series is applied (if it gets applied)

> Please fix the underlying issue, then you can post your series again.

This was a comment on your v2. Did you fix the orphan/ordering issue ?
If you did, you probably should mention it here.
If you did not, I'm probably not going to review this further until you do.

>
>  .../bindings/clock/amlogic,a1-clkc.yaml       |   70 +
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   56 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   26 +
>  drivers/clk/meson/Kconfig                     |   20 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/a1-pll.c                    |  334 +++
>  drivers/clk/meson/a1-pll.h                    |   56 +
>  drivers/clk/meson/a1.c                        | 2309 +++++++++++++++++
>  drivers/clk/meson/a1.h                        |  120 +
>  drivers/clk/meson/clk-pll.c                   |   21 +
>  drivers/clk/meson/clk-pll.h                   |    1 +
>  drivers/clk/meson/meson-eeclk.c               |   59 +-
>  drivers/clk/meson/meson-eeclk.h               |    2 +
>  drivers/clk/meson/parm.h                      |    1 +
>  include/dt-bindings/clock/a1-clkc.h           |   98 +
>  include/dt-bindings/clock/a1-pll-clkc.h       |   16 +
>  16 files changed, 3181 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/a1-pll.c
>  create mode 100644 drivers/clk/meson/a1-pll.h
>  create mode 100644 drivers/clk/meson/a1.c
>  create mode 100644 drivers/clk/meson/a1.h
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
