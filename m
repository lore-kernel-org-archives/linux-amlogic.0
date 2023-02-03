Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B38C05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyv08SZtloaU1IBfpr/Xb6JMwjMy+nTaQrJc1zUtgjU=; b=tla/S5r9QaoCZa
	FZkRC/465PHPuX/pG27vITtISQgFALCWna/4c7fkubhf5318/dG/fXHt8S2jwKtNxFEB1wB1gQAG+
	e5JHZbqgyv81lmsXaqW7BjgWvgdxujbyyOi4wcsNTjdRrFHcfpVNWnd2k2FLLG2AEASOyCA56c65U
	PUgT44irl1Im4IbNjgwJMQJOCXBQ44QmFaB0DIOjsCLss1eZ20tiJpMrPl4Fykjf3d2H0l0Nn2M1z
	V+31BsZNjtfPXbE1QNEaY0BBgPIfhtGYmowwQzUmPiuEBNE80/wJEZeUUWhRpzfZnJonZeR/ap0Bs
	nuADvJRa+BKcVXxrhB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO1se-003PiR-3M; Fri, 03 Feb 2023 19:37:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO1sZ-003Pgm-38
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 19:37:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id r27so1767234wrr.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 11:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=db6MYL6B1qCC0WghXqCqpmCV3BHmf50h/GnlGcgDEws=;
        b=NejcbZPMYGHRsiENQYz73HwZK/9UL8brsL56ssuMEEaDh7BfaeG5MgjlQC13JxmepS
         M0sYVmEsXS7mgyYEFXcu4HOW8U7sS38JF88Ic27hOSq1v25TcP8kgLdAdw9iypZUoOz1
         GTZ4vYsVM8mntAcvCueB0/hgRoiTp/G2YeyAwFXMIxTxCjXaztDHASyidKEKxWE+HcTZ
         ZGXUyltBkanzVFc2TNFwKp6tjcusPMlQYO/sIubxAXr/971nn9I2CplF5cDqUc1vvQk9
         fWbn4v/41QLAhtgfB/9U5F1fwFL96fXJ1N9HTRd0mzYAr0uk/PapTsrZNdEEcCBZW4wq
         bxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db6MYL6B1qCC0WghXqCqpmCV3BHmf50h/GnlGcgDEws=;
        b=4qzKSbt/ka0m8ExMEuVGzr7GSlZ5lovaE70hpSVuCChzEIkQQLPWH61mY5uFpYeJGF
         ZeB50manCe25IQ1mIxYyJpGBzx0yHwp2QMPCuSdkd4sL+ubYwyHBEWYkV+MIe4LI6SrE
         5ZHSiE93bcaWlA4baDYqddTeamPlPwm/RNaVrQRzTIlvGG6kh+bhCRWHDy83leh3g+4W
         SGqAiroxX8HmBbWi+XtyUOYUi0ZFVLHtVsJcZgJI4EP8Xk/+z7tDsvRZC9KgmllG0B9b
         aGPqwmvNgxOEv3uB0KLmV3W1r23qSKNhi5GYP/qgkKuZ1hi2xHlEZNzuFWB/vanGSBy4
         oG2A==
X-Gm-Message-State: AO0yUKXJ0VmZJS0L/nwuiKoHKt/vzdtYK3g6nlUQg1yNOgxpF9LuAKUG
	TuEW2lx7IwtDI+77elqS8awTPA==
X-Google-Smtp-Source: AK7set95ZxUhUht3lmVwu6Z+ambqGhwtxGfLtaPaosE/50HAbN2VkxWC/Qzfga+8oosSaxr+m9qmXw==
X-Received: by 2002:adf:fa84:0:b0:2bf:ae15:ac15 with SMTP id h4-20020adffa84000000b002bfae15ac15mr9307669wrr.62.1675453061095;
        Fri, 03 Feb 2023 11:37:41 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id o15-20020adfa10f000000b002bddaea7a0bsm2744105wro.57.2023.02.03.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:37:40 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Fri, 03 Feb 2023 20:34:21 +0100
In-reply-to: <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
Message-ID: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_113747_401096_AF594FAD 
X-CRM114-Status: GOOD (  10.92  )
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


On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>> +          Multiplication factor between the frame rate and master clock
>>>> +          rate
>>>> +
>>>> +      sound-dai:
>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>
>>> Old binding was saying it is just phandle
>> 
>> It is just a phandle but the bindings used to have problem with phandle
>> that had cells.
>> 
>> See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>> 
>> Was it wrong or did the situation change since then ?
>
> Then define it as having cells:
>
> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42
>

The card is provided with the phandle.
Whether or not the phandle has cells or not has nothing do with card
driver. The card just consums sound-dai. I don't understand this comment.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
