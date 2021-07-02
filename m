Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84193C07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 21:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5674E613F7
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 21:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5674E613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJKPHFvvIvkgZ95hzxfGSzVqXE71uyvoUdTwzT1CUoY=; b=Gu/571uKDii8+K
	vSzjXlVDElyL4RdfisKUwRkvFOQ23RRdlh3OIib1Y3sCb6KQ2srs9h/Kleztw3jVfs8T1L2TgsVTS
	gzW+GOWE12Da9ioL8+kfGOUhedur1M6+dggBkiZ0r2v9zsacyzuETFrr7BB4F+vM/ISUc7pgG1Q7S
	DP2aGfcHC3vLKNlqcVzdmwvDrNa+uWIe6GUWfpIA4QvvAfGO3drZv8hh/YP1qRUlN1XSIfVxrA10g
	ooOICAuQs7XWcUX1g8GzpaYo0TVzwlavRBrmu8KYepWYWr0XECkw0UwhJ9rR5EE2fgaLTQ2CKw5VZ
	Imi1QmUaGDhQa/suSv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQHQ-0043LA-Oo; Fri, 02 Jul 2021 21:00:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQHO-0043K8-LO; Fri, 02 Jul 2021 21:00:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E68C61167;
 Fri,  2 Jul 2021 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625259654;
 bh=WOZ1VopfRwrnnRB8pJr+CmLYqpYymi8au37V22c6ILU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cZUPmVEuu0gWRMENpm98DvfRaC+h2GHX4YbmTv9UeHJcNwcYDlx6UJLolKVzBB7iK
 00qmT3BIYsgZzZ1T0Cv58FakY+fVxiUzKQFOj679u+AYj6fGVuUOQyAp5DKglSBUIj
 RR10lJKV/cwQEkRA3T6aIJjUfK/n2tHAr43olZkcKymvLTamFByWz2WxK7+R3FR9ur
 ChcOy+jhcH37K/twV5a94rG7c0A8I9uazPp3cfivmn3JJMVRIA0p1BpNI9iMi5zIof
 hageaNPakNSd286Y5JCNvpOUY19PMfrUqFuDselKK6fO+j/nfttz/mO8dO8N7o1/PG
 cK6IbvZRSlqCQ==
MIME-Version: 1.0
In-Reply-To: <e21c34a3-2586-057d-013b-6c8ec094d1a8@samsung.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
 <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
 <CAFBinCAASQUB=cg5EFsBQ4jd3TvcCJzV1=sYJci4ibR7FjRcww@mail.gmail.com>
 <CGME20210702124612eucas1p1762911deb37e4fb03adc9239bb715135@eucas1p1.samsung.com>
 <e21c34a3-2586-057d-013b-6c8ec094d1a8@samsung.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 02 Jul 2021 14:00:53 -0700
Message-ID: <162525965307.3570193.9588997729905273358@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_140054_754208_AD9C28B5 
X-CRM114-Status: GOOD (  15.06  )
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

Quoting Marek Szyprowski (2021-07-02 05:46:11)
> Hi
> 
> On 02.07.2021 11:19, Martin Blumenstingl wrote:
> > Hi Stephen,
> >
> > On Fri, Jul 2, 2021 at 3:02 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > [...]
> >> My guess is that we have drivers copying the clk_ops from the
> >> divider_ops structure and so they are copying over round_rate but not
> >> determine_rate.
> > I just learned something new - thanks for investigating this as well!
> >
> > $ git grep "clk_divider_ops\.round_rate" drivers/
> > drivers/clk/bcm/clk-bcm2835.c:  return clk_divider_ops.round_rate(hw,
> > rate, parent_rate);
> 
> I confirm that this issue appears also on Raspberry Pi 3b+ board. I was 
> about to write a bug report, but you were faster. The funny thing is 
> that is so nondeterministic, that automated bisecting failed to catch it.
> 

I'd think it was deterministic. The function pointer is NULL after this
patch so it should always try to set the PC to 0 and fail to execute.
Unless that is somehow executable?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
