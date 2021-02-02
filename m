Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3E2C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:50:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC8F64EAA
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC8F64EAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=btus4I2LrBzmKalWC5/ikw9dB9rzGvOFsClpDYzsLGI=; b=Zxb1eEiwflmNoeJEB8Tzl2JlT
	5JFjrgJ9ZA7V6tM1KMaxQMyqwn6FfBJfdOacRblNV72nC16Uqcj0sp36wzrtbhHEdgsqKYYDVYkuE
	XWS5/pwu+4X9mqcRIht+/g4o049K7dCoQvh9bKpeFX/pgr8sVatp+LuWbY4EBgagBPKg+0zXDstRa
	4cvM4h/3XdEf4NmkQ+LY3KGPR5WQdKsBVdrKMumkQ6mZ5+6w21epNH/KxHEYUW7pOWTxfuvm2kUAb
	g9XdeFtaYH/hc/Aeu1qCUxbGcLGTJUxM7iDnrNrB2ZlcLFDUQbiHyXiZhhWoARF7FMO6pwDSs7cMJ
	WDIL81b3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ju1-0008OT-3f; Tue, 02 Feb 2021 00:50:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6jtv-0008N9-GE
 for linux-amlogic@lists.infradead.org; Tue, 02 Feb 2021 00:50:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id t25so13760918pga.2
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Feb 2021 16:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=27tKhSPFIqMlc7ipauT/Jyzv2QmoBByq5yY9O8csaB0=;
 b=FGsXTgnbWdL/VfLwzPmHXFsdESL4PYfRb3bu9bkTk5A+FSJtSvsRI8iVTfhw/+7tzR
 XO6932S5OtqRqOHKwk5Ytm9iqkR2iZX1aTTolJRNWvnf/CDU4I3p53Y0NtRQ9MMzE3KP
 lIF8TDVxuxzKmyW/416vsts5j+b1IYj4k9kbT6aB7F/ejeDR2WPCxvVl1gptxoOJ9PD5
 cFEzVUPe2njXRgt8TRuo/w6amKL4KVWxf/2/PTqTcn8TMgWJ3La7F99SAQtBH4MoTXPw
 cscIobbem362gSuMW1Tezctu5n7MJMjQIcKu83J8OPMBUuinosJgI0rwGQkIDGGHaWDC
 mqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=27tKhSPFIqMlc7ipauT/Jyzv2QmoBByq5yY9O8csaB0=;
 b=hKsEhFDeoq9N2ymNHAaiGLGj8JgtdrZRTdCg3C2mmMBqsfOFoNm5k8zkwKNmbw4cE1
 b6fhKhChosFU6GQ1cHvEgY489Jgx5L1Jq0aJf7DR54HZEA0/fTMo13EGRm6uz4wUgbuQ
 uD6/BWKW3pmxmtJ8TZaGkqXWLLCPsPLKEU4cczCT8Nz5RnTTh56tlkos+hVjDU1ts+WS
 ChXQG8iPMi1/dTjF4Mm6+wkGxqXrw14XsfolnuAf6EEJLgEsRvfkj/yzWZLmeMEizqLx
 fOJfIVekJWNSMlcrqg8MgQzyrulMSKvRySZS59z8ujc2MX1qHLbi0BZW49BRiPxva6V2
 zebw==
X-Gm-Message-State: AOAM533xzwzv58Lnea+exDC2h86YMCjY8/Rd5EHVdpdD7YOdmaZV2BMc
 E4eoRH2ioMQ3sWtj2YbMSy7XfQ==
X-Google-Smtp-Source: ABdhPJxkIhp3kWe0EgoOtzHX/utXf4RXQ3p3onEWFdayXG6hNlmdJuwme8HwjvDmSsXhXoBpnbLVsg==
X-Received: by 2002:a65:590d:: with SMTP id f13mr19575154pgu.38.1612227037223; 
 Mon, 01 Feb 2021 16:50:37 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id cq2sm595324pjb.55.2021.02.01.16.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 16:50:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Assign a fixed
 index to mmc devices
In-Reply-To: <1975982.ltkoRUPMKj@kongar>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <8de4d82e-b9a5-f809-ea67-5527f9fdde5f@baylibre.com>
 <1975982.ltkoRUPMKj@kongar>
Date: Mon, 01 Feb 2021 16:50:35 -0800
Message-ID: <7hv9bbgun8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_195039_637576_9FFA2BBB 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alexander Stein <alexander.stein@mailbox.org> writes:

> Hi,
>
> Am Freitag, 29. Januar 2021, 09:07:45 CET schrieb Neil Armstrong:
>> On 28/01/2021 00:08, Alexander Stein wrote:
>> > Recently introduced async probe on mmc devices can shuffle block IDs.
>> > Pin them to fixed values to ease booting in environments where UUIDs
>> > are not practical. Use newly introduced aliases for mmcblk devices from 
> [1].
>> > [1]
>> > https://patchwork.kernel.org/patch/11747669/
>> 
>> I understand the goal, and this should be done for _all_ boards, not only 
> the Odroid-N2.
>
> I see. So there are 2 options:
> 1.
> Set the mapping for all 3 sd_emmc_* in the top-most .dtsi
> Upside: very easy patch
> Downside: When sd_emmc_a is not enabled "mmc0" will never be available.
> Might be confusing.

sd_emmc_a is (almost?) always the iface used for SDIO devices, which are
not always present.

I would recommend we go with a single mapping in the top-level .dtsi

  SD card -> mmc0  (sd_emmc_b)
  eMMC    -> mmc1  (sd_emmc_c)
  SDIO    -> mmc2  (sd_emmc_a)

it's not exactly obvious why we don't go 0,1,2 == A,B,C but just
document it in the top-level .dtsi.

This approach also has the benefit of having the devices show up how
many/most boards showed up before the async probe changes.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
