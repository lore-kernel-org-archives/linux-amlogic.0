Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08478C32751
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EC4205C9
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Olli8Wza";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FChwJRHW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EC4205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfA7FzHyQeE81Z6Kp0fGZfq4t6ReEwRYvWR9360Arps=; b=Olli8Wza1mA0HP
	2Hm0AqA1ifmJvIGZA7kpOMzaxTyiIVvONyOyoBbLORWZJKhDyzE+jvqraVyRC1R9pvpaQWcc/6Mal
	abJAPAQWq2fDeRGRs0S/hYBjmQO6MY1AWLnlugNgRmC6S2WseDKSi/gEtbCvkbHeV5fcCpa+mngyc
	k9cXiSxaoZFdt94VfnG0pu7zDZ8CAfnnGlsupDWGuFpNgkxWp100FIK3srMgpxsXjla+I4M+0nEGJ
	VJPJQinKWNB3NPP2n+Feh0UkpzdhnY1fhkQjmZnp+wOP/iOOHRjNh1BYI7jX7zvsLlx8pc76LD4rl
	1a4IhNKwMG3/ALZ1YTPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hucQ7-0008Jy-5L; Mon, 05 Aug 2019 12:48:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hucPt-00088O-CL
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:48:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so84411105wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oCcvAOHAqO79xgLqFQJG5nX7dFejuUKhdOvFqVtwuaQ=;
 b=FChwJRHWW3dzV7lekARV8knI19kr3MzoJn8IqdhP2RrgaIya3gGRxFzMMdCQx+/4Et
 SfeIjcJm4iL1rCJoTTV1Gm7sE9jr2PGwx3XIrr0p4kOTNDGLVeOJmNJg+OolThWDII41
 2UjZew70luwFIku1SOAptaZ5FVp3z7R/XqZ+6Qdxt7lK6EIot0c/SYpHfPtXpU08dJLe
 d42SuTPE9omXgun2WNbF6OAoPCq0SYKORw2F+ad8su6uj+VnerLYfGcGnt3fqrPWD4Yl
 MBZWeoB8EK/5OcFfRKZ2m4h35w6+F+5kXUd7mKHRVgABr4BH0rgCCjFtDSldjpbsTRwt
 mvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oCcvAOHAqO79xgLqFQJG5nX7dFejuUKhdOvFqVtwuaQ=;
 b=ubS5qv5OnZAnllkiwlJjG2rjSJcBoEXnzqLoSK4GRjL1lw6qH4wowObxIKGL+cFhfD
 aAo+Naab7vaWXxrxppoq8kn4j+JaQXebKB8QvZEwxuuIvTLmOZGtdOgGIVjrVDzRozy1
 OkGnh+XfEaw/FwWqktzMM38N+Yp2zW3LffJpBR91DCyXSTmBhiWXDVILo1H6Qpck4SOs
 UV36hfDTzoL4Nh4nlmk7F02UEjA8ipgNiRAzHWA/Y2kQUEO0euvTXApedvJUArURcecU
 ymjZaCC4+5MqR7MRN/eEV3ek9/lc8SLkWYlpprfXxVkzkEQbAb4Wv0ZNQcz96y8Jt7vw
 CrJQ==
X-Gm-Message-State: APjAAAUKFVund1Jm2QsxMndmEzKqbqSQs1I+6C5/L1hbGeEDMBhpSckS
 naEYdMsZ63ynrlTyNj+PCnV8mA==
X-Google-Smtp-Source: APXvYqwBfUtY4HHqJanim3CfED7337YIudrlcue/iSf8ew+PnhRdLMvdK0/Bpmpr1FNIz44UJYNDZg==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr15344303wrv.146.1565009324012; 
 Mon, 05 Aug 2019 05:48:44 -0700 (PDT)
Received: from [10.1.4.98] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r5sm91425958wmh.35.2019.08.05.05.48.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 05:48:43 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-5-glaroque@baylibre.com>
 <CAFBinCD-DUEjPgfUEJmHpPjw1ShZy7nemaFBKANmM5M42XBG4Q@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <805dc9fd-1c1f-a23a-27a7-d91908a95a13@baylibre.com>
Date: Mon, 5 Aug 2019 14:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCD-DUEjPgfUEJmHpPjw1ShZy7nemaFBKANmM5M42XBG4Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_054845_427361_BEBF57DB 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,


On 8/3/19 8:29 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add minimal thermal zone for DDR and CPU sensor
> so high DDR (controller?) temperatures will throttle Mali and high PLL
> temperatures will throttle the CPU?
> to get things started I'm fine with this, but I think it should be
> mentioned here

i will add in commit description

>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 56 +++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> index 979449968a5f..2c16a2cba0a3 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>
>>  / {
>>         compatible = "seirobotics,sei510", "amlogic,g12a";
>> @@ -33,6 +34,53 @@
>>                 ethernet0 = &ethmac;
>>         };
>>
>> +       thermal-zones {
>> +               cpu-thermal {
>> +                       polling-delay = <1000>;
>> +                       polling-delay-passive = <100>;
>> +                       thermal-sensors = <&cpu_temp>;
>> +
>> +                       trips {
>> +                               cpu_critical: cpu-critical {
>> +                                       temperature = <110000>; /* millicelsius */
>> +                                       hysteresis = <2000>; /* millicelsius */
>> +                                       type = "critical";
>> +                               };
>> +                       };
>> +
>> +                       cooling-maps {
>> +                               map {
>> +                                       trip = <&cpu_critical>;
>> +                                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               ddr-thermal {
>> +                       polling-delay = <1000>;
>> +                       polling-delay-passive = <100>;
>> +                       thermal-sensors = <&ddr_temp>;
>> +
>> +                       trips {
>> +                               ddr_critical: ddr-critical {
>> +                                       temperature = <110000>; /* millicelsius */
>> +                                       hysteresis = <2000>; /* millicelsius */
>> +                                       type = "critical";
>> +                               };
>> +                       };
>> +
>> +                       cooling-maps {
>> +                               map {
>> +                                       trip = <&ddr_critical>;
>> +                                       cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>>         mono_dac: audio-codec-0 {
>>                 compatible = "maxim,max98357a";
>>                 #sound-dai-cells = <0>;
>> @@ -321,6 +369,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu1 {
>> @@ -328,6 +377,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu2 {
>> @@ -335,6 +385,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu3 {
>> @@ -342,6 +393,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cvbs_vdac_port {
>> @@ -368,6 +420,10 @@
>>         status = "okay";
>>  };
>>
>> +&mali {
>> +       #cooling-cells = <2>;
>> +};
> is there something device-specific in this patch? I'm wondering
> whether we can move all of this go g12a.dtsi to simplify maintenance
> in the future

this is depending of each board. actually it's same on all

but if a new one have a fan this value should be different or not.


>
>
> Martin


thanks,

Guillaume


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
