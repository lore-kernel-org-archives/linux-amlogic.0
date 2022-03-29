Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A2C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LevbHUr5xic6XK2nUgI2eVOI+v+dA0Wg2KDrfoJzboA=; b=oKvTzwyVUNpkW/
	BLcKikN9eEnUe9FyK3B8sncViJKQUppOTgJjOIfmzEEbTxCsiiHcKy+VztnOmB+6Nk5AAh+I8Wjsy
	Y5nHGVJY7oph8tvDuxG36YVcqcyNpS/sZBmnlvsDuK41EyLGVHJLKK2vGbghL/QgXsz8q0JXQExzb
	ow67qI3yEKd/eh4aSyrO5KEjDOX85vLFj1LBRZ/vDzzh2P/ppGKIHwsq798JSXtVdjJg0BShXtgHt
	NgWrRZWUhVft7uClUQ0yrYTa6NdPVBKLuCTs346ZlzDGfU5QD3sTToOc/zwo7JxuGt4uUiCYtDTuQ
	fuZKR6TcQLHQqwgTTAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7cV-00BWwR-Dw; Tue, 29 Mar 2022 08:54:31 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7bu-00BWb4-7z; Tue, 29 Mar 2022 08:53:55 +0000
Received: from [192.168.1.103] (10.28.39.59) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 29 Mar
 2022 16:53:50 +0800
Message-ID: <a5708e46-7169-c2e3-369f-e31b8a5d1b14@amlogic.com>
Date: Tue, 29 Mar 2022 16:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pinctrl: meson: fix unused variable warning
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220329060821.15251-1-qianggui.song@amlogic.com>
 <1j8rstjhec.fsf@starbuckisacylon.baylibre.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
In-Reply-To: <1j8rstjhec.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.28.39.59]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_015354_348925_57063572 
X-CRM114-Status: GOOD (  15.10  )
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



On 3/29/22 16:21, Jerome Brunet wrote:
> 
> On Tue 29 Mar 2022 at 14:08, Qianggui Song <qianggui.song@amlogic.com> wrote:
> 
>> The kernel test robot reported a warning as below:
>>>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>>     static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
>>
>> Fix it by adding missing description about this pins
>>
>> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
>> index 3c7358f53302..067c6749c849 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
>> @@ -575,6 +575,7 @@ static struct meson_pmx_group meson_s4_periphs_groups[] = {
>>   	GROUP(tdm_d2_c,			4),
>>   	GROUP(tdm_d3_c,			4),
>>   	GROUP(tdm_fs1_c,		4),
>> +	GROUP(tdm_sclk1_c,		4),
>>   	GROUP(mclk_1_c,			4),
>>   	GROUP(tdm_d4_c,			4),
>>   	GROUP(tdm_d5_c,			4),
>> @@ -937,6 +938,7 @@ static const char * const iso7816_groups[] = {
>>   
>>   static const char * const tdm_groups[] = {
>>   	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
>> +	"tdm_sclk1_c",
> 
> Thanks for fixing this.
> Could you please try to keep this list somehow ordered a bit ?
> Here you are adding a new line in the middle with single entry ... it
> looks weird.
> 
>>   	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
>>   	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
>>   	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",
> 
> .
Just think that put the tdm_sclk1_c in first line make line too long. 
Okay, will put it to first line next patch that make one line per bank 
for pins in order.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
