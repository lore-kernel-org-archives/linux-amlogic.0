Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BACBC678DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Aug 2023 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAFAmfXxy55Xrl8cwX934QbzFH0xbYoJD4I6nEJF52g=; b=Fn6gMR7iAOt4SZ
	n5mG7FuEtIGy9yW61GSdQgEsvT6QxVX11znAqwALPVePOkILSkpV/dK1XKcXhyPOKMD9nnYbl5/C+
	YqipWk6AkMtlY8KgiBqlw/yGCvTCyGaVnGkNd81+AFEgjc3ER+4Yb9sd50m8sLdetJHmrIPuuStmC
	oTPKJELGP7Pvb5m/6r8T5/vqVWuxkTFH2V9ET9rQ18dXuftThZhtYFoopWNmWCf4SJxZKy0e2PPOO
	IQ9MIc0vhCmzi08hDiiHvFUY7ht1tgQYq7tT2dat4AYouP32w23xD75152JKaGZZT7nEzaOxY748D
	leSUu/8z6ZYLKXO/KTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyW1-009Bx7-0J;
	Fri, 18 Aug 2023 12:23:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyVx-009Bsv-0r
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Aug 2023 12:23:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31757edd9edso729411f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Aug 2023 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692361418; x=1692966218;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=a4FXX1vzJ9lRRxuR/Yz2TRHzHWJcED629QuXtUpZGD8=;
        b=lU/ZiIztgtIeE3xkOirQuBWgH7RTQBau5q3f6YOZ3pSAp2Edl8VPMXNidvM8u51ZJ2
         fguPGyyiLcFtIJX22JcIoLYIRPW/voaAH1dLmqRAtk5sCnbOFfEKFMvQgYMy9pzBIH3U
         ubx+3xPpJi4vvJXssbLhoFFG1wrJU5RFjreDyfF7kwOKLPQemZ1reztwtwfDzhShKn8y
         4radyS+J2YkGloffM4mKan2M6MhXDFpGYAK75Ipru9RphAbILYmenliEKqTaXdZPSuRp
         iJSjMg9AJy11E4WD+56cieIuCmb3c1yqZQQdrea6zDZZv31hgRfoEOgGeG5lcyJl5gGS
         j2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692361418; x=1692966218;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4FXX1vzJ9lRRxuR/Yz2TRHzHWJcED629QuXtUpZGD8=;
        b=N7izhBrBfjaD9YtN7w3fYqQiBlqmH+axiH4qBImRlVZw5fwu8qiOBFfoFKXrEjfEwB
         nNvelWRFkV/FRrEZ9tIkYDLIFm+2uDvv6Xjl3lczEaSMwAnnjwaVvpjsmPB0L218X3N3
         SGQmtOLwASp3XSmeDkyTrg2HhY4VdGwhLSUn4oyjfaM3yEqxXmCW9/npX8RlNhjnfQ9+
         dsLhgpvaJ5HLnsrL2+xJFqROwHtfiX6936f4AJMj8+IqYAHK8iGKLK+sNehO77BAWT3U
         k8ytRRblF++Ky2w+42w34UljIZFe7LBfCfVO/B9peRBS7Tezntl7sC9qRckXLdw51cQ8
         QhvA==
X-Gm-Message-State: AOJu0YxE3fZCY98wo2suEPooaGSnj+0pYs25Bs1FgyzHpwTgnnhItuKA
	rIQ8TAQHErz5jENS+KFw3rPHlQ==
X-Google-Smtp-Source: AGHT+IFC+ElMRNtG1zCiTmBVsFpGQ8/5Olcrj9qb/dtFLDRr4vRODaejT5JzBCFEfDeYi2VaDhRjBQ==
X-Received: by 2002:adf:fec6:0:b0:317:e5fd:ab49 with SMTP id q6-20020adffec6000000b00317e5fdab49mr1642079wrs.16.1692361417769;
        Fri, 18 Aug 2023 05:23:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:474a:b712:99f:cca1])
        by smtp.gmail.com with ESMTPSA id t4-20020adff604000000b003176aa612b1sm2612620wrp.38.2023.08.18.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 05:23:37 -0700 (PDT)
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
 <7ha5uyes3f.fsf@baylibre.com>
 <3f437e5b-2bae-384a-0a08-216a4ec55bde@linaro.org>
 <7ho7j572ue.fsf@baylibre.com>
 <1d643d2a-2aa9-6b36-7f5e-bdd01fd2979f@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
Date: Fri, 18 Aug 2023 13:39:36 +0200
In-reply-to: <1d643d2a-2aa9-6b36-7f5e-bdd01fd2979f@linaro.org>
Message-ID: <1jo7j4a69j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_052341_496540_0C45288D 
X-CRM114-Status: GOOD (  47.48  )
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


On Fri 18 Aug 2023 at 10:58, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 17/08/2023 23:53, Kevin Hilman wrote:
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>> 
>>> On 10/08/2023 19:15, Kevin Hilman wrote:
>>>> DT maintainers,
>>>>
>>>> Alexander Stein <alexander.stein@mailbox.org> writes:
>>>>
>>>>> Binding specify order of clocks as:
>>>>> 1. "sclk"
>>>>> 2. "lrclk"
>>>>> 3. "mclk"
>>>>> Adjust clocks accordingly. Fixes warnings:
>>>>
>>>> I understand this patch is to fix DT warnings (and thank you Alexander
>>>> for fixing warnings!) ... *but* the underlying requirement being
>>>> enforced by the schema here seems completely wrong to me, and a step
>>>> backwards.
>>>>
>>>> Sorry if this is a FAQ someplace, but I couldn't find an explanation for
>>>> this.  One of the main goals of introducing names in the first place was
>>>> to get rid of ordering requirements.
>>>
>>> Not entirely. The names was just a helper for cases when order is not
>>> fixed,
>> 
>> Exactly, "when order is not fixed."  This is the case for lots of
>> hardware today (not just clocks), and is precisely what we need to
>> describe multiple, optional and independent (unordered) clocks.
>
> Minority of bindings require relaxed order, literally I remember just few.
>

