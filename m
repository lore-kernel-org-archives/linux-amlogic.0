Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50280CD13CF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9kIXIcxyFfbqOZLYIdRG094pkc8njt2i9TB77BeM2Y=; b=kbIqBVO/XWglEJ
	PnKizw/m782vDIykqQR/yZaOjre8ZuvEJ1ZzHMlZ0fnj1ZB+tCK6DiEMLg/Nr5t9qeOeQ7ICuhLoE
	Gtl638KYelHwWTI9W8vbIvx2WSXcYeEYI+zjRa8wte1BTyk44jOfRzazzkpxFqYHzzrKiYVr8WA11
	ENMrNtus0ODzV7sim/ckAjlLVQj6yL96uGmTSJ2FAqI5XufGugg/RWX0MybGLcWxP8pA40gG/vqwV
	oOWoSmXPqZ8BE9dITrGLMIz5F/gvRizO+TKNXBXEXhlu3TkIkq31lhPl7J//jpbGW9g0P6NEoKsW3
	NvNWiCpDu3waxc6vt+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3l8-0000000DmqT-0FlS;
	Mon, 02 Sep 2024 09:54:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3kZ-0000000DmeG-0qol
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 09:53:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-374b9761eecso1755356f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Sep 2024 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725270809; x=1725875609; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap1TFjvG1Ip3qZtO+pSCOcSztVaGL1F8QNxcVrxFmH8=;
        b=RLpLzxSYxRUTZgFz4ausa4tEdb6WPC+dqc/g2tX81fEPtP5Ajw6fjRPhu5VQpqQj9I
         syFUE69k+9IFgnKq6GJ5z1aUYiI/5QKa+WGwGePsH9Th8lN1D6Q9vXTQ5ktpud5g1RzS
         6LNMQHawCyKvRoMWM96nAwwAwvG2k3LrdUOHpcsszTdnXuzKKwbolt57CCn9tjb7V0L3
         h9+E9icXj7Vd5TuYrh8Unftw+EixOAJ6PIMDMWI1mcxqOo8NMV1fvMM7/i0N8z5/f+uN
         LMxQgPYcpc1oZcyBMTDwHBT8AI+dHV9Mmn6pXr2VaC7jz8+peXuZOgan4+HyiqSFFu6t
         Ifiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270809; x=1725875609;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap1TFjvG1Ip3qZtO+pSCOcSztVaGL1F8QNxcVrxFmH8=;
        b=sJ+8ubYE4kPGs/7aFdM7vnjMbbpGAEW989wTpDU1gvMzdONo0U/MF+hwu+8CKgDTR8
         vVAoq1MWFvErWuK6OwRSsacF2HEsb2ItCtK95BQSQ2vUBe42avQAnDp/6lwAbgWnDSdN
         FXIIqqt4zYpFaNtK1b/0Mv+wHq/sU2ruqhZeLfr3mf/MNCcH/H+n0V8dBF4hM66a5J7+
         RPfwze6uhk9dIwbiwanxXDFZcGcC1aZHdYxkxYyYaMEhfgEenoit4jiuqcURIzAp+o88
         3bakEh/Eez4pbkCnOVAheRl+h1aWwlWBWm2dS17e/U0ssIKYqhfJGZb6w9nGvFipIuhc
         g+sw==
X-Forwarded-Encrypted: i=1; AJvYcCWpymwuF0kh5RTLd+rNwHFBXYLyMg2V0q2V5j9PCxhGqa29NMiDESwJwd544zeQovnQGo5d42JtQc3Lt952@lists.infradead.org
X-Gm-Message-State: AOJu0YwH48JnypuuSlrg3d3VR1tpyLR+U2ImWY1CQXp7h9+CkbiS/eQi
	2c0VCoMnNAjT+oVTkgaxX4VNUewdU98NVSdquhSYYIQ3nVKzeKIUCYp7jeEC4UM=
X-Google-Smtp-Source: AGHT+IEBNwIDeLBGu5sJyen1fHV8CZ+NfcZkdnYwyDXfXu0Okz+GmfMqYb27o4OdqdSGbmDR+fVhEQ==
X-Received: by 2002:adf:f206:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-374bcfe5bd4mr4272968f8f.46.1725270808862;
        Mon, 02 Sep 2024 02:53:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a2ea:8e6e:d881:76ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c5ae48e4sm4162458f8f.90.2024.09.02.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:53:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Stephen Boyd
 <sboyd@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <34bc2d1ceef7bcab3d9b78de588e996c2d2ecdd3.camel@pengutronix.de>
	(Philipp Zabel's message of "Mon, 02 Sep 2024 11:47:34 +0200")
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	<20240808102742.4095904-9-jbrunet@baylibre.com>
	<812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org>
	<1jsev0wj8y.fsf@starbuckisacylon.baylibre.com>
	<34bc2d1ceef7bcab3d9b78de588e996c2d2ecdd3.camel@pengutronix.de>
Date: Mon, 02 Sep 2024 11:53:27 +0200
Message-ID: <1jbk16s7oo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_025331_268480_BDED0A0C 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon 02 Sep 2024 at 11:47, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mo, 2024-08-19 at 18:49 +0200, Jerome Brunet wrote:
>> On Mon 19 Aug 2024 at 18:33, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> 
>> > On 08/08/2024 12:27, Jerome Brunet wrote:
>> > > To prepare the addition of the auxiliary device support, split
>> > > out the device core function from the probe of the platform device.
>> > > The device core function will be common to both the platform and
>> > > auxiliary
>> > > driver.
>> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > > ---
>> > >   drivers/reset/amlogic/Kconfig                 |  10 +-
>> > >   drivers/reset/amlogic/Makefile                |   3 +-
>> > >   .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
>> > >   drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
>> > 
>> > Are we still in 1983 ?
>> 
>> I don't quite get that remark or how it is helping the review.
>>
>> > please use reset-meson-platform and drop pltf completely
>> 
>> You are requesting auxiliary -> aux on the patch.
>> So which one will it be ?
>
> I would prefer to drop the -pltf suffix completely and also to drop the
> "reset driver" -> "reset platform driver" documentation changes.

Hi Philipp,

I'm not sure what you mean with the last documentation bit ? Could you add some
details, I'd like to get the next version right.

Thanks 

>
> regards
> Philipp

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
