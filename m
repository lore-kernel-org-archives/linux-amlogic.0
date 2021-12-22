Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E76C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRslwqN5yDiIV1dWpUZtvex9OAnSePMnIwBHBZdJZDU=; b=ux1a1YGAtYdk46
	+9JmBDxhXYep3B7Xmv/N0N5MS1p24MKMPBRIfm+0dhuNQSWOlKGquXMynxt3oT+hHkctk/o07+teB
	9MRx9SCHdHIfamgG+UoOlEPXFnLPb+CZh1YejyJ4umwSyWQsrtS9OSbadFbpPujp4JPi4MRvBCRzb
	qXwWk8FaKiG7gG5lmT8KfWuyzUBwSURWg3+8/pDrkeHMnCIlweebFgtdvZS2JHAZSz4Unuo0aWB9f
	2ohGVQMWn1Dj3qnZEbxo0ecC+I/mUsj9uQGZzmhVPs5c01DaCZrO3gba8d9Of2TfU3C6XOy23EdTg
	O3s10GHde15R8CEvaHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n05Qe-00AzHG-Hr; Wed, 22 Dec 2021 17:29:28 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n05Qc-00AzGe-3B
 for linux-amlogic@lists.infradead.org; Wed, 22 Dec 2021 17:29:27 +0000
Received: by mail-qt1-f179.google.com with SMTP id f9so2584860qtk.4
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Dec 2021 09:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WCZrpqSM5SCvmPll0P0YIuGHTPFnHK+hqTuTr7HRoYI=;
 b=aHk7pmJi9FBHkXN7732fduxGPYUiLvylODE37vIIK7wX9tqm7yDKMpbCiCpltcyFwx
 NLcEB6tT02Arzz3hUtEfqudrYJtFsWzg1DoYpYqpi85MreNSU193KZAToeuC4yvT548s
 YkMag3XM5a1ZSPHViHNOG3NcG6ZacqYu9ELT+X7nlhrwSEpHDiEkKuctXa32e1KUuAlA
 Jfm7m42dX08yDNmiLt4x5O1Dh9J6Kz+WK3pxo34JxRC97N4qQsjllvYtTWHDXiW3HZBF
 KATKeQI37ICJBrvp5DIcxxAy3lzaXHAmS1q6k+GWM+hyH1tFZnWYBjshCbSaxULqND1U
 hz6A==
X-Gm-Message-State: AOAM530dCJDrRaNIx+H9aGFJ6dnSG+MfWZmZUNLo/1fABlTddvyKXWGT
 D1vcmprOp5pj2TzP3HgITw==
X-Google-Smtp-Source: ABdhPJz5vWlu4Ez3yu4D3GXgn/A8sW3CqU3o0VadCVwTPfx0kZq7HUhjvJFuPHpSgFBhwWv8rjGqrw==
X-Received: by 2002:ac8:570b:: with SMTP id 11mr3068330qtw.128.1640194163685; 
 Wed, 22 Dec 2021 09:29:23 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id w2sm2264733qta.11.2021.12.22.09.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:29:23 -0800 (PST)
Received: (nullmailer pid 2366089 invoked by uid 1000);
 Wed, 22 Dec 2021 17:29:21 -0000
Date: Wed, 22 Dec 2021 13:29:21 -0400
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: meson-vpu: Add missing
 amlogic,canvas property
Message-ID: <YcNgceABXb03J9gN@robh.at.kernel.org>
References: <20211219094155.177206-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211219094155.177206-1-alexander.stein@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_092926_164276_6EE6175F 
X-CRM114-Status: GOOD (  11.30  )
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

On Sun, 19 Dec 2021 10:41:55 +0100, Alexander Stein wrote:
> This property was already mentioned in the old textual bindings
> amlogic,meson-vpu.txt, but got dropped during conversion.
> Adding it back similar to amlogic,gx-vdec.yaml.
> 
> Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Changes in v2:
> * Do not linebreak Fixes tag
> * Make amlogic,canvas mandatory as it was in textual binding already
> * Add amlogic,canvas to example
> 
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
