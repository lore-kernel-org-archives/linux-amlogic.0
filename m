Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47A3CA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 08:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A580620640
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 08:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdlQ2zQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A580620640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00uqZ8G/nWzY9a61Zs9A7q1ZqzSnpXbEJN95b3J0TQM=; b=fdlQ2zQ/54nIxL
	iOYX3jJzJhnIQLbtna56RcGGSTNiO5AdOhm2gmkHxZwu+b+ySc/OJPWglZRtrabxGnPvSN/lNQY4e
	3QrRMw1b21+oIT4rLxY3oWuHiJIZ+3vF3NAsQzdu5X+jHLzhS70RpJKSCA9klgsB+JjGl77fsWmpB
	umXwHz5J5WjzIW1iCpmJ7Bjn7Pcfw4Y3oLAEcobSkIB2hc1CISB7JVQ/IkAjOY8cL+coRiwAIzcxQ
	+hvv/E8k8ladJLCAiUy6cLB9BW67VYhFV3OiADvdEMuKIsg2TqQMTg8pv5WYMVcMG2d6+y3ukQKAp
	u4LNQm6hHQv+JsEiipyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMSys-0001wr-7X; Mon, 21 Oct 2019 08:23:58 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMSyo-0001qY-Aa
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 08:23:55 +0000
Received: from [10.18.29.227] (10.18.29.227) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 21 Oct
 2019 16:23:57 +0800
Subject: Re: [PATCH] mmc: fix mmc dma operation
To: Neil Armstrong <narmstrong@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
References: <1571637541-119016-1-git-send-email-jianxin.pan@amlogic.com>
 <fc1f61e1-b156-11e6-3f21-c498d2f0a8c6@baylibre.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <a322d35b-28de-acb9-842c-ac64ba40e9b8@amlogic.com>
Date: Mon, 21 Oct 2019 16:23:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc1f61e1-b156-11e6-3f21-c498d2f0a8c6@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.29.227]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_012354_386451_7C99F1E7 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Victor Wan <victor.wan@amlogic.com>, linux-mmc@vger.kernel.org,
 Nan Li <nan.li@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thanks for the review, I will update the subject and commit message in the next version.

On 2019/10/21 15:57, Neil Armstrong wrote:
> Hi,
> 
> Thanks for the fix.
> 
> First, you should add "mmc: meson-gx:" in the subject.
> 
> On 21/10/2019 07:59, Jianxin Pan wrote:
>> From: Nan Li <nan.li@amlogic.com>
>>
>> In MMC dma transfer, the region requested by dma_map_sg() may be released
>> by dma_unmap_sg() before the transfer is completed.
>>
>> Put the unmap operation in front of mmc_request_done() to avoid this.
> 
> 
> You should add a "Fixes:" tag so it can be backported on stable kernels.
> 
>>
>> Signed-off-by: Nan Li <nan.li@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
[...]
>>  }
>>  
>>  static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
>>
> Neil
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
