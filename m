Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A39C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 07:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC09B206D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 07:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGq/yE6R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eepHxWx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC09B206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zjMK7jIMHarL9LWjkNTe4K3BQ5P/mxUPI5N5pElX3cc=; b=eGq/yE6RtnxkKhl4WyX9hYqwCI
	EM5vaofKuv58SYQ4NgNH6zOVOBB4QKa/if1F4112tGihi4b1daB5NctGLhWCuppplaC2DfFUtioUL
	dtc1Nvkmkt9lhkNcCwIBZfAByGYdrUbfuXa3sqQ/iQxKUQVXJ5Vb8gDMx2l07gQE3DZ0g1R1oW7rb
	IDzwoTg2Lxp0y9VLZQTT5O+x8wf/TMemAv1L7Kr62CTp7L8PeVYTP3WxG+u/LfAbfeI0ZFg13miAz
	XY6jHsjNip98dJCgG3UFx2wSrTaa+INWSVXFPAaAsiDYu8YAPH0fUU5Nt1NDF5tMVOSgEifLIn3rV
	h17iQAqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPLfB-0001OV-LE; Fri, 17 Apr 2020 07:43:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPLf8-0001Ni-9h
 for linux-amlogic@lists.infradead.org; Fri, 17 Apr 2020 07:43:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id z6so1895964wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Apr 2020 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=7VxUyCozUFRQ3HWyk/FR84Y855XH8vC8ACtL+uxdHOg=;
 b=eepHxWx0UCQ3bBjYPAxbl27Om6GC70uRgirDesMlw0GcwtwctP16SCiHB+9lipG9Q0
 MgNdJoEZVSmbzmwNbFctN8vwR/E4WL5PrBitcvaR4Mv5RZyqao5nKchsF6SAoVjQw6q8
 1sBR/TQ8qY8RmucdLYRWbxuvwjwkdplwZck/fYRcvy1zb+UVhxu540CJET3ACX9t6WuQ
 IAlO3q/oQ0fiIwt/0iD1Y5oFpSq3BcdbdHfOVxTsU7YR4v7fa0aOShrllZ4IZQDEdY1z
 wcrFjOJJqsSYcm+HvrKBxOn3cHvgNXvN8UbAciWfiS7exv4J4Q6YoZlD4nsCuLB51+ze
 HL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=7VxUyCozUFRQ3HWyk/FR84Y855XH8vC8ACtL+uxdHOg=;
 b=Pb8Xafg1k/mQZNJKYuFLS1yF3q9BWNdz46bpIoeeCMWRNGcRfRz4V2/WVwdVx1SX9B
 yqRJeZS0rr+2z5atC1+aO9QgB0RwNpP/uL2YA6hCykPFmdwJuWD1fvmvdyyLVeZYggzU
 P3ynqfY+S2tNlZeoTaIKTbLF6DVN3jYzmsdDCtQj502q93zuGqd3SNyl8E/H3k4NOl99
 /2RMVnrKaMsXDb2ewKki8CmUIGJZHOsXjqQ0CrMrenNis+sIP2PQJ3rNV95h4S2dKNqf
 PcvowFIRu6o7Np5MW52R7lWdLiPU9sTsDoeGW66Y05UpRYG6+Kma2GsaSDvr8YQ2m9Tp
 Il0g==
X-Gm-Message-State: AGi0PuawOwPJIfWWYisvrOT9msM4CwI8ExN2f9KLq95EFuS34D4VAGP7
 R1PajGe7r5aG6niqjw4Ucky2ww==
X-Google-Smtp-Source: APiQypKB/8+cZvXsHO1NRHGVVpm+LapGF68siOZwDYjt2dTxd7u+tUAFWwcTxeJ3csNYW5kgsVQ09w==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2124159wml.189.1587109423806; 
 Fri, 17 Apr 2020 00:43:43 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id l185sm6779244wml.44.2020.04.17.00.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:43:43 -0700 (PDT)
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
 <20200414200017.226136-3-martin.blumenstingl@googlemail.com>
 <1ja73bbtqt.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCAtSPTHfbr5KGNFFg3eo_d2p2q59fQfMXu+XkOb8WVrDQ@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/4] clk: meson: meson8b: Fix the polarity of the RESET_N
 lines
In-reply-to: <CAFBinCAtSPTHfbr5KGNFFg3eo_d2p2q59fQfMXu+XkOb8WVrDQ@mail.gmail.com>
Date: Fri, 17 Apr 2020 09:43:42 +0200
Message-ID: <1j8siublqp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_004346_401043_6C1C3699 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 16 Apr 2020 at 20:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Thu, Apr 16, 2020 at 12:38 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> >
>> >       if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
>> >               return -EINVAL;
>> >
>> >       reset = &meson8b_clk_reset_bits[id];
>> >
>> > +     if (assert == reset->active_low)
>> > +             value = 0;
>> > +     else
>> > +             value = BIT(reset->bit_idx);
>>
>> if (assert ^ reset->active_low)
>>         value = BIT(reset->bit_idx);
> I can do that, but I prefer "!=" over "^" because the result is
> expected to be a bool (and because I'm not used to reading "^" for
> logical comparisons)
> will this work for you as well?

yes

>
>
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
