Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0892BC47096
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C128D61364
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C128D61364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XuBkuLDZTAnXmEyWaCHE+im6WrQEKZKnX5XZXWUffyk=; b=buNHxRJDZvQkCWZwSUT95u5UwQ
	X3XvbWxYzrAxYaagemJ7OVwrkOnGvDIsRCApaNudZN04Ssosrzzm3dP08f2Z1UtFIYQvcynPwel7V
	Q19dGPGV1S1Fgws2K+HBGK4/gB5cPVFYiGKtKFSe5OFSq2AO+hrZFP68r+48tzE/Bvf2oC0Q7P5tE
	zM0pRrb66Pk6IPeekz6N+IaJRcLKz3Ol0rIIFKn6s2Y/yeYH3cCuevGg4G4UAuNKSYwJEZ20whgDa
	I9rKCIa62tPiO8SqbMvfe89KGt4PyYqQXh7MLT7e0jTzh3n7/+oTUgX+v6X8re+C3En57vAnmDLZg
	o+ydT0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo04M-00FPm7-8C; Tue, 01 Jun 2021 08:48:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo03z-00FPYr-Gb
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:47:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id n4so13389080wrw.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=322dbtM46O3QcTbghSB7BeJYNbqpaIfGRgomGDZ93iE=;
 b=zH0nyqnHcnGVmdTu3YEei5B5TuCrVSjv8yvMBbEalGkFR9tLH/LZP64768STt5ZyEy
 alL2aGOrrCgn7j9jDB44WS3AlW46a7JY3VRBxQBQnN9AhUqAZfZ37HZNLygt4a9pHaJl
 ZWMv0eoBWY5M7Zj1/uYTb2ixvr6IuGnbHs37wnikhRwNeJrcp9C/gaZEDS6eiWspZB78
 tLbPWi92pLFxpM1rBmsLdIl9dQjycXqIEucDR+eeKJtZpPUwfciXOE5SQSQvLNyAOc+u
 GTCqgIsq31lHP/Y8M/J+rDxluTNF5HgsTCs/mjqZZtC41wwqFxlGjqc849Iw7fhljdTy
 bfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=322dbtM46O3QcTbghSB7BeJYNbqpaIfGRgomGDZ93iE=;
 b=peV/msWlZtJ/u4dIusMS72TQ0EHMZifOsnsn0EgZ2itc43CvkF+3zn8IP01/A3pVoI
 wHhbb+SBzJJbt4EGcF8fQto5Mhnd59/Pj4yc5xXOla5JYmM9TST3D1Ak1ttPcflBGzwy
 RtRWua1Fn7kdalrusyVyHllSFnOQixHCCG4BXBP2uMRd6yo2irsnMr9UY0wximT25Fof
 xu+9I3weyQ9c/yjFYFSGMAXpjNiUv17pVhjGdxAvpGYtotKFKX22G+ngnBrdf2RCu1HT
 h28WVQtQGNuFrpUixT8R7jmbW/qPNkbe6ahnMKr9chmiYkKQMDjH5lfSXT+hlEEgOy24
 qRzw==
X-Gm-Message-State: AOAM531Pzsi5lGaPw8zjaQdvQ1Cfzcf1A9JgOqi2oI1aMVw5INh7iFqG
 eCqVbYzA2SwNLm2bFsussXrx+g==
X-Google-Smtp-Source: ABdhPJwHfm4W7Jg6jHlyp2IqpSdMFmvjQnAuGssRjqPaBcl0npzMlEISc9JhfpSSb8BQzxgFoo0xMw==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr26184792wrz.256.1622537269671; 
 Tue, 01 Jun 2021 01:47:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a3a:d001:6a80:207a?
 ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id t1sm2438670wrx.28.2021.06.01.01.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:47:49 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: meson-g12a: Disable the regulator in the error
 handling path of the probe
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <79df054046224bbb0716a8c5c2082650290eec86.1621616013.git.christophe.jaillet@wanadoo.fr>
 <CAFBinCCBo4fYoO=2NiWTEixPuJo2Q=J1o1+yfi4Oc32SLi=GAw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <455790a9-250d-ff00-6304-fd933409b1fb@baylibre.com>
Date: Tue, 1 Jun 2021 10:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCBo4fYoO=2NiWTEixPuJo2Q=J1o1+yfi4Oc32SLi=GAw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_014751_617025_4F63AB41 
X-CRM114-Status: GOOD (  18.33  )
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

On 23/05/2021 18:03, Martin Blumenstingl wrote:
> Hi Christophe,
> 
> On Fri, May 21, 2021 at 6:55 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> If an error occurs after a successful 'regulator_enable()' call,
>> 'regulator_disable()' must be called.
>>
>> Fix the error handling path of the probe accordingly.
>>
>> The remove function doesn't need to be fixed, because the
>> 'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
>> which is called via 'pm_runtime_set_suspended()' in the remove function.
>>
>> Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> for me this makes sense so:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

> 
>> ---
>> Please review carefully.
>>
>> I'm not that sure about:
>>    The remove function doesn't need to be fixed, because the
>>    'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
>>    which is called via 'pm_runtime_set_suspended()' in the remove function.
>>
>> This is more a guess than anything else!
> I am not 100% sure about the suspend code-path, so I am hoping that
> someone else (for example Neil) can also review your patch

Not 100% sure aswell, but the probe function is wrong anyway and must be fixed by this patch, so LGTM.

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
