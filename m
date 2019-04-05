Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A78C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 13:21:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2440021850
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 13:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B03FBix1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kNIQt2GA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2440021850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmmqNSXEDgO0cRzd4k+Qz4hQn15L5XnxcYvCEhEGbVo=; b=B03FBix154ttmR
	rG+LdOeWdM0EHGRbBNxiCdhOkqW1RlX9Z++lpNArtFZDeKRV+bidGPUlpAqpAqyGdL/55ZtDRNJ1D
	cUpSitCDClb3RV11BRaDzxHy6jIGFUiajUe/2QAqfc2zKMRo3ToCq1AR4YTSPZFUq+2qhK/aX4qSM
	MSDFPeeyQ9/b79OKZHZcsU2BMMaFPYVGMjwDHqiGe0tJj/v5zyciOrOJZlgIPFsxrU/GC5Z7KbRvv
	XVRPOfL0H3rRrKGa/aO4GIQL5tkd0q0Ugv/pJBk1IvpmiJm3FkSopRMw99SC52SInzEda63EjMmyn
	CRLsOcben7ybjMXzU0zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCOmu-0008J1-CF; Fri, 05 Apr 2019 13:21:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCOmq-0008Ib-Ne
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 13:21:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id r186so9728754wmf.1
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=kSx9mh5b7b6ARzAObtfWNQU4v3sEVl6a3sIbayKaOpQ=;
 b=kNIQt2GAnpL6SInmmxO6ujW7Ahcd69ywtmVV4PJ7eWJ1trfVx0Gf/YOUqe2z8c1iWx
 +/Djx293TN7PXO2KMBWkEl3QkOQNUa2ieeOV7H9F04QOXHZIc3fy5FqeGmcuJTCOcioF
 O2yHvVWpxIsms545A80iQXQ9ntakOiQLySA7/+HEwRiopddqqV203ivMIXIG5Xioo/pS
 8oDlYlB6ZDW4OlQPvOL2qcVGCK+BH0TC/j7PzRKpOgi55hfExamWUh3SsY5z+Ao9PpAC
 YC6nCKM3YJ98v+J44VqZsnybAnVTpxH3qdkjd2UfyMMUHKVkJOYJVgqUjNfY2192Vc1U
 0zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=kSx9mh5b7b6ARzAObtfWNQU4v3sEVl6a3sIbayKaOpQ=;
 b=b5tPp0NLAw5p4HpBu/PCHC0fQqTSpQaUc0I+np2zQLZ590IUWg+g5kTrnsOwykedGg
 sW7f+7eYmwCaleMtfjTZz+CersCTxhxmad+yWHp7RmabFJUncCIxDtiaDL3q3+m7qLS6
 Xn/d17ng3tc23XfrdfLYxwp0m5+epA3SPS9e0tWqvPR1W3DEp6//nnab759XVzFTMvMG
 L56R2fFFHhmso2Bb15iH+tKD/l+hDjhbwm0g7JFKE2rXivR40Lm2/R7T6sQwGV2wX7YB
 TU8ApfKQKA0lLkHYo/cNQE9n9eqn6D6noJYDEFuUdgY16ySjjlkgJsQVI4Xf/7sc3FzW
 hSTw==
X-Gm-Message-State: APjAAAVYpEuJKQpIJRwIUMaj6gkFp+ZVxTc4KFx/BTDQp1MdQAzRlOwE
 wDEyi+0uO0xy0LFSlrX4W+GOjg==
X-Google-Smtp-Source: APXvYqyyBhoJpfwNMz7AjUR0CO335m1tsYKHADDjtuXxv1u+XNUdWoOJb9V5FhBEHx4ZXxTMuvuYgg==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr8365626wme.72.1554470498603; 
 Fri, 05 Apr 2019 06:21:38 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 v16sm41444018wro.48.2019.04.05.06.21.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Apr 2019 06:21:37 -0700 (PDT)
Message-ID: <c1393b7d289c83197f8ff83e9d58fa5e5ac9487f.camel@baylibre.com>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 05 Apr 2019 15:21:35 +0200
In-Reply-To: <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
 <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_062140_816658_EB25FFC1 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-03-29 at 23:58 +0100, Jerome Brunet wrote:
> On Fri, 2019-03-29 at 15:14 -0700, Stephen Boyd wrote:
> > > > We actively discourage using init callbacks. Can you do this some other
> > > > way?
> > > 
> > > Yes I'm aware of that but init it the right place to do this.
> > > To be clear, this is not initializing the clock to some particular rate, the
> > > rate is preserved.
> > > 
> > > It just applies the necessary settings that needs to be done only once to make
> > > sure the clock is in working order and that the rate calculated is actually
> > > accurate. 
> > 
> > Ok, but can you do that in your driver's probe routine instead of
> > attaching to the init callback? We want to get rid of "init" at some
> > point so throwing the init sequence stuff into the driver probe around
> > registration is a solution. Or we should think about not discouraging
> > the init callback
> 
> Is is callback really a problem after all ?
> I think we should actively prevent using it to set a particular rate.
> 
> Here, the goal is put the clock in working order. The bootloader does not
> always do that for us. I could put this in controller driver, but I would have
> to repeat the init pattern for each instance of the clock...not nice 
> Using the callback clearly shows the relationship between the init and the
> clock. I think it is a lot better.
> 
> In the same series, I have added some init for the controller. In this case
> the init target a group of clocks, so having the init in the controller makes
> sense for that
> 
> 

Hi Stephen, Is it ok if we go ahead with this ?

BTW, it is not the only Amlogic clock using the .init callback (the pll and
sclk use it as well). It is not an excuse and I agree, there is always another
way to do things.

Still having an init() callback is really convenient for several cases.
Reworking those 3 drivers to do without it would not help maintainability.



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
