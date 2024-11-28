Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB61D69113
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4MIsLVjkhXfAP1uPU+3he8BGOmfGPPcpJyEUSksy4c=; b=f3YIYOfjTMAg8A
	a6XAOm8O78JTuUnSabH2ktucdmAVKf+3MWhGU4BzVrqr5bh9tdxgUxR67X69skGSxWnVwKIayvCsp
	bprAZnmo8Cm9VxMdN9r60t8nZx8xTSiMtKRa2uSNEpezW3pyZpSdmmX6AVuBDXgmsqTPODCL9u9Yi
	uGq8RXBZoJesl17S1VJHWqAX8RfIcqhxc6VmN1MZv6bpQSDNTU6LKlkdZXbrS3TXFycsmtVv8geVi
	PraSPHr3r5lGb3J63rZWs+u7WBkyRAiKzMf74SHxVrf+c1eatEs45MCJ3V3iPfBUE/3Sd48533VTS
	tssqMmJsOw4z5u3rKIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg6o-0000000FpNe-1OGd;
	Thu, 28 Nov 2024 15:07:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg5n-0000000FpCp-3bCk
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 15:06:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso8006055e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732806366; x=1733411166; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=lLdqlmq7sSOH7BAV07k0DeNsN0flHSCf5fofMkx1VHw3d0RCW44sTy1Mt5ALLbQzxW
         6Jh0Wn1L5KI3uiXVQuuZmwX5Uv6ZJDZi/VvIW4fwPptSnN91uRPyZcRNefHphDEbK5E+
         4h1srckh8CAAoHpLh2frFn8b/m13OWMGCfOrRl81tbWXdz66WXKpfiLbzXH8KwMP9DVi
         a0WtvqQA3ljVHzBOUtpe2bAGSVk8hxxq7MT/X7owdbyKEYzKb3NO69ikXhKsBw471OjJ
         pVYgt8vdgNQlmn6XGW/G6Ic3tfKQakaoSWdqzz80P9Dopk+daeG6wo9xs97o5ZZrQgmW
         K/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806366; x=1733411166;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgMI2XaAkzSEk7PCM+/3QfgY6sh/m9iqNd+K6a7QDCs=;
        b=bFlsT0/elmLOMTj7Gv1Wt/BTOfdlW9HigF6KykON0jYBfZaECIgywZINRZvkOyMbvD
         GJE6r9hyo4mRAKPKIE6WVQfbZ4sS8XgMSvc1Yer5s7KAxDiQFsYzfq9sCanaz2y/7j4W
         WYs6pJU5fR7s1nCMVHTruCNN0bswILB8b/boPiXJunKAfRbQp9AdBTw+1eHatFmAcf09
         MumjD/DfwKNhmmWRwohVArsj3tAQndy3jpC1imX13UioqchQJTCOYifngoRTbxG2BpCG
         A1x0cG1glp1mIy4sjvRMnztklV6n30EmUtZBuez/pInUOqb3kbZtky/2rDp6PcpeFLhI
         RDPg==
X-Forwarded-Encrypted: i=1; AJvYcCVzM1KQBvrXscVQEKO5DHdtxHpzwM/0GJo0rQslVTgaT9OTZJ5iPff76pyUFa2sBKpozxDVwF9s3YEOUJPL@lists.infradead.org
X-Gm-Message-State: AOJu0YxrLyw/kKFnpr5x7qhTd4qSX502F0QIhyZvsjXzs3LOvzbUfRHT
	YgEQD4jK7hPVXrTPJ+HTrxTktsUsW7g9uQXHLEeqZudAKZDb/7jtTTdEkt5OH1o=
X-Gm-Gg: ASbGnctnpH5Drw+aYH6OHvQkJLdHDc1ZYV6Jz0qHYoNqNJ7lsDShtwfqObONke4nz+l
	2/wj7FWD1Q4Pzg/GKtCu2Db279OeegLJUqcUBRtfga788P21/eaC32CMpFZ61HwMF3fG8uiPbT8
	RkIfRqzFKAiDIx+DiDQBXixf1uXJuWacDgpo7xRUyR2vm261uu8p9DJBBDKCkEXtfTg3yvPTXe+
	vk+L0H9G329G8ZmBRtCCbz1FwsFD5aoXpJB4hveAFfoYzHeMw==
X-Google-Smtp-Source: AGHT+IFCQOlNDI8ArzCZ2jGZrEopkwYDeCZvjEQAGp3/JK0gSJIUVVZoGTxQH/hrEMSp6P2HzE11Pw==
X-Received: by 2002:a5d:64cb:0:b0:382:4978:2aaf with SMTP id ffacd0b85a97d-385c6edc515mr5523043f8f.57.1732806365996;
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2dba8sm1893959f8f.1.2024.11.28.07.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:06:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 15:51:28 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:06:05 +0100
Message-ID: <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070607_894615_F112FC19 
X-CRM114-Status: GOOD (  23.78  )
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

On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>>>> All clk, pinctrl or regulator are used by other driver yes, this one as
>>>> well, sure.
>>>>
>>>> What special about this on is that it is an auxiliary bus driver.
>>>> It is directly instantiated by another driver. That's where
>>>> it differs. The axg-audio clock driver instantiate the auxiliary reset,
>>>> it does not use it, which is why it makes sense for it to select the
>>>> driver.
>>>
>>> Can you explain the logic behind this design? It seems that the
>>> entire problem here is the split into more drivers than it
>>> should be. It's common for clk drivers to also act as a
>>> reset driver, and my impression here is that you were trying
>>> too hard to split out the reset functionality into file
>>> in drivers/reset/ rather than to have it in drivers/clk/.
>>>
>>> Could you perhaps move the contents of
>>> drivers/reset/amlogic/reset-meson-aux.c into
>>> drivers/clk/meson/axg-audio.c, and change the exported
>>> symbol to a static function? This would still require
>>> a dependency on the exported meson_reset_toggle_ops,
>>> but that feels like a more natural interface here,
>>> since it's just a library module.
>>
>> That's what we originally had. Reset implemented in clock.
>> I was specically asked to move the reset part in reset using
>> aux drivers.
>>
>> https://lore.kernel.org/r/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>>
>> Eventually that will happen for the rest of the reset implemented
>> under drivers/clk/meson.
>>
>> It allows to make some code common between the platform reset
>> drivers and the aux ones. It also ease maintainance for both
>> Stephen and Philipp.
>
> I don't understand how this helps: the entire point of using
> an auxiliary device is to separate the lifetime rules of
> the different bits, but by doing the creation of the device
> in the same file as the implementation, you are not taking
> advantage of that at all, but instead get the complexity of
> a link-time dependency in addition to a lot of extra code
> for dealing with the additional device.

My initial rework had the creation in clock (note: that is why I
initially used 'imply', and forgot to update when the creation moved to
reset).

I was asked to move the creation in reset:
https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org

We are deviating a bit from the initial regression reported by Mark.
Is Ok with you to proceed with that fix and then continue this discussion
?

>
>      Arnd

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
