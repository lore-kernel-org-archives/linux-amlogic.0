Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D6BC4321A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F0C205C9
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 18:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUByDZ1h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="urIYMQLw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F0C205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZD/xaFifUe8a9da9c4p2PCXNrSvPz0iezPpPhiU6ws=; b=VUByDZ1hmd+wQ4
	1/KiC2iJc/TX+gUGqyWTIdEE8Z/KcUmplHTXqezzgos+SvkwVeY6fYqRqf1FTDRNmtly1CyQscqz0
	BcMO/96rY8wDY8My/Reu8zGGFXfNDuURtPKQKGsc10KPtqox073DpIPBxAd6iyWoxfmvXVw8YVSoC
	JuT0xt3qbFUlOJMZM8AnvbhuS20QSMbJIDLNwpL7aiUB0NvYX/hb7pDJn/q69CyRD1lfFpu3doti0
	rQsFIkYrILRi6zpXoIiehnbmhldKf2lt92xn6Q9vfzj6FXb/q0VoCTls/E+TS6m6zwvq+otPvfNib
	mldb5w9ms50PpTR47qEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgvId-00056O-OQ; Fri, 28 Jun 2019 18:08:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgvIO-0004vf-GS
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 18:08:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id e5so3642329pls.13
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=G6tQj9JGt5eWV6Usl/0DEM4bXR28Xsa6XudzWBZRees=;
 b=urIYMQLw7SgSurMotfZfSVmJc67vOh9HFHgSKGv5VupzUseVTLEXmT4xdsJnI7M+T9
 OYncOZk2MSaN8ehZkyEwnW0GdRndb+7sm1ngQeAfY47Axmo6TSzaIf/nq+y0zynVLrLy
 d/hK3wpwurXP4dybCFCwbMvYbG6iyoDoOem9/C+obwD/e34nssT8ZZ3OA7s+Zs3MHQFZ
 zNKOsouJEhQWT5wUUBmyfWd39S7QVEZR1e3BRaQbNsI8/cIRgBUyKA9EmGXPaUwwGfB3
 sk9Rl/U+Ol/TSHTDqiU7H9KoeYDOoMZc1vsZ+4sdoItr/3X0owjcXhKSfZgcTnEf66qY
 hhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=G6tQj9JGt5eWV6Usl/0DEM4bXR28Xsa6XudzWBZRees=;
 b=DwvJwhcZZyA6KN5rVVOXktbW6yifSx6Us0syjpuvip+uRgJIpiuMbp4NTviJr5gRBy
 iZJhoZTQ+8JcdLMrBrmf2PT5gcRnc+lAr+X7GSmb9P6flfN29MHxVAvrKp9wQN/erO1r
 4oxx12x6v84eJEglhHcQ86/zoMy8rUTbc+BwD7G6egWiSAtGqBsfkKrkyv756xd6qfEU
 0/xKDPGE++VVeMd1KIOHS9C9HRjnswdJGy2ZAXgmxnpYjw7wTiyEGed/hEiNBFnCoFQ1
 gg2WME7ruP/DhHnUNu/9Izy8RDvFAJKD9sFxh8G8oyYlZe10WKbGzdzUAlYz3EOtDq6T
 aN4w==
X-Gm-Message-State: APjAAAX/GM9j8rZ+7knL/+uIG5fCUFzIAalkE2jkoonorL7REjMcaI8H
 YgU9doU0Z1bg7i0UFKnZkpZvzQ==
X-Google-Smtp-Source: APXvYqwgMrO9KnbOghS1eRTPHzN/QExULWcHo+Axo7AlQFrSWdgK3st/zL/VsoC8WPYxv1TleZVDSg==
X-Received: by 2002:a17:902:a414:: with SMTP id
 p20mr12470690plq.187.1561745303607; 
 Fri, 28 Jun 2019 11:08:23 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 196sm4065985pfy.167.2019.06.28.11.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 11:08:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC/RFT v2 12/14] arm64: dts: meson-g12a: enable DVFS on G12A
 boards
In-Reply-To: <20190626090632.7540-13-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
 <20190626090632.7540-13-narmstrong@baylibre.com>
Date: Fri, 28 Jun 2019 11:08:22 -0700
Message-ID: <7himspr3ah.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_110824_555036_E00BF184 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Enable DVFS for the U200, SEI520 and X96-Max Amlogic G12A based board
> by setting the clock, OPP and supply for each CPU cores.
>
> The CPU cluster power supply can achieve 0.73V to 1.01V using a PWM
> output clocked at 800KHz with an inverse duty-cycle.
>
> DVFS has been tested by running the arm64 cpuburn at [1] and cycling
> between all the possible cpufreq translations and checking the final
> frequency using the clock-measurer, script at [2].
>
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

[...]

> @@ -297,6 +316,34 @@
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};

Just curious where this max clock transtion (clock-latency) value came
from.  Were you able to measure that somehow?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
