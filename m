Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF8C30653
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1NBNuoko8qCkhB+QOBuTg3d0PZsBvMtwX2JwG137V8=; b=fbpLKF6/QKmAmd
	/8hyYB2oWRyYB7QnlSkASd7ZC1NgLkUrNTkfG0iEa38HyTl/cINJ9vFqI8wwACloiA8IldUGVo831
	nCt7YWUbETN7BgSLKcuughxbV0dfPzCmMgISx507Od3wOHB9+77dyjJrtYqbK5tDp3GKsS6Uy9LxM
	KUVhV0DLAy7D6+QIPoQYv+0jPQj7QH/BffRo52f77f/CcS6R0F1lCxaZIplGKOcJrfGDK89dS3dHu
	Zz/mSE53Fhde0nESyiATWHWIzUmlEMLgUtjvjzqU6xEGTgl3aGeiAUF0jXYGShvbSSx/GChN15xJF
	7rFByzaSKeXtrIeYKRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2rW-00000002JwX-0k2J;
	Tue, 25 Jun 2024 09:53:18 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2rS-00000002JvH-1ek6
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 09:53:16 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso65124911fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719309192; x=1719913992; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqUVVAOM1tDnUN3dY9Htp5pIdnqRxsviToP8WQQNb8=;
        b=z4lKKn3fEX2lsFYF2Su96div1e3W9KaeLlZCdrEz+jVi9H7YF2uInMXbTim7M2wuaM
         Zr0Sp1Q6brd0ZdwEMcIhLs4iSoN8/7c7e16dh8rrpCUYSWwTscMp8XNGwYnuxTairwkN
         FwxYx0TLR2SuVpoLKer5fRyjoTSmO4PBj1SiUzIvNyBy46uRN1UOFTzWoziShZnThWUJ
         rzfEn7VgClEmVCQjf6Sftfe+PuJKWbkWNK9WOEq3MnEeP6xO5XJfGJdKs0AtEWVu6nEa
         cUS223ffRGWQjgO/qGOKzocUuxKaFo2czgzR4w1ncDb3kqufTsgBniWfGlnzlViy+A5v
         fvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309192; x=1719913992;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqUVVAOM1tDnUN3dY9Htp5pIdnqRxsviToP8WQQNb8=;
        b=PN3iCTJZHFfgsBIVTuCLsCf3gD4ju+dKiou81L1o6xPOMM52MklJK/tWcXYTp0s/cw
         MMAgO6bEzJvgi4xfazktFLjSUlfw8Nx37hlsisjzRWcjjvAHzh+fmtgcNsByS+N1WJ42
         40d1VYPZeiUm8Owy+K5NuHK6lZGmPkeCW3lTNEII2XntiWROAMQ/9RAab+ZSb1W3SgAb
         IaPCccyVuqUFvI6kIizAlf89moUfO1VmGN7X6ZfZ2onsJ1tRCFEOua/31AmG6PCHozz3
         OAIVs3y5dyeUSCEtBfw/LH7gl1CqKHII4VzHAyfSo/+tTzbc4PahMsjSlEDKWNUrUGZF
         06mw==
X-Forwarded-Encrypted: i=1; AJvYcCXJlu5s1NExBvdG2FljYJXU4HIqGblYfMPFadnowh9s30ixCaI4q7bQwrxQi2cjp54qTTZfn9l+Abltor/TXY07iEQOMtVOuzx80WJrdmAUnQE=
X-Gm-Message-State: AOJu0YxvIfbrUjHD3w2Art3qKEGK5FeftGNYrEuUI01AHoobuuRhB3tw
	K2t6DYfzV3mk6WmXq2nsmPBMdTXxuLYZt0b7h1r3GfAClMjH5h14teXBWXAGO40=
X-Google-Smtp-Source: AGHT+IHpM8BunwwPdvPiWNmjKmtzMLfC9/Piq1T7ZczlkFsx69QObhWgnzrhF+eLaMHFOp00zaHOrA==
X-Received: by 2002:a05:6512:2399:b0:52c:e36f:369b with SMTP id 2adb3069b0e04-52ce36f3750mr4669582e87.17.1719309192280;
        Tue, 25 Jun 2024 02:53:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b57:b4a1:3d50:32a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d8e0sm174183925e9.3.2024.06.25.02.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:53:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Kevin Hilman <khilman@baylibre.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-iio@vger.kernel.org,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
In-Reply-To: <52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org> (Neil
	Armstrong's message of "Tue, 25 Jun 2024 11:38:44 +0200")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
Date: Tue, 25 Jun 2024 11:53:11 +0200
Message-ID: <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_025314_576414_76141724 
X-CRM114-Status: GOOD (  22.30  )
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

On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi,
>
> [+cc people from linux-msm]
>
> On 24/06/2024 19:31, Jerome Brunet wrote:
>> Add support for the HW found in most Amlogic SoC dedicated to measure
>> system clocks.
>> This drivers aims to replace the one found in
>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>> * Access to the measurements through the IIO API:
>>    Easier re-use of the results in userspace and other drivers
>> * Controllable scale with raw measurements
>> * Higher precision with processed measurements
>> Jerome Brunet (2):
>>    dt-bindings: iio: frequency: add clock measure support
>>    iio: frequency: add amlogic clock measure support
>>   .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>   drivers/iio/frequency/Kconfig                 |  15 +
>>   drivers/iio/frequency/Makefile                |   1 +
>>   drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>   4 files changed, 868 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>   create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>> 
>
> While I really appreciate the effort, and the code looks cool, the clkmsr is really
> a debug tool, and I'm not sure IIO is the right place for such debug tool ?

The reason why I went through the trouble of doing an IIO port is
because I need that for other purposes than debug. I need to to be able
to check a frequency from another driver. I don't see a reason to invent
another API when IIO provide a perfectly good one.

The HW does measurements. IIO seems like the best place for it.

For the record, I need this for a eARC support.
eARC has a PLL that locks on incoming stream. eARC registers show wether
the PLL is locked or not, but not at which rate. That information is
needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
is a life saver in that case.

Everything that was available through the old driver still is, with more
precision and more control.

>
> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
> they chose to keep it in userspace until we find an appropriate way to expose
> this from the kernel the right way.
>
> If it enabled us to monitor a frequency input for a product use-case, IIO would be
> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
> it's not the best way to expose those clocks.
>
> Neil

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
