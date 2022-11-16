Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00F0C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BP5Wo/MDSRlsWMkwYJWj2WRbZQwowpkmVe6EmD38+0w=; b=BoviDPAJiNRvHs
	plIsZ/myPmzktvY4c6M9cje49i70EzfPN6Ce8cshmSFBQ+94YhAQFukDilpyI3r8iq27ojyR5iXdt
	pS0kKiuV9hIVVQAfROS5c8WxYhAZLIjKczWnLuyqONIxHIeHWrqjW2qGMvAT6owoWe8RrhLu5X0lq
	6Tx73n7IDFF64ZYmD1CKRukRC4k7H4/qFBL+bGjLTPgdEBzU8A9yXmsudSfWbi07N/9K/pxN13vVy
	wTU721tQzsHqfxSYVRopScKK2/2ay9fK4ibkDGUYW1deH+dV+eR84DSxnz+OkOUZlgn+TL4aEeHXk
	e8zMXfFY2N1V/91i0zfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovF2g-001vZC-UX; Wed, 16 Nov 2022 09:49:14 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovF2V-001vML-LH; Wed, 16 Nov 2022 09:49:04 +0000
Received: from [10.88.19.158] (10.88.19.158) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 16 Nov 2022
 17:48:57 +0800
Message-ID: <ccc924e6-8626-c95a-1be8-c2280fa06f3a@amlogic.com>
Date: Wed, 16 Nov 2022 17:49:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 1/2] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>, John Garry <john.garry@huawei.com>, Wan Jiabing
	<wanjiabing@vivo.com>, Chris Healy <cphealy@gmail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris
 Healy <healych@amzon.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
 <Y3SjuC6xHn1uz2zX@debian.me>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <Y3SjuC6xHn1uz2zX@debian.me>
X-Originating-IP: [10.88.19.158]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_014903_724980_3333FD4F 
X-CRM114-Status: UNSURE (   8.78  )
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


> What about this description below?
>
> ```
> Add support for Amlogic Meson G12 Series SOC - DDR bandwidth PMU driver
> framework and interfaces. The PMU can not only monitor the total DDR
> bandwidth, but also individual IP module bandwidth.
> ```
Thanks, Your description looks like much better. I agree with you.
>> Example usage:
>>
>>   $ perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
>>
>> - or -
>>
>>   $ perf stat -a -e \
>>     meson_ddr_bw/total_rw_bytes/,\
>>     meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 \
>>     sleep 10
>>
>> g12 SoC support 4 channels to monitor DDR bandwidth
>> simultaneously. Each channel can monitor up to 4 IP modules
>> simultaneously.
>>
>> For Instance, If you want to get the sum of DDR bandwidth
>> from CPU, GPU, USB3.0 and VDEC. You can use the following
>> command parameters to display.
>>
>>   $ perf stat -a -e \
>>     meson_ddr_bw/chan_2_rw_bytes,arm=1,gpu=1,usb3_0=1,nna=1/ -I 1000 \
>>     sleep 10
>>
>> Other events are supported, and advertised via perf list.
> The demo example should have been outside the patch description, though
> (more appropriate documentation as in patch [2/2]).
>
> Thanks.
Okay, I will modify it in the next version.

-- 
Thanks,
Jiucheng


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
