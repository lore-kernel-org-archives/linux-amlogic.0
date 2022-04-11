Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFCCC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOviHlCF5WDnh1bpQ9nMFFMK43++qLUoA+OEWsdXoDM=; b=fZmA9o0lIndhsM
	Ge2MLuHbWi2rPJyCsQbFd2CvAlOmWZS7IsCGn7JLwQbOAe9RdEHf7w3LPzovJVGIPnBjK1aYjHpDB
	RLkOS0LRO/ilpZElvwiWZJcli3dPgI698vbqxSXMepFluDWxVRjCqQQF0v1uAsjD3yEz6G0EC0LE7
	eKh1agl0PLr52P726n0lz6qO/tEKdl85HvvBsme8IgZzuHzZKWKgY42Ie6wW/x+SsQh5LAJ69JsCw
	4D6cpqmtAh+tgaf/7fC4f0oLH+YInguW7FYxAfL/pI2mWjJq91EPlYh7euVV9fa/0xfd2UdLgpCPa
	C3WvSR6Lj37FJBFxApMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduw5-009NTh-Jd; Mon, 11 Apr 2022 14:22:33 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduvu-009NO5-8F
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 14:22:23 +0000
Received: by mail-qt1-x831.google.com with SMTP id z16so269099qtq.6
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prism19-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=v6tXzO9I8TspPgqH1ah6TZclEmyVKH3/QhCMq11pSMw=;
 b=Je821PhFC5P3FHTw1UR+bMOphA0/XDjPnNyeyfYj3pwOkuSjEm57rj3VxHLZiJfoLS
 C0S+4/3dGYUOHO6667EokV9VWEpV2bIh2FdPVh1DbDiQh/HwfsT8ep01Qjbkg/Q5tsU/
 +UQgPL20kN0X8wPE3AWj563Pk//ENptZpHuB42T8oa0MDIT3WEviHzeta5frg7z/heI1
 wUS2dz2AD05v9t1Tb7Nrd8r74BCXV0nnXNsGgctW0hFcXimyY3r3i2tAb+fVS2mOQ/HS
 ooJDYQ5TqXilfvBI2daqx5OuPsSbrsEP+OJI4vM6+RujDljRGr2lsXB9J0a0toOwoDHG
 FYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=v6tXzO9I8TspPgqH1ah6TZclEmyVKH3/QhCMq11pSMw=;
 b=PctMgnFcfx7f/nRtDcX6l2+Ahqr9ocAS6WwojOJQm/p4ntJfZQYu12j4Kic20psRNL
 dORK0USGCEfeqPGdudFicPz9V5c25hW8uzuBBG1jsj3ikbGIGipHf8l4poYU21fb0YO1
 GE3IA5d1mfTW4P5uYcdCelKWp6huEGCK4ImU5W3dtn3k5Zk4ZMVQwDs2jUe/mHJrfJ3K
 4/JONmqNOpS8fMe7tFc8fcq5c5IjHkiy8V3oamX1J2acMSvBoNUrRhkrNDO1Mwiaiede
 H2W4wZazUBX6tMEqmc7sv5CJpjDRLOnS/DzCvLGft4IMZffK4QeWUmDm2rXDF475h4fU
 EVbA==
X-Gm-Message-State: AOAM532Y2T+RGd8CfO37QEgHJBl5VYmRESUHUrMQdv/r7lcIEoXDKz1J
 nhkRAqxqfyTJsoJDaHdgFKSJdQ==
X-Google-Smtp-Source: ABdhPJwWNDqdxtfx45QKb+u63H6yXodmATetW98BqkU68PPc3b1MNtwXg+Mr1W0ydz4G7Ra4PFMwpw==
X-Received: by 2002:ac8:4f12:0:b0:2eb:de47:e30 with SMTP id
 b18-20020ac84f12000000b002ebde470e30mr13928661qte.193.1649686939452; 
 Mon, 11 Apr 2022 07:22:19 -0700 (PDT)
Received: from RADIUM (bras-base-mtrlpq2718w-grc-02-76-67-205-66.dsl.bell.ca.
 [76.67.205.66]) by smtp.gmail.com with ESMTPSA id
 u187-20020a3792c4000000b0067e679cfe5asm19314489qkd.59.2022.04.11.07.22.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:22:18 -0700 (PDT)
From: <ggiraudon@prism19.com>
To: "'Neil Armstrong'" <narmstrong@baylibre.com>,
	<kernel-dev@prism19.com>
Cc: "'Rob Herring'" <robh+dt@kernel.org>,
 "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
 "'Kevin Hilman'" <khilman@baylibre.com>,
 "'Jerome Brunet'" <jbrunet@baylibre.com>,
 "'Martin Blumenstingl'" <martin.blumenstingl@googlemail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220411140401.450-1-ggiraudon@prism19.com>
 <8bde8ee2-ee3f-bba6-66da-28adb3897178@baylibre.com>
In-Reply-To: <8bde8ee2-ee3f-bba6-66da-28adb3897178@baylibre.com>
Subject: RE: [PATCH RESEND] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO
 pin labeling for CON1
Date: Mon, 11 Apr 2022 10:22:17 -0400
Message-ID: <001401d84daf$8d001cc0$a7005640$@prism19.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQFrGI7YFugmhoni/8+f7eNP0fB8BAOIHqkvrajs4iA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_072222_321607_F5EACE51 
X-CRM114-Status: GOOD (  13.98  )
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

Will do. Thanks Neil.

G

-----Original Message-----
From: Neil Armstrong <narmstrong@baylibre.com> 
Sent: April 11, 2022 10:21 AM
To: Guillaume Giraudon <ggiraudon@prism19.com>; kernel-dev@prism19.com
Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Kevin Hilman <khilman@baylibre.com>; Jerome Brunet <jbrunet@baylibre.com>; Martin Blumenstingl <martin.blumenstingl@googlemail.com>; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-amlogic@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1

Hi,

On 11/04/2022 16:04, Guillaume Giraudon wrote:
> The labels for lines 61 through 84 on the periphs-banks were offset by 2.
> Realigned them to match the Banana Pi M5 schematics.
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 
> board dts")
> 
> Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts 
> b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 5751c48620ed..754c3d43ef0b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -448,7 +448,7 @@
>   		"",
>   		/* GPIOA */
>   		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
>   		"CON1-P27", /* GPIOA_14 */
>   		"CON1-P28", /* GPIOA_15 */
>   		/* GPIOX */

While reviewing more closely I figured that in fact the issue comes from the :
		/* BOOT */
		"eMMC_D0", /* BOOT_0 */
		"eMMC_D1", /* BOOT_1 */
		"eMMC_D2", /* BOOT_2 */
		"eMMC_D3", /* BOOT_3 */
		"eMMC_D4", /* BOOT_4 */
		"eMMC_D5", /* BOOT_5 */
		"eMMC_D6", /* BOOT_6 */
		"eMMC_D7", /* BOOT_7 */
		"eMMC_CLK", /* BOOT_8 */
		"",
		"eMMC_CMD", /* BOOT_10 */
		"",
		"eMMC_RST#", /* BOOT_12 */
		"eMMC_DS", /* BOOT_13 */
		/* GPIOC */


it contains 14 entries, but there is 16 BOOT gpio lines.

So instead, send a V2 with 2 entries added in BOOT and leave the GPIOA entries as-is.

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
