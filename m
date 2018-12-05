Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980D0C04EBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 03:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F87720661
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 03:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVtD+2Nq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F87720661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b0TOCCw1pe5PavKrXcTZx3/Qza4Equ18e/7NzTzVarg=; b=LVtD+2Nq/owYhDZaGIgJYpBwT
	3COEkQhuxzMgP3Pc3XlK1VI9kTcM3GhvBcTIWasn7bjWr7mYTSyOYrMOVuotMqhB9UhwCrwxqvGrZ
	FKwo7ywIKoB4ELXrtaBJncEz2UHlKMF9MN1Rf4MnzucPbXyTTVO61L3rmBbFhGySEE+WCLUxME80G
	cSE6HQxSMnx6AkGbyxxrLp8BVCOJH30IYuKVvJSouw6MrN2/59Lr6JGmitODuzqxNr8JHLZ3n9OQC
	NoRi9Q7xZA5rfB1IXAdDqyLLbCjrjpnry57n1XUmptWyMlYTlCdYCuOiNv9VdTQ8rowoqtdyLBVtR
	AhdtXfSAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUNas-0001kC-8D; Wed, 05 Dec 2018 03:11:22 +0000
Received: from mail-sz2.amlogic.com ([211.162.65.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUNah-0001bF-Rz; Wed, 05 Dec 2018 03:11:13 +0000
Received: from [10.28.16.74] (10.28.16.74) by mail-sz2.amlogic.com
 (10.28.11.6) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Wed, 5 Dec 2018
 11:10:54 +0800
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: meson-g12a: Add G12A EE Clock
 Bindings
To: Rob Herring <robh@kernel.org>
References: <1543498917-98605-1-git-send-email-jian.hu@amlogic.com>
 <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
 <20181203230645.GA14522@bogus>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <5d181208-1d51-fb1d-da8f-d8e1f55709ac@amlogic.com>
Date: Wed, 5 Dec 2018 11:10:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181203230645.GA14522@bogus>
Content-Language: en-US
X-Originating-IP: [10.28.16.74]
X-ClientProxiedBy: mail-sz2.amlogic.com (10.28.11.6) To mail-sz2.amlogic.com
 (10.28.11.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_191111_933321_6C7AE48F 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, Rob

I will add it in next version, thanks.

On 2018/12/4 7:06, Rob Herring wrote:
> On Thu, Nov 29, 2018 at 09:41:56PM +0800, Jian Hu wrote:
>> Add new clock controller compatible and dt-bingdings headers
>> for the Everything-Else domain of the g12a SoC
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  1 +
>>   include/dt-bindings/clock/g12a-clkc.h              | 93 ++++++++++++++++++++++
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/g12a-clkc.h
> 
> Please add acks/reviewed-bys when posting new versions.
> 
> Rob
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
