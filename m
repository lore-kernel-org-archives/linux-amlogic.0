Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78AFC48BCF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 21:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7696D613EE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 21:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7696D613EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tNc7qXQUWjDCdtuWQn28nwKJd3TB85Bos1D/E9IJFEM=; b=WOiWMiV6NAjXEju9b6i5DM920T
	eEenwJVhhI14MYkKibZbg4ZaSONibQ00tFx8fiVFqUkmmVU/tiyXWJWhaWVUtHAGgAdDKYqR1D1KO
	seUOiBQS62A67j97Dv3VTrAm3OV4cbOdnXyTadwsDGOznHnZ+dMZLFd56nBPQoJAQAD4Yk9AH6hsr
	AbAgjxEdX93LjMom/NolYLhgqZiM+l+wa3G8aZHDTtx0AojJGXr+c5Z0UwKywkCIWgNhJsnXgBGjE
	LWzJlymdeqw/PIgtqGy5X0zszGNC9YANuuX6tooqFJOwzntHmKkrSI0zlWtpPnZEQ3CkVMwUlAYDO
	SNwvuWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr5WO-00FtpF-8T; Wed, 09 Jun 2021 21:13:56 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr5WM-00FtoW-Dj
 for linux-amlogic@lists.infradead.org; Wed, 09 Jun 2021 21:13:55 +0000
Received: by mail-wr1-f52.google.com with SMTP id f2so26950426wri.11
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jun 2021 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=cAUmhDMcAs6pVQpZ39SGVcYjz64esmLkl1UKed+u18o=;
 b=pNeRzIRnaTGmkgMPbCsKBqgdbBVn9dylp+G0Eqvxu807/HBsMAHxFUc5a+XIu1yHK6
 SKaaUgzOTNFBC4rvP2sqwz3/JVHsQc+6eTBDV1LrgowQmYyY2ozO+r3AudwfHuKHMPOt
 nGTVhRY7x9UToA6cGogqALMWoCpW1Q/oI5ZWOeIz6AqDIsPLFWHwkV40xCBf57Scki0W
 chuyVwZKLNkuY0csTRr/Q2Pu3QnvfhgPVge/m3gQajCdvc6Xhcsz3s8PJvC/bTEeK9Mh
 BS/28jwR12tLz6YgMI3N38oshG8cqKarWsMbTtKfAbFsGm1SAiDy1/0jJCJf3CZOQ/JX
 ZaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=cAUmhDMcAs6pVQpZ39SGVcYjz64esmLkl1UKed+u18o=;
 b=ZsBESESQ7nuOK6iSwQzpNI5dPFrpUWxgjkZVE9ravZNkpVMZlVuONbw7y9Wn6RWVzo
 tkuT2OtUpr+38kER3W9kCNSwrKTLon1JMJDBp6RNs//Zi/MlVcK0bZCXNd/30l436lUH
 DrpeABqtbSCw9ci6aHZT4iSmdP0KxwJXC625NYr7Gobe+8/x7AxlkEbCeq7EV+tpSM9h
 E4f5SbSR9ag9/oSup/CmXtekjt/c6A7bsjQNP6rI/cdK79i69hyUrGuaLfB1BK9yTfT9
 pn4h4EHLFIuayH7IhEklzuVLR8iDWRBaOBU0NElg0hqk/9HW74NsNrVvXWiBFrSWJN81
 r0sQ==
X-Gm-Message-State: AOAM532vj7wvJE5e44LMcNPNHaRwAYZXbJVwqI0T003J6AeG+jk9Httv
 o0tJntzEDSvy+yTym9jFadfbUg==
X-Google-Smtp-Source: ABdhPJyQoNukEOdgVu3ZKB+pj81tAMSWz8KS/fjVm7EvL0ZxydElHHPfNS/0BXv1kWn2Op9TO/p/xA==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr1736396wrx.22.1623273172798; 
 Wed, 09 Jun 2021 14:12:52 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id m21sm7088297wms.42.2021.06.09.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:12:52 -0700 (PDT)
References: <20210604032957.224496-1-xieqinick@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: xieqinick@gmail.com, narmstrong@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: nick@khadas.com, artem@khadas.com
Subject: Re: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
In-reply-to: <20210604032957.224496-1-xieqinick@gmail.com>
Message-ID: <1j1r9a214c.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 09 Jun 2021 23:12:51 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_141354_473931_E149C0C4 
X-CRM114-Status: UNSURE (   7.02  )
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


On Fri 04 Jun 2021 at 05:29, xieqinick@gmail.com wrote:

> From: Nick Xie <nick@khadas.com>
>
> This adds the Neural Network Accelerator source clocks for g12b.
>
> Initial support for sm1 already exist in
> commit 2f1efa5340ef
> ("clk: meson: g12a: Add support for NNA CLK source clocks")
>
> The sm1 and g12b share the same NNA source clocks.
> This patch add missing NNA clocks for A311D (g12b).
>
> Signed-off-by: Nick Xie <nick@khadas.com>

Applied. Thx.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
