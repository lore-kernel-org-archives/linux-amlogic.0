Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A95C4321E
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Nov 2022 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP0Ox3AOYir0afCj0KyY/jCK3zMsrehiw6dXnchsciE=; b=bHPrfXTmqXFZli
	zCotm+aOHYGMA7jYbBCa6wcobtJw5gsmcHSTblYiwZ2OZXOnPIXML2yARKVtSR27JEZU8ZP8QJsen
	v54G14cl7+B1L7ZPPyRHBpRFNzoXpMBehPLZsKbdatDAJVaKc86bTrkdvdRxSedVcHgfX9LPh9Rtj
	Cbq7XXXo6FULECGoKVqAxX1VhPoWIwVNKKsiWENUkJHCPxg7iYwMtLM3PQK2EIGwHEdWlWIaMtp9w
	Ep9jFtfJQlLCmHKLTYqoZO7gPxbJm9J9ZZNDs/2UeNcKgpyFlGMI3VjsLIXug5pHi8INYc7/GJyeW
	OzE80xChSlXEbWZx/JpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxeu-0072k1-5i; Sat, 26 Nov 2022 16:04:04 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxek-0072dW-T0
	for linux-amlogic@lists.infradead.org; Sat, 26 Nov 2022 16:03:56 +0000
Received: by mail-yb1-xb36.google.com with SMTP id l67so8404946ybl.1
        for <linux-amlogic@lists.infradead.org>; Sat, 26 Nov 2022 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oPI4AZ2eAdf9dpFkRgyi9VOqBdgUQo1/pANTi1uI3pg=;
        b=qb5b/2eXX4lPgYmeza0r1fNs84UXtLmZSNW4snW99vNTkKqz8V51lyk6Xtm+CAmEFl
         x33Ecu160iOmJS5UcAezKA6sjS7lkrnxtgxjqTurCKvvjnfJyzWXA60T6vokaYPZr0Cz
         PwNKTT2jlBga46ujI5OOamevM4GfwPQSpg2eslJK9BGIF2amBN5CbGONjDfNU622sBAq
         TijvaxYrvE8pLH+pFR7JtUNGccqDlLcdkRFfov158Nm5hX596DQPKTS1AhfqNftdEblb
         su+vD1lRSuyszk8v8ipoLQFlRa1lh2H23gXn9jo1ApbAvrGz+00SuSJ1qTmXahHlpLFU
         tJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPI4AZ2eAdf9dpFkRgyi9VOqBdgUQo1/pANTi1uI3pg=;
        b=SZhQooee9XdCG/fCcxA8Nub+5xy97JU3rk7do2MiNHUUbk62s0mOi8Wa1tjEIO4qVt
         mCBR6K3xGshN2KfRisb2eCPMNo1Znlekr7I9rBrwIDYMnoDOfYvPPo0tHDo0cbzwTWNF
         K8n4dbNhN2LgnNbeA+XSmdVcbO+T6aYWzlQuO+5mZPM0rQQg3heEFP6XiqjthgpW8sMC
         1KCbb+hz5b6mHr2xrmXYvBpTfjSJHR0U7Xtkvgi/A5e71ZrPDxjILYCjHlEIQSVtV2Yb
         7hZHa020jMo8PuzaYQ+OGvr+AM4F+ze/hmiel7OTO8CF1p2SaxByjQ7WOjcdqgYFI8fq
         lZdg==
X-Gm-Message-State: ANoB5pmwC52k8ya6BLlnAY+FY0a0C7ACvK+FEGqUjq8Jp6YuVbKiQLl2
	AHw1jPBihOMyTgUc6YGwHR3OXdgYzMnTplcxb90Ulw==
X-Google-Smtp-Source: AA0mqf7hvcnOUxnzNtLIoGMAMAsp39IkIkzo1prQTdpWorNW60u6DsujeEGHp6iwBrCpbf4h0RTRClHXC0VgntqE92g=
X-Received: by 2002:a25:3c82:0:b0:6e7:39db:aeb5 with SMTP id
 j124-20020a253c82000000b006e739dbaeb5mr24048591yba.304.1669478630995; Sat, 26
 Nov 2022 08:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org> <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
 <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
In-Reply-To: <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Sat, 26 Nov 2022 17:03:39 +0100
Message-ID: <CAB6niQ4808JEgdQEvRvaYqq8YmFCGo_YLnxXo+rjpSgxQxu+7g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_080354_960851_3A8943CB 
X-CRM114-Status: GOOD (  13.73  )
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

On Sat, 26 Nov 2022 at 15:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/11/2022 15:16, Krzysztof Kozlowski wrote:
> > On 25/11/2022 18:16, Neil Armstrong wrote:
> >> On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
> >>> The node names should be generic and DT schema expects certain pattern:
> >>>
> >>>    amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>
> >>
> >> <snip>
> >>
> >>
> >> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >
> > Aren't you maintainer of the platform? This means I should take care of
> > this patch?
>
> Ah, this will be picked up by Kevin or Jerome? So this tag means only
> Reviewer's statement of oversight, right?

Of course I'll pick it.

Neil


>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
