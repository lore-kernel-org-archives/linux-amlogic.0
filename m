Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04E0C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 23:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34D7205C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 23:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ewih6ms5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SRJayQ+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34D7205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4AlNUvZ1T5RN8nUpgp/2JafXdpJHu7Qf8fjTEZTrVQ=; b=Ewih6ms577SVnK
	g3nIxxsUe6uEtG9OT/ish0yn4uJpkoDZuAGRkrVgbysdTok2jwGebcbpnuM76HDookz0qP+8PVEeF
	hbkZJ+qhKjwZFQDnIeINJEmOmudKif+9AEKR9V9aVIdE/D+7zIxRC9/YmAmYhZhdtRBxtVpLUz6Q2
	5AtxO++KT323lEhBOOHLyimF/FzQ2t7GmdRMQeW7CssV0sE0S/iMlWukLh7eppFrq5id4C9bOZPm1
	mVMjU1h2wFfgXddnCXA9+p7JSJEO+0iHkLntjfMGjEYG7no6gj383ros1GFmyHyyPk2OyES/ZjYE7
	Sq79aCilKz5xTzespu4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0a3J-0002mT-Hx; Wed, 21 Aug 2019 23:30:05 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0a3B-0002Go-37
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 23:29:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id d1so2278767pgp.4
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 16:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Ce79tt1EdjWmHjsbOeVM0d2spReWneK1/ievz/5bOQ0=;
 b=SRJayQ+vvdMXVmtPpjEFclS7e2GZ1M9sa9zF2sf57HNJmzZnN2WRqclWakGVnPGLN7
 7GYwJ+WTjKHLab1MxehDKQSHs+KMnpzraeh5+CSSW+LhI1avIb7Evi76Syf5qZfJa6Sw
 L6gZ6SV1gh2iCsdxfxWvzc6oAxu9ug2lsdcMT168c60XJZwz5hCaB9UieV0oaSvD+0rP
 LU75UaFgyt7GyVC9h8mhJ+2nSDu6Ef8kDqTDpWLmyYk9Y25SXLi9hvNtUGbnIj7WjVUP
 9sqsHIqaBqGrMWL2EboclseGxi6y8M0YQXDC/jjG1iOUy+AdFQHbGLEdbYTFlpWScRNY
 2bSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Ce79tt1EdjWmHjsbOeVM0d2spReWneK1/ievz/5bOQ0=;
 b=f4Ry52x76Fr4cp/6fUcrixlPEv3RG+ZzOctnojwhoQy2+EotUMRz5H+jr+Rd2RtM9F
 fjjb7uGsk2tjwRCdVg4XiW6RkTsSKQKfqZkd4Zqg5XSx1S1j1YXTMkfLQTsbB7X/ettk
 KFykaFf00K9y6hueQhx8E/TWUsW2T6V4mSOfzLQYCR1ulv7T1sES+7iKgHq1pn9otvdx
 VlQOLYUQ2l+E9BAc6s5gbd15rbcgWIpNabzk0b/hFk2uAPVEvMcI0MKIvLlPK2Hz4QFk
 k+peVQ/jDg4ZuuNkOhWPjexQmgNWGND/U3VdwTnOaN4fgLxGV77t5xP0UgVaNXjn+AUk
 hQkQ==
X-Gm-Message-State: APjAAAU9KsTBYPnl+65JJE9rsaeh665PzHg09dLgcME3lpD9ZjRjBwUj
 8fL9Xojk1Cn5sAMrRM9uGdkFhA==
X-Google-Smtp-Source: APXvYqzkdm/ufbDMjz6NTJ8+3pzRUrft6UEGKjkNpjv+C03jHIb4CVd+utTFJWjOWcDCpwBAbC0G3Q==
X-Received: by 2002:a17:90a:d082:: with SMTP id
 k2mr2464206pju.85.1566430193696; 
 Wed, 21 Aug 2019 16:29:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z19sm20864303pgv.35.2019.08.21.16.29.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 16:29:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, rui.zhang@intel.com,
 edubezval@gmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v4 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
In-Reply-To: <20190821222421.30242-5-glaroque@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com>
 <20190821222421.30242-5-glaroque@baylibre.com>
Date: Wed, 21 Aug 2019 16:29:52 -0700
Message-ID: <7hsgpu5c7j.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_162957_132558_A4BC95A1 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index c9fa23a56562..35d2ebbd6d4e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	compatible = "seirobotics,sei510", "amlogic,g12a";
> @@ -33,6 +34,67 @@
>  		ethernet0 = &ethmac;
>  	};
>  
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&cpu_temp>;
> +
> +			trips {
> +				cpu_hot: cpu-hot {
> +					temperature = <85000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +
> +				cpu_critical: cpu-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_hot>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&cpu_critical>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		ddr-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&ddr_temp>;
> +
> +			trips {
> +				ddr_critical: ddr-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map {
> +					trip = <&ddr_critical>;
> +					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +
>  	mono_dac: audio-codec-0 {
>  		compatible = "maxim,max98357a";
>  		#sound-dai-cells = <0>;
> @@ -321,6 +383,7 @@
>  	operating-points-v2 = <&cpu_opp_table>;
>  	clocks = <&clkc CLKID_CPU_CLK>;
>  	clock-latency = <50000>;
> +	#cooling-cells = <2>;
>  };
>  
>  &cpu1 {
> @@ -328,6 +391,7 @@
>  	operating-points-v2 = <&cpu_opp_table>;
>  	clocks = <&clkc CLKID_CPU_CLK>;
>  	clock-latency = <50000>;
> +	#cooling-cells = <2>;
>  };
>  
>  &cpu2 {
> @@ -335,6 +399,7 @@
>  	operating-points-v2 = <&cpu_opp_table>;
>  	clocks = <&clkc CLKID_CPU_CLK>;
>  	clock-latency = <50000>;
> +	#cooling-cells = <2>;
>  };
>  
>  &cpu3 {
> @@ -342,6 +407,7 @@
>  	operating-points-v2 = <&cpu_opp_table>;
>  	clocks = <&clkc CLKID_CPU_CLK>;
>  	clock-latency = <50000>;
> +	#cooling-cells = <2>;
>  };
>  
>  &cvbs_vdac_port {
> @@ -368,6 +434,10 @@
>  	status = "okay";
>  };
>  
> +&mali {
> +	#cooling-cells = <2>;
> +};
> +

Is there a reason these #cooling-cells properties belong in the SoC
.dtsi and not the board .dts.  Seems like you'll have to repeat this in
every board .dts which doesn't seem necessary.

Same comment for patch 5/6

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
