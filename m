Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7720AC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGcrsYHNNtPPh3nfnle2+cvH1Z64RG9V3Zl0WkW4jQo=; b=w02R/GeimfcG77
	dP/Z7Qyt1kuNBNuiX6YpjOZrfyqtK72LWZ9x1XvRnHnVpxv8N6A3fKKoDnlR/qNuJR9+R2XJRzTfv
	1M6uJ2TLN8o1pfz56Oyk9JpXCVyvtH5nNwFiRs3u2882YewIaUbMLfRVwNfSO0FVFtIpcGYDlitkq
	2euisCYyjHVzCtt6/+WdjgnvQksIdedd5nYGcXyqK8sqFT2z+R8H3/Ys2hIfcdNLTtrnlACvnfaQg
	JPUVo0n7e80zyAH7bZg+jwtJr26dA/kprLj+S5+/c6CeyipNmL7cQAe/YATE+2YwWED7+Y40Jel4i
	kng+ebhMDyTGi+Za37rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n92At-00CFQp-2g; Sun, 16 Jan 2022 09:50:11 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050::465:201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n92Aq-00CFQB-05
 for linux-amlogic@lists.infradead.org; Sun, 16 Jan 2022 09:50:10 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Jc9Hq3wg5zQlWq;
 Sun, 16 Jan 2022 10:49:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1642326597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5LrjAbPdo/A2nrBhoOhdJxR6g5DwmCNB/WVn11zbdg=;
 b=hLHy+sR2gGYWk/G1XB42XLD7PDozerm7RKwnuIr7gFOjT+NnWDeBBw78ZQS7A0A9Ss/js7
 NagfLLaPcQZU8YnzoTm7E1MpdvDt7fp/qlVC5FF6l1H9pfY7yX8CFsvCERCsA8kaueDt2+
 mAvTNw7APHIsidcvfliRo4fPFTDpRx/xq/ORHwAS9q5ibJ+5SqfT4tn4pv3/xU/F64OX1A
 UxrRU+W704H1IPbjqWFaPrrDkcca/6O0+J4X6ThXTGw/HzXvrxo6A4UxDUS1Gq+eLg3umT
 uUTy8LNDgzDbcLEQoMqDjpJjdWs0xtQ2F0gy6eCAqsUeJNsBpHQpoigJYCp0jg==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names
 property
Date: Sun, 16 Jan 2022 10:49:45 +0100
Message-ID: <4732096.GXAFRqVoOG@kongar>
In-Reply-To: <1jilulav4u.fsf@starbuckisacylon.baylibre.com>
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <1jilulav4u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_015008_252005_795CE231 
X-CRM114-Status: GOOD (  15.09  )
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

Am Samstag, 15. Januar 2022, 16:04:10 CET schrieb Jerome Brunet:
> 
> On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> 
wrote:
> 
> > Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
> > property. Add it.
> 
> Binginds *mandates* ?? the bindings you are adding mandates that, not the
> previous doc, nor the driver.

Well, under required properties 'reset-names' is listed as well as 'arb' is 
required, only 'rst' is optional.
So when creating the .yaml accordingly this leads to warnings this patch is 
about to fix.

> Modifying drivers and DT to accomodate made-up bindings requirement is
> disturbing.
> 
> The bindings should not require that because the driver does not, as it
> stands. The driver requires the arb reset to be provided, not the name.
> Please fix the bindings.

Nothing is made up. When creating the .yaml file I took the .txt documentation 
for granted. How should I know the bindings documentation is apparently wrong?

When using your older bindings conversion [1] I'm fine with dropping this one.

Best regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-amlogic/list/?
series=246453&state=%2A&archive=both



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
