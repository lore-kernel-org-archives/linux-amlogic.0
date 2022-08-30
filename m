Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E035ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZGg6aLjNBNL1FWSSpM49/5YJK2OvbG8twpfiSUgwts=; b=WOOlU8a3tJuvjNvMcdJtftTiyH
	E7O88hl4kAQMyABW5ZoOtoSQjI0lbBcy6PYQ9wP4uNc1GCFKilWOEZh+98ZzcmTaPbhFfZnWJ5BSw
	klxjgtQ0evKe6/hHI2ILxYf37F3JUrye/wTNon3aOlwv+3ukKy0xjoI5mJwPGKh3hctSdaJX3WOih
	i2AaF7zeEa0/ujnSxbB7oZv2IT9FL2Ov/iudV6A543JNVS/6GQ0GSX0xxgSF6SvVAg9fh4M4idJO3
	hx0iB7YqTrRtdBQuS5DxFHb+mp+QxvvLPr8CquoxYmqGx0uVwduMJAqEpJb+KCiSSN0nry6f7V7D5
	us24Qy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuQ9-00EKhl-84; Tue, 30 Aug 2022 06:08:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuPs-00EKcB-GF; Tue, 30 Aug 2022 06:08:05 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 14:08:02 +0800
Message-ID: <b98ad038-5f69-204f-fda5-0e55b34144c7@amlogic.com>
Date: Tue, 30 Aug 2022 14:08:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
 <1jwnartm78.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jwnartm78.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_230804_636425_C272CE9F 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2022/8/29 17:46, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Mon 15 Aug 2022 at 14:34, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> Hi Jerome,
>>
>> On 2022/8/10 21:47, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>> On Fri 05 Aug 2022 at 16:57, Yu Tu <yu.tu@amlogic.com> wrote:
>>> */
> 
> [... ]
> 
>>>> +#define ANACTRL_FIXPLL_CTRL0                       (0x0010 << 2)
>>> I already commented on the "<< 2" . Remove them please.
>> Sorry, maybe I didn't pay attention to this comment earlier. A little bit
>> of a question why is this not okay? I understand isn't it better for the
>> compiler to help with this calculation itself?
> 
> Because it is aweful to read
> 
> Also please trim your replies.
> It is a bit annoying to search for your comments in the replies
> 

Okay. Like this?

> 
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
