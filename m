Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5424C6FA86
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Sep 2022 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlDiZ/4cgkbrWPQKDJTP0A4UyYfEQ3TlTe3QjzG3HL4=; b=PDyziLgiXqBbXd
	Ezrbr2be+XsVfdA2kWb4GD/TzZwZoQu1TfEAmIbmTHuFHaSAVg9u1qW+G467eBD2vzLvt/wF5OwJs
	9i2za9Avbi639qI6aIv5a8ViQ4zqggeNVxqveICGHjt4Ir67EIuFmsAm28o7lKLNN3+hWhqGyMVYb
	nOlWEaiVZIizGC/v+xtZU8ajL9J3XsG4wTcv3Tp1PDUEspZySVWKy6h5MOexwzG661ksCnz1rpg0k
	pr6tse5YQvKwz7uPVw8qexfjkz1Y7vUYoIo40aRoXawdUTSg5MYhRXSoIDzFRWWCUOAlEFzeyI2+l
	hHVlf64/nq4QwGzNsCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1Vh-004YIZ-7H; Tue, 13 Sep 2022 08:43:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1Un-004XMK-Nw
	for linux-amlogic@lists.infradead.org; Tue, 13 Sep 2022 08:42:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so8992061wmb.4
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Sep 2022 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=uHI+VOCSCW3ZSm7NbyJIsIOScib0Mbu91hSQOT5LSy0=;
        b=eSoqJr59xHFMg2AJgVk4/HbOsxFWh/jZ/SJ45WAQwM8jwVBs34X3kBdtRzqWjx8Bwj
         Nt19UhRQWlv/a24OhIbAUhRLhvfCF7OnE+eFRRag7CJnmgljdYN2rs0G9yAvzNfoSpBi
         upLYcF2uSTm68WRBhmo27+El3PT4KIVimNltE3qgLw+pyRj9XwFFFZnuDFYt3rPa0IBk
         rmvKdXzhucSd1JxFVBl0qQNqt7OYrKmZfs2rVylmSL8rel+D7X3iBqep/t++g3c3ZqbZ
         WHZ9hW7uViUVY1pIm88fbiJ0EC/Fo3DPlVQbzv4HNYKjNoqPXkOWG9A8n3D1Mm2zHMP4
         9tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=uHI+VOCSCW3ZSm7NbyJIsIOScib0Mbu91hSQOT5LSy0=;
        b=VgIFVPJFwVOCfSNp2g0Y2se5lCvDMPFeCwoIerfvdF0ODWIOKVjE8nRgMI/hhLpIsB
         skytDBj4yk3ncuEa01FVevZzLSlanWAPoAniHUVNL8TLzWTgPAyQyDjDgFWWySo93cI5
         vf3/PKyYz9Go7RevoKj5zhX+sNl68Lb5h3z25lgYv6c75eUrlASS86rfFYnFGxQ7nJ50
         WIu313yBrhgSQIn0eZ0umVPgup3gMrByJBeuBd/nZERdA82JV4qu8Q6qKobZKe+HDoM2
         o/QyPaNKbK5SxulUEU6wkVq6OHHC5BPjs3CUzQ+wv8VSj6BZXwvX4J9SpDMOSWMhxfhE
         bQ4Q==
X-Gm-Message-State: ACgBeo2pTiVdDjcQn/T3zaU1Ck5ozS0cz2JWGTM8pYjBtZhNRDswbsXn
	zs/TgnEAufsvyhQzNAL79GPduA==
X-Google-Smtp-Source: AA6agR5eeVrU4xs/t3Q0Lg2UG9Xin+2EdtdiWEL1NX1uRclOgWPZz0YnCK8lU4TbOhwQfAarcizn3A==
X-Received: by 2002:a1c:6a09:0:b0:3b4:92fa:8b27 with SMTP id f9-20020a1c6a09000000b003b492fa8b27mr1510521wmc.115.1663058534486;
        Tue, 13 Sep 2022 01:42:14 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bw2-20020a0560001f8200b00228c483128dsm7085049wrb.90.2022.09.13.01.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 01:42:13 -0700 (PDT)
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
 <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
 <1jo7vswmjw.fsf@starbuckisacylon.baylibre.com>
 <52b07db2-7edb-0373-c6d2-df67917f4af7@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Yu Tu <yu.tu@amlogic.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from
 vendor driver
Date: Tue, 13 Sep 2022 10:42:00 +0200
In-reply-to: <52b07db2-7edb-0373-c6d2-df67917f4af7@gmail.com>
Message-ID: <1jleqn3btm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_014217_858202_3BA5DA56 
X-CRM114-Status: GOOD (  12.46  )
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


On Tue 06 Sep 2022 at 20:29, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 06.09.2022 17:21, Jerome Brunet wrote:
>> 
>> On Tue 30 Aug 2022 at 14:33, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> On 2022/8/29 17:54, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com>
>>>> wrote:
>>>>
>>>>> On a S905X4-based system this call fails randomly.
>>>>> The vendor driver has a retry mechanism and on my system
>>>>> the second attempt is successful always.
>> 
>> Heiner, ideally commit message should not be about 'your' system
>> but describe what the system actually is. This would be more useful down
>> the road.
>> 
>> Based on Yu Tu feedback I'd propose
>> 
>> '
>> The PCIe PLL locking may be unreliable under some circumstance, such as
>> high or low temperature. If the PLL fails to lock, reset it a try again.
>> 
>> This helps on the S905X4
>> '
>> 
>> If this is OK with you, I can amend the message before applying the
>> patch, or you may resubmit. As you wish.
>> 
>
> Yes, please amend the commit message as suggested.
> Thanks for the review and follow-up.
>

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
