Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB4BC4727D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:44:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5CD206FA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ew8HdD7r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1oEjBHmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5CD206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aGEKm8yVxAnrt+zns/rzbTx20p2Q610nJul1opzoeI=; b=ew8HdD7rrNQ2jx0/BjgqycdzKc
	4E1s6qYJ6E9W6I18uzdqJS2H+BgK/51pG/40hV7ndyQRj3K7r4XgB7mfCF9EKyLZH+2wDZquC4vx9
	pDv/exCHYBueWN20DFl8fcDyNGa5W8hDkqgN4fDQlRS+xkoOCtlTy0g+RCf8kZkm0BuD9GXWeySdA
	GorW5JJvdYHMMOCWoZR5oxxYvRGx1zaFLlfA7CPWI2bG1bibc3IlrBVpjrfS4DRGWido594gAMZYA
	SvyRECBZPbBz9Gtf4OO+qsWxq78f15epK5UmqMK7B48u4X/89OCEOIMm50a8nI+wFcO7a2DkflB00
	28FFhuhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOMIT-0005lm-H8; Fri, 02 Oct 2020 14:44:33 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOMIP-0005jv-KZ
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 14:44:31 +0000
Received: by mail-ed1-x541.google.com with SMTP id l17so1892409edq.12
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=H8SXq+IivXLIchSfhBFhCsQdlWRn5LQ5/8Y7HUIonDM=;
 b=1oEjBHmcmrl7G72HPcgOOjmMfPKnY1mzHxUAG+YMZ0vx5yTz/K/Sr1YBmASnczaJn0
 KsRBqbHaizK1jG+UCS2OF+8ZLJLqMqLv+Qen1kVBIpZJbdfq/dUsiU+Mmu7Y3+uzO5P4
 pCSBt9oMxiH71ROSEvG80TXBpOAtBV3llQKzZKcDdkT9CtxBAqmGBZsn6/TfJ70xwX96
 DPyIt4n5O1IvPYzVOCwTwfdhnX4a1u67Bd8FK7z+19KSRNfLUrTQk5VLPtCXDB3MBw1m
 BQTywGcXHi5+/eMlx+RjQc96/GWlDtU8ZMYdTN4PM4mUvk79Xb1Wm+vsHU+qrt7TxYXX
 CkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=H8SXq+IivXLIchSfhBFhCsQdlWRn5LQ5/8Y7HUIonDM=;
 b=n4+ldCrK74PF+ghLauYWwwbG4BaFKpx/ysLWW2w+IhqcJfr1pxhDPA60AYr65U8RHp
 IcCNIRuO19Vyf38MHV5BOmYr/8QE/7NL5kcgK7B9G0f48RnGXsRDx0QV5zPbuRR+Njjw
 f4qRg/lvuFQlu7HANbRvW+hB7LM1oLW3laqPF75HweFUhZUKUelIJBzMMlsb8dyW/npI
 hPoFsRUpDaZ+gQ5hA1uJl4kwqAv1IBj3UdTKOPtcGfU8fYkHUIAVU3J6O3KcYHlfSvzt
 lZMbQNmTEMGeL2LyuB1DLh6xy/tI2c6QSYaMna6ojKXY4yx1MrttP0TSV9A1g2EbbxQX
 QSVg==
X-Gm-Message-State: AOAM530n+i8gmqp/TexmsrKurQxrpgQjmSZGB5TSfQfPQW8xzaoVsxdl
 Rfax2DoaJBbgpO7kqSQs7MI2bA==
X-Google-Smtp-Source: ABdhPJyXQIsKPwo9MrANy8jUk3eZWf5PjDyGiQHyY2oynpsndOEwqFNGuAI3YT5mheABVJKbCxFbMg==
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr1761863edt.200.1601649866534; 
 Fri, 02 Oct 2020 07:44:26 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id cz11sm508493edb.62.2020.10.02.07.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:44:25 -0700 (PDT)
References: <20201002141619.14387-1-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
In-reply-to: <20201002141619.14387-1-christianshewitt@gmail.com>
Date: Fri, 02 Oct 2020 16:44:24 +0200
Message-ID: <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_104429_778758_8B12FEA9 
X-CRM114-Status: GOOD (  15.39  )
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


On Fri 02 Oct 2020 at 16:16, Christian Hewitt <christianshewitt@gmail.com> wrote:

> VIM3L now inherits the sound node from the VIM3 common dtsi but is
> an SM1 device, so label it as such, and stop users blaming future
> support issues on the distro/app "wrongly detecting" their device.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index 4b517ca72059..f46f0ecc37ec 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -32,6 +32,10 @@
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	sound {
> +		model = "SM1-KHADAS-VIM3L";
> +	};

The sound card is the same so I don't see why the sm1 board should have
a different name. If you are not happy with the name, please update it
in the common file.

>  };
>  
>  &cpu0 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
