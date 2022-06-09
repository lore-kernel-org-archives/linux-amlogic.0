Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F6CC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 20:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkmS9s8Na5Fn5owhX2PRx46k2bGOY579g8AvuMnDOOc=; b=TkNPrEuAelyyks
	d1Decyhu9IrO+geSjUagE6FxtwbGTg9JPMfFxEqdKzyV63rFHVkS2xGUM0/Q67okOrwGprOOUq+ck
	JxK97SKaWFUCcoJj9Ei2Mtw3bK8BLnm05Hc1/jIphh0qBnw4l3pViGUnJ/I16hvHcBERkI9bPmhK4
	UOdTbTyE+OGqMlv3/vdSu968XX5U0yQLAcULuqprWyWkhTWaOMhpwoAG5n3WbW3PG8ipQNaYAg7/s
	XJ2pqFhZ2tOOqfYUna4zE6WE+LKkE/udpSp4m6dDvgxHSc7UsG6eJPBg3AiMizUXed0JMAzK7Ox9+
	bei2NJDiUEraRxmcK3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzONh-003t9c-Ux; Thu, 09 Jun 2022 20:03:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzONW-003t6y-Dy; Thu, 09 Jun 2022 20:03:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n10so49600491ejk.5;
        Thu, 09 Jun 2022 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65BKb6+QTnEhJJ0Vp4EQuB44eWGIpxtLTjcmvbPa/Q8=;
        b=Emp0E+5ZxCn3BLb90p4QITBjZiOgXtq9gcju7V+lZINA/YbIJQvdKPYv/H+HAI3qdr
         v3odiCW/sg1rz55NsstJQfMbjM+0cKeb4V1dgkeONQd6WbK/k5XLPQ1CNO+Ne9dkCX13
         aeVUsUCiGxtMYwgPo0cvLAJgHQdfddrgVPIqyKjWvwD3LLIsm3JGBJ1Lleg/QO/A9cF3
         xY9VqZZdQmcdUSpl5co5d1gYh0gFmez3VXE0PbMxNA4W/pt29g/2J+SK0aXDYPR54oq0
         a1+FMG3tXEkm8NR2gDdbm72+qF1y0kTwUyJJOafmA7/U/FCBQThsyIGCUmUECf370ACE
         a/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65BKb6+QTnEhJJ0Vp4EQuB44eWGIpxtLTjcmvbPa/Q8=;
        b=Jyi+vrZjekcJN8PTwMGKPuBjUFWGfwraEdcGgnSCUVavDsvcI8h3d9xsY6LK6SNs56
         qkiBEORBTWcMPa+b7gYnYU6z3DMhSHbwtSFMIzgWRRBrWXSI3K/BpURAluXK59OxZ8+P
         Qa+3EcFr4+6sbcgCBJZSltdKD3pHA2miVMaOlXOLpJTAMu8pCn+VVzxdJLjibDW9fgn4
         aldLhAPaVBwNf+vTwOR3bR4FVur7RW28bba/lGfaRq4p4i6/oJvplD0dhyam0qHON3ve
         PeN4aEcyEEPM+7Ne759n2K6SmzBXrifZ3uP7bwskEppC2S23CJqiODqR6IMkp27EHpUR
         ZHEQ==
X-Gm-Message-State: AOAM531WBq+vplbkyrfAvAYRC3sh+kmRfo7wW7CKVNaL9zKKhSGaCnAo
	JsOp9Jr8dzxNbUehjm4JoTkpfhLqN5vIIw5+TCQ=
X-Google-Smtp-Source: ABdhPJwfjXkI4NfrY0Ak8ggvGl+owfQ44h7IsmFLeTxpiYz+agoIaeTAoH5NeXgbZqJNRr4AYiO6dtCK5cHgctlK6qs=
X-Received: by 2002:a17:907:7246:b0:6ff:241f:200a with SMTP id
 ds6-20020a170907724600b006ff241f200amr37297815ejc.543.1654805015941; Thu, 09
 Jun 2022 13:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609113911.380368-6-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Jun 2022 22:03:25 +0200
Message-ID: <CAFBinCAwS2zYksWUbQiPY+XNhQHFz8Qvfe+Li79Lw16dviWSZA@mail.gmail.com>
Subject: Re: [PATCH v2 07/48] arm64: dts: amlogic: correct gpio-keys properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_130338_510322_603E4FDD 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 9, 2022 at 1:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> gpio-keys children do not use unit addresses.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
