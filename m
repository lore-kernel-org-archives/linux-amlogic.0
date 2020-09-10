Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFFFC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 09:49:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C377720809
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 09:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imEkCGo4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S36d+wG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C377720809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rBFQn0waLQeQClMUq/KGEOnxd/JGbRfrJpn/a7NSi1M=; b=imEkCGo4b7x+ywLMSSb1WwSx7
	PBE42JpZnUTQ5AkkdR5CbOvx4Ey7/2ZLnYXgphLaLSHJ0tqm2OSBRXTylTodppfi4LupfpUwbams6
	UfCYiclp/zoV8fDEVnv2E63U6UweinMcW3eyO3VPNByJ1bA9V3FXyAzG6jGSiPMfXL0awT6xQFvR3
	SkGSpyEvHvG2AbrhnUGywGjoCPV1Ab9COtqAX2m9+lXrbw8Mz2OWUSs1N/or283GUvbrR5oxr0eeo
	FePfFVECqOYGA6HMccN3m/O6/1Dtz58YoyeDlSnOV+KTgZqS0DiuslDvrlOT9fzeNxsd/71IecyzK
	j9YG6oqDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGJCY-0002n6-P4; Thu, 10 Sep 2020 09:49:10 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGJCW-0002m2-6h
 for linux-amlogic@lists.infradead.org; Thu, 10 Sep 2020 09:49:09 +0000
Received: by mail-ed1-x543.google.com with SMTP id c10so5641398edk.6
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2020 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=+nnm9BXqafE/FDvFW/KQ+vqXtpX/12/KK71uDZZ++kY=;
 b=S36d+wG8zLWz+Gzwo/f8s5vcy9F4lRF7s6PS4Zs8zXBC7Ovqjo3S1m55kIPRT4vsId
 cku3TPgQ4tcMbz1mdQtfyLQ1R0OBWAmfw4BWntl3L4r+Qo0L/qmQ3SgVAulS3aFdcOk4
 6NUbopDyxJYka77t9oHquxjsQZyJ2UhoggflvzSLGg9RbbJs1NSjp9HKE1wYsT1zI/gS
 3EDErlaQ/IcS38itNRA2VwH7JAjXw8sFXxTqgR4NSD9qzhBbad8JIFvmeX3FqpDNx9Xj
 ok8qLq1drBHoVbBmkIdg8sU1iNMY3XFgeshKrMkJc8UNZlcVfCVIRTUiIentDXYdIZyW
 e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=+nnm9BXqafE/FDvFW/KQ+vqXtpX/12/KK71uDZZ++kY=;
 b=K9AichunDX8+U7gAnOCnxEg16YVmOPDyo+Zf/0SjP3NepbEBYvJOundSp3y7XoQ+9x
 OUNYqipC40rYz2p3hHhSDWr60yt1sC3Z0UYK64MrylA2bQ4kRfHOn2Dwvr1HkfLwKtGz
 +/k+mM4F2N47W52sAFphkjoPUYnNhdDAS+7lzT3TfY80nH3XWEYF13pbaeOTqAGKe1g5
 115snO5rp8wvdsC2hPHdnCPlJMH3WyvSQWXXheqqoTM7IwunEqBnlUPypblj7AMAx4Qc
 WSoWINQi5QBlOrM2ceg8U+yFhRCRpnVmMkssknHPI5onGQOMZ0VjOoNp8h5U+Rk4ODVX
 XNOQ==
X-Gm-Message-State: AOAM531yEeUR+GPHHBQEcMUmsibFPzKFlqYxbuy7DjEJawBSkdMN7RoU
 MLc6Ag8j99EopUMPMHhICKsVhw==
X-Google-Smtp-Source: ABdhPJw201OWJh7qykUkjB31eTxWyErlzB+x7CVYxeqsXmzk8Hk4kfsUruIZR9aOu2UOPtXuvCvyHg==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr8428632edq.327.1599731345283; 
 Thu, 10 Sep 2020 02:49:05 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id i17sm5944547ejy.79.2020.09.10.02.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 02:49:04 -0700 (PDT)
References: <20200828154735.435374-1-jbrunet@baylibre.com>
 <159972433977.2295844.12910258806178190962@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: meson: make shipped controller configurable
In-reply-to: <159972433977.2295844.12910258806178190962@swboyd.mtv.corp.google.com>
Date: Thu, 10 Sep 2020 11:49:03 +0200
Message-ID: <1jzh5y9d2o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_054908_359458_10A0D50F 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 10 Sep 2020 at 09:52, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-08-28 08:47:35)
>> Add the necessary so bits so unnecessary amlogic clock controllers can be
>
> s/so//

Fixed and applied

>
>> compiled out. This allows to save a few kB when necessary.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Thx

>> ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
