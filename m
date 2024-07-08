Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA0C3DA42
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve9c3R4Y9f8GsWK+6agyjbj93GEPeCZjeomK+PBqxs0=; b=ZjQYtPko1caPQQ
	gD6BtJVdvAkLI0nPT3qPPNUUNcNCFcrlZEaUZ27LIo2pc2agcSeqNlZII45BbKvtEhEWSG3mtd/Zk
	5lCKNgNBqo5IZu3ykpV6YtnSCLM10rcyKxNaDdREUz0FtpcxK1nD3+0pNWZ9cUPoUttc2ZcijW03Q
	GxfMvROXSSl17U/6QOVlMJLfs+IoYtWkW+tqIYe83Rd4u1iXOfTlS2DE8y5+YVqyPvz8huMtLCmLr
	CciXpPP2RBXNt+BrH/yUOUTsk3JWVyDAegCNXxZF6VXlRGXyB5hXEzD1skR4uaJiaFJQMKoPOD/dY
	lSFUCCbkBY2ELU7KOxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQp9F-000000041wh-1JJl;
	Mon, 08 Jul 2024 14:15:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQo9B-00000003sff-2zaQ
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Jul 2024 13:11:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso26453095e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Jul 2024 06:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720444271; x=1721049071; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWHS7n4JKE4Zhnq2fHCrq3JBbmX9LHIbWotNtCmupg=;
        b=hCOl1Fu6qGdQKrbnNglRGS8csMzW9TBEEEjTtPydZsvOgR4VU8x68L3HHFNRVl0tlZ
         7jU75C4YDE+2uvigqCViDh8KlLoPtlOuNtsFJmKkk/vtQnafNFiO2crUz27t5yB47r1I
         4ua6ObIyEkPEUzEOIEmmRTmsJATAxUq+axit5K68WD8dBJtD5Dfe0u0CkmLtg+HST9i8
         e22qUNsJGdMOgshacd4UQ01L8ya4zcTA3K3JyR0iIuqAEEhCDegLBYcB+iGg5ehRsLrO
         ALbdbeCr37IdBthsa9KwXPc2xSTja0QaBc8czNgOOwNvLoqRIakRYDbf61JMI6ROg3oD
         UShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720444271; x=1721049071;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWHS7n4JKE4Zhnq2fHCrq3JBbmX9LHIbWotNtCmupg=;
        b=NHKgBvYjHs4TEo75fio3zzy+lS2gOpi2JT3i5p5Ai6tJLIE12tBPuVjja52YIybSTP
         0MvfuTA6mc+FRjkToDcmTCsTLN4limr9APPxF4YUzTA+WBcnkoxUc9dXFatLXSjEZFue
         jgHnhRzmsr3ssZqqfjTLL2CFe1HZp8BAqxod78UAQIkIoG3anIpjAcIolfi8prKPnwj+
         94TBf32Lw1jznHWaczI67AOJVKQ5Dcbj0oXAgsMPnwjQvq1N/N/TBBuL2QXaz1FQWtPV
         g9lzNS5Ss2os4tDVhyErzkqsLhlBhCO/aatbH5pADwdaNXa3Qs+xvM4wAdF2I4NgxcC1
         QaVw==
X-Forwarded-Encrypted: i=1; AJvYcCUpOsG7F71UeigRXX/lZoUoALe65fMKKyH7DxSJl2BH00jd4Hw8NTrcl1jB/zUYiVMUXS0akYPusBJM5ZLVp8BlA+hq493b3KYbwnSeex0DMuc=
X-Gm-Message-State: AOJu0YwsnVDaR2kjyewHE6PMpey0PK0v51cpQDuihdkZ1o/jkeNu5lL4
	SbHnByeZ4/kP1QFCNUkD9qCSP7yIRv7ov7dbr9TBvav9Gvuid5wUXm4rRCkuY0U=
X-Google-Smtp-Source: AGHT+IG3y3s2abTIzMduavSusGk41h4eUyyiMJrCpnEXNNbVBBrdn+KPAsoARDJOB2DmaMtozMzthw==
X-Received: by 2002:a05:600c:4da3:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-4266eac83bfmr5970605e9.1.1720444270774;
        Mon, 08 Jul 2024 06:11:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5158:f510:c35c:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cb57sm163660395e9.21.2024.07.08.06.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:11:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: <ukleinek@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <neil.armstrong@linaro.org>,
  <khilman@baylibre.com>,  <martin.blumenstingl@googlemail.com>,
  <hkallweit1@gmail.com>,  <linux-pwm@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@salutedevices.com>,  Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
In-Reply-To: <20240702123425.584610-2-gnstark@salutedevices.com> (George
	Stark's message of "Tue, 2 Jul 2024 15:34:24 +0300")
References: <20240702123425.584610-1-gnstark@salutedevices.com>
	<20240702123425.584610-2-gnstark@salutedevices.com>
Date: Mon, 08 Jul 2024 15:11:09 +0200
Message-ID: <1j8qychvv6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_061113_898377_BBB457BD 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue 02 Jul 2024 at 15:34, George Stark <gnstark@salutedevices.com> wrote:

> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 1d71d4f8f328..e021cf59421a 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -37,6 +37,10 @@ properties:
>        - enum:
>            - amlogic,meson8-pwm-v2
>            - amlogic,meson-s4-pwm
> +      - items:
> +          - enum:
> +              - amlogic,meson-a1-pwm
> +          - const: amlogic,meson-s4-pwm
>        - items:
>            - enum:
>                - amlogic,meson8b-pwm-v2
> @@ -56,6 +60,9 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  power-domains:
> +    maxItems: 1
> +

The change is not only introducing a1 compatibility but also allowing a
power-domain for the other SoC, even if optional.

If that is intended, it should be stated in the description and probably
a separate change.

>    "#pwm-cells":
>      const: 3
>  
> @@ -136,6 +143,16 @@ allOf:
>        required:
>          - clocks
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-a1-pwm
> +    then:
> +      required:
> +        - power-domains
> +
>  additionalProperties: false
>  
>  examples:

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
