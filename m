Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD05E7716D
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2024 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkOWlR9rxFb49YhNoPLJfxznXuMWNbd6q5N8TNZynDE=; b=jR6keJEC/38CCa
	FrvKjCO0IXspW7MOY0/CttG+xV5t0e6Yn1ghxi3tbrL6x34cvp/mlVueUO865gLKd2cTWPJrpdmjb
	E1aYQm1li4irnVH3TkFXm2yC5JDkAhce2FjI2Hz0gQDlRWBp+ZR+pMXQZN1n0+yf1N2/HSIRwHcFs
	G6pf2pagjYlzI/0SaEOzt5+F2uuZ2sIwHEkmCIVh+VH31PUiOrDIB6RBoS02cwvLzL88nNYsqc6lL
	sQkoIWrtRaZSyJfsCwiXyFYtOXh+yx6v7wOMI3tdCY1TSKFvGbOytVUvJ8TPN15SxiEgeFSU1KkXw
	wXZBgRsAZEayHaiSc9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIt3i-0000000DLHq-3Cp3;
	Wed, 04 Dec 2024 17:21:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIt2Y-0000000DL0h-2CSB
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Dec 2024 17:19:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434ab938e37so376655e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Dec 2024 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733332792; x=1733937592; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T4VPTHC1HjDTFGld2HmMCi4WsaIbmTJEjJcmDhH4GE=;
        b=O/cFI4VXE3Qa+H2rQjLCWQy+wUCb14NmIMyUFGx1i4f2w7wswT0jKENsLuilAOh/LL
         P+Ixg10UO6jM1F2bhm1OZPMHj0wkjP+wCL1pmOJwUTRyi0A39UxD93G4wUFERxKw+mwm
         gD2tk/m+q2+eaFmL6HSgtBczYkKiV2LSbxdFcnUe08rlalWtFImr1w1sjyyq6n+sAyeh
         NCkYBL+w6uP3IYZDUc5yK7rlNFJlZejk8lLvkE1xP959J5ndVpw9lUyUhrtLyP7WEV7X
         Derxtk2TiqN9kgJxKgwFmqeLlTV8q7jQmbLabtHFU8Hnt9YRUdXHVO1mQevOzr5v6xU3
         EL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733332792; x=1733937592;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T4VPTHC1HjDTFGld2HmMCi4WsaIbmTJEjJcmDhH4GE=;
        b=n2cQNOudDwYt3wz9vzNnrP0NU9ysFVa4k39phtz0B6TMrtMJ4NhVJnB82nSaHLPTul
         7nAx5pg6caxWxSlYtRVbUhQ2u4/J6TpmEdqohHEVG9NRUu4xP/xacDkbiWGPw5ogjMDd
         LdVRDqDoD/90Ol3SwMCAIRR+nTC/l6F6i01ytF08Pd6E/EUbR0Xv21eYUNbxihvD2tPA
         irdf3ml5spl2dF1bGNGjhiv6pNp9MgqH/Ri91CW7lvZyVFQWlGT4FqYeCeCJvMh2mN4Y
         yQFdOcqUBlpBHYkdeTZ90ZILh6GxPSjEcXuqkP6vexG1q+TaaE5LpkCBGEn8eQNLbok9
         0feQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTM7hF6MbtpXRaBVZjsg365NlQbsINW4pea8N/W0Do+5KnxvXugrqYlg1QLRJQK/9aH1lwS3QNecE3v0df@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOFgt6dw/LuBBrHfreszswVPP2DVp6sP7Ln7niRzJQlNrAxKE
	siyweQCvFMphg6nW7v6sdplkYbBiYad5LC7nAZMGDuZBuUpkofDxaDrAeD1gCjA=
X-Gm-Gg: ASbGncuqXkVmeLFfAoc7dLz9Fh7USMO0jyqkHhrBXFDIj4FHWAaLB/ZCgURfYd0fGCN
	e8MOwKlpSwHb1ecwkhtgOPQgC8ZVgZNw0Z83k8NAFoLVXxRO/8S+sLdaHm8GDCTmvktHl0uYhED
	ehco9y42JRVL5eUFkPP2VOq9MScuH+ibtF99wBLFAGo8UbxRFfJkiA45dinf6ulUEmauI/S2NTz
	jfjrQrutPBh+dZ483YnuZ5poXyQ+SAjOz7M2BQdjywe/ELN
