Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0EFC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:18:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D049620828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlTJGTxb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GB+HQzVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D049620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8JslKrUVnFlaeGsmMPPW3C/TUtbxE0KmJpEw70x8gw=; b=FlTJGTxbZ3iepo
	WK1987teuVMlxn0HTY3d+bflwMULfYF10Xce2nIOaZf0emE7/gZ2yJKJE4dYV+L8hf5OwZfHVdB8x
	a2CUQY2bvkAK+V6u3rPVyTt1QorOCpYp3oI5le6tUa63xs2rGhh/ZWns9mnPNmv3tqX3UbjXu/EBu
	BRmhuBXEKo0zT1utHEuRRR2sFk9q7r218beiuh66CYlHM6h5qoH1+wmM0B5+9lvv1k7or9GkyuuAP
	pQNsThAGVobTleEBacXY6ouQrK091JzYphX13/d8pSwZ7Vh4Oyq8BVkqpgdFVAyh9KzbTEg63tD6H
	1O/gZIVqRMg8cjaRSVNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5yhm-000606-Ok; Mon, 18 Mar 2019 20:17:54 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5yhj-0005ze-5A; Mon, 18 Mar 2019 20:17:51 +0000
Received: by mail-oi1-x242.google.com with SMTP id i21so10788428oib.11;
 Mon, 18 Mar 2019 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kviz/ZAppsOp97wiwa/3qIYHbJwscWwNP5RnfHRpeDo=;
 b=GB+HQzVsQOcWCvFIEFBse7gdQqKCla07o2s0SjRyREYw1B6tK6JGIzP0iHN/x+hC01
 /8GBoaImw+xXSwQrAU1yogcGoNxVvX9iryi5QiC9PfpV8BglnX3zpJEJry+poPSCxIan
 xRHIqBgwCdVQndsO9PbkY890c0cj6LzaUphqcD+0HrirUuHlK2UJyUCdC+CDE0Zz5fXl
 jhKXi2xkmOnSyPusQgf9AkvyuLfDS+Ue8ocDnar0cx7h5wjjLdzSrnrTC32W0j91qIvR
 3fav52QCeZLTrlFQRoAkq2NKjZtwVZjelF7+XQg1ZoQuh35TXUa5fR7kExwf+t9ACf2/
 OTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kviz/ZAppsOp97wiwa/3qIYHbJwscWwNP5RnfHRpeDo=;
 b=BUpYs26hR+j7hQ3zGzeMigjJqUYqhaUguifXP9NVdlqrrDqS6B/vXTvAZr7hY75WYT
 jaqNLfnr+55ukEF2ZzMatHkzfVAwwHsd7IrQUs9Wjxa6xLkJbCEsbgHjjvGfULKK48ZQ
 VfyLYblKno6aPJHO/4E7/3e2pNJkOuBmKvjC/mAHF9ipmoxohaqj6twUzUXutk5yJ7eW
 XVbV2sog7uTZPScNUNJpQ1v7CBDgKqstkaGl42vFG/4LwezmFG08ui//jXnCGQtiVSN8
 /pBKnpBoZoY6Ufvj47YnBVKKYwKPxUMix0A/lkazUsw4SnmhTvHbH4K7054p8YgaEhEc
 l0hQ==
X-Gm-Message-State: APjAAAU/o0vY7+l2q4gFsgRJfNOXzvHmrHIp0MCw3MyvQ/xQTf4YFa6U
 HG3GNM8kNvTCVHG5J4Fy/Yfbicmzj9OlD3V/Tvk=
X-Google-Smtp-Source: APXvYqwSISyeOH9Uc2VL1oxQaZFMCjd/XksthHTsvNaRR2/rhIYFljgtzS21QekWn9ai9rIdNFhhM5uY12aU9ARtbtI=
X-Received: by 2002:aca:6209:: with SMTP id w9mr460277oib.47.1552940269900;
 Mon, 18 Mar 2019 13:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-9-narmstrong@baylibre.com>
In-Reply-To: <20190318100458.5619-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:17:39 +0100
Message-ID: <CAFBinCCWMpyaJ1WjxGkxAr-ROc6MjWVyzt+LUrcAhjTY99dVKw@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] arm64: dts: meson-g12a-sei510: Add ADC Key and
 BT support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_131751_199692_730607AD 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add support for the :
> - ADC Touch key
> - Bluetooth Module on UART A
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I have no details about this board but the changes look sane, so
(apart from one nit-pick below):
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 43d57e20294a..ebdad5a192f1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -7,6 +7,7 @@
>
>  #include "meson-g12a.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>
>  / {
> @@ -17,6 +18,19 @@
>                 serial0 = &uart_AO;
>         };
>
> +       adc_keys {
in meson-gxm-khadas-vim2.dts we use "adc-keys". Other Allwinner and
Rockchip board also use "adc-keys" instead of "adc_keys".
I prefer if we go with "adc-keys" (we can clean up the two occurrences
of "adc_keys" in arch/arm64/boot/dts/amlogic later)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
