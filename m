Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA264C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 07:45:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721D1206BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 07:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="okE0Q0KJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c084BhzY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721D1206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCfP3JgPBPwUB0wqarXYpWytiOi+wZTNQHsYZbALpQQ=; b=okE0Q0KJWnLY05+BYx1rXbbz5W
	Vba6FWsLmziLtlQhM8dOj64Gw5aJrBhWrsoRzllWBakyR4YumU+AcTdDEvoyjg063V+3UqpL/4qnv
	AKUsvN0FATcJjLSL5tleHgectSiVyzzy4jdZ5nDGyea62pcNTvaK+i6i55rGMH5ESu50Ld3kAAMB0
	JVoJZMtarj2LJCFRUjzTJcPmiZtPOlOMYMXfAfzQ+GOdPhi2SsmIXl2qSJ1fBXI5AYunYZS9L2hgK
	mN2GusCSKZaQ9b6SZwiVPwg9zTZUsZ7j1Rpizl8SfjhrD/skQ8vsRBscis6SggkBU7rqOHq/B3MtR
	ckH7Dmbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA7AR-0007zW-47; Mon, 24 Aug 2020 07:45:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7AO-0007yL-72
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 07:45:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id a65so3745083wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+S8Ykqs0ZQ8t+yop1ljMlx1N00OmTfQ19sguq9KXX8A=;
 b=c084BhzYjy3yPCTwWcV7IyuxzHuPz3/dJcyQdLTMUIBB6QXZpCSeTYKM802AOVMlWJ
 JqgZD+9cDgFflyzsUdbUpcHUg6wX2ppq09Ex0ajTU0BN9o4XFiCUN6Q/tiOtYN8tvbpW
 5KWExNHx2vfYzLV6MMdtedvy3IkVgjPzOqEWhUDu3YnuL+zi4fZEzJ1GnfUQznWzQDqs
 TcS3+mnJUPMyrX4aIy/1OOws4tmXpt1wMMIvu6hxyzVxRYm6iwV5v9t6Bfx1i1c8KRiU
 HCvtf0BGebyloeDxyl+Z/bfGxEx/OMQH1bVItqsJk8JJNIScCdjLzamPf+3bdwaaP8fd
 C6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+S8Ykqs0ZQ8t+yop1ljMlx1N00OmTfQ19sguq9KXX8A=;
 b=OE27nIJHL4ytRdc/XskDQ8E7xl2UkvKerGVvXNu51gQE5UQFD38VCshk+3cZE0EpcJ
 Z16tGncaGfDQInibnG2aBCzjLZVIV8S2i07gb0XnLYaDHdVACJwzp2V1+7E4Y6Wq2DXt
 /MZTV97mqwea8byfuiIQErnRmeKNpfCdGgruTD0VjjufN9f4iRvNFlhBRhGXPrF2oDgj
 VVijqLdpjazlgX3vwodFLT44lS1jP6JfT6fXAUnNOHrq9+Wk2C7xYaOPZHw1MgxiPAuU
 55/1amnILVw/PjblcjMykHwSAUHviCZMgjQzxvLVhEVGyL2NtGPnEKMAkQJHpp8mxg4+
 Z3Gg==
X-Gm-Message-State: AOAM530yLdYwv6SxpKmSwTfulINdXqyTOKqeBA1hQ75e67sVSxf+h/Gi
 HvN+/8nTBTG0cOX0Q76cA+598JA7Lg/7yw==
X-Google-Smtp-Source: ABdhPJxxOR4bMXpl5NpGAwHJjIz0rWnrPTU21JWob5Qmn5kIh00jQB9qUHY/sh4Y9tvYPKH2vpSLQA==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr4335344wmh.168.1598255117364; 
 Mon, 24 Aug 2020 00:45:17 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t9sm1190267wmt.15.2020.08.24.00.45.16
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 00:45:16 -0700 (PDT)
Subject: Re: [QUESTION] drm/meson: Hardware cursor plane for Amlogic/meson
To: linux-amlogic@lists.infradead.org
References: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
 <CAFBinCCxXd_9EL-P-aHiX+nVVkgeK7X6jOitsPWgRN6PjUUH1A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <dc6e91f1-771a-c9ff-06c6-e4e38c8cf37b@baylibre.com>
Date: Mon, 24 Aug 2020 09:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCxXd_9EL-P-aHiX+nVVkgeK7X6jOitsPWgRN6PjUUH1A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_034520_458770_74D1AFCB 
X-CRM114-Status: GOOD (  21.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 15/08/2020 10:59, Martin Blumenstingl wrote:
> Hello Jian-Hong Pan,
> 
> On Wed, Aug 5, 2020 at 9:54 AM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
> [...]
>> We also learned there is the hardware cursor plane supported by
>> Amlogic chips from the slide "Mainline Linux on AmLogic SoCs" [3]. Is
>> it possible to have the hardware cursor available over the drm
>> interface?
> as far as I understand it is technically possible but currently not implemented.
> We have a specific TODO item for this, see [0]
> 
> also I'm not sure if this is trivial to implement and whether there
> are any plans to do so

Sorry I was on vacation !

Yes it's technically possible, but not trivial.

The blocking point is Interlaced support, currently we use the single available
scaler to automatically switch the field on each vsync on the primary plane.

But if we were using a secondary plane for cursor, we would need to switch the field
manually for this plane.

Clearly it's not an issue, but the plane management has changed for G12A and support for
this would need to be added at the same time.

We (BayLibre) do not plan to implement it in the short or long term, but it's clearly a wanted feature.

Neil

> 
> 
> Best regards,
> Martin
> 
> 
> [0] http://linux-meson.com/doku.php#todo
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
