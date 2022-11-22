Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3203BC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myhz5qCrVghVXdE6zAwQjz2zBMIW2AChVV6Q6ZztNB0=; b=TMAhNbdOxIvm0o
	IKD7xcoYTu3htuia2G/UVoamazRswwUCMNoZ6DBT5gxKe8kvpukOg2VFlDi2oqmBX1CauERWB/ooT
	y1GFxFTGkYsGY/Xq/1tbQ5dCPzXKw4B233e0ZtuuGnKmGRQjUAHXM5vU07kg1O5a4+pFrhuMg5K5z
	E5mYiZGst4WTxd8azBb1tGQuo8RvHro7a2X4C5NutlG4r4u+loERIrX/2Ohn15Uf9dpq0V4xpo2Cb
	0aXulALSQ6NCfsRnj/XToCwaBwenT0uyefNqxKwDKPQ0l6g4cWH6f9L3tkocLxGa7RoqAqVpyNl04
	iGab/+kqhCNk/ulsp6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbLb-00C4nl-4v; Tue, 22 Nov 2022 22:02:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxbLY-00C4nA-FX
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 22:02:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v8so11474444edi.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kotx7AX+mwT6i3vVwmp53VI7mNBUsRUlYdaX0ddPLx4=;
        b=csJ/w3Z/BVCLiUCwgR+l0WjPTQ/6GzS+9Q2LmSS5lJUpp+EPqRZbkNHc3L3yHLoLvc
         PJ5Ox5jzhrlEWblaHV95o5322ojh06DK/41lht5fxhT535BzULuYEHTI4IHZpHUrbRpy
         LiPIUvAQ4XuS/Qu46TMwoXnyg3SATPM6bxy+3VF1t1tnehCp9EcIGPNHKam5Nfi/IJW6
         Z03ur3QObKCpMYnlagjKgebK18iOLw7hgD9Gqw+yDQekIwWmPnsNDJArvozTkr8+mxb8
         s2h679vzFZjyxUfa7sAcpFm+EesfZBpszAG/qryFwIpZR/dZaN2spDDeG/m1eyWnzTOv
         RKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kotx7AX+mwT6i3vVwmp53VI7mNBUsRUlYdaX0ddPLx4=;
        b=ynPd7V2pNGD4kJrlG0B2F9jNy+pGCh5MY98tdkqsHLh0txPjkSQ3Fg5B9D82yotklO
         gLTJx4ZQDLJS49zWz7exHxeoRQnrkEOEVm5ATRijCEM/HVfetZsSbC0IYerGG0sl51w8
         ku0sa2DpsKx0zTgb2CcmHlqq9rES90vk5SRblflwRpLD49b3ohYv+PrCOVysnh0AlasT
         Py1uRIewEu6Xz773E0ruYiQIXb+PsUP6ns7zhfTy4TRMkv7yIFrDAlJ8fAYC+4AG5rme
         x9GA/KP3uXgN+rj1CpafVHLSYHAyai6VfXjPYoBxMJ85yaKl2cHGxYDTt2b+7vxgRO3c
         knww==
X-Gm-Message-State: ANoB5pl+BN3WRkMRRwaZ7VdbAQAf/6kdYog/uHKdBMMEtFuCXAtMfahw
	9w7mEmyclzMbN/iTbE8ten8BRllwgyMs1rpfyOg=
X-Google-Smtp-Source: AA0mqf5MwCypCpSb5xvKaM+6KzLx3LYUZLVsA79BUKoD+pz0QKKYqS7eFmzlTpVcUJrhCmW/bK7blIP9Bn3ueMmFP04=
X-Received: by 2002:a05:6402:b84:b0:461:a89:8654 with SMTP id
 cf4-20020a0564020b8400b004610a898654mr23079847edb.212.1669154545695; Tue, 22
 Nov 2022 14:02:25 -0800 (PST)
MIME-Version: 1.0
References: <c797dc5e9248498918916a6eeedaa25de2196e8c.1669154149.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <c797dc5e9248498918916a6eeedaa25de2196e8c.1669154149.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Nov 2022 23:02:14 +0100
Message-ID: <CAFBinCAEwYaEvmGjen_LPO52BcyUFD2EKtzzzfZ1rMuVuihEqA@mail.gmail.com>
Subject: Re: [PATCH] crypto: amlogic - Save a few bytes of memory
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Corentin Labbe <clabbe@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_140228_556989_81DD828C 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, Nov 22, 2022 at 10:57 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> There is no real point in allocating dedicated memory for the irqs array.
> MAXFLOW is only 2, so it is easier to allocated the needed space
> directly within the 'meson_dev' structure.
>
> This saves some memory allocation and avoids an indirection when using the
> irqs array.
..and it even fixes a missing devm_kcalloc error check

Personally I prefer this approach over a patch that was sent earlier today: [0]
Corentin, Christophe, what do you think?


Best regards,
Martin


[0] https://lore.kernel.org/linux-crypto/0df30bbf-3b7e-ed20-e316-41192bf3cc2b@linaro.org/T/#m6a45b44206c282f106d379b01d19027823c5d79b

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
