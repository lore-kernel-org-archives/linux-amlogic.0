Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE660C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D476611BD
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D476611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PpprkEelXSFLIQOPTCuautO41n66r8SA109TlyD/gSY=; b=0ZbYorkmhvxI3jxF6wNNAQsXf2
	qhHPAyRngwEolJjtybwYBI6KBQnjWXvPiWegRkaQ9jRQitFnjxEMJE8Ymfi3Dss0dKompvbr0GL9U
	zfzzCmN9kqf8M9AqLk9fdFra1QdyL7Of2i12V9hZTiyLOBnR039qv9Gh3DGdS79yB6SSSfgNozeW3
	eN49AGHqPstH5IzzzG72aeyJ8vgKZDrtNHYv856OtQoHCj2abaDcGzP9v+nV+L11Wxh78FKXcOyo3
	ubrDHzWo+Sf3BHnWatKtKMAd72QcfM7XuyfQdsyb1J62dd7UAmCK7cxW9UA/IfEgiEimi2sX/zqKa
	lKc1YW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSa5X-003mAH-Q7; Tue, 21 Sep 2021 07:21:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSa5U-003m8t-9Z
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:21:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u18so34521755wrg.5
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e9lJls9x4Ir3Og0tsCxemcW1jUDuoRfpiScVUmuJYNs=;
 b=4o+4O73eYK9bMb4Fnk+vy9cFbL0G26TLFn+vItPOnLqaOCHIUQdahny+5V97crEcUV
 bUn7xnxEVYgaT+PSVTU9WixGDjvYpwFkxQrmg7KlJkHkrs5X4kdoPPNX2gm0A0Ltrtsh
 8ixNu0sMryS7jtRPFOvlrYW6e0i/CBXQtyj8VkeQVRT9cbd12gQ4bH2rP7lASKIpGtzI
 nSkDxmoipXgdzMn8t9U3jndTGFEJ3VYNk4w4eS75MhfVNtnp0xDF1tuO44mrgavHaHWl
 qQ4qh7fYtNmRRbMmoCyv3ftbXdrbMOMRFXhxPT+tquakPZaoEZcdzQ9wKlBhlceVioJS
 SYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e9lJls9x4Ir3Og0tsCxemcW1jUDuoRfpiScVUmuJYNs=;
 b=ctf9jAq3D8Anb71vR1mvz9kQzduf+rxvsXV66qi6DoZKzZ0Q0kOrDtwtrLGSsI0nCu
 cjoFi/byEjAusYgiSPsQlWEdMiapR/1wdA0Umsp3bohbUSgTX9V6LS236BEpNfyinKwQ
 ZiwJ0yLAHnJIadhcSWBCEfNDguAAL8lYafV4j/KWL9jiCG0q9GqitDoRWW5+zCNJeXfD
 ZCEFXKkVOMZcYf5fdqwJCkpWsx6t5Yfv9OSiqnaLgWw2Q6emWTmShCStBfP41O2IQH4Q
 qaeYOeOGnSi18VjJhvOOTdyd3w2aYDTTL+mumehbTlewZZOUvlyQzB6cggUniqv762+r
 bWjg==
X-Gm-Message-State: AOAM5319Ik8l9l08pCWM2N7E7WT4OxW3cBEqKG0f4tziSCa/gH3JE3os
 wEq5Mx1uoFm0rJf5adFgZR6oqg==
X-Google-Smtp-Source: ABdhPJzELYbJ8jy1mwr1UoPKsoHlMwAbLOQHyrlZPvZHTluI+64PrlGi9gxNT1kbI1txsk+x490UTQ==
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr19634849wry.53.1632208866904; 
 Tue, 21 Sep 2021 00:21:06 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id z133sm2247263wmc.45.2021.09.21.00.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 00:21:06 -0700 (PDT)
Subject: Re: [PATCHv2 0/3] Fix the pwm regulator supply properties
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
References: <20210919202918.3556-1-linux.amoon@gmail.com>
 <CAFBinCBK02mnf6nEGFi+ZLUX4irAHL720ujms8NJxRe_NZC6PQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d0d03e85-85d9-eb23-b57d-e8482475181e@baylibre.com>
Date: Tue, 21 Sep 2021 09:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBK02mnf6nEGFi+ZLUX4irAHL720ujms8NJxRe_NZC6PQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002108_387628_2B27CA00 
X-CRM114-Status: GOOD (  16.75  )
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

On 20/09/2021 22:13, Martin Blumenstingl wrote:
> On Sun, Sep 19, 2021 at 10:29 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
>> Anand Moon (3):
>>   arm64: dts: meson-g12a: Fix the pwm regulator supply properties
>>   arm64: dts: meson-g12b: Fix the pwm regulator supply properties
>>   arm64: dts: meson-sm1: Fix the pwm regulator supply properties
> all three get my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Thanks for working on this!
> I haven't runtime tested the patches but I expect that they will work
> in the same way that the Meson8/8b/8m2 patches with the same change
> did.
> 
> Neil, some of these boards are covered by Kernel CI.
> I suggest queueing the patches in v5.16/dt64 and then seeing if
> there's any feedback from the auto-builders.

Acked !

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
