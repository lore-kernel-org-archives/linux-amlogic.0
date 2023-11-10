Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7EAC04A95
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 18:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNDZ0SpOnu44vJxQbDC85iYpdMJ6HBhsvf50dG7zc2A=; b=b6CREbOYJkcYQC
	WjB0eag8atHKDjnv/PzF4fNBxRGAEercQu9gR1rbxNssNrqKXz68lF9lbM7WhB6KLxUidS9cp6zhP
	yAHo3jWY1GOhOft4lxQspXg3Cxo8ff9IODf2pp8USxnszIwOVvoGXXA0MoPfzntFzacEPiPv3MlQ8
	46U3c+DYNGSG4Lf9nA1iGLFcCGrUzPtEvaSLMJmeY9BypijYAvpzX6eKecgLmFrBUVfy4TFif2xvs
	eaYEYJ2VBlfnf9guGsghxLQ9rwQt07bMGmOnNVutdklW3eaKVBJxqNHDk0tYbnyJvj9Mo+6xf0H8Y
	oou7FV3c/eke23lPLpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Vwx-009CUG-2f;
	Fri, 10 Nov 2023 18:09:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Vws-009CRT-29
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Nov 2023 18:09:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4084de32db5so18201505e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Nov 2023 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699639777; x=1700244577; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ng8cN8zDe0R53w/cTJkEAYIlBVh/fEa75Si1UCaSOlg=;
        b=df4paraNMLlyxFCFpRXcdQbwWQy5fAsPVEAv+k/X6GzdSe3q3BSIBNio0KeU1BQa3d
         54DE9Fl2ll0lKRnw1RV6VM7mEj9juEKBkwj8INgDsNu/l4Sor8tKAWmM3qA/aOcvdyFZ
         //2OebWQo1jz4lt6ojnmnHFU5LPA4k06NzObUEwaZhNQzyRT0XF6jzIhO1sSoI+i3urf
         GshexCYcmXw5MQfC8xm3Ek2/ygnWjqkRKwqEsKVeepSv1YQy1w/yC5EPQSOGc8fuYJNa
         ixpOikUdRN4fdZPV7E6sr4ih2hPtNeja3d89lvQNG1AbRm5Bk6zpLHWg1wI11xO+nj/9
         lFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699639777; x=1700244577;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng8cN8zDe0R53w/cTJkEAYIlBVh/fEa75Si1UCaSOlg=;
        b=AIOHuO+MsZGZcNPXn44MDCYA+ZWjMD8wg4+OnYHRwgcmcEM3PHDIb/WpFZ11KTJBL3
         4WHMevJGY9M3WTAjjRSo/2T3AuO0pjbRQislb79o39Kd3GGJJCLdRTeLlkZ5rhaiUv1U
         rvNmtnX6xTgw77ySo5otMNj4qQMYPpnjexAylBiCycRP2lYakeLTDAdYfxXY2pflR7G1
         qEv07OkSkEg3xP1GC/f9l8C0VWN9CFgMWze0ibKWZy0TtRViR6EQmXGdu8cR58525wke
         gxSTs7qf7MaUSWNillAC4lLLptYbVyBGoMtxFL7YKE5RsZIrxT5l5mWEy6NuKkivdxZh
         Xd2A==
X-Gm-Message-State: AOJu0YzKMZGrc1CbcBQ2NbbbqgqdsabokXCqILjGrLLE/WbM7RX3faPB
	4LAP5Uj3+s6SyI1SCviCWCRibw==
X-Google-Smtp-Source: AGHT+IHFi71LzP56sECK9cPzRrAXiprWtaEqlntnc4nZaUr/6hWWb4qHltt8nbj1kZsiALkEip55Kg==
X-Received: by 2002:a05:600c:4703:b0:405:3cc5:1105 with SMTP id v3-20020a05600c470300b004053cc51105mr116766wmo.8.1699639777205;
        Fri, 10 Nov 2023 10:09:37 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2169:e902:f0d0:1845])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d66c4000000b00327b5ca093dsm2359847wrw.117.2023.11.10.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 10:09:36 -0800 (PST)
References: <20231106085554.3237511-1-xianwei.zhao@amlogic.com>
 <eab3869c-7529-484d-983f-dd85ecfbeb0b@linaro.org>
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
Date: Fri, 10 Nov 2023 18:50:25 +0100
In-reply-to: <eab3869c-7529-484d-983f-dd85ecfbeb0b@linaro.org>
Message-ID: <1j34xdcwf4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_100942_707738_C4C3B7C1 
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


On Fri 10 Nov 2023 at 14:20, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 06/11/2023 09:55, Xianwei Zhao wrote:
>> The patchset adds support for the peripheral and PLL clock controller
>> found on the Amlogic C3 SoC family, such as C302X or C308L.
>> 
>> Changes since V5 [3]:
>>  - Fix some typo and modify formart for MARCO. Suggested by Jerome.
>>  - Add pad clock for peripheral input clock in bindings.
>>  - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
>> Changes since V4 [10]:
>>  - Change some fw_name of clocks. Suggested by Jerome.
>>  - Delete minItem of clocks.
>>  - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
>>  - Fix some format. and fix width as 8 for mclk_pll_dco.
>>  - exchange gate and divder for fclk_50m clock.
>>  - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
>>  - add CLK_IS_CRITICAL for axi_clk
>>  - Optimized macro define for pwm clk.
>>  - add cts_oscin_clk mux between 24M and 32k
>>  - add some missing gate clock, such as ddr_pll.
>
> Where are all these versions? Please provide links.

I have provided some guidance offline at the request of Amlogic.

This should have been v4 and the cover-letter should have summarized the
change from v3 to this. Unfortunately it was sent as v6 :/

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
