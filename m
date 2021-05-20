Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722AEC433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 16:04:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69C5610CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 16:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69C5610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8IqMH2D+IzDHAWypZjDFbfjHzVLcwVguuK7hzhE9uA=; b=Ed1cy5kicpv4+FqrpXri29a5mp
	3UJIo8lEbesTyXNdd5cxf77gZXSKgMiV1aJ9UMQ2g9OvlZyapJCm+fSRky24SaVo/K44drRIwjOWD
	EJdD9SGeJYsw6fYOm1ulbu1u5DOgKAjTRpVw8VGQQehNjbQia4zgdGQEmfSuBrrmmsCUIomHxvZr/
	IGX2wRtIV1IOIn2Vn/prG2X4W64ad81UaWCoY5GEO0uJq1eVu+V1HzH+YRRbxgV1y7CGYjrALSFHg
	G44u1wErjLc440/X4o9rvOr7Kic0M537IJfQHcHoKJtqidvB29xapy/oT1/BQ02HHLCP4AwG2Rk/M
	gQu2UpCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljlA1-001qoB-0J; Thu, 20 May 2021 16:04:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljl7e-001q2y-TJ
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 16:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kI0h2gVSUj9JWqorLy8/VvL2RU0jPQm/IzG0Q3Yviek=; b=uQJXgsK8MV7LcO7wwKxiifMcXe
 wiTjlYTV8mVuwjlnR9VH5PQ/vS7qDDxveOoZBEw9qD0hitUGGB4C2MIPYWSS7HKrxekxcf3hq9WVZ
 PqHOyRcIYh1XCJzLUXHf8AhVJRUbKIKmxOTpoJqWOTKs1NrKYlGKjgklSU/eSpvyiphnfIjjOXNRm
 5eiQJ8IerWwVvBKaiteuwyagVNBFMoGxIGIFpXLdCHdjvLtBKILjWhY/ZFMGo1nbrWhkBJnjtpQoU
 qHG1eJw31gf/TkGcC78x8tf3Jz6STBvDiQXqZHvFbFQGibtmifk/BTAjHaMxHjiKrcCwuQes2Becd
 vUzGpk3Q==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljl7b-00GUZh-Eh
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 16:02:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id y14so16134355wrm.13
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kI0h2gVSUj9JWqorLy8/VvL2RU0jPQm/IzG0Q3Yviek=;
 b=zA2v7Id9RNtXBF1yfPJZXWmlZzKpRxIluaZ+MJG4ysFRqhuqV9gtxi8W0FTlb8w5vs
 mOn5gzPyeakHxZm6gnTCx2RgLqjO7vCnILfN2PTN4jFQXm+dyJIlwBs0hAwUR2xzW5ZW
 YtB53Z7Js8Aha5NVL2BLuOY/+VqqJ14T/75cuvmost68QSlUyp/CFFma5zhLIUkpbbnN
 Bv5sVWiVRFfjMbSwza/onKX4zfNRJ5qBSDxUlLclEC7HOShSI3x3WaRE5ZA6eKhi9YXL
 2EU4E3pA+T8uzDPZHy2pEBtP8OSPfwmbd1BZgpL6ITrUGIrJA78OuCvQ/8zxUDsLm0TE
 ONMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kI0h2gVSUj9JWqorLy8/VvL2RU0jPQm/IzG0Q3Yviek=;
 b=NJAt4mJDuHuAcgO3Mo8WIsqRkVZPlE+HYXHGlIND7cBOgViYsRJTv4vTfOvcZdJVNB
 B8iIOxlNMKjwz/WVYV1tq57Y7EspBqoouAhgE+IF4n/B4Fxgi/EKEd3cJ0VgWedksBiL
 Lr3byjW2kuAjpaaE3eu+yZT0Ebl2OlJQvVhapntZ6cnKxZXmxlzz2NFfhYhQO2WuIj6J
 Jk+YDzFQzMq5IQz2bYBZHaQ+UkPv6TEPRbzF5nYHxL2y5bNA25T1q3OWD5GmcXEcbiFC
 LhOnBxMvIILa4YlPX5N2qNrBzzDXEVM28EeHPcn4wUBOAM646cOd/SB/s1ZLP1ab9ZKZ
 b0iA==
X-Gm-Message-State: AOAM533GzT+bSMxr7u6PHe+AaN6kyHnylQ1tOFLWRjp61K6IY5SSfWd9
 1sabokiMZ6tARDSE454wA2DZAw==
X-Google-Smtp-Source: ABdhPJxgQAwFG5+mH7h5jPT67M2rVkEPPjlqDBRPWJAWkDvOx5Hw09oefZRhL1be3OStGsdJWAT/UQ==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr5047900wro.408.1621526521508; 
 Thu, 20 May 2021 09:02:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d88a:b479:b222:83bb?
 ([2a01:e0a:90c:e290:d88a:b479:b222:83bb])
 by smtp.gmail.com with ESMTPSA id q3sm3518095wrr.43.2021.05.20.09.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:02:01 -0700 (PDT)
Subject: Re: [PATCH 0/3] tty: serial: meson: add amlogic,uart-fifosize property
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jirislaby@kernel.org
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
 <9c6ce679-1721-be40-c1b2-6ae90503d2cb@baylibre.com>
 <YKZt7lCBhesXzoQP@kroah.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9f4f2dce-79ce-bef5-0725-2e3cbf530999@baylibre.com>
Date: Thu, 20 May 2021 18:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKZt7lCBhesXzoQP@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_090203_578223_F50DD688 
X-CRM114-Status: GOOD (  16.25  )
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

On 20/05/2021 16:10, Greg KH wrote:
> On Thu, May 20, 2021 at 03:55:35PM +0200, Neil Armstrong wrote:
>> Hi Greg,
>>
>> On 18/05/2021 09:58, Neil Armstrong wrote:
>>> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
>>> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
>>> a different FIFO size from the other ports (64bytes).
>>>
>>> This adds a property in the bindings, reads the property from the driver and updates
>>> the DT with the new property.
>>>
>>> Changes since v2:
>>> - removed spurious blank line from bindings
>>>
>>> Changes since v1:
>>> - switched to a more generic "fifo-size"
>>>
>>> Neil Armstrong (3):
>>>   dt-bindings: serial: amlogic,meson-uart: add fifo-size property
>>>   tty: serial: meson: retrieve port FIFO size from DT
>>>   arm64: dts: meson: set 128bytes FIFO size on uart A
>>>
>>>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
>>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   | 1 +
>>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 1 +
>>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    | 1 +
>>>  drivers/tty/serial/meson_uart.c                              | 5 ++++-
>>>  5 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>
>> Could you apply patches 1 & 2 ?
> 
> Sure, will go do so now...
> 

thanks !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
