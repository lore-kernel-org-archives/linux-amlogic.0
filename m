Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA59FA3735
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:43:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B9E2089C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yy6lWd4A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="epCRTxPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B9E2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmPSu2KZbrfOKaPXyvRatKVxb80Ht4skPNWFESY+kz4=; b=Yy6lWd4AmAFbLs
	oaP/NZXOJP8/HPZQdV3XS/HfKAC5V8YgXlo5iGEMybNpmKqmpZK5lhYgw9uiNK1JdD71Amy53SCJQ
	t075R3jsXs1eUijcLDqoA7AVhGsuiXkxXnbQIYQsmhEkx/harQKODmgaonr7XhG30Xyrf+zXRIkze
	SQMzcpBEqi2Al/IVPGf6RqRdSbuCKpmAZBXh6k2y7ebi7aZ7HvRimXrR8+VIoVCYqkmUwPvnun4vH
	i64dqxvBTW24fWpFTjuLJRyOH+GzxP4YdExHNolEJ5q4pl91wdFgmqQdm2mOLdMVcCUuhT/Rb7kTS
	Ik0nsZEI4TvNJtG4QB2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL7wI-0005N8-RS; Thu, 17 Oct 2019 15:43:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL7wF-0005M4-Ow
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 15:43:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e10so1566516pgd.11
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VOvV2/r2ynt55cnuM6fNik0rL8EihZtai79HG+PQGYs=;
 b=epCRTxPcIzW1JK1hav0kYxQFV4/KtoeRzGuJPSEcPwm+07F5s+hclMNoXvQqf4/Xn1
 PHRKmwonpyafnqMNOi9dcJPoPWnD3ya7CTnu9Qry/TzAB4HpaKOrbK0R0qaDDbOiEQuc
 NAMjpGaz/LGOeUnEU04tjxWY9G5Za9Eys1QYmuHKt94WBRAaXPRhFZjOql8+NYkH3ors
 UfFt5ENN2F9lK41nMVEmg+Mu/70pL+aDZgePCLsFDjUW2Ci+iy3EgWg4J7mRQpCA0hge
 OOvt2UsggArcB7npbmFQA0cehGx67F4L0qjr14Beidi0Rt1MqMZm6SjLMBOoC32THmyd
 CsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VOvV2/r2ynt55cnuM6fNik0rL8EihZtai79HG+PQGYs=;
 b=qzJql3Jx2918Ipjk3Upu6xVpoKSeHTHFAIwQcaNGK82QIh6/4VDAw7YfLYqnL0kL/o
 8G63WqiJhfn0BaU1qfX/JWFj15vIxAokQ6cUNgzfRKxB8CYeH8AQo+E3WbNwShDJaVw4
 LkaNHWyh+Wsjz9flo8Jn8sovcCoXkcPSvr348gw/xTR2SfVuaFxaofnLAR00+4khDbe5
 wqgFwknuhHqMNW4trywW1d1vVVl5ml3YPp+VaqYkgzLo/EoWVdgH7EgxtrV9cPM8iTE+
 dadeh9b1u8PGXeTWPBBSohQoSW9Bn4GiAomv1p+3THHNky3V+kqEkbOu6AGRFpyq4Ghr
 LVPw==
X-Gm-Message-State: APjAAAXzVSXUHq3h+WJwLs/sI9gvoP063hUx72HwTTSKG5quNJLLy6wo
 03J3ihlWh9fDaYXGpn8ynjSihA==
X-Google-Smtp-Source: APXvYqwBC3rv9yHdPPniodMnf3ve5F6d/VBydNViIQXvnFmqx0IoTgB6MJOo2TPQ1KZma6BcLkaNWA==
X-Received: by 2002:a17:90a:3608:: with SMTP id
 s8mr5226930pjb.44.1571327022410; 
 Thu, 17 Oct 2019 08:43:42 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:d8f2:392e:5b44:157d])
 by smtp.gmail.com with ESMTPSA id f14sm3987624pfq.187.2019.10.17.08.43.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 08:43:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, edubezval@gmail.com
Subject: Re: [PATCH v7 0/7] Add support of New Amlogic temperature sensor for
 G12 SoCs
In-Reply-To: <9ade0e3e-1bd7-c49b-44b1-2361f1e3a7b1@linaro.org>
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <7hwod4fxwb.fsf@baylibre.com>
 <9ade0e3e-1bd7-c49b-44b1-2361f1e3a7b1@linaro.org>
Date: Thu, 17 Oct 2019 08:43:41 -0700
Message-ID: <7h36frcr82.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_084343_811588_3F99447A 
X-CRM114-Status: UNSURE (   6.55  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.kucheria@linaro.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Daniel,

Daniel Lezcano <daniel.lezcano@linaro.org> writes:

> On 16/10/2019 18:39, Kevin Hilman wrote:
>> Eduardo,
>> 
>> Guillaume La Roque <glaroque@baylibre.com> writes:
>> 
>>> This patchs series add support of New Amlogic temperature sensor and minimal
>>> thermal zone for SEI510 and ODROID-N2 boards.
>> 
>> [...]
>> 
>>> Guillaume La Roque (7):
>>>   dt-bindings: thermal: Add DT bindings documentation for Amlogic
>>>     Thermal
>>>   thermal: amlogic: Add thermal driver to support G12 SoCs
>>>   arm64: dts: amlogic: g12: add temperature sensor
>>>   arm64: dts: meson: g12: Add minimal thermal zone
>>>   arm64: dts: amlogic: g12a: add cooling properties
>>>   arm64: dts: amlogic: g12b: add cooling properties
>>>   MAINTAINERS: add entry for Amlogic Thermal driver
>> 
>> This has now been thorougly reviewed/tested.
>> 
>> I've queued all the "arm64: dts:" patches via my amlogic tree for v5.5.
>> Can you please queue up the driver, bindings and MAINTAINERS patch?
>
> 1, 2, 7 right?

Correct.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
