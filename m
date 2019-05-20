Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DCAC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14560208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpnjGGsJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Gw5ZFVvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14560208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIi4fMcuQ9nftT/g6veLs/yNVVkdUTIfzxwrRSxVMjU=; b=FpnjGGsJbW0lhh
	Rhs+SF8EhQlf9eplx/fmsROAh4cfbCaGydcNShmugNajiAMiqmO/APnoT0iLRHnyBu3CHiG3cNCf4
	CZbAfs50J6ZDnq1TpliypkBT3uwfzX86XrOsa7IjKFTvk95T+ZvBpeE6BjGYzoEfPcsbHqQWf3YJU
	VlGUox1qE+c7T0jn8omWhy9HYnvU+MMHHyABKQSpXixKIKnPiOSXGglNn+nh57JJ26FCEoHxhMfEn
	1EikcP8WtaEANwE2hEwc6g73XmWUKsfkPZWNSp+AM0rScrltaFBynCFrYnkuKG/UBbftRohAlCDJ8
	h9C2RfHjJbrdvg3hwuZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmgh-0006Rt-VT; Mon, 20 May 2019 18:07:03 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmgf-0006RY-IE; Mon, 20 May 2019 18:07:02 +0000
Received: by mail-oi1-x241.google.com with SMTP id u64so1481957oib.1;
 Mon, 20 May 2019 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/mkNRaloYm4q4e81CZAIxtva6CYlEwPt4YAYYrKrHM=;
 b=Gw5ZFVvWbGzpmF8y+hSk7oez1jyyFwu8IUGwPSJyfDu1oSbl8A71FC/8MM5seTbyYc
 nuo3bsJir7/6msWzaYixA3kZWV+qQRscTDPO7wgQ1CigsRRWt+jUNbq92qvrhKCNLMeN
 ltU4TB02W3YKesBRXKCtic0kTRChVtV7wDkcuKnh/V+kLWdK9BBhhow2r1cRmq/JfMOr
 mc1uK3tVodISTIUqEwTRx8kK/C6CHFcsxf3tkmQmWLHHxGGq8VtFmgVA3FM/ARqwe+Ph
 DtLGQC3ZEOGqKIhmSsPZBDRVeucSx2J7tmH2B5dM3nOfZQ1OoSgWgAxOkYD0mbrMLz5o
 jG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/mkNRaloYm4q4e81CZAIxtva6CYlEwPt4YAYYrKrHM=;
 b=at4eCOktQvKUNxkvRYbbuXs8pBKpukUgHjK3Brgy1ewVWqfKusfQQzZ5yZk01rLVS7
 YMlJVDvDtPTz1Wav/6avcPq/K63fGNsieGN1uv7DPvmriGZEHblPiP1NN8GHa7aPND+c
 8mM6GKOKgph06+7m7yJmnYxSQ5Yryfq2SGE6Ycr+XCpjc8Ga72EsE3oKNJMoKltHuJ4Q
 AM9MiSZxp7vncGEYpKBxOGUNu1oHg4BbHdWwZ8/zkNy9ceIun/NWm+LnJqLEHq3JMqB6
 WIFas3TvtiroV2Pj9aD9HCpzPlQdoiwXkN291sBgpjjfiupX8urvZEMlbkU2/1cs/6VI
 Tt7g==
X-Gm-Message-State: APjAAAVyLX2xUaOz9HweA4XHhMiadtGke3SOemwzzAuaaUU77ijkCaQf
 oRQ60wlU76LJS+ZTKZ04btl5DqoOKgBEINILrVQ=
X-Google-Smtp-Source: APXvYqxbuQHL22U8lHijHjitJPXnnx300LA4EOUxMrBsIl4UhxogFbmLJxCUA3WXmBC1dAmeI82mdcOhr+suIYh5+YE=
X-Received: by 2002:aca:4341:: with SMTP id q62mr358048oia.140.1558375620395; 
 Mon, 20 May 2019 11:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143812.2801-1-narmstrong@baylibre.com>
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:06:49 +0200
Message-ID: <CAFBinCCEi8OjeDaWxfhyfoQOu3GVsw=U9jBLQ2LEkPn7Ataf7w@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM: meson: update with SPDX Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110701_601747_3025D99C 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, May 20, 2019 at 4:38 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the SPDX Licence identifier for the Amlogic DT and mach-meson
> files.
>
> Neil Armstrong (10):
>   ARM: dts: meson: update with SPDX Licence identifier
>   ARM: dts: meson6-atv1200: update with SPDX Licence identifier
>   ARM: dts: meson6: update with SPDX Licence identifier
>   ARM: dts: meson8-minix-neo-x8: update with SPDX Licence identifier
>   ARM: dts: meson8: update with SPDX Licence identifier
>   ARM: dts: meson8b-mxq: update with SPDX Licence identifier
>   ARM: dts: meson8b-odroidc1: update with SPDX Licence identifier
>   ARM: dts: meson8b: update with SPDX Licence identifier
please check the .dts updates with my comment on the meson8b patch
because I believe there are two typos (which managed to sneak into the
rest of the patches)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
