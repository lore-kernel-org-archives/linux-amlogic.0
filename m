Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2170ACA0EEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKkoU74s0jEdDiW1U0rNVWdqDzrKshDxagipi9taiGk=; b=mPeotjPEigv+fe
	Fvpv7+IcLz0S/gpTkCbgZg4xZeICryOWga0hFqP9jfJmCw2TV+VgW68Al6R0tvjKYwLjoqbTLUSD9
	HnqTgjBhY4xGc54bd/QDo7D8ZlM0PQ2PEJlPB8yZpTZv3VJUlSrabLZEr0b5FFmKbkgj0BXDt9Z8x
	95NtPyIUQIlxAnyUHkgLi8m6PzYGueww7abcXglOhRkhBkQw+jiTLQA9PpFesMxy9HhDut2wMeLRD
	l7nVt+CwzDB7o/vqoxp1SmwdsB1ffiY7LTtt9cNdCzj1ytwbxjOoHMUsrsNcYhATSsyjxjuk6nv7B
	USlA3a02K/HJ/XEdG0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwiC-00000005GUE-0Y6F;
	Fri, 30 Aug 2024 08:10:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwhy-00000005GPU-0ZJ7
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 08:10:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42bbd0a40faso2099325e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725005412; x=1725610212; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Css1DS/twF3J6CTksvvGFwq/UDTMQRJ6E1Ahqfi3MtM=;
        b=Y9PtbT7w7lylhA8gwBPDgK10ypp2AHMan43pXhqKp4pWra9Rkb/RE/Q2p5/95U34OF
         N/DYy0Z41qFlSKXxSUaY9sfS4QFtWFii2G4bNR4fOAColsyfKZUwtOrASHKltockKbkG
         ttHeWm93Hw0F5wokKOgc9pbANCsRaAg+x/zqCWS3BcEKptEy9t5xJHQ2AEvKjNjJ/W6M
         bPShslOVeDZfDufCndDJdDvCsBja7DsSaIt0PdLBwSDWa6WFJgqzm18gUCAiG27UbTyk
         qi8gaRdSIHfpEvJFxwKy6dQK2C0GiGKuV27Sb5WbJSDvya+Y2c17sGMkJW+iMM+N4m2n
         sf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005412; x=1725610212;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Css1DS/twF3J6CTksvvGFwq/UDTMQRJ6E1Ahqfi3MtM=;
        b=VzTuh7vP6U/W7voqVieg+CAHAU9cyBUqpyEC/7PdVHSqva2isp9xYlvjca7v/N0vh3
         oA5yn97Kzal4HT+I/3K083dP0ms65efX/ibfrqEP8ZcufoOb980PKErgvBTt1YRtzB1/
         S5BwcHhBoCMwF0M/SwKDKTsdm1o5NfuAOM0HirISRUJ2oR993mUSna5y1LFC6ZazQ3JS
         yzgC7JmYC8fIIwJLvhzhtr4Lwb34zlui01taRQVELhujmdbHMZzZUZVogQdVlexSB9RF
         rARjGP9giLbkK4LwAP203oKi45JixhaUUVBrtlvsDGKa/o6tGShUvu/Nr1qEgpBsExTO
         0cjA==
X-Forwarded-Encrypted: i=1; AJvYcCW3g/xhD+EFi9ggiaKbnSeiGuXEa6X8snva3pCMS3xRuv7+YQviLxCADTCRLqSK/I9fZmpkpgAYGYp5gdqH@lists.infradead.org
X-Gm-Message-State: AOJu0YxKoc6LGTjHAfQKRlNz6yR/2Mt3rzfLVkpwtN76JfQC0PfghSYN
	qxvh1FDczHEki8fas6dKAVZsvo5hzsaO/j9Fo7aqnsKrg0psDYRJD2IsSubLJNQ=
X-Google-Smtp-Source: AGHT+IH8H5uUNTbFEsKnYUdKRjBzDDZGcrGLT+W24BeFBC1OCMxsf8Ey3WOHr8h+hmPJhmnT5iK/wg==
X-Received: by 2002:a05:600c:3b8e:b0:42b:a9d7:93 with SMTP id 5b1f17b1804b1-42bb032c82cmr45411815e9.28.1725005411476;
        Fri, 30 Aug 2024 01:10:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90cb:5cec:cfdf:966f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbd46b60bsm4808145e9.1.2024.08.30.01.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:10:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: xianwei.zhao@amlogic.com,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: fix C3 PLL input parameter
In-Reply-To: <0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org> (Neil
	Armstrong's message of "Fri, 30 Aug 2024 10:00:38 +0200")
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
	<20240830-c3_add_node-v4-1-b56c0511e9dc@amlogic.com>
	<0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org>
Date: Fri, 30 Aug 2024 10:10:10 +0200
Message-ID: <1jplpqsa71.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_011014_199713_0CEECD01 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri 30 Aug 2024 at 10:00, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi Jerome,
>
> On 30/08/2024 07:26, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> Add C3 PLL controller input clock parameters "fix".
>> The clock named "fix" was initially implemented in PLL clock controller
>> driver. However, some registers required secure zone access, so we moved
>> it to the secure zone (BL31) and accessed it through SCMI. Since the PLL
>> clock driver needs to use this clock, the "fix" clock is used as an input
>> source. We updated the driver but forgot to modify the binding accordingly,
>> so we are adding it here.
>> It is an ABI break but on a new and immature platform. Noboby could
>> really
>> use that platform at this stage, so nothing is going to break on anyone
>> really.
>> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock
>> controller")
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
>
> So you mind if I take this one via my arm64-dt tree ?

There is no conflicting change in my tree so it's fine, yes.

>
> Neil
>
> <snip>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
