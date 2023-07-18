Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39638C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 06:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VCelOGB4zgUacfUijKiShd7yE3WlFb3S6Wgx7E68Fs=; b=2oTT/NGzFpXaAp
	bZthqQ7BpkL0CWSUMiCMMXCRgeRKTISLHNg7vVPToAj+pnzYABlFH/co/EcE/sCjBshZL2sjQaG8o
	41tiGFQCUdx+nyB7lQd1PFcy+GB0MJH3Ish56k9lFvBfnGWDKYE6zwGHyHsILN5jW9f/yFR49q9Vu
	TQ/d2ur/NkQczyqN0EOiAaxOIL98jd+tiRMhnpq1zCrZQJxrVNvFKiu9MPV8URRveMZQBcjnvIHzG
	tTzjzsaXMYo8g8UwS5JHAjAzgKGSPRgRje48IEVqRB7M59eYOXHwAmMlFoPSCQYtbkQDVi1tVkawK
	n4AFHmhwqSwDGK9FzYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0XG-005fNT-23;
	Wed, 19 Jul 2023 06:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0XE-005fLG-2C;
	Wed, 19 Jul 2023 06:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+zwczu5QnNIOzrEHPAFvLC0K6U11d0b6oW/2YUo3A28=; b=nldGO4N1f+qOD23y2ret1wD2Xu
	BDhsdlAQrH9QGv8PTqgn414tY6hAck8GTdSTbX30b/e3IsVOH0xHp39nQD9OQI0AdhPNdWbOHDjyM
	g9YUKJStNqEny8hmO3VaWydDag2+PzSO1lpBuQcQ8sTETHJdaiW939Tl3xtQ0AWRWync0rZdm44Bd
	UAxPWYD3mbIERxspr6G3oH5PIcvAdFcxTTDg4APVVSmjZy8GIVUZ+YFn7AsPeleppCVgdKq92j1BA
	/RPkoygrWJ9KBWFPhMTK8NQa8MV92w2R2kWWES/8VT7v5NRanMnqfymhTn2IQVT0qQqcxPdzEGVcH
	Ex9u9Z/Q==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhDG-00BMox-26;
	Tue, 18 Jul 2023 09:41:48 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4v5g2M4gz6J6gd;
	Tue, 18 Jul 2023 17:38:31 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 10:41:01 +0100
Date: Tue, 18 Jul 2023 10:41:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: George Stark <gnstark@sberdevices.ru>, Jonathan Cameron
	<jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <nuno.sa@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] iio: adc: meson: tune init sequence
Message-ID: <20230718104100.00007c0c@Huawei.com>
In-Reply-To: <ZLURZWPkmP6aKDOZ@smile.fi.intel.com>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
	<20230716171134.43d05c45@jic23-huawei>
	<a172c764-1eef-835f-f237-8f78b4c6e877@sberdevices.ru>
	<ZLURZWPkmP6aKDOZ@smile.fi.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_104146_850973_F734B87D 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, 17 Jul 2023 13:01:09 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Jul 17, 2023 at 12:41:29PM +0300, George Stark wrote:
> > On 7/16/23 19:11, Jonathan Cameron wrote:  
> > > On Sat, 15 Jul 2023 14:05:57 +0300
> > > George Stark <gnstark@sberdevices.ru> wrote:  
> 
> ...
> 
> > > These look fine to me, but I'd like them to sit on list a little while
> > > on off chance anyone else has feedback on them.  
> > 
> > I understand. I'd resend the patches in a week or more if there's no
> > feedback.  
> 
> There is no need to resend as long as they are available via lore.kernel.org
> mail archives.
> 

FYI, I track using patchwork.kernel.org so rarely drop a patch set down the back of the
sofa any more...

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
