Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CADC77B62
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWpCx+DOLLT1Ve0mcEvZ79qYUar2v7HgadtdkWhrEDk=; b=s8iCJgLIlRqNbf
	OMJHblxOrKGfH9yhNhrLsnO/ED601lCmvuhNnBpCxIxKz+0MOQUymRfAiFHTjbPZe/HwLqb52EYuk
	Ni2pxKZppk8oSLuc26EzxBc9DZH25eDcslgAwVRkN6C+4fHXUB1+qSjrhhkNmyrAZ4RiKixRfpZ2R
	CPfENcq9+aKg1NGCPRQhq+vcQ95ZAvC888OUw0gv+8srqefbrv8bDMgDgFxGH84DT3/aAw0GX3DeH
	mJiCYzUnQy4qF5eFASmiZ3s3Bes8vA3j0Tahar9fvk2UX+rhUzhX4NqGQCc8wJUEaTqUH4jr3t2bK
	4NcGlLr8uTWCPZkxTh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnYu-00BEHc-33;
	Mon, 27 Mar 2023 14:11:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnYs-00BEFV-07;
	Mon, 27 Mar 2023 14:11:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78BF9612A4;
	Mon, 27 Mar 2023 14:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A91C433D2;
	Mon, 27 Mar 2023 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679926260;
	bh=RRlj8SX8e59FcNYzqGReCEP8Q5Z1eD9qPrgCjM6F8jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUzbAp7cDBPuYbKlJ2W5QBYwjuPWjoUmmnG1/051vFdTWbjCnP6CVydyHfVwT0cm0
	 aaxcdLQ9tHvXIHg2hcRG1XErPhCTraTdDGVcmm+uOxwFLc8JhAGjMHYhLpAqVfXG/P
	 cfAraquHUKLuxpewVvx+Qon3Fk0Dg2Bn77xcn/4vacjVN+WNeX4jUYRbzMTDIf/Pqt
	 zLQPc0AJVjVPNJFQSCVdWhSx0DofQYr7YoPMJ+hloGTeYlK8ZLuOGKQYshCp1bhOAE
	 LYYX7ef0I4SFb8TGC3qMdyYVQkOtM7+53F1RJJKug48XWOkMGkVBHSsXc2VEQgr6dq
	 hbym7vuVQfCfw==
Date: Mon, 27 Mar 2023 15:10:55 +0100
From: Will Deacon <will@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <cphealy@gmail.com>, Chris Healy <healych@amazon.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/amlogic: Fix large number of counter issue
Message-ID: <20230327141054.GC31752@willie-the-truck>
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
 <20230209115403.521868-2-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230209115403.521868-2-jiucheng.xu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_071102_107326_DB7F5EFA 
X-CRM114-Status: GOOD (  19.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Feb 09, 2023 at 07:54:02PM +0800, Jiucheng Xu wrote:
> When use 1ms interval, very large number of counter happens
> once in a while as below:
> 
> 25.968654513 281474976710655.84 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> 26.118657346 281474976710655.88 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> 26.180137180 281474976710655.66 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> 
> Root cause is the race between irq handler
> and pmu.read callback. Use spin lock to protect the sw&hw
> counters.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  drivers/perf/amlogic/meson_ddr_pmu_core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
> index 0b24dee1ed3c..9b2e5d5c0626 100644
> --- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
> +++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
> @@ -14,6 +14,7 @@
>  #include <linux/perf_event.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> +#include <linux/spinlock.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  
> @@ -23,6 +24,7 @@ struct ddr_pmu {
>  	struct pmu pmu;
>  	struct dmc_info info;
>  	struct dmc_counter counters;	/* save counters from hw */
> +	spinlock_t lock;		/* protect hw/sw counter */
>  	bool pmu_enabled;
>  	struct device *dev;
>  	char *name;
> @@ -92,10 +94,12 @@ static void meson_ddr_perf_event_update(struct perf_event *event)
>  	int idx;
>  	int chann_nr = pmu->info.hw_info->chann_nr;
>  
> +	spin_lock(&pmu->lock);

Why doesn't this need the _irqsave() variant if we're racing with the irq
handler?

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
