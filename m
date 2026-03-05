Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85469EEF331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZsGRjoIqmYui+9rtzeTLfJ5HZVPE4NTb9mqLZzVC7w=; b=he9YJjsTi0epNE
	U4dx3jktWySd9/v8plfilO/9FcRah7Rwk0zMEK+rF1TG6ru8j8ffv7PKmjf4MI9fcoYXOQjeAmSHd
	Q/WKC91asV3RgyzSvvKEcdeCZjM+JKVI44YhFw+b07/XR8vTflsEXktW0EPV00n7XCXuM5s//KXbE
	7cU1i/N3vLX92cKOjwL4dDBsFm68aRvwXQDCnt6QQuMbl/OYZoAwEgIqJnYmay4Gu6a+Yc5IwZfCJ
	fjjgujNAE4vBJqgaiIEgXMffe6IK8GFhzPSZYQFZQvfcwg/A7VffJK90Jjj9EmA54gR3HQ9gjM80K
	OlIbGAnZOJOyQDvjeNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4WA-00000001GK7-1gJF;
	Thu, 05 Mar 2026 08:57:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4W6-00000001GJD-2d6v
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 08:57:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439ac15f35fso4636866f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 00:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701028; x=1773305828; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=UF7A+dJiafEd3sgzFJis3PYV/d9Hnn5RiJqB9KRchz3nXWV5yCEOoVJC0DyDUAbzda
         wgEHZeEBmbananLd0u0egpJZGflOutjuMin2vNKe3hQFCsmiyFQmAwM/U7EVUWA6PZct
         4sdO3IfMexP4LpsEb4O6F79wFPdz2HZVuHPLXYqyWwJRO0x7x4967zHU0Bk0uMphW+5N
         +u0znUuoBg1S1UTmGpKK+hJuzsdUvl6E1xu7qwP3yylttMVCP0ie6RuGUezoK0Z1ikEu
         crYDxGXx5tkAsjQzGuOZkaTovYbtnmt1Mk8YpMrc5jHeFvOiJfe+whwqCybsut9/iG3l
         hk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701028; x=1773305828;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=uYj0Gyoc2tWXWR71TPa+VLtokJTyB+VUNz+rCPbL1amCnldXmpU+dycMB4os7DiBNL
         UPfOMFLpFEqzzlrdbraxUA7wtcZc0J4wZH8wPTXF3kYWCFeh1MwdYju/O7AmZDN9c+T2
         9u/9SECINbJNgsUu6hjMrugwipaRJFdWCBp1HR3Cu2wPO1HvfupRD1Ox7ck4L2QxmxPc
         XjIIN+pCaaxVuKROApbG5kIyS62Lj7GOTAWLVvKi5EnPjRf6jjveyRySoltWpjGwRp7L
         t35L0Atbnka++6yOmsOSCWOZBfmZhfjpJyQAFifaSC+ORdkKaFy0G36WsbZGczZWVcSg
         U90g==
X-Forwarded-Encrypted: i=1; AJvYcCXKN5NuAzuNQSMEvX5rlxVYpmQI115xNiSysYH3+7dCVevc6u3IKIxqyQf97oAc3xYq+c+FVawwMlT9hg8b@lists.infradead.org
X-Gm-Message-State: AOJu0YzjXtH+ebHY4gsYNRng1eXOvKQhv3lQAFTyiz00p9F15ducooHY
	sMJwUJD1YjaLVoel7gqeu+A7Bg/t+1Jpvy2dQ0biFLbtKVi1xnCcJzYi9kcV3R/7wE8=
X-Gm-Gg: ATEYQzwy4qoDxwApSbVkPVtOTcDjNgBTSa0aFaLagh6tuQeOBBBcbVljbXZXXZ6LZxx
	JMMlqZInM9FRBsymym2/09M/LluA3WVrK2pHSMjDMhZczCGMIRekRVHIoWlGS2tGX85TVeZ6E8r
	10SDu4HzJYW+ejq/3iz8bH0BmGziPYnyLyCRdDvNhWZJNne57smjeBX1aiBUaIMlTn9EsF8d23o
	3+aK/s4VMp/jgvd7wcz3z9gK3cFiendTLD4mqPI9QWpi7jXxbBrsoq94embzsazHM72JA8PNxWe
	OBmWWzDQRZsnJP6l2xQBZ7a8bX6KVEY7PC9dfEujYvTcByoKiultvcTa8ai0WMr2GYQ1AKSQqsP
	vbtkMDUPLPdkWf6r+TSd5WamwVo45uAamkaoB/PXPjpuR//3FMj9laSZRiKfNaz/MFuqpBf21kA
	WK3IQs7opP6uu8buNiMKZK
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48519874e2amr76440305e9.20.1772701028139;
        Thu, 05 Mar 2026 00:57:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439b485a0b6sm32442608f8f.39.2026.03.05.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:57:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
In-Reply-To: <20260305074328.639993-2-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:25 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-2-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 09:57:06 +0100
Message-ID: <1ja4wmbqn1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005710_676105_6B5BAD6F 
X-CRM114-Status: GOOD (  13.68  )
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

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> Fix a typo for T7 gp1 pll.

Patch title is too vague

Credit is due to Ronald for finding and reporting the issue initially.
This can be viewed as a clean of his original patch so the change should
have his Signed-off-by IMO.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..b488d92b7984 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -72,7 +72,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll
>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
