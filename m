Return-Path: <SRS0=7cY6=ZF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66501C43331
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2019 06:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37064206BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2019 06:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMguzppy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37064206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sDN1q2aYCVkcVm34mkQQ6uZonD4HENpXkCdSFnoSLg=; b=mMguzppyKdeZ6X
	fYILqC/49ioTY3heDv/3TD9TXG2Rx4uxxwT2GVu793sYtdSGV3QuFQm6WEjwbQxRF2T/gUaMYP4UC
	cSO/Z15sxfbshrfjdIcyjuDPQC6IYbjWwf03ZSIjdE4I4u1swvawLKHwOGUPfCoQKLg0WBM/QUURN
	sg4ucL0FFogdojP4Jv+hok4ZumlIcMTsmnftDVrtXHn/MBYQJ0JuenltnbRMAXlBHOXeLALzAva+b
	66dr+o9zKWDQ5TFF+kATbk6Mjwi9jRBVkJqMUASyRIAj+hTf1Tlmuo8QTrWHnQuHuRxShqsneudLF
	8lwmKqvR4YjphtMzE/cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUllX-0004xP-K1; Wed, 13 Nov 2019 06:04:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUllU-0004va-4q
 for linux-amlogic@lists.infradead.org; Wed, 13 Nov 2019 06:04:29 +0000
Received: from mail-sz.amlogic.com (10.28.11.5) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 13 Nov
 2019 14:04:34 +0800
Received: from mail-sz.amlogic.com ([fe80::ed49:2000:aa3e:d8d6]) by
 mail-sz.amlogic.com ([fe80::ed49:2000:aa3e:d8d6%4]) with mapi id
 15.01.1591.008; Wed, 13 Nov 2019 14:04:34 +0800
From: Nan Li <Nan.Li@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan
 <Jianxin.Pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix mmc dma operation
Thread-Topic: [PATCH v2] mmc: meson-gx: fix mmc dma operation
Thread-Index: AQHVkwa5AzBtskG6eEysgtiGF2SGpqd6sqWAgACWuoCAAG0ugIAAA9SAgAAGwQCAAAMtAIAASewAgADp/gCAClRwAIAA154A
Date: Wed, 13 Nov 2019 06:04:34 +0000
Message-ID: <bef7d514-874f-e70d-63ac-9db1a46b478c@amlogic.com>
References: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
 <1ja79b4mje.fsf@starbuckisacylon.baylibre.com>
 <e80cb817-e58a-68ce-a3c6-d82636aaf7d3@amlogic.com>
 <1j8sou4u1g.fsf@starbuckisacylon.baylibre.com>
 <7ec2e682-cfec-395e-cf38-58f050440c40@amlogic.com>
 <1j7e4e4sab.fsf@starbuckisacylon.baylibre.com>
 <dee789ae-6825-3f4c-16e7-227e064562d6@amlogic.com>
 <1j5zjy4fif.fsf@starbuckisacylon.baylibre.com>
 <ec705819-9763-b0d2-9480-949e7ccd1cb9@amlogic.com>
 <1jeeydf27h.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jeeydf27h.fsf@starbuckisacylon.baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-originating-ip: [10.28.39.107]
Content-ID: <6F2D462936CE644781F034542D8ACFB4@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_220428_185040_2611DF8D 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2019/11/13 1:12, Jerome Brunet wrote:
> 
> On Wed 06 Nov 2019 at 04:28, Nan Li <Nan.Li@amlogic.com> wrote:
> 
>>
>> I see what you mean, pre/post_req already provides callbacks in meson_mmc_ops for the framework to decide whether to invoke the chain mode or not.
>>
>> However, I searched the frame of MMC and found the use of mmc_pre_req() for this callback in the block layer mmc_blk_mq_issue_rw_rq().
>>
>> Block layer mmc_blk_mq_issue_rw_rq() may be useful for emmc and SD card devices.
>>
>> But it may not be useful for reading and writing operations of sdio wifi, and the sdio device communication may not use the chain mode.
>>
>>
>> Our chain-mode is a way to transfer data using dma.
>>
>> This approach is very efficient for reading and writing large amounts of data.
>>
>> If you don't do it that way, you'll do it the other way, the bounce buf way, which is limited by the size of the buf, so when you do big data reads and writes, it affects the transfer rate.
>>
>> Therefore, our chain mode means that emmc, SD card or sdio device will use dma to transfer data when reading and writing operations, so our previous driver and the patch behind me all ensure this.
>>
> 
> I see.
> The problem is that you are providing the same function to pre/post_req
> callbacks and the request()
> 
> IOW, things mapped in the pre_req() callback might be unmapped by
> request_done() instead post_req() which, I think, is not great.
> 
> It's been like that so far, your patch is not making much worse, so I
> guess you can go ahead with it but we need to look a this before it
> blows again
> 
> In the future, we should probably use the cookie to distinguish the 2
> cases ... or drop pre/post_req in the ops.
> 

Yes, you are right. The previous version of kernel did not have the 
callback of pre/post_req, so our drivers all took dma operation, which 
would improve the interaction efficiency.

I still have a doubt. In kernel, block layer calls the callback of 
pre/post_req to complete the mode selection, so the call of sdio is 
omitted. Since the read and write operation of sdio does not go through 
the interface of block layer, is this the function loss of the framework?

You are concerned that the umap_sg() operation will be repeated in 
request_done(), which is risky.So we can restrict that.
For example:
1. Add conditions in the driver. When only operating on sdio devices, 
pre/post_req interface is called in the driver.
2. Determine whether host_cookie has been assigned 
SD_EMMC_DESC_CHAIN_MODE before calling pre/post_req. If host_cookie has 
been assigned, it means that the block layer has called pre/post_req 
callback.
This should prevent duplicate calls.What do you think?

----8<-----
diff --git a/drivers/mmc/host/meson-gx-mmc.c 
b/drivers/mmc/host/meson-gx-mmc.c 

index f7ac88c..3eaae4d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -282,6 +282,11 @@ static void meson_mmc_pre_req(struct mmc_host *mmc, 
struct mmc_request *mrq)
     if (!data)
         return;

+   if (meson_mmc_desc_chain_mode(data)) {
+       host->needs_pre_post_req = false;
+       return;
+   }
+
     meson_mmc_get_transfer_mode(mmc, mrq);
     data->host_cookie |= SD_EMMC_PRE_REQ_DONE;
---->8-----

> Regards
> Jerome
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
