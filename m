Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5656C678DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Aug 2023 21:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Auc34xZ+CjJjhE1aQY5gae3rTG1Y/DKMsErDMA3LkbE=; b=37Hwau3cnBm3UG
	Mqxr7bGhWYEsJP8OWGDZ6DLZQX6MgvTr9eyjCFNHVuFMKJtq9rxDCc7/nVTyuOM3FtzXMLykgVVkd
	INfokm3N4V88kwBbi4obvohbrjG4VIkruq6Om47i1mtFKgttynxlDLe2CDhwR14R1lTrFiCWvvCTQ
	vaq8+0OTumrL2M3zlh8Kqja0ZKEhZ9XKz+by5u5ti305CvlDLuEe/+AHbP+RLNc/C6ZILlPoasdet
	fiBY+kmp6h/zrPN9NvCKB33vYmaTMCx2IVWwtCZg+Zj/Zp2bC9sCslWhadNOxgFEsLVcBWT2xRC88
	MbfNsrnEvfGop7Zn/Olg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWkvx-007Czq-0f;
	Thu, 17 Aug 2023 21:53:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWkvs-007CyU-1W
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Aug 2023 21:53:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bc8045e09dso2387385ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Aug 2023 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692309210; x=1692914010;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bIhbOs6w0KnszFFxtSVpc1J87Pj087SiamTsLl7quTE=;
        b=PP7f7rB8oUh4wX56GXLxGOrnsopXNpXsbR+3MJdVOSmAtMCCGawdBMVqOUDcS4AGaF
         lhmwaDNo1vYqaZaSPcmKg3mc8WTWAS/OgzYY1tAMtXrtAlCyOJaxcENuyYZ3RKMxXohx
         WuMngULjAWJJ2f+cGDNO0SNGFRmMVUjaABDLEckSsaLUxSf40QNhYuFbB4h9auk++NzQ
         qivB0ngYcfwFwCPSfnWXpGX/4KY6izuX1zQT8gJNMYQSZmholCoqdMcjBfizQ7/2EZCp
         FnNB5lxDRdp7x7FzO2iCZpmCIVYuzYlyN2c3dT9L7xpPdrJf4uStEzgdLSb7C/WfWVUB
         T4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692309210; x=1692914010;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIhbOs6w0KnszFFxtSVpc1J87Pj087SiamTsLl7quTE=;
        b=Qa66v6R2ic9rv5FtSVnKUcP4VKWEWum1XwN5VxNquPDkt3pYyHRoUOp3GQt10/Wf3G
         1jiHrMQ7dAg4KV/M91ZIJRIorgCOJ1xccPbtU0RIJrclfUq1MOtI7WgxzfSgSt01mVoJ
         5FLkgGxwBDLBSmEVPRTCHoF7+L6r3vgXnvmNiyI731+tjrGDfhV6R43Wzjt5SwOZWaxB
         X/NTownBqHJzc8Ho1lo6RNUwxIqSa6KWRPHiGO4yRRNHBZsNJ4TQJQUi3afxczmgFfXt
         qnCuRZDBW2AX8U3BoBeuNu/cQcqQJVn0n5T9s4zCeydSBZvOahmxqEa2lpL1IhL2bJ1C
         gxJQ==
X-Gm-Message-State: AOJu0Yxy91n1yOlNrbl1RQTUWoN485tNvVOArCw/Q7r7cyl9UNNQaut9
	tD4skKSsCAaE2Rre1LG2cAIlgQ==
X-Google-Smtp-Source: AGHT+IHodeb66xmCsLfcpIbYneoHY88TDkT5oWKCEQEyHaKong/vb3pbnuTsGz3TPd4KzL4Q1DAzrw==
X-Received: by 2002:a17:902:b70f:b0:1bb:833c:6ba8 with SMTP id d15-20020a170902b70f00b001bb833c6ba8mr598740pls.56.1692309210286;
        Thu, 17 Aug 2023 14:53:30 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id jf20-20020a170903269400b001b7cbc5871csm253556plb.53.2023.08.17.14.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 14:53:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
