Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BB3C63777
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 03:03:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97CF72074A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 03:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z5KrkDhs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97CF72074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jRyCKLFtKqxIKEy8LjcST1WelQXyCOBTuVWT7EAprw4=; b=z5KrkDhspeqkbKeztDkDgG/Au
	omg3LYsK1hvY71lK2iB3fdqDgnSY96n/IlQ3T+arN8exBk/JW/RQsd/UQQJhToEs+EHBm7GZGA3Qv
	SDOPCWJbgCQyYuVp8wSGumHBL+EmjnVWxV4+Gskypk92pIyWSEkkXQGeijRojcTcZhcIccJV/TlrX
	kc73xGjYfvFFwYoNiNqpKbulJ/zqLIUdqermcF2pVXJYrQNjtYp35SJSVoTY/bu/eTSFyodCDb2an
	8Z2p1XNbh87G7wMHuGycvi9hQVTc0wsMDHzWFsxf/Ee6AVleV2+Azc5XHdSYW3tiAcTAzMw0n9Cpp
	14eexxvCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjvxD-0001xX-6C; Tue, 01 Dec 2020 03:03:47 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjvxA-0001wY-PL; Tue, 01 Dec 2020 03:03:46 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ClRjz2zpBz76F5;
 Tue,  1 Dec 2020 11:03:03 +0800 (CST)
Received: from [10.174.178.154] (10.174.178.154) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 1 Dec 2020
 11:03:27 +0800
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable clk on error handling path
 in probe
From: Zheng Zengkai <zhengzengkai@huawei.com>
To: <balbi@kernel.org>
References: <20201111095256.10477-1-zhengzengkai@huawei.com>
 <CAFBinCANr3zC4VxeGFTXhz1ZmTiOJ44r7DX8EmPwOjezyFAmhQ@mail.gmail.com>
 <7ea6de9c-f482-2f8e-1d54-b8c127d10f22@huawei.com>
Message-ID: <f17665d6-7ba2-314e-3ef9-46641733b063@huawei.com>
Date: Tue, 1 Dec 2020 11:03:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ea6de9c-f482-2f8e-1d54-b8c127d10f22@huawei.com>
X-Originating-IP: [10.174.178.154]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_220345_086954_E07C1BDC 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Felipe and Greg,

> Ping...
>
>> On Wed, Nov 11, 2020 at 10:48 AM Zheng Zengkai 
>> <zhengzengkai@huawei.com> wrote:
>>> dwc3_meson_g12a_probe() does not invoke clk_bulk_disable_unprepare()
>>> on one error handling path. This patch fixes that.
>>>
>>> Fixes: 347052e3bf1b ("usb: dwc3: meson-g12a: fix USB2 PHY 
>>> initialization on G12A and A1 SoCs")
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> many thanks for this fix!
>>
>>
>> Best regards
>> Martin
>>
>> .

Could you please get round to taking a glance and giving me a reply? ;-)

Thank you very much!

Best regards

Zengkai


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
