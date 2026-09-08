Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39583C79F99
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s73WJyz4Z8ZzPzi+Ilzz6NA1HZ+0T8fqH7fZoEh5na0=; b=tDoBMnOOSyrdOL
	kpuB0KFjC1LwsJ/Vb3QqZ3NMmWbkvPUQgVz9scnPjqhHqKCChN6vtUqkZ6vqdVAVvp855DgtoxYxY
	UWzn6ZReJ63e+mNV/FR877KsIZAWjNURYKbPZq8PFPkzpR8ldKpCD+GXuDryJYyP50B1jo+tgknWc
	s7cfsGh/F5uab5UM7s5QuABVsnpH0rZBJGASiW0IPd5KHJV/7+D4IELMN5AiM+0tfl4L1bsfCOX2v
	+a7tNCYUbljmWk+rESJ1nQknxJHrbjuUx8aNeSg4uBlcXil+Sad1vJfNFUtJ2y38UopYoAN4NeuOx
	sWOGcydjEenhId/rqqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yJO-00000009aSN-0KcI;
	Tue, 08 Sep 2026 16:04:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yJJ-00000009aRp-3foz
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 16:04:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398b3d66515so4643183a91.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883477; x=1789488277; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Tzx5UI34JujonmDJzMPjBkhAE6c2rwa6ggnBzBUQec=;
        b=ikvFSWxpNdsgzX10TNxTQcXfIVOUsV1KcCu44OHTeF+qFJl06CMeYe+cun3NL4G0z1
         j6drtguHe3WttDee1PukKlX5jvc1Q8MV68GyiUI9QthVj8qH0AEmDnK2tHWMSAhw9QT2
         l+vpaORHRSqikBkkhsXNInmvpNl3pOSoRBvFR6fHnLnpNxrfCrK+OLb4RMjW7lLtHcAr
         AkbMVZp3+0tIxRA992irlIY99BuHGpD7lP5JdmDSbJ0Vd7ukx8tF4tIkL2MkqaaMpfIz
         KybQ4mOBErJdsJSNzpUzAre/8WVymoLkMiluqMy4uaMXIe+EPeB5rXr+/bw25ATE+3tg
         oMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883477; x=1789488277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Tzx5UI34JujonmDJzMPjBkhAE6c2rwa6ggnBzBUQec=;
        b=EmxeE98eedKYMMO1R2eEecvL7jOUVeCX3jt49FrWMmRorv+qakfcXBmCCSMNejKpIp
         DyG5ZoKlu+PooCkd0cd+43LUS3U3q3aOqPhu8xeujcD4e71MOzAqXirVlrdmGL467oFs
         NxOxhrgknr0nt7UzFEbjXVqsh+FAP7ea3WWQniuxppKVHQjNq9Adxn7DTcuXmcD8pZgh
         GaX7DOCH5ydSgrT1KFHg/+/axr3070zL30V6tZ3g1iKBByiIrsTzKWSLx7ifiMg9bU8r
         z0MlkTYQcdegMjsj814I9I+yi8BGQ3PGkX4e+xEOQ59ZWOey4eyjwlkLwJrRQ6aue0sD
         /psA==
X-Forwarded-Encrypted: i=1; AKwUvBymgI34mz1OIWIgIvH9ynVJXhAbnmwjoW91pA9UfGNwWY/Mi8AyTlBPU9lEEjfeE0uLx5Qp39rj9zFQ8suN@lists.infradead.org
X-Gm-Message-State: AFuF++nmSCff2kvGJWae5+OEMdHnbXeqTt/LvYV8TCNxyGMR7ap6YKgI
	fgvT9s8GLzKbOizfML7jGkMHWjP1ew/OYBZrsZ4j7K0fhllYZ41PpMai
X-Gm-Gg: AYBFou1clwgZb7MLlizsza0cmzKCOh8z0w7gbWSmmFbMWM/o7cMG/hrn+mRjiZptzd5
	NIj5wFc407EC4oFBu4Len8nBhnQYxKF3hNVfRM+Ebh2HdQZCvUPHao/sgs1Yrh1yINtzqKsXfJq
	MXmVvqwelgA0hOHc/BmIWK4ZnlScR+7TMS9zvaFFpY7QjaIXlmH5AGoHIL0aI0WAEL9PAIJfUq1
	CiEtqr1tgwlhElWI5GVAviTtgpIcKLaMoJ7I/2EBKWJVAEIB6EucP1rjkL7URSL2tkTMSN2encC
	sFsPhMr5NHvkNNPKpCODkixmUDaaxs7i4IC9MGVktDG/vo8gNu9zBA8Irnn9FCwtdp++v01EOCo
	mTNw4U9tsC3eAqylpdtiFPX1+taWFKdZuJL/KXpG5QfgrTXRX0wavbByv/XWWPuRlFnAkxlIwbe
	OW539sp/2nNSvNjp51krEBiZcUJ26XfegEQ+lsgDdMU+xi8LHjxNp9/XYY/TW89PXFBBJK1q5Fb
	lQNCK8=
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr46112186a91.19.1788883476937;
        Tue, 08 Sep 2026 09:04:36 -0700 (PDT)
Received: from kernel ([45.251.35.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm37459495eec.26.2026.09.08.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:04:36 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:34:28 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <aqAyDJq37-mCJL-2@kernel>
References: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
 <apox0f2D6bYOYOnj@kernel>
 <ap_T2wCesl3whdJV@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap_T2wCesl3whdJV@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_090437_914755_BB397EEC 
X-CRM114-Status: GOOD (  14.24  )
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

On Tue, Sep 08, 2026 at 07:22:35PM +1000, Herbert Xu wrote:
> On Fri, Sep 04, 2026 at 08:19:53AM +0530, Mohamad Raizudeen wrote:
> >
> > Just following up on this patch. Please let me know if you have any
> > feedback or if further changes are needed.
> 
> Please repost this patch by itself since it's not really part of a
> series.
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Hi Herbert, 
I have reposted this patch by itself. 

Thanks,
Mohamad Raizudeen

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
