Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5273CC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41D5206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUcAvPnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41D5206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCW86fOAYh1ZACyfq7P9O07l2nAZ7QZn+xwTjbHUwBA=; b=KUcAvPndMrVET8
	4X1nvJE9H2KH2DDOkz8z173hGZ1Oio5NeFiiZddNrw1B8yW+vECto/nnPG+x/RhJLPXg18VfF2JYe
	Z0D7hc8xd8fJ6qzeik8PduNPLFGNQXuQoWtGMhK7IKqfBrppdgtZApwekjV8lyjapGS3INq+bkDVm
	h/w82ruqzX+OPkGRQx0OM84/Vo/56JqUd6wHnApkYhIRwnRPOK0hgQOW4dD0d5uBVdZZhSpPjUduJ
	iQDXogvOYGBhIzGEmR8tPePidIpk0bVfGvPzL6KjnXcYBSkJ0eokJS6D4n7Hr4P9zEwU1MEjMIxnG
	qWHahjPspRsoPy1wvBDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUBAP-0002SV-Ei; Mon, 11 Nov 2019 14:59:45 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUBAD-0002JV-G6; Mon, 11 Nov 2019 14:59:35 +0000
Received: from [192.168.0.108] (223.167.21.236) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 11 Nov
 2019 22:59:25 +0800
Subject: Re: [PATCH v4 2/4] firmware: meson_sm: Add secure power domain support
To: Kevin Hilman <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-3-git-send-email-jianxin.pan@amlogic.com>
 <7hk188stcy.fsf@baylibre.com>
 <420073b1-0a3f-1bfd-4422-34f8cd7e0d2d@amlogic.com>
 <7heeyecw8d.fsf@baylibre.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <3d14fc01-f903-c008-631f-eeb0b4a335f0@amlogic.com>
Date: Mon, 11 Nov 2019 22:59:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7heeyecw8d.fsf@baylibre.com>
Content-Language: en-US
X-Originating-IP: [223.167.21.236]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_065933_536670_F9B251CA 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Kevin,

On 2019/11/11 22:40, Kevin Hilman wrote:
> Jianxin Pan <jianxin.pan@amlogic.com> writes:
> 
>> Hi Kevin,
>>
>> Please see my comments below:
>>
>> On 2019/11/10 4:11, Kevin Hilman wrote:
>>> Jianxin Pan <jianxin.pan@amlogic.com> writes:
>>>
>>>> The Amlogic Meson A1/C1 Secure Monitor implements calls to control power
>>>> domain.
>>>>
>>>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>>>> ---
>>>>  drivers/firmware/meson/meson_sm.c       | 2 ++
>>>>  include/linux/firmware/meson/meson_sm.h | 2 ++
>>>>  2 files changed, 4 insertions(+)
>>>>
>> [...]
>>>> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
>>>> index 6669e2a..4ed3989 100644
>>>> --- a/include/linux/firmware/meson/meson_sm.h
>>>> +++ b/include/linux/firmware/meson/meson_sm.h
>>>> @@ -12,6 +12,8 @@ enum {
>>>>  	SM_EFUSE_WRITE,
>>>>  	SM_EFUSE_USER_MAX,
>>>>  	SM_GET_CHIP_ID,
>>>> +	SM_PWRC_SET,
>>>> +	SM_PWRC_GET,
>>>
>>> These new IDs are unique to the A1/C1 family.  Maybe we should add a
>>> prefix to better indicate that.  Maybe:
>>>
>>>        SM_A1_PWRC_SET,
>>>        SM_A1_PWRC_GET,
>>>
>>> Thoughts?
>>
>> I consulted with the internal VLSI team, and it's likely that the latter new SOC will follow A1/C1.
>> And then it may become common function in the future.
> 
> OK, but it's not a common function for the past, so it's useful to mark
> that distinction.
> 
> Just like in device-tree, we often have compatibles named for previous
> SoC families (e.g. "gxbb") used on newer SoCs, but we use that to mean
> "GXBB or newer".
> 
> Similarily here, we can use SM_A1_ prefix to mean "A1 or newer.
> 
Thanks for your explaination, I will fix it in the next version.
> Kevin
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
