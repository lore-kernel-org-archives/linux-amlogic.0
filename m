Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0A7C48BD9
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 18:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517EB208E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 18:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nE7eT4mH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Spp9kx2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517EB208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5hLJ1nCNdGQYy5fviahO9VrpoZFgcKDlG3YC2RQEoI=; b=nE7eT4mHUY5boK
	VcXETMMXF9THNcYUKCP7OtaSwLJVQzGcAwzOndyDW8li6FMMTKaQTBcH1zV3lLcTbGU5mqcUyRFLb
	mN0AMlboVGU/GPt0OiNm8paqNxLuoQP9noUdJq1MDcwvnzVfD29HYqArGKtW5wx0uIKh+T0Hf7JcX
	kn9A7s4ziCyqsjo2une61FS0pXaiadz/42swNBIdmdNi2uZY9CmlsXFp+dLH1yypS7O7GgU9fFvAI
	PfRZGFUVTzkKPqWa+WJnU2DNTphSD/RDnjZM5lledbbvDRdfizt5sKLIC3LCMxsxt7pzZNbcU7QVg
	WznALlIw6EgU6Hv6D06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgCJl-000326-Hd; Wed, 26 Jun 2019 18:06:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgCJj-00031f-4k; Wed, 26 Jun 2019 18:06:48 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CC94208E3;
 Wed, 26 Jun 2019 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561572406;
 bh=2AI6vfXRA9shlQqJsOONaBOLJB2mY6s1tLqu+00O3F0=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=Spp9kx2SEGbyBvjRg7Rp8spfvABoWi0hW76zUYOM3FD6kqNq++B2bm2kKQRidP1z0
 qbLDeSCNP/lRY/2juCiLRkpXT4YSb6yqvqCgP6zTHA4HD4gWppy9wOI3qThityAkRa
 01Dxm3PzcYD9reVtw4Q1xhoPmvwMf05PC91C/YSU=
MIME-Version: 1.0
In-Reply-To: <2ceca0ca-8f8e-78a8-df39-67a763f28f30@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
 <20190620150013.13462-6-narmstrong@baylibre.com>
 <20190625202702.B9A9B208CB@mail.kernel.org>
 <2ceca0ca-8f8e-78a8-df39-67a763f28f30@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC/RFT 05/14] soc: amlogic: meson-clk-measure: protect measure
 with a mutex
User-Agent: alot/0.8.1
Date: Wed, 26 Jun 2019 11:06:45 -0700
Message-Id: <20190626180646.9CC94208E3@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_110647_205798_EDFE1386 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-06-26 01:24:47)
> On 25/06/2019 22:27, Stephen Boyd wrote:
> > Quoting Neil Armstrong (2019-06-20 08:00:04)
> >> In order to protect clock measuring when multiple process asks for
> >> a mesure, protect the main measure function with mutexes.

s/mesure/measure/

> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
> >>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> >> index 19d4cbc93a17..c470e24f1dfa 100644
> >> --- a/drivers/soc/amlogic/meson-clk-measure.c
> >> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> >> @@ -11,6 +11,8 @@
> >>  #include <linux/debugfs.h>
> >>  #include <linux/regmap.h>
> >>  
> >> +static DEFINE_MUTEX(measure_lock);
> >> +
> >>  #define MSR_CLK_DUTY           0x0
> >>  #define MSR_CLK_REG0           0x4
> >>  #define MSR_CLK_REG1           0x8
> >> @@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
> >>         unsigned int val;
> >>         int ret;
> >>  
> >> +       ret = mutex_lock_interruptible(&measure_lock);
> > 
> > Why interruptible?
> 
> 
> I supposed _interruptible was needed since it's called from userspace via
> debugfs, locking indefinitely isn't wanted, no ? or maybe I missed something...
> 

Sounds plausible to me.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
