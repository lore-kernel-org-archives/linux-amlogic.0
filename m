Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B578C64E90
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E4E206ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGDkw00J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O7tahjFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E4E206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qbyro+XZiV9kgktoivyCRvlOhGxXwUwMmLkOxe8c4tw=; b=TGDkw00JnNLFcaQattoD2n3LK
	i1IJzv03wQC+AoqtDmQwp5rJnflVpN7An6pJdKnm+nddRmM4H1ogXm5w4YHBb0SErE7JPWVkvihFp
	t5hdPvGUF21ISwdL5DS7v5LU78+/tZCmOHOSmDfRYoVNhOipEW0jIXvu/q7XwjemWAXPZhdb+Ftav
	oKAaD4do9lhaUCXsP7cp4QEzs13LEEeXxErXfaWa0jcHxvlpqGCmhdtfCE4Dx9CcjNlM6JiRGko9N
	LLhuJAIW0IgzYZtXgvPtVEgLCkBMIbvWcPA4MMxxoFHxUukBPJpIhwKJp9fImHHydP42o0nIQldQB
	AWFo8smCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjtAk-0005Ec-3L; Tue, 01 Dec 2020 00:05:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjtAh-0005Dz-Qo
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 00:05:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id e25so655920wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Nov 2020 16:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PxcXUulEgKyT5OqGMviihTXF0lRaKbBQv3juecUtJO8=;
 b=O7tahjFvfV270xsIxQrZzlM6k0pOwQyJC3RZ5+23q7vBo/Af+t8KarNIHs67XtYjR3
 MG5fxSV+idLE+yD9ZEqVpNV4QqRuAIoJyiLNmF2q//gSDnIGLe1705lVNg646dyLIbOY
 l3N7G+Q3Lagwg2lM66LXayYUUQaXmBKIHlxctdOjfTjLLr8tigAnTkRXXLMEoNG+Z02M
 3e+6cb7+kFzE9fvDrgIskCefZrYNXco1DzWq4KNx9hRGsjlPhURp77jFj8P+evOOawzO
 pizJJmd8NdBIIrUF0nptK18nImb9dM8agDGLY5ZiyVbyKqfsJOM4jQ/IyKp+Pk2N/aL6
 r3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PxcXUulEgKyT5OqGMviihTXF0lRaKbBQv3juecUtJO8=;
 b=BzOC/jqtjJjKQ4H5kegLGrPbhHMKIX5tSNR9NvsreKDCG/7X+Oc9ELoHzaOb0LoxbO
 PZ2Cvd+trHdgeEcERUBeXb7vPrHRWvu83qmhPpR0pQsENOLpyHJOnC33Sz3lua0H9sXE
 rG8zWQzj4bcLGdjFglERl13K1f5VnXoTjj5khcRmfGNbOFynuKYshzxG+WKELizhghLt
 8XquvzJW1lpam551OuRCW7/a9Wa5XzdyV4iE8W9pGdUf0CbVXDCL7hmkbM9yAnTnf/mU
 RqHRizJ/sCAjrRRNEVAnfUSIORj9X1DHkRqUpDnma3XnNmvf31Hh6GEdfkVEMF7Qedtg
 NHQw==
X-Gm-Message-State: AOAM532CW5iTNzc2CCRZHRrltxgAjL4uLgdYyEkIQxi7sxxRTITzEOVC
 QL0YBSuySv2cyhlMiLwJJX5YNg==
X-Google-Smtp-Source: ABdhPJxDo2whkAA2R00WX2/QVf+Qt3ioNPbxjqDxzSFpgUK0pyo10hiDr+JBjoGg0Wl+Gi6pgaZ9mw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr319472wmj.25.1606781130659;
 Mon, 30 Nov 2020 16:05:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t7sm27223749wrp.26.2020.11.30.16.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 16:05:29 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 0/3] usb: meson: fix shared reset control use
In-Reply-To: <093933fc-eac5-de56-d314-a1348de348af@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <093933fc-eac5-de56-d314-a1348de348af@baylibre.com>
Date: Mon, 30 Nov 2020 16:05:24 -0800
Message-ID: <7hzh2ytmpn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_190531_878076_45A47083 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> Hello Felipe and Kevin,
>
>
> Could you please review this patchset ?

The changes are OK with me.  Please update based on Martin's
suggestions and this can be queued up by the USB maintainers.

Kevin

> Thank you in advance.
>
> On 13/11/2020 01:05, Amjad Ouled-Ameur wrote:
>
>> This patchset fixes a usb suspend warning seen on the libretech-cc by
>> using reset_control_rearm() call of the reset framework API.
>> This call allows a reset consummer to release the reset line even when
>> just triggered so that it may be triggered again by other reset
>> consummers.
>>
>> reset_control_(de)assert() calls are called, in some meson usb drivers,
>> on a shared reset line when reset_control_reset has been used. This is not
>> allowed by the reset framework.
>>
>> Finally the meson usb drivers are updated to use this new call, which
>> solves the suspend issue addressed by the previous reverted
>> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
>> use").
>>
>> Important:
>> Please DO NOT merge before this patch [0] is merged, it adds
>> reset_control_rearm() call to the reset framework API.
>>
>> [0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
>> re.com/
>>
>> Amjad Ouled-Ameur (3):
>>    phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>>    usb: dwc3: meson-g12a: fix shared reset control use
>>    phy: amlogic: meson8b-usb2: fix shared reset control use
>>
>>   drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
>>   drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
>>   drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
>>   3 files changed, 21 insertions(+), 7 deletions(-)
>>
>>
> Sincerely,
> Amjad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
