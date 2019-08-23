Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A213C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 09:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE17204EC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 09:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRpoftFd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rX/SkVUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE17204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG/r9FcIV4RvkXsZ1OqdVQinAUn15gA3zpoRgzHNlKg=; b=CRpoftFdo0hom6
	WYJWFxEv7LjZDomqCXGs+GXOn0IFad3yrjC9RqGTAAiJC+4eoSH5keaCjunl0FEjNvlMzhSwlNLu8
	fd6LjOZdkN0tlozWfBR3x6UU+pqJ8Y6UMfneJ72pb9Bt7ASzNRZt3xBZkzcZNufT72hZ3sQX6s99M
	9YsVi+PUJGNf9yCts9PCTod7/e4g66/hAqbb6HcTxOxYV0pUwc9pLpdcMZb90D3ypnCpDgF5j0jc+
	FjMqvAjNslBHxNhjSvDxpEXmj2yas6fq6f78l4EG20iYIk6dwl0Ocq7yPWun7AxRyNpRXmlHtczuk
	L/Kh09RC0UeyIrRckr9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i16CD-0007ur-DG; Fri, 23 Aug 2019 09:49:25 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i16Br-0006pt-O0
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 09:49:05 +0000
Received: by mail-lj1-x244.google.com with SMTP id f9so8237557ljc.13
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIj5J3GC6fJ/z8+TZRbG+UFUp/TNBUYk41ueKujFuvY=;
 b=rX/SkVUPR5Xkum4I8dMllwZbXC1J8GqzVGhKQLmtAJGWXvHSayB4J0ZHclIAfzhS/1
 f0SOPcPZRdLEPalAWtVSzoFv/JBIY5IrmsWallBDJse86OTX+RAC1RxImtwA9g/3FseR
 Ucf8GyfUKVXrrySMNJ0T1f6zafGxlaJ4ddQUtq+lpBQryywv+xWaFS68YCwCu4ptDgFu
 f+zVa5bWK7uS2ueRpQGIRJs1XiUs/ebTCCTf8W3YdbpnZU0ENFuBRkwenmakiWoj4mX5
 6mAZx1bSxP8v0O1GioXeSCbuTTjoJZU/vX8bEvt+corLyRnOVu7o9u61v6P3w6BxR1dP
 cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIj5J3GC6fJ/z8+TZRbG+UFUp/TNBUYk41ueKujFuvY=;
 b=BYOCxaD59WZqngoXrSE+pqrPwjet++ixejfTIOQDC3u28xi62+U4Nw0CGgqvhCROlK
 Ohaq9EfojaUcCRhl0jPbc5pJq0OzZIc92P34GCIVNqaCphwtl6n5kb/qWgTdRvNSns7w
 kgEYD2wgg8ba8MbXkoiDWDQy/A2Fs2PtvUSg9v5eoeRRUn0G2jcH3qiKMwGYMI+R05Pn
 veXvwHBXMU292mauwCfeHK5G43NpMEvxDAZgBSGnAHoNnQRvSbNJNdk03Bfoyau6KtVC
 Q3Eo3dhdAFrmYh1JLDqGL3m0RHCUodFwXrOa0Pjb/q7555RsXgAeacNFU41M8z1Z3taj
 kZrQ==
X-Gm-Message-State: APjAAAVf4Fn3mj1iqV6I7uapEI+ifsN+MiPHgrdHyzJD4PRkoy65UYJe
 W3zho1JEMwkzM2CkwpiO/V3R0eBS4Egkyb60IDjRhA==
X-Google-Smtp-Source: APXvYqzzgizcf1hEzZp0DPeYQ5HNGJre4pFWBphhjTNGc0lG4u7yjHgyy1zrsnB2xD/LzIjtVs5fBSj61nDdBgIULiM=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr2407466lji.37.1566553738017;
 Fri, 23 Aug 2019 02:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190815060718.3286-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060718.3286-1-nishkadg.linux@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2019 11:48:46 +0200
Message-ID: <CACRpkdYsM=R5Du8bLCWxwxjQvVhH=hGAn7DwUMfdLk_3Ytg9wQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson: Add of_node_put() before return
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_024903_781506_243D1F01 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 15, 2019 at 8:07 AM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied with Neil's ACK.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
