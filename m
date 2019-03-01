Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5F8C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 17:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6B420857
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 17:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fIAfOXYA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OswRkEMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6B420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dw7t7mT/MI5Ye9HXT08hrTNfbsUZ1QssqAWc92JmTgg=; b=fIAfOXYAZY4Ebf
	0jr3nn3LAAB10opnDQirFL2LFBBOtNFQUirFvRsppwkN6C08pRlpI6oWfuq56/sDl5b6dFhef2XJg
	OG/Ise126OdubzFqi383uy8HadgS1mgsgCPiT4/2Ha0bhMW+agbf84iJvxD766tsvdvKwh+upuprK
	4xgyEiei3Yaywz4ckH4czeJFHMm2YYZDhNRzSsd+Dbebit47JqO1mwuysu+iuofv1Db6jX2rKUQZG
	FrICwXOsI2SZi/5YFDha0FJVw+2Y0V/1mRxry/ggIK6eG0uBSoHBMaewOUvL6v/RO1kMtu72AL73F
	0DgGyn/oAVbvtTda8bZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlbD-0001IA-JQ; Fri, 01 Mar 2019 17:05:27 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlb9-0001Hc-V5; Fri, 01 Mar 2019 17:05:25 +0000
Received: by mail-ot1-x344.google.com with SMTP id q24so21612602otk.0;
 Fri, 01 Mar 2019 09:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TS2oNY4HfsJhDMVwcswsu8FZ8ib/zHV6j835eCfyGLI=;
 b=OswRkEMstAuif4RS3Do5iMeBc6c6jEl9neM4eEGAmREZtvhMRvkuhx7NHuGwCbk9BK
 4peoKFHecQZV3Wbrv+tnDtzrcqM8gvi/Nh+ii9elIkK5zQQ6puG1UjfagRu4gkyzLIjA
 sfPLkdRWEfNfiBtlOh+ts5NXOmjowuowEmTZimb6YRoZJKaMDoE/zKsYb5MVHh0VJDOB
 zsUTN9k8RXr0wiWlzfJj06hTNtIawJJj+ADbvWR902bAwYEZ63jra8Hmfum+c7dGFrwg
 7StgPhwxvubuCEJt2jU6WwtF/RGI9Ldw1n+pl9RO4wPPA9kKnvj4AVBOfrG1AOYUE9TN
 imVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TS2oNY4HfsJhDMVwcswsu8FZ8ib/zHV6j835eCfyGLI=;
 b=mdfJC8jVOAC5+Fj8lqnTGx4I+6A8Ok5MAtl55LtFYgheBiME3e1hRulIIh1nC8fnr8
 uSLMHTqDIKJRLvOpEqn6weHRdzPO342zXgd7nH25Rkq8rZkYiBpQ9zAWWDyV++h5DGsz
 wY/Q5rIphUrqfQD8uKib9ZlgvS6QavUNenwA6DOBqmN0enxplE+ERjVhwYh+zg5nkr98
 TwigbaFi7w4TPs90i0V7ctrhFWnSST2ta/cpbysnRK4DjSJtS7a+navuHDVUrJAIw/wU
 51YU73WdqNg4d9ZFQRtLl24UP9aI9odHanRSwvPMQInQ82wB0UzFKbiOyzcHEvtdTttH
 aZ8A==
X-Gm-Message-State: APjAAAWEJ5AhhIWcxKdSkezdQ8QFvrJ/E7Cjskjxhhf/4C7u2slRWEbd
 03McmNwQDMVkIqV4nozXd9PUdKjAhHzxxafY7r0=
X-Google-Smtp-Source: APXvYqwsTkIjwBot2w5Ng+9fomMlKgcYPCmyZUu9wklmT2VrB9CBW57WGAe247B9PS+bZOAvuoupKOZDqRmri1HYgMA=
X-Received: by 2002:a9d:a11:: with SMTP id 17mr4219386otg.148.1551459923091;
 Fri, 01 Mar 2019 09:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-2-narmstrong@baylibre.com>
 <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
 <d841b285-7994-fd7a-215b-13314bd0b298@baylibre.com>
In-Reply-To: <d841b285-7994-fd7a-215b-13314bd0b298@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 Mar 2019 18:05:12 +0100
Message-ID: <CAFBinCDt=BB_nAJ5P1TX0ahmOiqTaLGrqv5X4v2u62KCPw1UGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_090523_999415_7B7DCA56 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Mar 1, 2019 at 5:43 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Martin,
>
> On 01/03/2019 16:26, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> >> it should be the only ID used.
> > is this also true for the CPU post-dividers (APB, ATB, AXI, CPU CLK TRACE)?
>
> Do we need these to be exported ?
I'm not sure as I couldn't find more details about APB, ATB and AXI on G12A:
- APB and ATB may be needed by the CoreSight bindings
(Documentation/devicetree/bindings/arm/coresight.txt)
- AXI may be needed by the VPU driver (the S912 datasheet mentions in
OSD1_AFBCD_ENABLE: "id_fifo_thrd : unsigned , default = 64, axi id
fifo threshold")

if you don't know either then I'm fine with skipping them for now, we
can still export them later.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
