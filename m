Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E124ECAC598
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Sep 2025 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c05rs29uuRWHakesBoh0UjJ19lotcBivL05rRTZ+2yQ=; b=nbviJSkNwUiz+r
	mQqvvsmb90flRq/PVz9sGIl1B9zYzsZQZisBC0s4LOH5whHHllzFBELftFVegI9Y0KTYlqVYH91dR
	fUkUJ85xigCDqG7LMDiE4B0cvYUEuzX2vz8x+x6W1yTazOqA1gMKCqbeucr8IHBntuga9Zt5kxjKB
	2qcrFvALQldzr1nSgHQ6BO4E+iK7zqHH/SNaPmT7mpcUeE2MdO3QvkIBC4JkkqM+Wgn7EFZOyywI4
	1f1Oj7OCn2KkphxnGLXzx+llpFOgaG5biCj4Z6BUrMQiORICYqQOVul3QUhym+BdnSJsrH5Xw6/2A
	m8p9yG4Xr8UW7A9Aq7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoBg-0000000Akib-2jkL;
	Wed, 17 Sep 2025 09:10:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoBc-0000000Akh9-1WJZ
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Sep 2025 09:10:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46130fc5326so5441225e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Sep 2025 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758100246; x=1758705046; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PlK2stUccurl04mbWawfAf/ha/VEIfyoutD9WxWnA1M=;
        b=h9U8CSKQpI2m2ZflSX3mB/MAy1UdC35NTDjeiheaMBRRr5EO/TVvJxJlbaX6aMfULW
         0aouSFetRBHlIdd0oeHpcAQ1Oe+8fM99Nh3kwqjwK81kR/W86XDJLe5vnAOVj4T/LO1M
         RrhHCschAkKveToLU8USf/ANKmC3HEz0SpBKPJ4uSNiTv5lScfSbySrmnSkSduEr/rm0
         VhGsjL5fns5XFlNt/Ld7WaGNwdCvzVziPNt5n/AxWxrmq4Ptx6cCr6W1ZlKVwLk/XLsu
         jL1Iw4ILbitGbH8xKot1wbBZR7HZgx6KA/bjWJfYuZxaDIK6yEyh1BV2bZlhVx4kHPnv
         tfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758100246; x=1758705046;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlK2stUccurl04mbWawfAf/ha/VEIfyoutD9WxWnA1M=;
        b=m8Y+QntoiYYfvMlYgOL3R49BbKjkykQNKmWWuLrrdYqf+XIz1JMN5UYaxYbhufk+Cv
         fNEpIFN7zUwa2tGhjNp3Vantev5UtQVyTtYVNsUtrnwkw/m2/2n8JzX1s63Cc1NmIlXL
         oWf2WAmbXwa9KIV7XEjCsh+CPfIh7tfx2FbMcOdFk48TeZqIcEaf7c+/GHfYi5d0ubvO
         a1n89HRxraqVFY+RVdj5lHSibqWc1Obf9OCqw/8fAK+oMYmxltkNf25pFGdwih6AwY49
         TYc6zzg6FTMU9NbCUuBOMTkxpNjJNmEu3k1YbKTfUoVCQxGKpRdmb+GQPhm/BClMO3ZJ
         rpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOybTQwFdODL5TJ9mZOlmdifMCNCwCME1zTVcEKNfqQEoI9v6xKgOTg1i5MtVckET5zodj5zgyP6kc3UVg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7NIcukKyjY7XhmDHqjTDWiHxgv/6p1boi5TjSfvJMJ+GCRJVw
	+qJoG9ShnYIHVUx2ouDdmC49Ww8lO2jCIS3Tpd92v6WT7bZpC/3yv9Yt4J79SUVdrlw=
X-Gm-Gg: ASbGncs8u5onURliDvJ/9kgrO1Cke0zF8HCUdct4HgVpWeISwnppVlyzqRAW2XP7m0p
	9/FMS7AiO/7z+GFhpokM8kQ4d1Ijn9ZS51ZBiOFX7TKGap2V9THYX2fUAaECVJ5PPgBfmPgu4nf
	DeQp2MjvoHBU0DaaZu/1n6dUsFER+/VnJK9xU5t1E3wHY+Lrl/bQYL0rfh9So1CbX7Mmfg0KzaY
	Q8zJCvKwB55vwndKKnufkT+KwHivn7SPjFVq3mxwNnSelSOLVWtkY2OUp+sOZ6m1RL5coFfXnyb
	tUCXywXj1LYntLb1HvvVXuWxFI6+IZYgWSEivQztqms7w8go7vUGkf7xnMOmsX9ejeCsf3kGjYU
	N/I3sczwQN8mJfQvFI/sZpA==
