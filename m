Return-Path: <SRS0=Wall=TX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315F6C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 16:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A3A21773
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 16:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tF6MHFIU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ggWF1rOF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A3A21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tt5MTV2BQgd920hxr4+L6V6oaGCKRE9FWd/V67VkrM8=; b=tF6MHFIUHith3l
	TzlGxShyp8xyhBoOlf9L2eX1WZfRh6saWHvZNtfyo8bsiEHgUpaavziYfMSEUTy5ZT5doHGoKNz4d
	lnOm5rytFzETYdKXaE4LuReh6oxs4xxCzuGh/E1enBzS9mjIYMX92fQ84XdrUkqSx8SMc6IHR/1ZI
	DLQX/6ZM2+JyLBtovmUHpfgn2jENH4U9r4emcMFLHSv77vPFmiceUhg9EPyjHNR9Pp6wP4Zzed9U5
	FlFEhjPQbBDj6aUFYX1VqwMb9Oa9YRQGxgS41zRklzDiDUU74BMLyku9Z4nlzOswTEjUEqs7yjsTH
	UU/9L4g3GDRCqqkmmlLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTqLz-0001h3-Gv; Thu, 23 May 2019 16:14:03 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTqLv-0001dF-ML
 for linux-amlogic@lists.infradead.org; Thu, 23 May 2019 16:14:01 +0000
Received: by mail-pg1-x543.google.com with SMTP id t1so3389533pgc.2
 for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2019 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aRONL6lUSP8ySgexr3N6TwqdyB5aYrx+k7X7nWH0u7g=;
 b=ggWF1rOFU/L+bItrGYOrJMFIMeJBMy1WrRcSsr/WIBe/SB8eNQTLknryHkreR5tByW
 lsdj3s7N2iF3ZDqzrgDKd43KkU+Pp7q9FmJ1bkqWQFr8iPV8+Yz+spKDbDMSLJFvjANm
 clswCgsoDvvQhg0gmadmjdbo1953N4JsWXfxRagJfIxprFe+KcKANt6T8950sS7EYiZB
 0KN8NFVK5S8mFMZJogjBrFskvYWQGNqp3MpQS98Ba1ppmifq1k3Vu0iGVIUan9sHb2fv
 DeS79O4YsObFSplomEdYGoLwhlj0RUtaf3oCSV81fgKrm2gTW8VqIGBn6z+BWYOlPneP
 7YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aRONL6lUSP8ySgexr3N6TwqdyB5aYrx+k7X7nWH0u7g=;
 b=IuOmNZqQP5fqjai3Y/ggt8LT4l2u5REvAlAgIoGF57yXAbW0jmX1+Jqpfprv/KKLHC
 S/MqfKwAzIp+szPdyty0CaDmCeoWMI7vIiUV8T47fZKcCbzeFHJ142ExUU3vUUZB+6Vu
 Pgp+szNaN6WijWgHM9KwjtVvVBxfzIAoW3M+2rgRe+g+voq/w2ARUsafu3wz8axZoQzf
 rEKKv67UZUuAV60XgYDIpkyVRWILh28Vc4QjbbR3dRHG3MhpMW1lwMv+155mUERlQn94
 LhfBFAUKdpLAahA6o0FZAIGaBo1LRkIPg6ReI0fHRXVWyAIcdo2SvEzEdRFPLB8lQC/0
 i9Xw==
X-Gm-Message-State: APjAAAV7hUBrm+VOYrGhYslKgDYTCOHwx3+K8ReBkaZxen2rBhJ+zl88
 QryQwDwDyVFhKQeA+CpMHy6++g==
X-Google-Smtp-Source: APXvYqwfbn9vU6s+/np/lHKs6WpigAe5sHs/aZok+lBA7/xt8Mml6cW1UHNizjxuvC6Fg0TkrO0QyQ==
X-Received: by 2002:a63:5107:: with SMTP id f7mr11171884pgb.198.1558628039057; 
 Thu, 23 May 2019 09:13:59 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id c5sm30795748pgh.86.2019.05.23.09.13.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 09:13:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: g12a: Add hwrng node
In-Reply-To: <f4a1f115-d886-ddf3-c4fc-ea995f10a434@baylibre.com>
References: <20190520134817.25435-1-narmstrong@baylibre.com>
 <20190520134817.25435-4-narmstrong@baylibre.com>
 <CAFBinCD6wJnYd3-E=kS6WCZLFebV9JYk-GybBxoMA8qQqGfSHw@mail.gmail.com>
 <f4a1f115-d886-ddf3-c4fc-ea995f10a434@baylibre.com>
Date: Thu, 23 May 2019 09:13:57 -0700
Message-ID: <7hblzt408q.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_091359_867842_4CBF075D 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 20/05/2019 19:45, Martin Blumenstingl wrote:
>> Hi Neil,
>> 
>> On Mon, May 20, 2019 at 3:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>> The Amlogic G12A has the hwrng module in an unknown "EFUSE" bus.
>>>
>>> The hwrng is not enabled on the vendor G12A DTs, but is enabled on
>>> next generation SM1 SoC family sharing the exact same memory mapping.
>>>
>>> Let's add the "EFUSE" bus and the hwrng node.
>>>
>>> This hwrng has been checked with the rng-tools rngtest FIPS tool :
>>> rngtest: starting FIPS tests...
>>> rngtest: bits received from input: 1630240032
>>> rngtest: FIPS 140-2 successes: 81436
>>> rngtest: FIPS 140-2 failures: 76
>>> rngtest: FIPS 140-2(2001-10-10) Monobit: 10
>>> rngtest: FIPS 140-2(2001-10-10) Poker: 6
>>> rngtest: FIPS 140-2(2001-10-10) Runs: 26
>>> rngtest: FIPS 140-2(2001-10-10) Long run: 34
>>> rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
>>> rngtest: input channel speed: (min=3.784; avg=5687.521; max=19073.486)Mibits/s
>>> rngtest: FIPS tests speed: (min=47.684; avg=52.348; max=52.835)Mibits/s
>>> rngtest: Program run time: 30000987 microseconds
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>>> index 8fcdd12f684a..19ef6a467d63 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>>> @@ -197,6 +197,19 @@
>>>                                 };
>>>                         };
>>>
>>> +                       apb_efuse: bus@30000 {
>>> +                               compatible = "simple-bus";
>>> +                               reg = <0x0 0x30000 0x0 0x1000>;
>> the public S922X datasheet lists the range as FF630000 - FF631FFF
>> that translates to a size of 0x2000, which the vendor kernel
>> (kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi from
>> buildroot-openlinux-A113-201901) seems to use as well:
>>   io_efuse_base{
>>     reg = <0x0 0xff630000 0x0 0x2000>;
>>   };
>> 
>> where did you take the size from?
>
> Another typo, it's 0x2000.
>
>> 
>>> +                               #address-cells = <2>;
>>> +                               #size-cells = <2>;
>>> +                               ranges = <0x0 0x0 0x0 0x30000 0x0 0x1000>;
>> (see reg property above)
>> 
>>> +
>>> +                               hwrng: rng {
>> this should be rng@218
>
> Exact.
>

Will wait for v2 on this one,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
