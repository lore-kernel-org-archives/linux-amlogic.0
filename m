Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D18CC04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC4460FE3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC4460FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KIeW+DZz/tPnuaCEUTR0w2scD0X1UJ+7YNeXTXymVk=; b=el8WNRTdcBpvdi
	GVZCZ2Je+FbDqna4UuaXZhuPurWNXAsmSiWtDNNoY6ZNsxuwdwgA6eLCvhe5bwbTx0rq5NHLu8uGg
	2j66J+I+romH/xm2lgefVE/NkxYRMW0H43N1dhLMmZCSzXZFSF4bP6bSalf1dNMFNCjWhj3+dZK3i
	nfRpghAnMRQyTGfmN5DuJMhx1VREuKC/QSqcFWN8Hs6EAEwCnaun2lBa5sDVYAbQxWfhKO49Z0JTa
	4uX3aR1FNl6/PjeTpa1eeublNRvgu1T2E/t2TDgGay1LUIt2zg8LeO6ycFd77+VxcDcb2BdwKtnsK
	sfI4Z+lGy/P6n4mQZUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llELs-001GrW-Pp; Mon, 24 May 2021 17:26:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll95g-000shX-Iz; Mon, 24 May 2021 11:49:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n2so41307443ejy.7;
 Mon, 24 May 2021 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmDg0OPTc/Mfj+nfatUnRkw+P07W4/4NyprXDsEBySk=;
 b=M+KshWcevyw3gQMskiFellZq+xtrLGDuoL87DH6TQrGPYgG6+WtwHqkFMteifIoZDy
 IUx04svtQOuCDeWD0yPirVmgprpN9L1d37Hr3tApiluwUuMG3UcHsi06JSxHrWLKAdZf
 0qPjLHkAH23x9Gw0GmIFXkd8LPoTtMwWQRAsV+i/XVej/nAhg6czR6PVGTQCAKDmT1RT
 sTxSwnZnPSjtlksPRLbLvzIxGxy5R8yNg8th+V7l6igzmZKPtQV3gaznhNCZiqKGqgfb
 CjkpWhoLGuNCEEON1hxJUGJlw9WMFkzafaGFL3bhsKaUP6nxn2Xud4hRSh1PVUsI8SK1
 gt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmDg0OPTc/Mfj+nfatUnRkw+P07W4/4NyprXDsEBySk=;
 b=gNlLUy9QtoB4tjBOprHBldvrcE9n7FLddkfNm8pZeCZJTKqSjCUu9oVvqJ8bck/cgR
 sOOfeGno1t/o+a5xfAY2btDyHwTzgJcSe9yWs+pW5DaF1hmTD499pyHFDIP4AwjXZ03a
 cCJG+3LjLJmyhuvGlJD1tLWP7I0iOj32P8kMJcopJh7QZGV3ARtmjHeAepmYYtHdPBmu
 Dv8lvvZPvgzYtMAMauGjP8kZaBYqab7+MGMoHacGyPnDdyaIiUsYTaHLySY0SROrUgIw
 K1bIGRkoiDs57BCo68ntXIaUdFc1ABGtrwXA72K2e1nTxw9nxpyiuTqGnDbsQoATlx/V
 P6/Q==
X-Gm-Message-State: AOAM5314zUkjILqJ4mDz3GnvxVLSpXf1iUci18tC5tWcWYxeISDMQ/cK
 cSL1FIfmHNeTHcKVQo315GWzdvLHezTvAudS+cI=
X-Google-Smtp-Source: ABdhPJzD07dr5GAsLpaU3/MVHZTTnESWRgVvV5yJipcm5OF6jyEnTMkNYlSFvgDvRdDvG1QT4gLJcBIjaoRniROlDqU=
X-Received: by 2002:a17:907:2d8d:: with SMTP id
 gt13mr6315823ejc.162.1621856984608; 
 Mon, 24 May 2021 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
 <1jsg2cbdqh.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jsg2cbdqh.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 24 May 2021 13:49:33 +0200
Message-ID: <CAFBinCBs=vj_rp1yk_5bvYsMQUE6Pmq8xyc6JEwBPf6CewWm0w@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: Don't use MPLL1 as parent of
 vclk_in_sel
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_044948_663572_7AF7FB9B 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Jerome,

On Mon, May 24, 2021 at 12:57 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 24 May 2021 at 12:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > MPLL1 is needed for audio output. Drop it from the vclk_in_sel parent
> > list so we only use the (mutable) vid_pll_final_div tree or one of the
> > (fixed) FCLK_DIV{3,4,5} clocks.
>
> Are the fixed ones actually needed ?
>
> If the consumer actually lives on the vid_pll only, I'd prefer if you
> could add CLK_SET_RATE_NOREPARENT and assign the proper parent in DT with
> `assigned-clock-parents`
you're right, only the vid_pll_final_div tree is used
I just tested it with assigned-clock-parents and
CLK_SET_RATE_NO_REPARENT and it's working fine. I'll send a v2 later
today

Thanks for this suggestion!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
