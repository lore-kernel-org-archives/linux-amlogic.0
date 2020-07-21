Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED1EC433E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFA1206F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2G5U3fu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IfncSmSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFA1206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3FTZxA4cWREusYppqdvVezy4V2z7Lt9NTm3SgRMncE=; b=G2G5U3fubzPOyA+K3D5YZbHynZ
	H1twyOxtV5AffGGTmPRHQOl2qW1sbfXimBp6cQyjTSBfXKisRhsbrk/b669oYrsvtT37H3m0eE0VX
	k7+kUKNyAdvrqujALlXpMS7ROjeZoF4o7H+W+VsAoLn0LaLN4eZAgJ2HETfaE5cCq88zBS2BRvX0w
	XU3rWq/SX8KtHpdVzJkt6BW4UZqhMWMxOSIqkbgSBtopf0/6kx+FQEQ5WzjRsFIqaO9/zOr+0SiT6
	013WLLJLFd2jD3DJbwLG//za1FEL+zDzrw+ndBSNEFcFetwobOJQpqKalpC/dYBFnta7UkDOeAyMR
	8EWLJY9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnyR-0000la-74; Tue, 21 Jul 2020 08:50:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnyL-0000jV-Pj
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:50:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id f139so2032713wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=OOIK19iEIQb8iLI8NiFFRQO03KIxqOtMui3x9Ea/uFU=;
 b=IfncSmSRKyoe03aLW/O3/cHMCD+6dX2gbOWcsWC4NWYkfk5936OP1NnRhuTxmFkGQ5
 ftAcILzlhO8C/cnPjq8B2NH5unXuz3jppCJD+8yqJc0pYP+2BzzGBPTv+f3DNtJmC+Bi
 Lt9zw8Hu4M+fUi/jpHAVE/qc/aFv5fiOSD8tfzB5jBoQzgY9vjS6oqxarekX3k/5BLOs
 +GqRwvB9d6mtVgGqrmxDMNwbaPaMgjSo1C8boYlQ1Gx6zL3/3Jt0oEwgGp9YNpn8zDm2
 0AynyTQasTOY1AAHNGsZjfQ/Y4hgPHVEyYW8hVVupTldFVokrKPM9aAkXBUGBYBL9Y/Y
 oaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=OOIK19iEIQb8iLI8NiFFRQO03KIxqOtMui3x9Ea/uFU=;
 b=tYmb2/1Y4LemktjKrSn3UuPHSFTxUWO0gV6KioeP5hcCvaR+jzs1UW4YXlLfUwdoL8
 gzWGc3avEPpIDMMrN86HnWBq9Kz7HpCQ+W/2K/J+0YtmM0VBCop8XsKU995ys6J1Vz4b
 cgj/BO9ylTDyajRKFETnjQMajQMTzrB09R91ChILn/scJXLVCWUmvZbtDZXUpfhDUx0B
 YRjmfvqH1Ylr/1aOwwjFU63wce1Rj+FXpk3pKyNjE7q64zjEsyURvAVzf78KCeRyRmzG
 wTeS/cZUTfWeQK/pDn1otTNrWiG0WfeJRXbHlo+ai50bP2gfxg8shYjWiEIiIjrCHr/v
 LOew==
X-Gm-Message-State: AOAM532kkzgigcpytD1HtiF2OX4InSB8UCvArLwlpDCUB3E5ziPTsZTV
 zBQaZvOcPjnoFuEg8QIx0siW0g==
X-Google-Smtp-Source: ABdhPJwLk5enCMhq80NTtQvAvtSfv/4KmTEVW6gahsKEe44MxFF7XlPA8Fg5iPiiTmh4PJlAE/0rDg==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr2969980wmf.140.1595321400727; 
 Tue, 21 Jul 2020 01:50:00 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 1sm2466296wmf.21.2020.07.21.01.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:49:59 -0700 (PDT)
References: <20200718050056.1713-1-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the WeTek
 Core 2
In-reply-to: <20200718050056.1713-1-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:49:59 +0200
Message-ID: <1jr1t58d6w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_045002_109808_F251E913 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 18 Jul 2020 at 07:00, Christian Hewitt <christianshewitt@gmail.com> wrote:

> The WeTek Core 2 is a commercial Android device based on the Amlogic Q200
> reference design using the S912-H chipset. Specs:

This series is missing a cover-letter. Please add a cover letter when
sending more that one patch

>
> 3GB DDR3 RAM
> 32GB eMMC storage
> 10/100 Ethernet using Realtek RTL8152 (internal USB)
> 802.11 a/b/g/n/ac + BT 4.1 sdio wireless module (AP6356S)
> 2x single colour LEDs to indicate power
> 1x power button
> 1x reset button on the underside of the box
> HDMI 2.0 (4k@60p) video
> Composite video + 2-channel audio output on 3.5mm jack
> S/PDIF audio output
> 2x USB 2.0 ports
> 1x USB OTG port (internal)
> 1x micro SD card slot
> UART pins (internal)
> IR Sensor
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 378229fa8310..5eba9f48823e 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -121,6 +121,7 @@ properties:
>                - libretech,aml-s912-pc
>                - nexbox,a1
>                - tronsmart,vega-s96
> +              - wetek,core2
>            - const: amlogic,s912
>            - const: amlogic,meson-gxm


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
