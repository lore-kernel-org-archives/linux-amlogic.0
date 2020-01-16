Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5791CC3F68F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 02:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADA2222C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 02:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdG21shW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ADA2222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcye7G5e+Bw2a1Xiq/3RsFnMwE8jSAVH0MMbliAAURM=; b=WdG21shWmjZivr
	qLtP4OArAU0l/jge6Hv35MzdbcpHXq3GY3Yq3sJu4VOMyt3DpC5eECaj3IbFNE/0jigqEaa7w2YiB
	klrzJHAO7IdJmwnA85nNPSt+8FB3hlyzH2xKTss7TFrlnpnf76llvu5ZoOklzKy0a/AqE3g2gKIz3
	S/cv69aRc8/wqlhjvYzFN5Jh83rGFTCq1NIuLl72cNZlENqx7srqOzcIfzQG4dKPyNydwbIkZ6qx0
	k2pcNNm5vdhB4motOhowqfq/qrGvQMFu9FEaIRpMyvF6/XVXciJuvIghPtAFV/3taVXKrDXxEvgTv
	//sTx/W2O7od/BqfNKvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irudT-0003YI-9t; Thu, 16 Jan 2020 02:11:51 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irudQ-0003Xa-9o; Thu, 16 Jan 2020 02:11:49 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 16 Jan
 2020 10:12:04 +0800
Subject: Re: [PATCH v5 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCFUDst_-QtSuNioAa3ckt5GzTFDAhZWh3zu42VRByPpw@mail.gmail.com>
 <40e5b638-0606-70e2-3bdf-cc4619726196@baylibre.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <26139b4b-3ff7-ca43-4b27-f99946d4c23e@amlogic.com>
Date: Thu, 16 Jan 2020 10:12:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <40e5b638-0606-70e2-3bdf-cc4619726196@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_181148_342537_852A1078 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Liang Yang <liang.yang@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2020/1/15 16:01, Neil Armstrong wrote:
> On 11/01/2020 21:45, Martin Blumenstingl wrote:
>> Hi Hanjie,
>>
>> On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>> [...]
>>> -       devm_add_action_or_reset(dev,
>>> -                                (void(*)(void *))clk_disable_unprepare,
>>> -                                priv->clk);
>>> +       ret = clk_bulk_prepare_enable(priv->drvdata->num_clks,
>>> +                                     priv->drvdata->clks);
>> I don't see clk_bulk_disable_unprepare in dwc3_meson_g12a_remove()
>> please test that the clocks are all disabled (see
>> /sys/kernel/debug/clk/clk_summary for example) when unloading all USB
>> related kernel modules
>>
>>> +
>>> +       if (!priv->drvdata->otg_switch_supported)
>>> +               goto setup_pm_runtime;
>> my brain doesn't like the goto in this place because this is not an
>> error condition. I was about to write that
>> usb_role_switch_unregister() is now skipped even though we're calling
>> usb_role_switch_register().
>>
>> I want to hear Neil's opinion on this because I got confused while
>> reading the code again.
>> my proposal is to move all of this OTG related code from
>> dwc3_meson_g12a_probe() into a new function, for example called
>> dwc3_meson_g12a_otg_init()
>> then only call that function when OTG switching is supported
> 
> Indeed it's not cleanest way to do that, if you respin a v6, put all the OTG
> setup and role switch register in a separate function.
> 
> with that and :clk_bulk_disable_unprepare() in remove:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil
> 

Ok, 

I will do it in v6 patch.

Thanks,
Hanjie

>>
>>
>> Martin
>>
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
