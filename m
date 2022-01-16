Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DCCC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7QA26h8AcRnWlVfIWzy83Q459ODimEAdovwU4OyoZE=; b=OY/cXqF7jUJggC
	D3/NyYK+4UJZhNkpjauTAtq6vNxNtI7AE6qzNXPJQL+wUeF6FQe+KLjR1GL0su5pUpuG7YxZQ7QUI
	/kZhFz2cA4B3WrCW67aL4wSML73GP3dlfE2xfo20XbRu3Pyb4VuLL9jGn7jtpbuODNw42DL5FTh2Y
	Qz5Cp9wQCbsDT8/PiDAMXmiaiVGqdIx3V1yjb3l0vzN1/FCgaMZHnt4mjnVYoHVaTmFhz96fQ4QOV
	W2rSWMk22sSp5YRSYEA5HgAdqU6Ff6Z6QK3hNIr/enI+/dhyLYmFNwMOp56TCB31qmTt2EQiu/z7C
	QeLUMRQpwgxt+sNl0lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n99Ns-00ClXO-6D; Sun, 16 Jan 2022 17:32:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n99No-00ClWP-5A
 for linux-amlogic@lists.infradead.org; Sun, 16 Jan 2022 17:32:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so17355525wme.4
 for <linux-amlogic@lists.infradead.org>; Sun, 16 Jan 2022 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=QaFReGXs98i0NSKG5VNBSVqWm1GpdVirFq4L16mRIkg=;
 b=cG5uL1yvhdYotgs9DFrlN6VpYNMt0a8uWjvm7602DsilgVBYK7TwqIbHT5OBDsD0m/
 lQNozJdANUu+ZQ8hvN/iOY2+ShmwLmOD8uUnBNsYkimUAy/8yyz0TJ4ophKSOasPr5YL
 uf2tiwYKTT1k9knb2hdj2WYKhgaTe2d42Ixy3f9BcWt+9KOG/guz1UxmbBPPaFWIb71F
 wG4ybqM0mKm7h+DQcMc0lvB1CGfTL8NvFCBrFmBbKiVV+/yNMMpVc15F11LdjfN6dRyU
 6fXVz4DA4T4lufOJra8SqsNhuiqqcLupfIt/jANsGdXthnAEs6stvKpOQ8qz363hjM9h
 zK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=QaFReGXs98i0NSKG5VNBSVqWm1GpdVirFq4L16mRIkg=;
 b=El7GX+X7pF0ZmdHvTkx37UjlC89jpiAZTQ/r6PF933MU2O7Whh/2FzMSWZgnmGzaEA
 YpV9+u+k2qjN6zXGKInwukf3KEnx5zONzhngz+5QgINqZ7p0dYBTIFLRyh9ZUqZNlMuT
 bASyato//4TcsN3wZbSUcZXdFXCbxQXmbJZjNeSdDNIXyEOra5mcRSwrU3s64wKUNDv2
 8FAwM/SGCQT5VYHxVBUSGqVc5r0apEWSFMXPHdOlFRBITu9dHWzaKg2AFjmmhFvHPBrv
 7SHmCncKid+hCC2WiIu2telCQOI4MsOgA5CdW/AloduJmsdudyptJVJSkGT9oRqo9YKg
 LMNw==
X-Gm-Message-State: AOAM533T597HfvEaQYE89T3cF+QLa+RAwK13R4QbtCTveEBb1Mgp8cAq
 w9vk3kMFzhHintOT8kUiEg+cDA==
X-Google-Smtp-Source: ABdhPJxI5CihhtOe66ecJE5IsAwQgw+NnbF/1kxAtB1F0kEcJYpVyEGhlgVMeyPjuxcEHoUssDfGQw==
X-Received: by 2002:a5d:6251:: with SMTP id m17mr8977296wrv.49.1642354315994; 
 Sun, 16 Jan 2022 09:31:55 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id n14sm13728953wrf.107.2022.01.16.09.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 09:31:55 -0800 (PST)
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <1jilulav4u.fsf@starbuckisacylon.baylibre.com> <4732096.GXAFRqVoOG@kongar>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names
 property
Date: Sun, 16 Jan 2022 18:30:32 +0100
In-reply-to: <4732096.GXAFRqVoOG@kongar>
Message-ID: <1jfspnpoxh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_093200_229768_94C8521E 
X-CRM114-Status: GOOD (  18.75  )
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


On Sun 16 Jan 2022 at 10:49, Alexander Stein <alexander.stein@mailbox.org> wrote:

> Am Samstag, 15. Januar 2022, 16:04:10 CET schrieb Jerome Brunet:
>> 
>> On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> 
> wrote:
>> 
>> > Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
>> > property. Add it.
>> 
>> Binginds *mandates* ?? the bindings you are adding mandates that, not the
>> previous doc, nor the driver.
>
> Well, under required properties 'reset-names' is listed as well as 'arb' is 
> required, only 'rst' is optional.

I think there is a misunderstanding then.
The arb reset is required, the "reset-names" is not - as long as there
is single reset.

> So when creating the .yaml accordingly this leads to warnings this patch is 
> about to fix.
>
>> Modifying drivers and DT to accomodate made-up bindings requirement is
>> disturbing.
>> 
>> The bindings should not require that because the driver does not, as it
>> stands. The driver requires the arb reset to be provided, not the name.
>> Please fix the bindings.
>
> Nothing is made up. When creating the .yaml file I took the .txt documentation 
> for granted. How should I know the bindings documentation is apparently wrong?
>
> When using your older bindings conversion [1] I'm fine with dropping this one.
>
> Best regards,
> Alexander
>
> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?
> series=246453&state=%2A&archive=both


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
