Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF5ECAC598
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Sep 2025 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYfIBA9mhlw+CZE3gKuz1czZiVUpddZ3dpcWICYQ0qM=; b=KPncuQuJx9g0sg
	9VoCI2sGotbcxpfRVFtMz/yYy57qPsH2UCJkVvy9s70ySqaupfWecuHkXklyncZDVG4zChxRRgJBW
	ebONlnY6++spfy4mT7BPXQ+gdgtXvNkI6VF1vod8XQl/iIUhxDi+qMiaYA75PTA3MHIVS/Jv9zlTm
	TU2zsf2BiEsUrygMsD9f4UJDFoVlsOo/38e/5tisnW4uvqF2DW+DRCIGjCsHhsnwJkv3Azv91P3td
	JGZ76XXaoguVC9vMTcxLsutgRxvAZYVlBkTmwiaTiv9Ka4R2ywWPj9QbjDqTPgXo4HIlwOC/6xSSk
	nAzPBOzLWWJdpYRQpoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySGh-00000007Qdt-2WGW;
	Tue, 16 Sep 2025 09:46:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySGd-00000007Qcd-1xL5
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Sep 2025 09:46:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45e03730f83so24288815e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Sep 2025 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758015989; x=1758620789; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKriTgmYlGn91P6qgtECUepZvJEA2Di6BahJZ7SaZyQ=;
        b=azIogIa41H9sd/OAS5Nv0rNnlWp/ysv3og9CUy39LEMQTFCwAtMEB2+Y+XJkL35p5l
         DG6QOG6y4dIOYXh6bbNeYucCj0fODiWXBMgtxKY4Y3nzrRnXZEgfVdGhNhXWUgKTd7Vo
         spYS6Rb798XhBlQAQLiOpL23gPmOMu6Hd7jVJwT0izkr7zDZVGbMu6JTUAlusNcazIne
         JsV6uzNoqOa3JStaTQAotDyW3lSmKHb3QCAWvk1wHQR8rM0P/nXxwoomzXPShEqQlc5S
         mAGlVV3JVPTs1+QapPIJT4r6eeGUOsFYVUtK178jG4racfR4afaz+HRrK0PK8Xj4gL2m
         Wcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015989; x=1758620789;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKriTgmYlGn91P6qgtECUepZvJEA2Di6BahJZ7SaZyQ=;
        b=T9rxq8uFgxb1lY8wlNYQpChdz6apXNA+loK/VwDWHS5MJMj5CXn4+aWpkfYflKsAv+
         x4dvqGb+ZK21la3q7OOvfkh4bcTZo02DBFNfY1hT70LHsfhcOtLwkFEVQU+hCy6cb0Zc
         tapRTUZbH/wOTfcApeaVlcmmRBkeSCT6PCYRSczSNeJmt2a9YPOPv6re3wC95G4F3Kgd
         XZAJimdUx53cz3/g+138pFWbTg9mioY7vJLMD89I9xqdRU8R4VW+06jzYop+x3LtMPC4
         ws5AjHdgLvJ/ciujd18NCiPuOHKHEkotd8EvHnzDWOmeNDLiR6Iq4/L8sQeglahiIoGR
         V5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK8I1uhOWXrWY06xSGh5g79bpDX8eT4h0HQ2XmBCImT++PvY6jnLK779XRhk9/u4/GvsxjJrLhFDVJFjms@lists.infradead.org
X-Gm-Message-State: AOJu0YwuF9ddPjgzxh0yIaD6UnRkDwlrHGDww/GAVNzKUVOf52BxlF0h
	jaIdm+000vsn3+S6xJcu/7G7Z6ZMw3KFH8CdIrioSfwLFopPGPYh7rJQjgp0d7kZAo0=
X-Gm-Gg: ASbGncuVlfj38bnike1/gOpVplpFr+bxi69cGaYDkSitQ+AiGbLKDyem5qv5PKZ7jsm
	HU0MSxX+coNTNh0R2u9rQNp5Qi/7dCLHaz0chjkAIqa7ZtyIGsy3fV/V5enazM9jDZDRhPmNXGV
	XFNwsqflMFJ0W1CvrxAVSHUsLzEFdljT0ZQKLRSWdm/rNBaqbaFEsORofEAUofxmzmXlOJtnjrY
	ZzIER71zso48y3uX7xQ9kVowdCXSyXnkifJjcXeXqhV1WSUdMlerMnpysmicVa/GvXp+tDozE3+
	fDmxvJCCyw+7bNLUxgIbWHK7agHf9CpbbjF0OFDRPLSxobPDvkFAZJK4VbaaP/hxrsUwJ/ZfJeg
	AGL46aMgvJ3xEW+/5DTEf
X-Google-Smtp-Source: AGHT+IE8PXskyGCers87Y7NP0MSYZZPH7pEpN8IMr6HhZYRCkIe+WiPVCA8noQ//F0XdONjDZfZtNw==
X-Received: by 2002:a05:600c:1c0e:b0:45f:2870:222e with SMTP id 5b1f17b1804b1-45f2a023010mr72082385e9.26.1758015989240;
        Tue, 16 Sep 2025 02:46:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a6cd:21af:56e0:521])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e8b7b6ff8fsm13195432f8f.61.2025.09.16.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:46:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <66f130b4-88d7-46d2-9f66-9055896d445a@amlogic.com> (Chuan Liu's
	message of "Tue, 16 Sep 2025 17:30:29 +0800")
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
	<1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
	<66f130b4-88d7-46d2-9f66-9055896d445a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 16 Sep 2025 11:46:28 +0200
Message-ID: <1jwm5yhgqz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_024631_512167_E0381262 
X-CRM114-Status: GOOD (  17.17  )
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

On Tue 16 Sep 2025 at 17:30, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 9/16/2025 3:47 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 16 Sep 2025 at 10:06, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> This patch introduces new clock support for video processing components
>>> including the encoder, demodulator and CVBS interface modules.
>>>
>>> The related clocks have passed clk-measure verification.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>> Changes in v5:
>>> - Add Acked-by tags from Conor.
>>> - Remove unnecessary flags as suggested by Jerome.
>> The request was "in an another change" ? Why was this ignored ?
>
>
> Sorry to bother you. I'll drop the flags for 's4_cts_encl_sel' in this
> series and submit a separate patch later to remove CLK_SET_RATE_PARENT
> from enci/encp/cdac/hdmitx clk_muxes. Is that ok?

Why can't make it part of this series, as requested ?
It does not seems that hard to do.

This is another unnecessary revision and the community will have to
review, because you ignored some feedback.

As noted by Krzysztof, you really need to pay more attention to the time
and effort other are spending reviewing your work.

>
>
>>
>>> - Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com
>>>
>>> Changes in v4:
>>> - Add Acked-by tags from Rob and Krzysztof.
>>> - Fix compilation errors.
>>> - Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com
>>>
>>> Changes in v3:
>>> - Rebase with Jerome's latest code base.
>>> - Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com
>>>
>>> Changes in v2:
>>> - Removed lcd_an clock tree (previously used in meson series but obsolete in
>>> newer chips).
>>> - Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
>>> - Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com
>>>
>>> ---
>>> Chuan Liu (2):
>>>        dt-bindings: clock: add video clock indices for Amlogic S4 SoC
>>>        clk: amlogic: add video-related clocks for S4 SoC
>>>
>>>   drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
>>>   .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
>>>   2 files changed, 213 insertions(+), 4 deletions(-)
>>> ---
>>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>>> change-id: 20250715-add_video_clk-dc38b5459018
>>>
>>> Best regards,
>> --
>> Jerome

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
