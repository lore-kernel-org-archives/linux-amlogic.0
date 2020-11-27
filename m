Return-Path: <SRS0=VV3M=FB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9259C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 07:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176E421D93
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 07:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NezVS67Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176E421D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d4sTXyfRtvEt/ritHpCxr6HJN1V8tIxHtPpynET8vi8=; b=NezVS67ZhIAadF9jf3YPXaHcP
	hd//TNE8MrnNvNPiuAIHLsRbgDPFIBTt7aSzvoEeKn5kKQUBT+CO1al/vn9Omx14fpXkkim4qArhQ
	4DNHbZpsxi0LqHKqs1Ob6fMFX+ttWLcOOGuQ8bkTT8x3c9I6xnMX6FLRweepWgMmGmqIZFR/sG+Tg
	0QT2YJXX3fiiCl8UL2lq8Nl8+b4eKq8JDn6CY5ZyaQVqefl2xyXAqurpRPRH0DskkCgSmbxjwheE1
	WAPu6gUg5jdSH7hYApfmt/uIp6wNZpEHG43VUdTytyhxzS3HcaNweei6EpdMJUg0R2aPU1D80iovq
	NgzRwkTTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiYEG-0006Xo-EL; Fri, 27 Nov 2020 07:31:40 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiYE9-0006S4-Px; Fri, 27 Nov 2020 07:31:36 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cj5rq6ZfCz6wBk;
 Fri, 27 Nov 2020 15:30:51 +0800 (CST)
Received: from [10.174.178.154] (10.174.178.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 27 Nov
 2020 15:31:11 +0800
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable clk on error handling path
 in probe
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20201111095256.10477-1-zhengzengkai@huawei.com>
 <CAFBinCANr3zC4VxeGFTXhz1ZmTiOJ44r7DX8EmPwOjezyFAmhQ@mail.gmail.com>
From: Zheng Zengkai <zhengzengkai@huawei.com>
Message-ID: <7ea6de9c-f482-2f8e-1d54-b8c127d10f22@huawei.com>
Date: Fri, 27 Nov 2020 15:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCANr3zC4VxeGFTXhz1ZmTiOJ44r7DX8EmPwOjezyFAmhQ@mail.gmail.com>
X-Originating-IP: [10.174.178.154]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_023136_141719_20F9A830 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: balbi@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ping...

> On Wed, Nov 11, 2020 at 10:48 AM Zheng Zengkai <zhengzengkai@huawei.com> wrote:
>> dwc3_meson_g12a_probe() does not invoke clk_bulk_disable_unprepare()
>> on one error handling path. This patch fixes that.
>>
>> Fixes: 347052e3bf1b ("usb: dwc3: meson-g12a: fix USB2 PHY initialization on G12A and A1 SoCs")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> many thanks for this fix!
>
>
> Best regards
> Martin
> .
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
