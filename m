Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F41EC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 21:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D92361027
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 21:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D92361027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiXvYRz+LGpmLXQQHeCDPTmaoDQ0HG6Ve235qz14/3w=; b=QD2ay7dnOH+YNG
	NHhtpvE1viGKpD72tG5TSy/bE542TODmd8Ah4KxToTqu86KfFdWogQ33tUd28MjOt1bJuPEztd1KT
	TzkJJZbyQ2PYSCaXU26JsZrD0jfPAmr6SZ5anGDEswLpDxxgWTHSRAtjG90Q9lqeWG3K1Q56aXvol
	kwyGHBRCjwwo0fgSPdEa4KAomVpcXDO8QtLJy5HlyDK7dBAPs1OWUM13YoHsZ5AH10Ruwg2YHxfcc
	bqSEwHvcUBAeUYEFtNZjiArnkWjDpGpAPX1lBA2gGNRjY5t+/AQAZG634r3OHQGIYZ+mwec4+GNsP
	jgEM6QpFQKCiohO1a9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVF1-008tlx-D1; Fri, 15 Oct 2021 21:59:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVEy-008tkt-PM; Fri, 15 Oct 2021 21:59:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 5so12997462edw.7;
 Fri, 15 Oct 2021 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9pKyE4uXQ4v77H67bVhfvYNdBYMVwhYoxHl8+ZSF6s=;
 b=Z9/Wnz3HV1RIE0kt/gUyL6rSKP114/irnOAKQdhKMk3C080mvTEDXcYWcTwBIq12xC
 /7O8zFykbmnCXIciX883dHr08y/jLLO5+ousxsFk+LUcq4OmlUZ7kKn9pFfge/q45HNp
 lgMljTVEuG3JtclgRxA/bXl6GIMyMn1dsmyJx6qIeA2lRizdywzbqhRnGbvdmp/pZA+0
 vHr8QP3/QnSmsnl/UbaVadqEZtqGC+aLOrCe/DK/e1nlpbvYjOZ4yrbbcvihmEFcjHfB
 aL8hVdd4Ocl+ZZJ3FXLVpUc9pWqaYzk8n/gRqc3Z992I7pbmcpTEgHipysTBhK3Y+GRh
 oSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9pKyE4uXQ4v77H67bVhfvYNdBYMVwhYoxHl8+ZSF6s=;
 b=nbGS1bh9qFnWCQqtp3zwh7fI9J8hjiCrtvSrD4r97SqouwgzZWBpSdWVdVVW2WIS3h
 U+W05wm3nu8wV56eAJ+hvXqOS95zI4V+LjOZ5lkBw2ankGVThB8upBFg1XOvaLch3W0G
 xgSZbHXzBz8sO3eJ8F/4xdAODZoWiXoyQ9HoZsNbRAaaVxpmCObqZlr6UDRingD7THxn
 uWiwbE7pa7pkpXAjqxlZ+BPJsW43Jh3Q/P5TmovIbA/8AxVU62SIC9f099hth42/0Ose
 9t1TbSO2Nnn39TxGdgrzeWNxE0iIe6RbB6b+U1ffco0XZSDhV8UwATf5ihURXxLpZCDV
 RFiw==
X-Gm-Message-State: AOAM531hZIjRiDCVy1buvxa/6A8ejqEYsNmBqHriQlT5WhdPt7bkjcqc
 4H5DbVS+mc7VHS2dFXBjRJeE6kvk56nkI5i0AEAYl3BLDuo=
X-Google-Smtp-Source: ABdhPJzp86qa0FdWr7jP+PxpSeQNFXQFNcPFAbi0Fz3srgNClnpBQS/YnOhaT16RiuXhCdSG0FryUUUlxHCO8y+Cops=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr20692743edj.298.1634335186003; 
 Fri, 15 Oct 2021 14:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-3-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Oct 2021 23:59:35 +0200
Message-ID: <CAFBinCDubtF=gSO=dpr==mMnBPeLGnWNMSi0X0_pqkFbtLCkQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson: remove useless recursive components
 matching
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_145948_845305_FA78D5E8 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The initial design was recursive to cover all port/endpoints, but only the first layer
> of endpoints should be covered by the components list.
> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
> first endpoints instead of recursing.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
