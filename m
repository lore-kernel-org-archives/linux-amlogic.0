Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51223D6911B
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcjRtOKA1AQgC67ckVQc6T9p/o/6vN3a4pATaET1FW0=; b=PaWOli4CeJtaHT
	/ocSDbx2XByEdNpyNm1uEha4GLIxq8+YITJvfDdPSurS760pOC7FSa/Qy60fpdKiZi9Uc99hNInn6
	jdPahFi3zwAwnt1+MFgl+Ccc50N7ELQfxPRBNTAxaWPneLn2Hcj60QeboZNaSEj0fPb+IMUBTAw0f
	XLTyxJ6do96s0H48JzPpaKB+PQ/J0S6DkK5GriPHhBo//k7HjwlTYvetPspFDZq6VQmMV4iy+lAcQ
	y/QeKhdSKund/hF+9/NG92mBjRs2yXFLvsD9S79V4xLt6sgClc+qBqREYvFNnDzJJ+gveaDsfH4Zn
	Q+XWDXO8JLQFcRs+anBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgrB-0000000FwS1-0qMF;
	Thu, 28 Nov 2024 15:55:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgpw-0000000FwIA-1TjQ
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 15:53:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4349fb56260so8367585e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732809227; x=1733414027; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=HybmXqW3YmL6uRqRthG79sVzHyatclqD77X0TBMeFsAvGlBo9y990DyBdqLWAa98pz
         7wujkxLxUldrwJJbmrUpCoLyedgsKAbJx6QgDczzb2mnzoVAdzOMyc9RFU4sr3nFEId/
         DRTn1VqWpvlVJs7zGj4PoYWYv4hVaD9xuUH8SLntM6TCIRDIaIJWzreIPJoKt3rTp74R
         azE9VqL9pigzvUzgK0Ro9dKoWgXBA3vY/FQNffHFcm3KFcDM8nh8acZe++3ZVCUyocmy
         0eV7Vo2VOXM2ZM5kZE1Mem6kbVXqabvA8246BH4mIy3MuvXizVtPnfiSiYx6WTCFlJq2
         RH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809227; x=1733414027;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=XQUwA7XwX62LuidxcHDrmjt49Uf/fiOZdQqfh0O5uPUT5lUK8G2d4djQY20UOQWveJ
         gSrM7RQZrrZE7+RvOSRbFoz7j3Knq0knwLjiQ8d1eUKLViyXARG7coQr3lWbQX2bL5Y/
         G6nEZS7YzeAnP//bWlBgrE3R9sfjY4CT8bE8af0Ao2128m1R9yXNlx7WQOkMFNYGmqy0
         JczLiH4l8y2a4cdbuM9T+7FPlCSo5O/2TzqI/TZTNw9Esj4wMMu/XpOnLtpBfQHSak+S
         HqGC6o/MUPemasXt7RTuQUG5GRxQQECsMMmabUb7F1xSUgrv62bTJIPVZhOsdG8SrRNL
         AVCg==
X-Forwarded-Encrypted: i=1; AJvYcCVTf7dt4l7w49Dh5M1JcTKHxlchGMy60R9ONcjmctBbvjUdmvJcYPvAzYzaCgy2cVnhgdaxay9v8+ZgofGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwxfjHw4asz0hFnH93gPk2jg/fE75Wbv9wA47cjTX8GkiIgx69a
	t+URqFTiL+zW2xEP04DEqfgd+KSNRn9uJ3c8VfzLlD79DwJFrZhhQ/b3yYinAX4=
X-Gm-Gg: ASbGncsOdYIHxPiS8zYxjgJdz2eTvOs4oHK7TPZVgSpfkh15zevpPgCKK2uRpKOJAri
	1PFn8l79Yiz0+o0d9+RqZJAv+m11UZ5HRiPEiF4BaukoJTt5ZTC+0cUBLSw5Ki4f34YK44pYHbo
	iB0rZ2OwmTkZ7kM6BgofK7QdHTlw+/UCaASeE3HZqkzTYsvxnImu50iGaAh5jAfTvu56Q9DBuLM
	3JRAhri7t1tNhnJflr1JvHhYWsi431hkBTpLcRQt4xwSIAXAQ==
X-Google-Smtp-Source: AGHT+IGniJq3jqV+EYYIMc2ZyU15P38lX7DI3pP8iwwIHzl+aDRDGlHZnT2XwseXds/67vDoiz4FKQ==
X-Received: by 2002:a05:600c:4747:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-434a9dfc3d4mr61829395e9.29.1732809226700;
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76b52bsm57165365e9.18.2024.11.28.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 16:34:46 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:53:45 +0100
Message-ID: <1jjzcn1hiu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_075348_425157_0549447E 
X-CRM114-Status: GOOD (  26.48  )
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

On Thu 28 Nov 2024 at 16:34, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>>>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>>> Eventually that will happen for the rest of the reset implemented
>>>> under drivers/clk/meson.
>>>>
>>>> It allows to make some code common between the platform reset
>>>> drivers and the aux ones. It also ease maintainance for both
>>>> Stephen and Philipp.
>>>
>>> I don't understand how this helps: the entire point of using
>>> an auxiliary device is to separate the lifetime rules of
>>> the different bits, but by doing the creation of the device
>>> in the same file as the implementation, you are not taking
>>> advantage of that at all, but instead get the complexity of
>>> a link-time dependency in addition to a lot of extra code
>>> for dealing with the additional device.
>>
>> My initial rework had the creation in clock (note: that is why I
>> initially used 'imply', and forgot to update when the creation moved to
>> reset).
>>
>> I was asked to move the creation in reset:
>> https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org
>>
>> We are deviating a bit from the initial regression reported by Mark.
>> Is Ok with you to proceed with that fix and then continue this discussion
>> ?
>
> I really don't want to see those stray 'select' statements
> in there, as that leave very little incentive for anyone to
> fix it properly.
>
> It sounds like Stephen gave you bad advice for how it should
> be structured, so my best suggestion would be to move the
> the problem (and the reset driver) back into his subsystem
> and leave only a simple 'select RESET_CONTROLLER'.

Okay, though I don't really understand why that select is okay and not
the the proposed one. There is apparently a subtility I'm missing I'd
like to avoid repeating that.

>
> From the message you cited, I think Stephen had the right
> intentions ("so that the clk and reset drivers are decoupled"),
> but the end result did not actually do what he intended
> even if you did what he asked for.
>
> Stephen, can you please take a look here and see if you
> have a better idea for either decoupling the two drivers
> enough to avoid the link time dependency, or to reintegrate
> the reset controller code into the clk driver and avoid
> the complexity?

If I may,

* short term fix: revert both your fix and the initial clock
  change that needed fixing. That will essentially bring back the reset
  implementation in clock.

* after that: remove the creation part from driver/reset and bring back
  something similar to what was proposed in the initial RFC for the
  creation and finally switch the clock driver back to it.
  That should provide the proper decoupling your are requesting I think.

>
>       Arnd

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
