Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1E3C31E44
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E017420872
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D9B2pSbf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hE6Vyz0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E017420872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKFuO+k/h6EHWpjk+2z7W8UB1tzCB32npZykw10Qj9E=; b=D9B2pSbfzvEr6A
	3tZ363rnodN2YPu7+X/HRyZ7zvteu76S6b6yNADK3cXKK3q/O7NDpgi9g3hAEzD4Obi0nVQ0g4sJv
	nJMF3GbS6EP5tzoVxvhVMwWw7zRv08eEfwNMIC7xgnu9VHlgtiPdfhvw+nxdCIgbKYLhfOYjX0xAu
	lzF35LwiNsxpnmN4/Qs5ODmQUhZG8v9V9rzxTb/0CWxQM4cESJep2uievVKHBaRdDN7bwz3E7zWAj
	hxoMUl3WPpvbcIo/nKJmE8POtQl5U93PJyO+7HtkI3PLhVhUO22KKV27v8Pl4vQ9CTXmI0A7upMV5
	AweBR82cQHmIhW4bzyog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hapvl-0002sW-SB; Tue, 11 Jun 2019 23:11:53 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hapvj-0002ru-56
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 23:11:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id 20so7802439pgr.4
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=h/Ahv7eA8x88jF5eI8N93bk8UpEOMw7Fv6vtgVdZMQg=;
 b=hE6Vyz0icmixiDqQLngn/E8+TvZ1wjLSk7giDvFj7j3qnMfAKhR25SJ2sLUj6PkuY6
 3i5S8+SyWIZ3lA0hi0A3YiIjC5bwM103gE3IQ1VP110ZS42zOz1U2OtAB7I1Kyy62CLm
 cN9hQeF/IXbbUQm10HA7QDTkNuGVs3LWsbHwDBlxTVWBKAn2h3msNg3iul9cgruu6T8Q
 XjHR9Zzk/dy4408sqlCpf+W3u8lbUTwKVwQlisgHlUolBZYu+0RCfMLNhdKwALob8rk6
 eBT23c6PXNZB5IUuzOu8hRSf75PCBpzqfOHewzKSIfX07mVV3yy71uKEIdOplbm8P8q1
 dLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h/Ahv7eA8x88jF5eI8N93bk8UpEOMw7Fv6vtgVdZMQg=;
 b=NZS7NC5iEnuGi3/dnjbvSxGQnOyWIp9DlbSSmfyNMvATOlode4X0hBNKNbhWr1IugY
 7n2JX1XlFxOzI+7N5VOffha5/I4/RjoOVbNmF39Wiq9VNAufsUdDaqmiITBVQo5Jbdzn
 811XgkTuplZAqn9bkGot3YMww3qXUWqOA8U8oMTmnRdYvQXQV2cRuK0fFy5eVbsOJ9Jk
 71QwaCxnFYdck/XpJYjW/c8ppYTW97Ayt+B1SZQbG8whKBcFzBXW3aMuir7i6jgz9Fme
 yxcOwt13x4o8o8Jzg/X1n5j8u6GVGmnZ1gmq6qT60k3ApYIOChcO0hFg6x6MQHnlc5Yk
 2AtA==
X-Gm-Message-State: APjAAAV2jcUW2SykXyuUQxou+fb0PLfY0WqWXBHjqC03mbg5IZZ4p7if
 Byc8BG6QNxUtNudzMGaHoau7CLgoyug=
X-Google-Smtp-Source: APXvYqxXNQ1B9XI00ShKlHEtW+7hu6hXrVKCEvYn1i4dOvkOk58H877p/DyomEf5lKZm7fonh6oMCA==
X-Received: by 2002:a63:4419:: with SMTP id r25mr23125932pga.247.1560294709777; 
 Tue, 11 Jun 2019 16:11:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id f17sm15521820pgv.16.2019.06.11.16.11.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 16:11:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: meson: g12a: add the GPIO interrupt
 controller
In-Reply-To: <98394b36-301c-986c-cf53-f88aaa13f5bd@baylibre.com>
References: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
 <20190608190411.14018-4-martin.blumenstingl@googlemail.com>
 <98394b36-301c-986c-cf53-f88aaa13f5bd@baylibre.com>
Date: Tue, 11 Jun 2019 16:11:48 -0700
Message-ID: <7hef3z4szv.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_161151_206298_EF3C3F6C 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 08/06/2019 21:04, Martin Blumenstingl wrote:
>> GPIO interrupts are used for the external Ethernet RGMII PHY interrupt
>> line.
>> Add the GPIO interrupt controller so we can describe that connection in
>> the dts files.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> index 6aec4cf87350..50fcdb3e55bb 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> @@ -2222,6 +2222,15 @@
>>  				#reset-cells = <1>;
>>  			};
>>  
>> +			gpio_intc: interrupt-controller@f080 {
>> +				compatible = "amlogic,meson-g12a-gpio-intc",
>> +					     "amlogic,meson-gpio-intc";
>> +				reg = <0x0 0xf080 0x0 0x10>;
>> +				interrupt-controller;
>> +				#interrupt-cells = <2>;
>> +				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
>> +			};
>> +
>>  			pwm_ef: pwm@19000 {
>>  				compatible = "amlogic,meson-g12a-ee-pwm";
>>  				reg = <0x0 0x19000 0x0 0x20>;
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queuing for v5.3,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
