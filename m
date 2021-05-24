Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C23DC2B9F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:17:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90818610A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90818610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v88YG1OBgZdVZYzy3gIPRbQ2cUrPB5Gzz9XZBmjuES0=; b=g6nMRAHKsC7sozer07MnmX8SYo
	4H+CiqM1vR2YIV7XG7Bbr+rqeNucmo/iEEV2rAj1A6WIR36YNkkmMvoI2hj83FJ7QscUHlhsitr0H
	X9WHbv27MtlXHOnY3687sSvjLL+P7ljO2oGTDUohpDEf7blv05xwjvf0CMeZyMhO6iC+J6afYviEu
	aZWaz3YF6yfmgriIpFQLsg2I8Ihm+14G3dCVezZAQo8nTEftAVYjEfzKhpTVcehx6pAOSbfdksICs
	lxJQqtJO/5O3YDfM62pfQCVsYJMSehn8OwIXixK7sq4+HBrfx+WZksLEqoZKxSWddhQmlVBXPhBzd
	PEgnRXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llECw-001FCn-52; Mon, 24 May 2021 17:17:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll72g-000o9t-98
 for linux-amlogic@lists.infradead.org; Mon, 24 May 2021 09:38:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d11so27796306wrw.8
 for <linux-amlogic@lists.infradead.org>; Mon, 24 May 2021 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=zHFH7Plck20fV+guAcmidVBsnyZcvavYbuQkUm8U9zI=;
 b=mKRuK76nF+Y6y2U20Pv7Z/CyAKe4Rjy6qHBLniv2W4ZJVtoJEb3rF7qXJ06S7BVrbI
 7yEDNW1NxJLWVjdCqs1qD81bibm3OL4Ld/+xIk8qTUVfW656t/hh9TpKOOfdxOr58CUC
 zM4zEliSMrKeI3r45bC5ieA3Na0ljCUpPYLwepxCk1OzV4w8zSuTyWkGDlT12n/wzzyQ
 OSUUTvyXM49Dk1MexccKaV/8WBZY8siAUtl0D3XiI83+aa0B60FBTd5BVamKgXzjedp6
 eXSeRU3ppcqq1HGxUAPuVSeogXVjng0NtDVzpaaSW0rkG52TcyIJ2HPsIqvrCee6OBVq
 63eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=zHFH7Plck20fV+guAcmidVBsnyZcvavYbuQkUm8U9zI=;
 b=brQAo94WtHNg2TS54Guow8/d/z+o/OyoQuHTdZTudt7Zp7EBd6JIHks2711ktp02v5
 MX1e9orRAzx1bROb3g9WVWq8MhEpoNdVKNhMG8VqUj6zyEyu4ivxor/ZLG3+PkoStl4J
 1lxwNLYB2WcKAQuICzrOuzkLeSFTE1X3RT+vTnzl4vo+3BNZePdKeUv7hOtI3JYkRCP/
 lKYPvlkxX4TbmB8XZYVci5J2/kM25M2/U5ZLwnPWIYCrdSuwCsHF2xFme/a52Kl4cQjV
 hAWx4ChCvxLsoQ88dLSAtuvTkcNENHUakn0ErKpZ9vUAocJaSfJyp8KYmr+FHpfKFMuT
 ua/w==
X-Gm-Message-State: AOAM530MvG6AZRMbwjHef0iHeFc+HXWMxIP9qX+tRS0r7Ohhslt19IFa
 WyMQT7PfgbEtsP3tzeH3p/kl3w==
X-Google-Smtp-Source: ABdhPJwK/tWaJpBRU28y1BG55+5omYls82OT5wCKeAK/at6GNOVMWYAiaT1XZMuaZi9erT7XOfvH5w==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr20755996wrx.424.1621849112854; 
 Mon, 24 May 2021 02:38:32 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id i15sm11445544wru.17.2021.05.24.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 02:38:32 -0700 (PDT)
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
In-reply-to: <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
Message-ID: <1jv978bhew.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 24 May 2021 11:38:31 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_023834_339064_2C2A5E1B 
X-CRM114-Status: UNSURE (   6.16  )
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


On Thu 20 May 2021 at 16:02, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/04/2021 11:03, Jerome Brunet wrote:
> Sorry for bothering with the DSI stuff, I'll fix this when we are ready to upstream DSI support for G12A.
>
> I had this patch for a while in my integration branches, so:
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>
>
> Neil

Applied

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
