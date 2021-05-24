Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BA9C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 22:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756C1613CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 22:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756C1613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GWdUcjZz1XN9KUmXOWEeHiZTXVCL+zPkjHoxDDn8mmY=; b=rpUtr7qa/R+OaQ4dmKrd6zNr6O
	3qs2qM55NMqs5GP3k8mWMY6GXsHh6ObGfoO3dH7UkUL4bDMsb4eIC59ibfzSl07gHRElVsfN/uSC4
	839ufdrxELf9bT1LC7/dGLgQ4z/dLWrWA7wqp+lqOSzWd4V9ubwFmdt25nOM7SEzQLV/umWSVoXfu
	MB41rpOFbRQ/CrOHTG+j73EE1rSs8O5sJaLJRmSht56niBB8t6p0hYNwQjjsDZK2lLWOc7+LNcQ6U
	f2bcLz1LMN19lnE5yQbVcpAstSfVYfiFnzjjW8+kIbK5IKIK9qY9C/Nn3V/LeqBARumNv9MgdBqpP
	j9kgsSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJQD-002DR5-AM; Mon, 24 May 2021 22:51:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll71V-000o7E-4j
 for linux-amlogic@lists.infradead.org; Mon, 24 May 2021 09:37:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r12so27814052wrp.1
 for <linux-amlogic@lists.infradead.org>; Mon, 24 May 2021 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=eDrYI330g2FzhYKn+4hPogmPRz25LSNoxfJ23kSyb5s=;
 b=tJ0hM2HiTfP+YC6rqU8Hf9M4qSZMUM/bEXPJyVK2XaI5QBuI01GybBYIiLPWmTPsDc
 gPrRZJ1A6FMrkqdw/G8l1cw53JSD54otveALt429Ks6gahJkpIFqZWFeg/MZ7hDQH4oH
 ZE8olc/FI/kO9m/0RvKVsDjBFgdGtDKtVTlR+itw1HSGRdWl5R4MkvMEjfH9kAFMofw7
 6BO4mMjkeUHTMDdZUOyN0+7gdG+EESIFSNctYRlsQOEbYNQqRtF5pUnEKgTG9X934Vi3
 /CpirNJRlSxfzJ0EA1muZSCbcybqnLDOrkacNqPxo+xez6TKs429RQaiMv393PQ3ni1n
 PZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=eDrYI330g2FzhYKn+4hPogmPRz25LSNoxfJ23kSyb5s=;
 b=r1w8m3CxA2yuTjRENjU59nL0QRSkDZYq0qpVOm/NyLLR478qPKwf3Bcaccv7wwF4eX
 Hp3x/kPZIggyRFGTMVTOS/gI4PpN5OYWQ0cbAOZMJSthlY1+3T0Rk3iSM7/D2KALlkD2
 ZT0uFQ03RkHHmyhQiUa5Dzw3+2KqdrzibsPXEJUlsI7TSFoK8fL+Qmz/kwuHzkiVSWib
 lq7Ot6q+64dVQlRvKpFTv8oOQpYY8Q/SMU6pwlhA2DyKeNFdKZfftEKtoVSqZscv/IhN
 A2nDKqDEsEJbBgtS6DhqeF5WvreZ9T3Wv1kLcAKXgEjq4I3GULuUWz4Akw2a1BEXhZ+D
 MYYA==
X-Gm-Message-State: AOAM53227TFPCGCcI5mJOVr7jQR3lNsBVhNw5jU1uecYjgRCvJqGSsJr
 4T2YJmBIoUq10GPdE9fFYuNxdw==
X-Google-Smtp-Source: ABdhPJyxP4K03dqX+BVEirSz7HMQ95Xnk4RY0NTu/bRcZAbWtqcKa2tYpeP7fH6NjTaC+VDVjR9TTw==
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr21126282wrs.144.1621849038532; 
 Mon, 24 May 2021 02:37:18 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id i5sm11881875wrw.29.2021.05.24.02.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 02:37:18 -0700 (PDT)
References: <20210520073136.272925-1-jbrunet@baylibre.com>
 <CAFBinCB=pAipcZOi8S005SyO8ptfzy8oGpW4S8Pi++A5-Jc5eA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: axg-audio: improve deferral handling
In-reply-to: <CAFBinCB=pAipcZOi8S005SyO8ptfzy8oGpW4S8Pi++A5-Jc5eA@mail.gmail.com>
Message-ID: <1jy2c4bhgy.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 24 May 2021 11:37:17 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_023721_205627_4080774D 
X-CRM114-Status: UNSURE (   5.52  )
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


On Thu 20 May 2021 at 22:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Thu, May 20, 2021 at 9:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> Use dev_err_probe() for clock and reset resources to indicate the deferral
>> reason through sysfs when waiting for the resource to come up.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
