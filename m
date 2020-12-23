Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9066AC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 14:42:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D83222B3
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 14:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D83222B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zGg46A2LtKFrK4WzvyxgmWlmZI9kt9pn5PoNo0m4CLE=; b=upFrkQ4eCSXetuKRZVnicC46Q
	VO4x2MgPmn3zaHTki0E3wgUzly7kWuwDu/PcZTXBurxK4iMDZ1mkozcdKIJK5tP8ITNCX1UQwiodR
	Bfofvn+6u9Gg4PAIeYcSc1M0qIuqLoJeJVzgFK7WdLFcU9dZciP8KWtx0B8xNtHveLaYt8hHjXQp/
	9ZoFPpGshnq3SC0m3q6+tQXL8aFs1u9YRsPkt2vvTDaolM7WlcbAksOoymy6Quqoeml8injHuu/FV
	L++N+XtvWpWohBV7Q89kK132F6HMxSThyNQA88oaUZVOIIQjClLnxLNyT0jWIhpLSf6ksFHneJ2KJ
	VBrSEYy1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks5LI-00045w-8w; Wed, 23 Dec 2020 14:42:20 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks5LF-00043J-IO; Wed, 23 Dec 2020 14:42:18 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1G9Q608Sz7K9m;
 Wed, 23 Dec 2020 22:41:14 +0800 (CST)
Received: from [10.174.178.154] (10.174.178.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 23 Dec
 2020 22:41:54 +0800
Subject: Re: [RESEND] usb: dwc3: meson-g12a: disable clk on error handling
 path in probe
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201215025459.91794-1-zhengzengkai@huawei.com>
 <c069b566-224d-f938-089c-6a69d1ec9d55@huawei.com>
 <X+L7usyEWYXzxQWD@kroah.com>
From: Zheng Zengkai <zhengzengkai@huawei.com>
Message-ID: <7df00fa7-df62-e963-6fb8-5e66fc47383d@huawei.com>
Date: Wed, 23 Dec 2020 22:41:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X+L7usyEWYXzxQWD@kroah.com>
X-Originating-IP: [10.174.178.154]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_094217_885488_5BD809D3 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: balbi@kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Greg,

> On Wed, Dec 23, 2020 at 10:13:03AM +0800, Zheng Zengkai wrote:
>> Hi everyone,
>>
>> Friendly ping:
>>
>> Just want to know why this patch was ignored,
> Right now it is the merge window and we can't do anything with any
> patches until 5.11-rc1 is out.  After that happens, I'll work on
> catching up on older patches like this.
>
> thanks,
>
> greg k-h
> .

Thank you very much for your reply and information!

Best Regards,

Zheng Zengkai


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
