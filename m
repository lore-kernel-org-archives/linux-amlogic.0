Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA00C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 02:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ/voaPNQmW59fczdRWJ+VogafpxDf/mwaTE94nEn8g=; b=FBOuUd1nd+OCoq
	21bPWYIjEEEGj6i7XC/6q0mX4nV/onEG0DjTOvWymjB+FwBAVHTea6GAryQfeZooO0ZLLjAriH94v
	onnENvs7fnMzF4tuZmgspV/TRJpv2kTbhvXopSzTA0VfUrLWZ9bgUWJ3xYf0killYEa+dp9ZlVVX1
	HG5BZ5M6jwWvezW45WvfhvexOVNMldz88eGDI0C+7/ks5hFsfU1jgMef7O7LJZxAe0F9OvDuTvbPA
	/m4Zl3gzVZGnqHMPVwzOWmQB/t1ezp71Vv22lhmwKGkyt1+IngUGQ4JKPgF9ym58T3IafA/jCQCXD
	Gih9ewH0xp0HSbhDh00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz7P-00Cuf6-1s;
	Tue, 28 Mar 2023 02:31:27 +0000
Received: from m12.mail.163.com ([220.181.12.217])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz7M-00Cue1-2P;
	Tue, 28 Mar 2023 02:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=tA0fWIdSREazRi2gsLXlzBOKFVkGlLcy9hDX6nupWJw=;
	b=dTgF/Uti4piGybbbfm/Ad3OY7td8IalSUzmPmCJ32ywJSDRRG4fo1e53h31xMo
	TeMjEeO3NZXKy5CB2n2NH9bSBV5t2ng96SpCsL58XiUk83VAx3lYDlhq4jpOILd4
	PUPIcNqY1VCnIJh3e97oeB+lGp8MbRtwEgfWsWgAJ7HpI=
Received: from [10.88.19.164] (unknown [61.150.11.36])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wA3vVXwUCJkCStCAg--.9235S2;
	Tue, 28 Mar 2023 10:29:06 +0800 (CST)
Message-ID: <79968005-28f3-d890-dfea-faca2e7d7947@163.com>
Date: Tue, 28 Mar 2023 10:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/3] perf/amlogic: Fix large number of counter issue
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>,
 Chris Healy <healych@amazon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
 <20230209115403.521868-2-jiucheng.xu@amlogic.com>
 <20230327141054.GC31752@willie-the-truck>
Content-Language: en-US
From: Jiucheng Xu <jiuchengxu@163.com>
In-Reply-To: <20230327141054.GC31752@willie-the-truck>
X-CM-TRANSID: _____wA3vVXwUCJkCStCAg--.9235S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trykurW7Xr1kJw4fGrW3ZFb_yoW8ur43pF
	WkCFyFkrs8Jr1qgw17Z3Wa9a18Xw47Ar9agrW2gw1YvF12qF9xWasrW39I9r1DJrs2kF4I
	qFyYg3y5uFyrZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfqXdUUUUU=
X-Originating-IP: [61.150.11.36]
X-CM-SenderInfo: pmlxuxxhqj53i6rwjhhfrp/xtbB0xhA4lXlyiHoCgAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_193125_186285_ABFD3F4D 
X-CRM114-Status: GOOD (  13.72  )
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


My Amlogic email box has some issues. Use my personal email 
<jiucheng.xu@163.com> to reply.

On 2023/3/27 22:10, Will Deacon wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Feb 09, 2023 at 07:54:02PM +0800, Jiucheng Xu wrote:
>> When use 1ms interval, very large number of counter happens
>> once in a while as below:
>>
>> 25.968654513 281474976710655.84 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
>> 26.118657346 281474976710655.88 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
>> 26.180137180 281474976710655.66 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
>>
>> Root cause is the race between irq handler
>> and pmu.read callback. Use spin lock to protect the sw&hw
>> counters.
>>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> ---
>>   drivers/perf/amlogic/meson_ddr_pmu_core.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> index 0b24dee1ed3c..9b2e5d5c0626 100644
>> --- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> +++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/perf_event.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/printk.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/types.h>
>>   
>> @@ -23,6 +24,7 @@ struct ddr_pmu {
>>   	struct pmu pmu;
>>   	struct dmc_info info;
>>   	struct dmc_counter counters;	/* save counters from hw */
>> +	spinlock_t lock;		/* protect hw/sw counter */
>>   	bool pmu_enabled;
>>   	struct device *dev;
>>   	char *name;
>> @@ -92,10 +94,12 @@ static void meson_ddr_perf_event_update(struct perf_event *event)
>>   	int idx;
>>   	int chann_nr = pmu->info.hw_info->chann_nr;
>>   
>> +	spin_lock(&pmu->lock);
> Why doesn't this need the _irqsave() variant if we're racing with the irq
> handler?
>
> Will
I think meson_ddr_perf_event_update function is called with hard irq off.
So update function couldn't be interrupted by irq handler. Right?

Thanks,
Jiucheng
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
