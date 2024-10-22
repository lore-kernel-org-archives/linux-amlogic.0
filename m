Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE7DD1CDCD
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2024 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jeb1Gdbqy+1okb3Lg1KbwfpeldEI1e/R535JyFYvVNM=; b=B+uNuh9NxdE8M1
	xtTBqbXtMLQpm3N7z1+kUKLxyBidCec3wao6Q0/7RprWzXIcaTkADYYHv6WL5gGO08jZOcogg6nrr
	l0/x9QFWBGymxTms/WyI9RyfADIaWxKJYdJrHoL8yD/0dTncKhGhYsLdx8IDJRn0aQCt58SxOYfiP
	Tp9l5kTcO4MnoSg8YGGDr63GrjgKIqisf5bZU6H0/H9uykKwQRNJ0ECtftnr/AvDYyM/JKjsY9ILK
	EP8aZi52acc/a1LBsTALbdNUT1Q5CwSG9Ye8jjO99Rn0wId/YOa8gtzdhEGtr1okYx2NDGI2nsH3J
	S/P7Sba+0ta4hxL2dDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BQG-0000000AOcz-0XcG;
	Tue, 22 Oct 2024 09:43:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BJN-0000000AN6d-40Fo
	for linux-amlogic@bombadil.infradead.org;
	Tue, 22 Oct 2024 09:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4fsVQUcARuIWhOcGodmkDQEe+tag8Qx5PkTwvtAzDek=; b=h99NHLibhq0PzKmW+6oJ1Jy0u1
	JIA/EAKwT0k1RiNshZUDOvwjImPB7bVoQQDGJoIeJkpdwaGgAKSdjoYpeVY/AcCTyqkztMw5xO8vC
	FE1NTpYCqRmDaIX7SEprNEax5NKt6elZo1JwYzmySMHPYnMZA05iZ0uu6nuLt46ifG3o53CTCQPJa
	clZe4dj2pfwsPQLT0g+p9A7llaNLhWYx0pEikLr7wNxTwIfekPg+VjpdwjMlMLCx4RfSg9fOWvN52
	k4mpnlJJpWe/ibLYeHhiQMYmwwJ546eG1FmssZyrQTs+907EgtWB0wtOc45k75YD8PbuSyPx9hXqM
	zceJZUPg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BJK-00000008Alr-2MQZ
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Oct 2024 09:36:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so59376785e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Oct 2024 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729589775; x=1730194575; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fsVQUcARuIWhOcGodmkDQEe+tag8Qx5PkTwvtAzDek=;
        b=NXzacs4h/gsoh2vPUIAED9HgmZvSAes1hm2JXkLWAjVUD/TeXuGlNec1told8bp6dC
         voSF4S8yPVsWSPid3bOJQmI7OJmLgmMW6r354SB5JzmzuuZOXCmfLyRuU0WMpeq4dxXm
         dTeQuCvD9weJsPxoh3dowdJZ0wNnlpvfrTKrT5pjQatr9IZb73HyhWj5C3Y+v6QKdZTk
         BE9Fm6H7oSIF/knEgIsbDff+liZpvgsyCWelnPbDt7pYZTV5Oip3ILhsb98ln6dATI08
         RFDkOoO0lUNLXjXsWH3BQoQ7iwJttzcvNnmFwOW6xrkI4p50lFsIR/QhDjVzKbHGKgoC
         VNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729589775; x=1730194575;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fsVQUcARuIWhOcGodmkDQEe+tag8Qx5PkTwvtAzDek=;
        b=PMAqdw7dugBOfyCQ+QbnWT++08o5z1GQWDtj+ggY+71Q2AJLaVzlKjERVZKG3f6/db
         FqyqUlMDmjD6b/N8+54wrEFz4+G5w2uYW3+MT+yTr5IGWnV4bCktaWJAemJAVguv54Fm
         UnaOXfGYKissEHLFH61G5rh2yDMbh6nrL4rbzY6I3A7Oz5B0IUJ2R2elzDYCvP3Xc+/V
         cGW4gPf+7mdnCr3lOazXdBU5vdUXsJCAaX2N4PYqe/DamwnAmim7U+4rSdUin/sco3WM
         6dXWtpWFDXG3gGEk0DBCGm8outYlRzQzvROn6kxBBQsureOnbApZdQ6AG0TAToCIoaE1
         zV7g==
X-Forwarded-Encrypted: i=1; AJvYcCUqx3vyTZ4HsGXIUnE2/k8Ee8yewdSF7XIn2Mr3aTIXKQcTo/NFVFTOsj5a7Qd4Snm3uT2UZ7wu6IzUH+Wg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+COIZRuIctHK+xuYQ9In465T6bqmVpKy7tkmd128PMuPrfboB
	pEFjM25f7nqJZav/efdafn3PLW+WwSTJMAr2OWBa0o90GP4RUlJ5LvrwNwRysbY=
X-Google-Smtp-Source: AGHT+IFMNwrhj0pJZPkzl5FYhTMDlK96/nSoyfy8b25ehdKKWw+4jVdDPhgV4SZ5tiGqcKSkTMexjA==
X-Received: by 2002:a5d:6b90:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-37ebaa7a72dmr8620512f8f.41.1729589775370;
        Tue, 22 Oct 2024 02:36:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b35sm6249649f8f.2.2024.10.22.02.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:36:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 3/5] dt-bindings: clock: axg-audio: document A1
 SoC audio clock controller driver
In-Reply-To: <1jzfmwjxbp.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Tue, 22 Oct 2024 11:34:02 +0200")
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
	<20240913121152.817575-4-jan.dakinevich@salutedevices.com>
	<1jzfmwjxbp.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 22 Oct 2024 11:36:14 +0200
Message-ID: <1jv7xkjx81.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_103618_815709_305AEFA1 
X-CRM114-Status: GOOD (  11.09  )
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

On Tue 22 Oct 2024 at 11:34, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>
>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
>>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++++++++++++++
>>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +++++
>>  3 files changed, 154 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> index fd7982dd4cea..df9eb8ce28dc 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
>> @@ -18,6 +18,8 @@ description:
>>  properties:
>>    compatible:
>>      enum:
>> +      - amlogic,a1-audio-clkc
>
> This controller is missing aud_top clock input coming from the vad
> controller, AFAICT.
>

You are passing it thourgh pclk so it is fine

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
