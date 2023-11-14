Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A30FC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQ8bDcmZxSyRCYITs4svjDgmYL6sUuKWSw0LOp8A0Og=; b=oVOPpkh3Zl/SCa
	AbDWdLZ9GvyNk0VCX7vzAzkEoOeaYOvXEMqTWSkNwxFAuP+GHcTLpI4/vzy7pQyMfIOZew3agxtaC
	eBrkF6guf6OlNudkUu6wbEZ7W5figmN3iMPXe0l6XpXWY1l7omk8jMb94E7TrsWxnz9tsCNc88tRS
	m0shWx/Kt5b7fRlO0IaXPkwUdHu37hJxsFHznlcPyDzkKipqEqtqeosJhEfHejw1SrMKOrFyehqjv
	thgc+WfLEA5CZxt29eKmVZmVkWXlua+U5yCUR52BAJpA9vadsLHRRVy5C/bD0iGhIk/FGfesbhaps
	fh1orCP4P8lcP6jhGQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tBh-00G07z-2b;
	Tue, 14 Nov 2023 13:10:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tBe-00G077-2D
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 13:10:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3865371f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699967434; x=1700572234; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kylEPySB/5FfOKILQp0wcgiznvVbaF9pAdNSaICh0gU=;
        b=sh347oQl8WI8yOT2mm6fluSoIVJGc8rOwAYi1UbbU45luvayTVJX7dVEW5J19WCL4P
         cy1Y7H9WCpwtc9hDEowx0tuh0PgFYGeIaVzMiv8Ds1Dm7atGBOu4NSZ0gs3EuzefIDiJ
         lEUJWjQy+62Z0sIxaQ73/2T8MoZOv5B4xa4qrsscOPp3ARPFXrx/8x5jXG4EGgLBUJNk
         OKB0LH+r/mqqc4lkqUykQkFWnX3ixa2cM4Vm7fklkEmWN6ectmDoJF6LnOpWrQRGfGm2
         w9FGR8XocaZF2nQ4eLCGkeQ++D+Git+KXIIhRZxsYhJV8h/iW2f7u/iPLQMdrSDBSCXs
         /T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699967434; x=1700572234;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kylEPySB/5FfOKILQp0wcgiznvVbaF9pAdNSaICh0gU=;
        b=NUfwysdeRQ79nlOWQRgqd9/c81qhB+gdq2k4imcwCAn31S5tzcyR7bV2SUtCoz8U1G
         cX1uewENnphq3UXgKAmjNFevAGHenR11H/35azxS4TzmcH5KmtAhPFin2WjJXQAcfWe1
         Vgq5jVcKMXct5Kz422TbHjY4PlSXGPvMWd1z2/532tO7jWNPnNN3vrqxMT7gYs6whMvB
         DGfL/kgfZqBdqmPiD7m9fuoYzPJeBsvmY/aMP/0oDS4eNMTSMTM/yOjms1XYrk6szVps
         JyoGUuarqW9IRx+5wI8bSznckFwZWU4qP+15bZIehoQ9S8UYP5AzOayatcBlvSUnkSp4
         u8Sg==
X-Gm-Message-State: AOJu0YxisJzP3IlGun5eVZSu8xjQoaUM83m42M+Hr/NfIHnNzA9Qhdc9
	uJch1l0QLGS/sPBJG4ZWiSc2oQ==
X-Google-Smtp-Source: AGHT+IGziU1soHXdOrIYoiZhkJ3lrSemdXNvFyCejd2ntbWKzDN90NoFHYrl0P9aRWDq0a+dBQ2I1w==
X-Received: by 2002:a05:6000:4024:b0:32d:b991:1a71 with SMTP id cp36-20020a056000402400b0032db9911a71mr7443849wrb.0.1699967433842;
        Tue, 14 Nov 2023 05:10:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:8fe7:3223:c57b:4b01])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003196b1bb528sm7843980wra.64.2023.11.14.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:10:33 -0800 (PST)
References: <20231106085554.3237511-1-xianwei.zhao@amlogic.com>
 <eab3869c-7529-484d-983f-dd85ecfbeb0b@linaro.org>
 <1j34xdcwf4.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu
 <chuan.liu@amlogic.com>
Subject: Re: [PATCH V6 0/4] Add C3 SoC PLLs and Peripheral clock
Date: Tue, 14 Nov 2023 14:07:16 +0100
In-reply-to: <1j34xdcwf4.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jleb0bhvb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_051038_722839_6F04C1A1 
X-CRM114-Status: GOOD (  14.23  )
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


On Fri 10 Nov 2023 at 18:50, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Fri 10 Nov 2023 at 14:20, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>
>> On 06/11/2023 09:55, Xianwei Zhao wrote:
>>> The patchset adds support for the peripheral and PLL clock controller
>>> found on the Amlogic C3 SoC family, such as C302X or C308L.
>>> 
>>> Changes since V5 [3]:
>>>  - Fix some typo and modify formart for MARCO. Suggested by Jerome.
>>>  - Add pad clock for peripheral input clock in bindings.
>>>  - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
>>> Changes since V4 [10]:
>>>  - Change some fw_name of clocks. Suggested by Jerome.
>>>  - Delete minItem of clocks.
>>>  - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
>>>  - Fix some format. and fix width as 8 for mclk_pll_dco.
>>>  - exchange gate and divder for fclk_50m clock.
>>>  - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
>>>  - add CLK_IS_CRITICAL for axi_clk
>>>  - Optimized macro define for pwm clk.
>>>  - add cts_oscin_clk mux between 24M and 32k
>>>  - add some missing gate clock, such as ddr_pll.
>>
>> Where are all these versions? Please provide links.
>
> I have provided some guidance offline at the request of Amlogic.
>
> This should have been v4 and the cover-letter should have summarized the
> change from v3 to this. Unfortunately it was sent as v6 :/
>
>>
>> Best regards,
>> Krzysztof

While labeling this v6 was a mistake, please continue from there:
next to be v7. Don't reset to v4 or v5. If more versions are needed, I
don't want to end up with 2 v6 on the list, that would be even more
confusing.

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
