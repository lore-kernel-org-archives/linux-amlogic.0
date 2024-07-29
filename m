Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E31C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLLN738W4CSDXB5v3fYAPceb8tRL0+4GGs5OWVo8wTk=; b=LJh/v9bMMTwOfZ
	kdidjLC4LesQmZkJMvEBWRFTV5jrMmE7UriDnj2pJJPsa8yMRLcEjsJZ8vwm20/a0XORoPBS2s7nx
	uNMu8k1/dIPEXH+NavbhSk6Geisf7xsy/+DSudRJJICPM+bkU7oU8sUZyJNfHTgCvntR3J9IoDtIo
	z1f5qOMNVBUtY4iXkQGyg35yuoOivSKZyfcFONa1F5lyysR+MtLLFW+ypHYXPoYlp3DoNooeEAkWB
	iElHQf5PIqT3IEodQhUivgQhmuW/NbmTqDedTffcgFoS1othYo1XoJB1xSCzj2K/NtouHHBTabCxZ
	wmCc45C18RLVT4FvQbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRy5-0000000BoKP-2TY4;
	Mon, 29 Jul 2024 15:07:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRxe-0000000BoDh-0xje
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jul 2024 15:06:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428178fc07eso15096925e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2024 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722265612; x=1722870412; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=njQZsizQlq4/sdtT8UDhiDdPZRr50s77lCBzme8y8PDQgTujo9VnexMPbuJUsl5BNL
         PAG2pdcl0Twm1XSxSmJTushM+XvVFxgHGO4Bt2XG9VYLenxBGcHwA/Jymd2P75jVRs6x
         6oAsQ3VHVUaFyNVupICIl8kfBCvGQqw0l6nbw9q4THELufeHEHkqzAJAJAJ7Fz0rhXx1
         htmED2el1UwvB1BHfIPPgQNxX90m9pkFMlP3dqYbVZvXIOrce53Qv8fEr6VE6cTlA8Ii
         y9vXKO2Wynu4bYUYLWXbf/pOOG1HQt7jBvu+bhxmnv4K22TQHkoQVqseeXDXXs7u2CVK
         PADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265612; x=1722870412;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=Sc/2j2PQu6iEirEvAWLYjN3LkWfiTuI8p29SA1qIeBQ5uR3DSt2mw3jAT2hYo0ptbX
         3uwxzm+6Nx904oPyjYJoehvCEziOjPxgdk1acEfF25IUxOZVXTgjJn3ycyR0AianUvyK
         QISPOoQHRIHdlO3ktPW5GXJlfz5BeOjA6BHRSzBs2CqrPTCcty7LjwgWzop6D4dqTxcW
         vf8lfpmqOS/K04zoPJtbFonAlOGvWLJvAvAkySQBWcitO/ZYD6VKauc8R45nACaBZqQ7
         z3PtsN9U5vLA2dETvDdlCwvSoZRrEkPCQVcD1RfFyTeLS6ZPcQQjXYGFCiDKNg22lWrq
         pnUg==
X-Forwarded-Encrypted: i=1; AJvYcCVwTjXFxIjfzIPKZ4CPe2PT7qlQZO7Ct1GNPgXYee0y27PpH5QjfpOGxSFACxZautEeroaZGuYWfkVZYNUchm4xSGE2Fj5CjYgMuw1i1IU4Rgg=
X-Gm-Message-State: AOJu0Yz1ZoSKAwR/RRtDEXT1FaTdmMgJv+6Eil/qca1T4B7vAR3Zh+r8
	bgqND553un0QcDaN5iF/WviB3YVK+g50SqT+sHARHYBU7zTkH9roxlmjuG63evk=
X-Google-Smtp-Source: AGHT+IFOpQKJrPEBTB7GUU+M3eQUukpjNflQqjbfqksXjQSALpbGkhpQ80Fn1dUw9m4ErxOkFf+giQ==
X-Received: by 2002:a05:600c:4706:b0:427:d8f7:b718 with SMTP id 5b1f17b1804b1-42811dd19f0mr51394475e9.24.1722265611970;
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c067esm12408017f8f.20.2024.07.29.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk> (Mark
	Brown's message of "Mon, 29 Jul 2024 15:44:38 +0100")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
Date: Mon, 29 Jul 2024 17:06:50 +0200
Message-ID: <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_080654_275082_85F5D620 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 29, 2024 at 04:15:31PM +0200, Jerome Brunet wrote:
>
>> Maybe mmio regmap should '.use_raw_spinlock = true' by default when
>> '.fast_io' is set ?
>
>> Mark, what is your opinion on this ? I guess it is not the first time
>> this occurs ?
>
> I don't recall this coming up much TBH.  It may be that people just set
> raw spinlocks when they need it, or that there's not many people using
> relevant devices with RT kernels.

I have not been playing much with RT TBH, but AFAIK, with RT irq
handlers are threaded unless IRQF_NO_THREAD is set. In this case,
something preemptible in the handler should not be a problem.

The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
unclear here.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
