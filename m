Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83714C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:15:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543B120675
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wr9ULtfj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BnqvVBms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543B120675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6bo27zKFFTIT3EB++PiH2oqMQXOMO/X5r9k1qCNv0g=; b=Wr9ULtfjBqV7VQ
	frBm/fmrdNY5OTmN87BkwM3H03Xa7tpKqDE8y2EEXuz6Zn17C7uLjVwkA8GrCgmR6lS0EkmilmOmD
	UhWxLciqB0FfxhYVuhgmajINba45ZTBW3z7efDxFqep9OkSrM0xQ7YqQe03P5w9Fa18RuN1SOSm2l
	7d4XVlPdew1A64z9SOaoQGDbkV9JxvaRwjgAuzYqgqzJ4ATN98iX7Y7Meh0jbW8g+DC2FYawx65FY
	M64pYu2XclZzEqcoJpbWgw5qg8dHTEF6Xfwyxt5D3o/kaCe5NYd4UOo+omjsLqTa72PPvScR2cAiD
	eLWz9ePNBoLy5r0V3DaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQTWV-0005KA-2f; Tue, 14 May 2019 09:14:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQTWS-0005JR-4E
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 09:14:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id l2so18287815wrb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WHxIikLCyzadwzBR9VCleTtgnBQzuu/J56HNxGMdIDw=;
 b=BnqvVBmslpi2JZdrAHWNmnzh291ev9Noqx2p1BSS5FFLZ/QmeMP/CPtcJLK98GZTw5
 hoqoo3cdxU1pg7p2kshCBipP1NfmlEevwSbtZDnCmZCaccD/xwUixYS/EoMnRy+v3Zrd
 Q61ro2lC+5dX5Q69cCwW7IWlmVOFSN+F5RVS0pw1ayU1+F/c+e6whO/RRoEotoL2kO7K
 s0DWFmR4+Tb5WefdOIuZLjA5vAi58w/HnbyJQFr/qS59I0VEmMtpIFpWowKTXKReV3b9
 Xt8MerNtojSZ6/ZzagiLJiAUfbHqm44KeJFSU91Gvxo1laO0gBUlQM13H2fKvHy/Pem8
 4wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WHxIikLCyzadwzBR9VCleTtgnBQzuu/J56HNxGMdIDw=;
 b=buDq8Paq909mY0TtG6MwcAThxPfU0tiTBQ1b0wRYDt5XA1PknLfrKhLd5NRoVt3s/2
 A5rrx1CVOFikeOfbSqHNJzgAzz1rDisOiMX8njWMnNrZsIyqOf9zMjoLgxsExs7wCjKs
 bcXARqRBco/gNbTyVvSfrb9Zd0Ts5st9cGQqQOFGNiZVTozhU2mEcyoO33QlNjwtJUKx
 f+gn6WjbZZ8LrwiGuC++/tw1+svFtV38bIjBN66jhwPaX3Ol/2lYmJ3qVXr0Eoqdscun
 5zJ1Oikla2tMR+KgGU6iB4BH7JWdOWOhe/SDWmXsSqUAOgRZindDGmEb+SFkcU7TApnn
 Pmuw==
X-Gm-Message-State: APjAAAU3YdLAwIG7Y/PLP0jGN6XPCleoh3DW3k+VM0uCT3lt97OXPKaR
 nxjlP3TPN7aWgxRQq0EM2lD/iQ==
X-Google-Smtp-Source: APXvYqzf+dSBEvOTHFEA7BpX9uCb381SseTb8LeMKVgOuG2PWYyraQWFwTH2qcHUwYjoH7p2xpk/Qw==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr10469376wrn.209.1557825294494; 
 Tue, 14 May 2019 02:14:54 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a?
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id u14sm14706822wrn.30.2019.05.14.02.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 02:14:53 -0700 (PDT)
Subject: Re: [baylibre-upstreaming] [PATCH 0/3] mmc: meson-gx: add
 ddr-access-quirk support
To: baylibre-upstreaming@groups.io, narmstrong@baylibre.com,
 ulf.hansson@linaro.org, khilman@baylibre.com
References: <20190513091548.16674-1-narmstrong@baylibre.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <65423579-52c0-40ca-143a-6bc6ed33c90e@baylibre.com>
Date: Tue, 14 May 2019 11:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513091548.16674-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_021456_182760_A5532A56 
X-CRM114-Status: GOOD (  17.77  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 5/13/19 11:15 AM, Neil Armstrong wrote:
> On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
> the data from DDR, leading to a broken controller.
>
> Add the amlogic,ddr-access-quirk property so signal this particular
> controller has this bug and needs a quirk to work properly.
>
> But each MMC controller has 1,5KiB of SRAM after the registers, that can
> be used as bounce buffer to avoid direct DDR access from the integrated
> DMAs (this SRAM may be used by the boot ROM when DDR is not yet initialized).
>
> The quirk is to disable the chained descriptor for this controller, and
> use this SRAM memory zone as buffer for the bounce buffer fallback mode.
>
> The performance hit hasn't been evaluated, but the fix has been tested
> using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
> 55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
> at 50MHz clock. It gave around 170 Mbits/sec as SDR104 and 200MHz clock.
>
> Neil Armstrong (3):
>   dt-bindings: mmc: meson-gx: add ddr-access-quirk property
>   mmc: meson-gx: add ddr-access-quirk
>   arm64: dts: meson-g12a: add ddr-access-quirk property to SDIO
>     controller
>
>  .../bindings/mmc/amlogic,meson-gx.txt         |  4 ++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  1 +
>  drivers/mmc/host/meson-gx-mmc.c               | 65 +++++++++++++++----
>  3 files changed, 57 insertions(+), 13 deletions(-)
>
Test with SEI510 board no problem or regression seen

Tested-by: Guillaume La Roque <glaroque@baylibre.com>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
