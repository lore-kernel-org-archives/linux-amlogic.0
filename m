Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D111D6D23B
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2024 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTe3wcYrzYyoVuCyHSOjxwZy1V4beRjIlMr9Ln8ZGYE=; b=GLCNdSMmBI8gwa
	6NC/DkQ7QICJDtjdUUdGdCYdMxxdGHPBGKcbcWhU56VETv3QzT/1LXjGaKQ4YttcWvl/UN3w77UN1
	iXARiXICezsJb2M1//Oo7DbWD3nQS4hfvgSO9aWtER9ifFrfk2sVZ8oqaUql6BPt8XMLiswVHndfD
	DzNNlYs6pfBI4lKz79sWH2dwNQijMTLHkXxSYxmDSjb90b1i9TojzF6239T2PYPjv5BfI6oRI70wu
	+HKwTLbUbv4C9LMrW3xA29lmbxSr8J5zGdwthHrtyx7IU0Kcu1CsgWKzfWqECi7MqdQD2ZGuiDzVV
	Ju+/agsx7IwwcUYgGlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGP6m-0000000E5BJ-0bTm;
	Wed, 27 Nov 2024 20:58:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGP5m-0000000E53p-0DZU
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Nov 2024 20:57:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso666045e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Nov 2024 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732741016; x=1733345816; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7U9hOswjkTlIu0eHpVW8cvTyEAZU1a4KzVLqKR0PK0E=;
        b=EzCD5nd3ED3IGmPAfVBzdWwhG/lT1jAQoQZHFnOJIv6205deMJZlIHGuArqL/6ot4j
         Tgpv3iOkMoXwfA0dIjr3qd/ZsKCEigvSGZEkKOq3VCd4TvW1hpi8XPNMHt8bRTUjIEw2
         utQ5Gb+FEbnc1Q6dLYLdw3IGW5/Lrv9F8Vecv4ye3E916No2BAk6iXNJVNwXnT2hjAGc
         PsjTuNcHek5tsLoRnfFxuOatRSImsSLak22zWX0N5Hq8dwPsqAzxYubUzjE2QjTNceGx
         J97v+IXkmETABzDFBG2/sPEAyjKYhKIxW/3jbgmMSZ8fGIws17Y+0GMJx3ciHCQW2sUU
         u9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732741016; x=1733345816;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U9hOswjkTlIu0eHpVW8cvTyEAZU1a4KzVLqKR0PK0E=;
        b=fvtBkTp4O0ItspM7KX5b3bYEVevW7iaCpH+NeRGSRakUTKYubC7DlAU/jSoxJsr09v
         YLt6hKomp7JoUmiCXtpl2QvevBwnGx2kll8KRXCOsVIJMYK520SiherWEKxFcSi62uSj
         8thcT1F9clJWLKabSDpqL0Ovjrg0Kmi/qNPFA50QNvblQu1jLzvoe73Qpnlfh/A1onqm
         eE8vtnz3CW9yciwL/JsgE+klpvWLXs/WKMvPsd4awVOU0/lHieG9kFlFZX4HraUABwu4
         n0GQZZ4uMc2SioNI3tZ6LmAFdseAgCMAxecBPdtay+vTqtthQ9yCuEtppsepada4Hpas
         r8bA==
X-Forwarded-Encrypted: i=1; AJvYcCV164Hgx8Bb/qEKUybJKyVXyJ1R4hd5F5jgw7+RpH4pdtm6YKnlxyQjEbMOBpx+1kReyI/zIDIxBYkrMEUy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvwb0J2NVRgWmatweIqZPRlI3fAnECY7iBCuPqztl+N+oFMJtj
	XUybVnthaVocUAkizl5psiInCi8PAOES/ZfhqOZbjnzgdUkz1V7ux7n7T1jP4MY=
X-Gm-Gg: ASbGncvuG+ywwA1MCBQhN3muzPcGR7yxka/5Ekt4Ebw8JGHu6wiJklNJl9Iqe8ojsgn
	5pDm0ohftNEW/z1QnOddk25nW0dRAFIcT3EOHG9rOMEs9DYdXnUnev5c5Fmn+Kok4dvuDg0SV3m
	RwrNZC0Oba4qopuzgqJ6FBZMv2GnFST9zFdO/ZPtJliK2wSsiSyFvujs0VdZBNL3jEJSfiHgGyK
	+5muRA68CPVBfkUYB0E9NUkXm8oEi6DDU2rGK2PZSlBdVsjsw==
X-Google-Smtp-Source: AGHT+IF9mEC2PpHHSEE4f/UbbHmSaSloRZU6SDyajUiQ4Pk9pvlFm1bVlT9XTXNm/2ABjv1LiTOqoQ==
X-Received: by 2002:a05:600c:4e8a:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-434a9dc3e80mr49302555e9.10.1732741016193;
        Wed, 27 Nov 2024 12:56:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cc06:8990:4fb8:28e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc91sm493395e9.9.2024.11.27.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:56:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 27 Nov 2024 20:30:07 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 27 Nov 2024 21:56:54 +0100
Message-ID: <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_125658_089463_60770B3F 
X-CRM114-Status: GOOD (  25.21  )
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

On Wed 27 Nov 2024 at 20:30, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Nov 27, 2024, at 19:47, Jerome Brunet wrote:
>> Depending on RESET_MESON_AUX result in axg-audio support being turned
>> off by default for the users of arm64 defconfig, which is kind of a
>> regression for them.
>>
>> RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
>> COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
>> necessary for every axg audio devices. Those are now deferring.
>>
>> Select RESET_MESON_AUX rather than just depending on it.
>> With this, the audio subsystem of the affected platform should probe
>> correctly again
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency 
>> on RESET_MESON_AUX")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
>
> febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 
>> 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>>  	select COMMON_CLK_MESON_SCLK_DIV
>>  	select COMMON_CLK_MESON_CLKC_UTILS
>>  	select REGMAP_MMIO
>> -	depends on RESET_MESON_AUX
>> +	select RESET_MESON_AUX
>>  	help
>>  	  Support for the audio clock controller on AmLogic A113D devices,
>>  	  aka axg, Say Y if you want audio subsystem to work.
>
> You should generally not 'select' a symbol from another
> subsystem, as this risks introducing dependency loops,
> and missing dependencies.

I do understand that one needs to be careful with that sort of things
but I don't think this is happening here.

>
> It looks like RESET_MESON_AUX is a user-visible symbol,
> so you can simply ask users to turn it on, and add it to
> the defconfig.

That would work yes but It's really something a user should not be
concerned with. I can follow-up with another change to remove the user
visibilty of RESET_MESON_AUX. It is always going to be something
requested by another driver.

>
> I also see some silliness going on in the
> include/soc/amlogic/reset-meson-aux.h, which has a
> non-working 'static inline' definition of the exported
> function. Before my fix, that would have caused the
> problem auf a non-working audio driver.

If by 'silliness' you mean there is symbol definition for when
RESET_MESON_AUX is disabled, indeed I guess that could go away.

Thanks for pointing it out.

>
>       Arnd

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