X-Google-Smtp-Source: AGHT+IFPGc7ic+PrwXQdYuhF8XZWH7tHR3Wzubn/3T39N6UzWqLydVcD4Osfm3AnC6uPAm7ruqpt8A==
X-Received: by 2002:a05:600c:1c87:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-46201f8aa4bmr12363615e9.2.1758100246219;
        Wed, 17 Sep 2025 02:10:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d458:6239:fdc1:d868])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f32181a47sm37857465e9.1.2025.09.17.02.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:10:45 -0700 (PDT)
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
In-Reply-To: <91935087-0f0c-42ed-8ad6-f6312240413c@amlogic.com> (Chuan Liu's
	message of "Wed, 17 Sep 2025 10:02:19 +0800")
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
	<1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
	<66f130b4-88d7-46d2-9f66-9055896d445a@amlogic.com>
	<1jwm5yhgqz.fsf@starbuckisacylon.baylibre.com>
	<91935087-0f0c-42ed-8ad6-f6312240413c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 17 Sep 2025 11:10:44 +0200
Message-ID: <1jqzw5h2az.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_021048_664735_D7BE076E 
X-CRM114-Status: GOOD (  25.35  )
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

On Wed 17 Sep 2025 at 10:02, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 9/16/2025 5:46 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 16 Sep 2025 at 17:30, Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>>> Hi Jerome:
>>>
>>>
>>> On 9/16/2025 3:47 PM, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Tue 16 Sep 2025 at 10:06, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>>>
>>>>> This patch introduces new clock support for video processing components
>>>>> including the encoder, demodulator and CVBS interface modules.
>>>>>
>>>>> The related clocks have passed clk-measure verification.
>>>>>
>>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - Add Acked-by tags from Conor.
>>>>> - Remove unnecessary flags as suggested by Jerome.
>>>> The request was "in an another change" ? Why was this ignored ?
>>>
>>> Sorry to bother you. I'll drop the flags for 's4_cts_encl_sel' in this
>>> series and submit a separate patch later to remove CLK_SET_RATE_PARENT
>>> from enci/encp/cdac/hdmitx clk_muxes. Is that ok?
>> Why can't make it part of this series, as requested ?
>> It does not seems that hard to do.
>
>
> The topic of this patch series is "add video-related clocks," so I'm
> concerned that patches adding or removing flags for other clocks might
> be considered off-topic.

If that's the case, you could simply reply, stating your concerns
instead of ignoring a comment which does not suit you.

And yes, you should adapt the cover letter to explain what you are doing

>
> In the next revision of this series, I will include a separate patch
> to remove these flags and provide the appropriate commit message.
>

Please start with that.

>
>>
>> This is another unnecessary revision and the community will have to
>> review, because you ignored some feedback.
>>
>> As noted by Krzysztof, you really need to pay more attention to the time
>> and effort other are spending reviewing your work.
>
>
> I'm still a newcomer when it comes to upstreaming, and I'm not yet very
> familiar with the rules and processes.

That's just not true.

You have been doing that long enough and have been reminded time and time
again not to ignore feedback. Continue doing so and you'll be ignored too.

If you still feel "unfamiliar" with the rules and process, then you
should read them again:

https://docs.kernel.org/process/submitting-patches.html#respond-to-review-comments

> I apologize for any inconvenience
> this may have caused during this period, and I sincerely appreciate your
> pointing out any issues with my patches.
>
>
>>
>>>
>>>>> - Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com
>>>>>
>>>>> Changes in v4:
>>>>> - Add Acked-by tags from Rob and Krzysztof.
>>>>> - Fix compilation errors.
>>>>> - Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com
>>>>>
>>>>> Changes in v3:
>>>>> - Rebase with Jerome's latest code base.
>>>>> - Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com
>>>>>
>>>>> Changes in v2:
>>>>> - Removed lcd_an clock tree (previously used in meson series but obsolete in
>>>>> newer chips).
>>>>> - Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
>>>>> - Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com
>>>>>
>>>>> ---
>>>>> Chuan Liu (2):
>>>>>         dt-bindings: clock: add video clock indices for Amlogic S4 SoC
>>>>>         clk: amlogic: add video-related clocks for S4 SoC
>>>>>
>>>>>    drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
>>>>>    .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
>>>>>    2 files changed, 213 insertions(+), 4 deletions(-)
>>>>> ---
>>>>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>>>>> change-id: 20250715-add_video_clk-dc38b5459018
>>>>>
>>>>> Best regards,
>>>> --
>>>> Jerome
>> --
>> Jerome

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
