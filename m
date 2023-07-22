Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F6EC001DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jul 2023 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPxZYuQpieN1TCLnlz/PhUbKKY/E65UqFh7+ST8T9wM=; b=lWBxTXWV8zs8y+
	pRfuhjXqiPJLEf+eo0n/fqYCfJfmujqpvtPOF38qF5nZhrJlcQznQawqfGSzd8ImUzxxud7iQRygY
	Yfkp6v7TrextrxGzpqYMIhlzoTG2MOcSn8xyWcgncoDd2GxM3byEV3Tx5+vCRJm09kaHJXYK+QzTN
	+/tnG1A50gsct5akZ6iiDFQa5qr9/dFfCGetljFttbTvYlrOR4U23esmqQCrGBz5p6fFHjyz4K6M6
	K0KW82lVkj2ITNcTJ1/v0PgIyN7j9RO+A2OzF2JrsAMrZSZs+azVT0zyA9x9LZXGgUE8K209jkh7L
	SO+iEAdtygihl9XHFr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNGD9-00H2fG-2J;
	Sat, 22 Jul 2023 17:16:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNGD5-00H2ef-28;
	Sat, 22 Jul 2023 17:16:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 228D060B06;
	Sat, 22 Jul 2023 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1427CC433C7;
	Sat, 22 Jul 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690046162;
	bh=UtehOe8WTVzu8GcIyD+eOJNbkMTE6KmMtq2wqtqtVng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qET9tvS3S2dwl9ETuKZlL040FF+aM/XHYro776mxCqW+nsMoM5ISL4u1reAkJ1860
	 2laI4MwIHd3hbR+2wIdGvoplEHJFh5X5ByEsoL9sIU20IUi1HkJJWVanJynn9jZY5x
	 a7OFSXvhXXdqfRT2ubOBafRAYaV9cxGPJDg55aBLxwFKyUb7U0WetKsFNbxBMzTg+v
	 706tAy0HE8W/78BInYFumAOYSWsEc81QcdUzB3yxqS7xEzA+tkqnAivkAIWlx/8LQ3
	 Cd3BahUskSzhPhwQ5lpog/GLCUaVqN9wTYuDFzvYUfR8fleIXv/n4M85HFoEpMk5rA
	 10l8qAod0WTYQ==
Date: Sat, 22 Jul 2023 18:15:59 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: George Stark <gnstark@sberdevices.ru>, lars@metafoo.de,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@sberdevices.ru
Subject: Re: [PATCH v2 2/2] iio: adc: meson: improve error logging at probe
 stage
Message-ID: <20230722181559.02c8362c@jic23-huawei>
In-Reply-To: <ZLphZzO20QW+t1m/@smile.fi.intel.com>
References: <20230721102413.255726-1-gnstark@sberdevices.ru>
	<20230721102413.255726-3-gnstark@sberdevices.ru>
	<ZLphZzO20QW+t1m/@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_101603_746104_80FB8E8C 
X-CRM114-Status: GOOD (  12.01  )
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

On Fri, 21 Jul 2023 13:43:51 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Jul 21, 2023 at 01:23:09PM +0300, George Stark wrote:
> > Add log messages for errors that may occur at probe stage  
> 
> the probe

British English - excellent ! :) (I argue this one far too often in
specification committees :)


> 
> stage.
> 

I can tidy this up, but the patch will be a while anyway given the fix
needs to work it's way into the upstream for my togreg branch (and I need
to have send a pull request for togreg as well).

Jonathan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