X-Google-Smtp-Source: AGHT+IGamjM/ufETyroPqKrH9H7GIRN+D0ykimmkcBZ7eAtT6byGOqzV/kqK41jyST7ik9VBo0aRuw==
X-Received: by 2002:a05:600c:3d0f:b0:431:5f1c:8352 with SMTP id 5b1f17b1804b1-434d3f8e3e9mr46322275e9.5.1733332792107;
        Wed, 04 Dec 2024 09:19:52 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd03:bc0f:6f7:54b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5206649sm31408795e9.0.2024.12.04.09.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:19:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 03 Dec 2024 12:15:48 -0800")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
	<df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
	<1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
	<37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Dec 2024 18:19:50 +0100
Message-ID: <1jfrn3l615.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_091954_707258_46A02067 
X-CRM114-Status: GOOD (  34.52  )
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

On Tue 03 Dec 2024 at 12:15, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-03 03:15:41)
>> On Mon 02 Dec 2024 at 18:53, Stephen Boyd <sboyd@kernel.org> wrote:
>> >
>> > I think the best approach is to add the reset auxilary device with a
>> > function that creates the auxiliary device directly by string name and
>> > does nothing else. Maybe we can have some helper in the auxiliary
>> > layer that does that all for us, because it's quite a bit of boiler
>> > plate that we need to write over and over again. Something like:
>> >
>> >   int devm_auxiliary_device_create(struct device *parent, const char *name)
>> >
>> > that does the whole kzalloc() + ida dance that
>> > devm_meson_rst_aux_register() is doing today and wraps it all up so that
>> > the device is removed when the parent driver unbinds. Then this clk
>> > driver can register the reset device with a single call and not need to
>> > do anything besides select AUXILIARY_BUS.
>> 
>> I think this is fairly close to what I proposed in the inital RFC, but
>> generic instead of specific.
>
> Ok :-/ I've realized that we need this sort of approach in more places
> to logically split the device without making it SoC specific. It's only
> useful to have the registration API live in the driver when we need to
> call functions provided by that module from the driver registering the
> auxiliary device.
>
>> 
>> I suspect the the generic path is likely to trigger more discussion.
>> I'd like to be able to finish this migration, instead of leaving half
>> finished like it is now.
>
> Is the half finished migration a problem for this cycle? I was intending
> to send the revert later this week and try again next cycle.

Not really, with the fix you applied. There is just code present in
reset that should not be used in its current form. I'd prefer to
sanitise the situation sooner rather than later.

>
>> 
>> May I add back the boiler plate code in drivers/clk/meson, similar to
>> what was proposed in the RFC [1] and propose the generic implementation
>> in parallel ? It will just be a matter of switching when/if it is approved.
>
> Sure. You can make devm_meson_clk_rst_aux_register() use the same
> signature as I proposed above so that it's a one line patch later. And
> definitely drop the imply RESET_MESON and depends on REGMAP part. Maybe
> you can put it in the clkc-utils file?

Sure. Few things I'd like to clarify

* I tend think like Arnd, platform data will be needed eventually. Not
  sure having 2 functions, one with the param, one without is really
  worth it. We could just pass NULL when it is not needed. It is not
  uncommon. Would it be acceptable ? (for the generic helper, the
  temporary solution does not need that for sure)

* You mean (meson-)clkc-utils.c ? I could but that would add dependency on
  the auxiliary_bus for clock controllers that don't need it. It is a
  minor problem really that I could just ignore.
  I'd rather keep this helper separate if possible.

* Why drop 'imply RESET_MESON_AUX' ? I would still like the
  COMMON_CLK_AXG_AUDIO to 'strongly suggest' RESET_MESON_AUX, with
  dependency problem sorted out.
  
-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
