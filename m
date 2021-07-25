Return-Path: <SRS0=knDR=MR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58612C4338F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jul 2021 14:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F207C60E09
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jul 2021 14:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F207C60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4Wa2cj+W1hgsYk3Gb1G6XQeR7/1VI+iOn2nckrOEPE=; b=dx3GWKXsIzMnDW
	FvYQReo2FhH/WVneao1QXK7OOJWz0CqjzITr+SiHWmupfBehfK5FU3gp719hBRDOHzVEYjiZH65Ub
	JZ53UoftZNrPqd62GlPBRhh9gVaviXDT9ax7TIQCMHT8HhMgiW8eycBBQXdB4INfD71l8OmPImN37
	LkXF+c40NmBV3LcO2HMN/1Sis3ebh4Y6n+hh8LITjL9n8u2BRwF0UhDnU8XNXQuiUQxxDu4WXBWWu
	bwqYqzjEbA2A337csARRigHctV4vPfiy4Wzd9wK7Fodw7WhOXWg3hkD+ijN4uOw38w9/5LEwiafJK
	Tc+6q1khGTKkn8BbaUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7fXY-008jIp-9P; Sun, 25 Jul 2021 14:55:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7fXV-008jIG-BU; Sun, 25 Jul 2021 14:55:38 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D78A760E09;
 Sun, 25 Jul 2021 14:55:34 +0000 (UTC)
Date: Sun, 25 Jul 2021 15:58:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lars@metafoo.de
Subject: Re: [PATCH 0/3] iio: adc: meson-saradc: Three small improvements
Message-ID: <20210725155806.0d22449c@jic23-huawei>
In-Reply-To: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
References: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_075537_464549_4006B4EC 
X-CRM114-Status: GOOD (  16.63  )
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

On Sun, 18 Jul 2021 01:37:15 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello,
> 
> the first patch from this series saves a few CPU cycles on G12A, G12B
> and SM1 SoCs. The other two patches are small whitespace cleanups.
> 
> In my opinion none of these patches are any real bugfix, which is why
> I omitted the "Fixes" tag.
> 
Series applied to the togreg branch of iio.git and pushed out as testing
to let 0-day poke at it in ways I can't be bothered to ;)

Jonathan

> 
> Martin Blumenstingl (3):
>   iio: adc: meson-saradc: Disable BL30 integration on G12A and newer
>     SoCs
>   iio: adc: meson-saradc: Add missing space between if and parenthesis
>   iio: adc: meson-saradc: Fix indentation of arguments after a
>     line-break
> 
>  drivers/iio/adc/meson_saradc.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
