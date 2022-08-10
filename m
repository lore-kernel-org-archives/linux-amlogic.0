Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01226C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn/stz5RJu2CIRqr0Aq8bKcHHNBtmrwrNtCJKKO0t+Y=; b=iRzP/kLuEaYXEH
	9rBzMS7s6Y/m9uJGWIUyuA/RHpG0sql4oIaNcmf1AAomZR4EV1L6U6a2ND3Fx1M5TTnXGJ1/6VT6g
	KfRSuHPJB3pJkTzMNbO3GdYn7BT+vKV+UakuLo/NcNuyx8QKrcvucJVsHTXJk4IigP3R3h7vUXCpW
	Y614uScMmBQpU8kVWy+PohB9yh1EhJ39nn6jHvzwSBEE0IeY6U5uk8R6Og51Zdf/ervpy3hGVFfXd
	tGrlgdi9mVLt4owwXmIRqV/tRrxKGVcM3NSQ7r+MXvwclPt0F7adv2IAiVgBbKfl2WCFW6MRV/IW4
	uz073GDQyN83ZtoAaFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlsf-00C3e4-Ja; Wed, 10 Aug 2022 13:36:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlrx-00C3FN-7j
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 13:35:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id bv3so17761853wrb.5
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc;
        bh=J1VWGzexY5E6UsX9vQ6bQ6ebcpD459VexpuSjd0X1xk=;
        b=vheOj5OqXAuJQuxThF4rG1C5oUbDBkg0eqaP81N1/zP/d2jZa9v1ALY9/A2MUhuEw9
         smJunFTKU1AjT2aJIV80QHIj44qIjzbF8BiwJdd9175ExWaVpB2pQMQgB8P3sVxRoyyx
         F2QHG8UKw3o9mEzmLhxDu40YuNFpnUMlTgd0wTwAuKQS5VftwnWN2itTX5Hlyztm1Da2
         QDtIIhHm6SWFzmnEw+ab+XdPgrEo8qti39g1Uqje0M0IihYpePyJCqAgHrVQYLqT4iAa
         iAQvZ6Mnj4DjnEcBRkd5Qjs2LZ9DlwccP2qwZLY04iUhgjojRWRH+4UYOf8Qm2Z1eUuG
         g6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc;
        bh=J1VWGzexY5E6UsX9vQ6bQ6ebcpD459VexpuSjd0X1xk=;
        b=6Ca5k9BxBO7j2A854pv7eUo6mr24wO51es5oJ4djmAoXLic342OHmzkDMb4JwqUO96
         5iPJcKuJN8KOUJZcEUnrAuTUdUm4+QsrtP2zRzVNR2o+Vbr7+twzRW/hhmmQPAwOhujv
         e0deneXTsVUHtm0g6sieiKPBMH81S90rUaZU0Soy4/QYrw22BH6NlV/mnjn7vMUscBL9
         weY6J+fpA36g+CtSnz9jqbZJ9IugxdhKi6NVtAauFQ0ZE0kK2DfEMSrfBNL9GMJxGL3N
         YSo0Ru08n7OrCezODR7F4uaIpy9ahsRpEshFwC1N1ERZv1+GV2RYVfPKjjUvxtC4C/kh
         lisw==
X-Gm-Message-State: ACgBeo0TY4SWIRIdyINaA7kKZ02Tbu4/yPGxv8+a2lPFK53KQna8xCFI
	kiIQWEtI7OUpkjUjLRfhdmX2yg==
X-Google-Smtp-Source: AA6agR7NHyGKRqIxWGpE5gY+PnqJiMudQi/uUaPx51qSYupKoqvqy+xNZdCloeF+K4jcJJQZh2S9sA==
X-Received: by 2002:a5d:5a1a:0:b0:21f:a9b:62c6 with SMTP id bq26-20020a5d5a1a000000b0021f0a9b62c6mr16898673wrb.20.1660138531570;
        Wed, 10 Aug 2022 06:35:31 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bd26-20020a05600c1f1a00b003a2ed2a40e4sm89768wmb.17.2022.08.10.06.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:35:30 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
User-agent: mu4e 1.8.7; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock
 controller in DT
Date: Wed, 10 Aug 2022 15:32:08 +0200
In-reply-to: <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
Message-ID: <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063533_532837_35118FDF 
X-CRM114-Status: GOOD (  11.91  )
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


On Fri 05 Aug 2022 at 17:39, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Krzysztof,
>     Thank you for your reply.
>
> On 2022/8/5 17:16, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 05/08/2022 10:57, Yu Tu wrote:
>>> Added information about the S4 SOC PLL Clock controller in DT.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index ff213618a598..a816b1f7694b 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -92,6 +92,14 @@ apb4: apb4@fe000000 {
>>>   			#size-cells = <2>;
>>>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>>   +			clkc_pll: pll-clock-controller@8000 {
>> Node names should be generic - clock-controller.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> 
> I will change to clkc_pll: clock-controller@8000, in next version.

Same comment applies to the binding doc.

Also it would be nice to split this in two series.
Bindings and drivers in one, arm64 dt in the other. These changes goes
in through different trees.

>> Best regards,
>> Krzysztof
>> .


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