In-Reply-To: <3f437e5b-2bae-384a-0a08-216a4ec55bde@linaro.org>
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
 <7ha5uyes3f.fsf@baylibre.com>
 <3f437e5b-2bae-384a-0a08-216a4ec55bde@linaro.org>
Date: Thu, 17 Aug 2023 14:53:29 -0700
Message-ID: <7ho7j572ue.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_145332_579443_E9F64806 
X-CRM114-Status: GOOD (  25.95  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 10/08/2023 19:15, Kevin Hilman wrote:
>> DT maintainers,
>> 
>> Alexander Stein <alexander.stein@mailbox.org> writes:
>> 
>>> Binding specify order of clocks as:
>>> 1. "sclk"
>>> 2. "lrclk"
>>> 3. "mclk"
>>> Adjust clocks accordingly. Fixes warnings:
>> 
>> I understand this patch is to fix DT warnings (and thank you Alexander
>> for fixing warnings!) ... *but* the underlying requirement being
>> enforced by the schema here seems completely wrong to me, and a step
>> backwards.
>> 
>> Sorry if this is a FAQ someplace, but I couldn't find an explanation for
>> this.  One of the main goals of introducing names in the first place was
>> to get rid of ordering requirements.
>
> Not entirely. The names was just a helper for cases when order is not
> fixed,

Exactly, "when order is not fixed."  This is the case for lots of
hardware today (not just clocks), and is precisely what we need to
describe multiple, optional and independent (unordered) clocks.

> but even with the names for every regular case the order was
> always strict. We always expect these to be ordered.

I'm not sure who the "we" is you're referring to, but this expectation
is new to me, and honestly a bit surprising.  Before DT schema, driver &
DT writers could happily describe their hardware using names for
optional and unordered resources.

>> Now the DT schema is enforcing
>> ordering requirements, but the drivers don't need ordering, so what is
>> the point of enforcing ordering requirements?
>
> Because names are not everything.  One OS implementation might still
> take by indices, even if names are provided, so you cannot change the
> order.

Wait, isn't this an "OS-ism" imposing requirements on the DT that are
not at all about describing hardware?

Strictly ordering resources in DT that are completely independent (and
unordered!) in hardware seems to be a big step away from the general
guidance of "describe the hardware, not OS-isms".

And so far, we've only been talking about clocks, but the ordering
implications here apply to resets, pinctrl, regulators and probably
others as well.  All of these subsystems today have some way to describe
unordered & independent resources using names.  Yet, what you are
implying here applies to all of these subsystems: even where names are
used, these resources must be strictly ordered in DT.  From my
perspective, this is a new requirement.  Do you have any pointers to
where this was discussed & decided?  Admittedly, I do not follow DT
schema developments closely, but new requirements like this have
implications that I hope were discussed publically.

> Few bindings allow relaxed approach here, but these are written that way
> to allow mixing order.

Right, "mixing order" is another way of saying unordered, which is an
accurate description of lots of hardware out there.

> For few other bindings (e.g. newer Qualcomm clock controllers) we just
> dropped the names entirely, because they bring little value and also
> code for lookup by name is slower than by index.

I can see that names might bring little value if there aren't
independent optional clocks.  I can also see that making that choice for
perf reasons being a design choice, but that also a case of an OS design
choice impacting the DT, and not really about describing the hardware.

IMO, this design should be a choice of the driver writer who is most
likely to best understand the hardware.  Being forced into that strict
ordering requirement by DT schema when that is not an accurate
description of the hardware seems to be enforcing the wrong thing for
the wrong reasons.

Now that I've ranted a bit, maybe our time would be better spent if we
get practical and discuss a concrete example.  This other thread[1] has
a specific example, and ends with a specific question from Jerome about
how one should actually model a specific piece of hardware with current
DT schema.

Kevin

[1] https://lore.kernel.org/linux-amlogic/1jsf8r9v1v.fsf@starbuckisacylon.baylibre.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
