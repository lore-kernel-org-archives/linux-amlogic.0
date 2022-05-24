Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6AAC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 May 2022 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcTSczr7hD0GAw1UJ/BQhlGi5KxI2ZFZLi1Nju/EAsw=; b=CIL86sIM1Z2kKu
	FpHH/veigaiYUj1GiabuH9bSvgogKm4vYrj26qigWXOlG7wtdiY5jaUYN7X7MS1I+3DG+urhYvVOI
	ysCPGd/0/DPYr0ngiv5BD3ZiLSaQk740kIBHbgRjf1d/1qA2mjjsfWji62csd2/8VyAJz11sS030T
	XwTXT4G3/56CLdCCDaRJ5Awker9vNiPppWFe4LC7vP73jcybO1+FA2Y3gU/xJQ/7DZEVwjx6ubqLf
	a8ccVz6wciQBu9EmofR2rSceocTcI4DjBLsDhTdID6y4FA0kqAA+2HqwZlaEPuHtzjZxNc6sEW7dH
	6vSpxaSi211KKrlo21/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntZyV-008zc8-L0; Tue, 24 May 2022 19:13:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntZyK-008zWP-9G; Tue, 24 May 2022 19:13:37 +0000
Received: by mail-ej1-x630.google.com with SMTP id gi33so28790828ejc.3;
 Tue, 24 May 2022 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rsS2AGuhnxF/8N9VLB8T2eF5RNbu94pUOvL2LTXnFJg=;
 b=HAOZoW6A4tlSRA4X6y2Fl9zXR6BbnUdHXqJK1PPa7kNEiCJPrx3Mkm9mA02+4w3mhS
 3IgN1UTNYCGQE96ZCbfxbESZ0ktW9AHIqsuNIQ7NSQfjBqvVI/GLUOXY5jzNIopN0MFS
 Lvsp/dCaenWSovY9acjyDgmGSuaouWlDOtmGMVB3V29UWsujfu56WHVhr/1kSWkjWgGe
 W7z60NolLIfgv0RaKGqxehWT5CpuD5ynhQB+4MX79DIcwUNiQaZxhlXMZXn/CvZNwcyE
 /EakcTnMFNYWor03QAZvpHLWLZ6BITYAl2wT671q3RJYKJROvWe2t1PrKZMQYxn55DHZ
 rTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rsS2AGuhnxF/8N9VLB8T2eF5RNbu94pUOvL2LTXnFJg=;
 b=RNQBdwZi8WAR6CKOi5qhVWquCe6qoValH8hjAkXtzxdwuIpzjaDzAvbTSpldUm6nRB
 lrAv/mDQP9Dc/nzxnMQjIaeHN92pcCevIqToqXVkLtOShyaF6UkjFP57sWW8O+CLvzAO
 FKvglI0ODDykxfmPib1eVhGVZepeU+3SxBiRDcg5fjG3TX6m/eMmIBhDA7CoaQi22/se
 PS5ZS9GxmJzhBQBFqBrTn7vLXkBYt4NFcXqi8aSdrZnyeFZ3F6ruEEXH/PnJi0y6Npal
 qVqgpXRsIHgKG/RUPehlfnxLZ9z/Cm+wjCHxS2eTV0rCRze15ETkSgbBH/eqvZeoJnRt
 MB3A==
X-Gm-Message-State: AOAM531prwRVhZzntwKxwMNIjMLZUQwu5xNSuGPFUaw/X++id+Fb1QIM
 R2np14lpxIYacl+00I/6sQDRj/WJEIgRlbkkZd3GxEOUxXQ=
X-Google-Smtp-Source: ABdhPJweaG+KIiYEQRCw11koCjYEypL+sU3mG2PwGIxlwKKLPT/Lpe4gKmlZNoAShS54tEeFI9QdtEboS/aMHjzFECo=
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr5288487ejc.302.1653419614752; Tue, 24
 May 2022 12:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220524065729.33689-1-linmq006@gmail.com>
In-Reply-To: <20220524065729.33689-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 May 2022 21:13:23 +0200
Message-ID: <CAFBinCA=bDdo3SJuoDgugtNz1zAMQEgxxHfZo6ZQ9Q3mRQciUw@mail.gmail.com>
Subject: Re: [PATCH] meson-mx-socinfo: Fix refcount leak in
 meson_mx_socinfo_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_121336_372725_05ECBBC5 
X-CRM114-Status: UNSURE (   9.38  )
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

On Tue, May 24, 2022 at 8:57 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_matching_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 5e68c0fc8df8 ("soc: amlogic: Add Meson6/Meson8/Meson8b/Meson8m2 SoC Information driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for finding and fixing this!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
