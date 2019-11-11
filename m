Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A639C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC6421655
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtfxG8T3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LAzanCoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC6421655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAqdFBjYAZT3PEUyIFI2cGVlrLgPuFD9cbR0r3s+GPI=; b=gtfxG8T3dkLxP7
	HLM+xObCrGVAHMVxuyCYA6Fcog3H3RpqY046I9lIIO0lmVwB2vLs/fbwg+tTYO0+X62TCKkR/gZes
	U0+LWUacO4tzANkJjX2+ZEcuXlfX6qjQpWy7fnlY3SW1c8/K+zZEdy2uzNmIsQINRhEsEgAGkwo1r
	7ml4DHTKtQMemaOk1QCN2wPL67x0liqYpgP1R0H7AAC5R/FIHdrW0rx9SoQcqwdVmdvzk6xb3SGSU
	tPUV8Pcvxd+jHjQi073fRbeIdC9xl7eQ3O+KXhNNtXnF9BkBpG3X2RAOaZPiF9SBK+Q4OiB5d56tI
	sZ0Z5kpyXcfCv2wFAlWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUArp-0002Ae-08; Mon, 11 Nov 2019 14:40:33 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUArd-00021C-N9
 for linux-amlogic@lists.infradead.org; Mon, 11 Nov 2019 14:40:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id q26so10805968pfn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Nov 2019 06:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HSZMQWzyEHnnHHGSgljiQy/rMe2MxTJvgjXJLTPB8Uw=;
 b=LAzanCohnqFWoF8gGT+BAns/rhQOt9zScUEdL2og/ftcWJRRiv37aXkm3RKjkwf2p+
 ALvBnZ0EdR41oJ1oipALK9HTNW3YLU06bdHqI2mCfXrRsOaH72lpnrDVj5qht22plo/I
 raY9u3gdnGyg9LrKuqIgdSuLbCkvJfvay3T8/j8RznOfP86n5uNku2uD8mRBWIFfzE+x
 G/+VqYJp/K+k64wGPG8tHH6inJ6Hd1ahzyAjEVin93HD7RgfQgN1EWHr0ZnCvNPTcbvR
 jqMd59qSv/jCqsbpiUag62bFCGY4vM8w9wV78ceO1YpZDuIddkh2Vm/IcPfH6F2kTCrD
 7hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HSZMQWzyEHnnHHGSgljiQy/rMe2MxTJvgjXJLTPB8Uw=;
 b=E/mc12G1MfUvSfcv6CjtuWBI/QbfNnHKzDkP6LrcnEAp20KGrujQVfOB94p5asccUo
 UHtufXbbWVf2LTQy3cCiz8+tQ5dzunDswJJBCH6Ikx50Ok49ynwuCQrnRcUnO54MSOW9
 HKxd7j4UK+CzSTd0u9Ylpn7mS/QLKJA26UAKR6wjB4a3iVdSICYYaMI6AbnWSaC+Z4Am
 +N8M+ak87N8E3KBeeDA17oprUjTPbNL2xBWnjpXMwkfXC17B/o8BQ+WnfwJfndEh9Nkk
 ewTRoIsQ46PODPqDrAVIgRVexAvAuaLScvzQGNs0QWA1jeeCt11CVBqPOaRHge6hNfrz
 pbiw==
X-Gm-Message-State: APjAAAWAuZep1QsDHW5YwzdWVQdjd2zZaAS3uWJ/cyWfp9wx5TJSkEaq
 RKYCvRcLQKSOU8UM6JTk6kpwAw==
X-Google-Smtp-Source: APXvYqzRF26meFYV5Haf+VOng2ZQhf2ivGmMtkGpcH5rhUWnKoKrEYEEDzl/1JLe7l1dj9g5OfIKpg==
X-Received: by 2002:a17:90b:110f:: with SMTP id
 gi15mr35797335pjb.128.1573483220407; 
 Mon, 11 Nov 2019 06:40:20 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:dd5e:2cce:fe26:7bc6])
 by smtp.gmail.com with ESMTPSA id fz12sm13611195pjb.15.2019.11.11.06.40.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Nov 2019 06:40:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 2/4] firmware: meson_sm: Add secure power domain support
In-Reply-To: <420073b1-0a3f-1bfd-4422-34f8cd7e0d2d@amlogic.com>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-3-git-send-email-jianxin.pan@amlogic.com>
 <7hk188stcy.fsf@baylibre.com>
 <420073b1-0a3f-1bfd-4422-34f8cd7e0d2d@amlogic.com>
Date: Mon, 11 Nov 2019 06:40:18 -0800
Message-ID: <7heeyecw8d.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_064021_754314_6C6267FF 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Hi Kevin,
>
> Please see my comments below:
>
> On 2019/11/10 4:11, Kevin Hilman wrote:
>> Jianxin Pan <jianxin.pan@amlogic.com> writes:
>> 
>>> The Amlogic Meson A1/C1 Secure Monitor implements calls to control power
>>> domain.
>>>
>>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>>> ---
>>>  drivers/firmware/meson/meson_sm.c       | 2 ++
>>>  include/linux/firmware/meson/meson_sm.h | 2 ++
>>>  2 files changed, 4 insertions(+)
>>>
> [...]
>>> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
>>> index 6669e2a..4ed3989 100644
>>> --- a/include/linux/firmware/meson/meson_sm.h
>>> +++ b/include/linux/firmware/meson/meson_sm.h
>>> @@ -12,6 +12,8 @@ enum {
>>>  	SM_EFUSE_WRITE,
>>>  	SM_EFUSE_USER_MAX,
>>>  	SM_GET_CHIP_ID,
>>> +	SM_PWRC_SET,
>>> +	SM_PWRC_GET,
>> 
>> These new IDs are unique to the A1/C1 family.  Maybe we should add a
>> prefix to better indicate that.  Maybe:
>> 
>>        SM_A1_PWRC_SET,
>>        SM_A1_PWRC_GET,
>> 
>> Thoughts?
>
> I consulted with the internal VLSI team, and it's likely that the latter new SOC will follow A1/C1.
> And then it may become common function in the future.

OK, but it's not a common function for the past, so it's useful to mark
that distinction.

Just like in device-tree, we often have compatibles named for previous
SoC families (e.g. "gxbb") used on newer SoCs, but we use that to mean
"GXBB or newer".

Similarily here, we can use SM_A1_ prefix to mean "A1 or newer.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