*require* is the keyword here. Yes, a minority of interfaces can't be
described as ordered, mostly because they have more than 1 optional
ressource.

Still the majority out there uses names and have little care for the
order (or IDs). They are only describe has ordered because that is the
simple way to do it with 'schema'

>> 
>>> but even with the names for every regular case the order was
>>> always strict. We always expect these to be ordered.
>> 
>> I'm not sure who the "we" is you're referring to, but this expectation
>
> DT maintainers. Previously only Rob, now "we".

AFAIK, kernel maintainers enforces the rule of the linux kernel.
These rules are part of the kernel itself, so they can be discussed and
clarified if needed, like checkpatch.pl or the code of conduct.

It does not seems to be the case here and, maybe, it is partly the problem.

>
>> is new to me, and honestly a bit surprising.  Before DT schema, driver &
>> DT writers could happily describe their hardware using names for
>> optional and unordered resources.
>
> You talk only about Linux and not even all of its drivers (because
> several took by IDs), what about all other users of bindings?

Do those drivers which take IDs specify the 'clock-names' as a required
property ? If that's the case, shouldn't we question that ?

What is the point of having a required property if it is purely
decorative ?

The property 'clock-names' is required with bindings discussed here.
I assume that if an interface describes a required property, users of
the interface will have to pay attention to it

No one is questionning that the order is strict if "-names' is not part
of interface or optionnal (that last one would be weird)

>
>> 
>>>> Now the DT schema is enforcing
>>>> ordering requirements, but the drivers don't need ordering, so what is
>>>> the point of enforcing ordering requirements?
>>>
>>> Because names are not everything.  One OS implementation might still
>>> take by indices, even if names are provided, so you cannot change the
>>> order.
>> 
>> Wait, isn't this an "OS-ism" imposing requirements on the DT that are
>> not at all about describing hardware?
>> 
>> Strictly ordering resources in DT that are completely independent (and
>> unordered!) in hardware seems to be a big step away from the general
>> guidance of "describe the hardware, not OS-isms".
>
> Bindings do not describe hardware (although this is usually what I write
> in emails to simplify the discussion), but the interface between various
> implementations and representation of hardware (DTS).
>
>> 
>> And so far, we've only been talking about clocks, but the ordering
>> implications here apply to resets, pinctrl, regulators and probably
>> others as well.  All of these subsystems today have some way to describe
>> unordered & independent resources using names.  Yet, what you are
>> implying here applies to all of these subsystems: even where names are
>> used, these resources must be strictly ordered in DT.
>
> Yes, we expect them since long time as strictly ordered, unless
> exception is needed - which is then encoded in the bindings. Every email
> from Rob since some years was saying this, recent my talks and my emails.
>
>>  From my
>> perspective, this is a new requirement.  Do you have any pointers to
>> where this was discussed & decided?  Admittedly, I do not follow DT
>> schema developments closely, but new requirements like this have
>> implications that I hope were discussed publically.
>
> I don't have resources, except that I recall vaguely that Rob said
> original ePAPR or PowerPC was requiring it.
>
>> 
>>> Few bindings allow relaxed approach here, but these are written that way
>>> to allow mixing order.
>> 
>> Right, "mixing order" is another way of saying unordered, which is an
>> accurate description of lots of hardware out there.
>> 
>>> For few other bindings (e.g. newer Qualcomm clock controllers) we just
>>> dropped the names entirely, because they bring little value and also
>>> code for lookup by name is slower than by index.
>> 
>> I can see that names might bring little value if there aren't
>> independent optional clocks.  I can also see that making that choice for
>> perf reasons being a design choice, but that also a case of an OS design
>> choice impacting the DT, and not really about describing the hardware.
>> 
>> IMO, this design should be a choice of the driver writer who is most
>> likely to best understand the hardware.  Being forced into that strict
>> ordering requirement by DT schema when that is not an accurate
>> description of the hardware seems to be enforcing the wrong thing for
>> the wrong reasons.
>
> No one enforces strict order when the hardware is not like this. I wrote
> it before in the quote above and again in this email.

Which HW is actually 'like this', ordered among ressources ?
In every schematics and datasheets I have, things get named. Order is
not even a topic.

Most 'schema' have been described like this because it is easy and
natural to just list your ressources. I did not realize when schema was
introduced that order mattered. I'm pretty sure I'm not alone there.

>
>> 
>> Now that I've ranted a bit, maybe our time would be better spent if we
>> get practical and discuss a concrete example.  This other thread[1] has
>> a specific example, and ends with a specific question from Jerome about
>> how one should actually model a specific piece of hardware with current
>> DT schema.
>
> The same as other cases. I cannot find examples, because there are
> really just few real world cases like this. Maybe
> qcom,sc7280-lpass-rx-macro.
>

Ok, I'll go with 'oneOf'. We'll see how it goes

> But remember - people confuse clock which is not strictly required. E.g.
> if UFS is not yet implemented, we can skip UFS-clock parent in some
> clock-controller because UFS driver does not exist thus we do not care
> about proper parenting and frequency of UFS.
>
> Now, that UFS clock is not optional. It must be there for proper
> representation of hardware. We only allow to skip it if OS drivers are
> half-developed.
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
