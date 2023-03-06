Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91B8C64EC4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7MYbA7oYgRdBM0mFl8S6ilQs9y7GcXAZ7ox8vuH1Sc=; b=iZpObqQgz/ujhS
	uHheGFIm84Q3hd/N85FxUqg6/8MrjYAEAim/X5cTV2MEFI9SSt7kCD5ed3OsQeCBsxGuhWH/OvXvl
	IMZMPW1BDakGU4wKlnBDVvPvjrbIYUMJ/BL8E9qd8y/+vCKMFJ4WGTd2pGg4/piYRZcgjDjygXgCL
	cY1UNjAPdNWiFJ0FR372xz4VNL6xD2KVsj0Ukpad18z8J6REwUwJ2UPGvz3Or7yFS1ISUg2VQm897
	Wp/ygVYVW6lfAjT1bP8ZA6bO0L8mlPgT/X26RiXf+wzfng8kxF6/ttOLqSEr1zpiVItuMmv9fxMAk
	2kHDKX09mcjqa8Ko6VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGB7-00EU4Z-5f; Mon, 06 Mar 2023 19:07:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGB1-00EU1H-H7; Mon, 06 Mar 2023 19:07:19 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BEC795FD0A;
	Mon,  6 Mar 2023 22:07:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678129632;
	bh=NCUnwGZBy5amnKE42xeiDjRu/asqJxD6kfl0v1O6JII=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=O3VAcuh+1ndOXCy+v/Y+8pIdSKyJvwKzfZs9MYM7qxJ87U8MwTkMxe2tvycvVpsUr
	 GiA7q/pffV2qC30pfkA3iQyxuR5LjSwwKhZ83OrJRCqOR/NDGWeTASsXOVlSwmI9Sl
	 7ecm2L8DnaGCEIQv3MysY/veylsqd0wM+PXFd5Lz+426uPm/lqQmHQTFjviYeOYbAq
	 dGDujwi9OxtJDvrijfEkk0MaKWhpgD+aYkJ8RMop3ciC4rYb+RPkLOy50LvyrPvd4O
	 /45bhVNU3/fRsqRjP8LOzzWHeTB/F4P4WtHl4MKF8YhLs/RGjOxACFP8ven6dvHwKm
	 +uTaAWnJ/WKGA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  6 Mar 2023 22:07:12 +0300 (MSK)
Date: Mon, 6 Mar 2023 22:07:11 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 3/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20230306190711.dl7rozpd57ilfjqy@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-4-ddrokosov@sberdevices.ru>
 <1jmt4qazb3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jmt4qazb3.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/06 16:19:00 #20919562
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_110715_802570_85CCDDF1 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 06, 2023 at 12:33:48PM +0100, Jerome Brunet wrote:
> 
> On Wed 01 Mar 2023 at 21:37, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> > clock controller bindings.
> > Also include new A1 clock controller dt bindings to MAINTAINERS.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> 
> patch order is wrong.
> Bindings before drivers please.

Totally agreed with you. That's why I see Rob's kernel robot errors.
Will be rebased in the next version.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
