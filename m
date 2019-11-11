Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABBAC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 15:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23C2206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 15:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLzWlHXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23C2206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7io1nxOQozy7HyV23KPOxxbbOOThfBpXMxoCCdxkDhs=; b=aLzWlHXZmgCmNg
	ZuDckycnviUp0xOxqFua6L/aHldJrmP09GyUcIo0hB+UsiQ/aPhaI2XmTEND+DvBIRuEKGdjll51H
	9qgoaRiUJpblsTdE9IsVnqdt6Nz6WrH/VvdNzdR4f47zv3zWqNZL5cPCmp0OS4tYSkIx3yU6l2vda
	rBCX45a7kVg9Ng76UWzu+ZG9AvnS/inYBb42fqz0lF18COb5+42xTlUbBwFVRb3emT8UHLs40tHcV
	UaUcGAjW9B/w0ABxhRKG2u+Ev5JFdBJZDdZjOWIH9mMqp2lStokjxD/EYCOv3OJO8L/7K4r8EaT5c
	gzUA1Khj0BguF3g3SUxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUBBB-0004At-Rm; Mon, 11 Nov 2019 15:00:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUBAz-00040E-12; Mon, 11 Nov 2019 15:00:22 +0000
Received: from [192.168.0.108] (223.167.21.236) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 11 Nov
 2019 23:00:39 +0800
Subject: Re: [PATCH v4 3/4] soc: amlogic: Add support for Secure power domains
 controller
To: Kevin Hilman <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-4-git-send-email-jianxin.pan@amlogic.com>
 <7hmud4stfo.fsf@baylibre.com>
 <57b9c706-c341-c7cf-698a-66335b34442b@amlogic.com>
 <7h36eucw1u.fsf@baylibre.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <8e227a22-97af-fbdf-945f-f99b12d736c2@amlogic.com>
Date: Mon, 11 Nov 2019 23:00:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7h36eucw1u.fsf@baylibre.com>
Content-Language: en-US
X-Originating-IP: [223.167.21.236]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_070021_067541_004B323B 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

On 2019/11/11 22:44, Kevin Hilman wrote:
> Hi Jianxin,
> 
> Jianxin Pan <jianxin.pan@amlogic.com> writes:
> 
> [...]
> 
>>>> +	SEC_PD(RAMB,	GENPD_FLAG_ALWAYS_ON),
>>>> +	SEC_PD(IR,	0),
>>>> +	SEC_PD(SPICC,	0),
>>>> +	SEC_PD(SPIFC,	0),
>>>> +	SEC_PD(USB,	0),
>>>> +	/* NIC is for NIC400, and should be always on */
>>>
>>> Why?
>>>
>> NIC domain is for ARM CoreLink NIC-400 Network Interconnect, and should be always on since bootloader.
> 
> OK, makes sense.  I suggest a minor change to the comment to remind that
> this is an interconnect:
> 
>    /* NIC is for the Arm NIC-400 interconnect, and should be always on */
> 
OK, I will update it, and thanks for the advice.
> Thanks,
> 
> Kevin
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
