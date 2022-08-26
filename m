Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1608ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z/DlAKiTfyKV7CfeZ4u/6yjPEYtqGf3dqWQdHTLok0=; b=y8rEA5yMmsCtXZ
	83b7jFa3V//mFH8hwVqZ72eg2IsPjuZP4C+FLYZdbXl2enbg7AM3/htEnOmu24VDyrb7mGaTW+3B2
	drXr60gRVyIuaW2lO6VLTrc3UyopN7Gr3orBfrbBySz44Cw+bKiPXI7T9zj8R2xkt3qli9IJ4iddR
	tw0cmPdR/B5vb2RfkjnfQL8I0gBFDmDaAoTlnoHdWo0rePDUD7oQMpWPh83XtQ9ApOBR2pazDadjR
	1wsHk2GjDp8SSYx5/zRMrqICA9lr4Rqek/nFfwS7VYeXotQ7W6YiMMETdVFTq1v8ocC2l42tJG7LH
	jHAxBE/KAAMabnAEhhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRYjM-002tAp-Uf; Fri, 26 Aug 2022 12:46:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRYjK-002t4l-4w
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 12:46:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so3948029wmk.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=K5ruSlY1jCvxqbhtszXYEzO5axSbMBdWGm1jX5xAIDI=;
        b=YDhK5SvJSWefqjsU2WPYj++ObRCDvVYTmwFRnA9yR2lyyCR/tnH5aDqVujU6uS9zMX
         m1qcVILMZ8TblSKP0hyA1JtbrsrYTDSiBDgAB+03OxNYGbKOB6vknSaDxKmoJYo+y2Hk
         kpoqO3qwq4EgS09hnQpN38xfu3gFTSWN36g0IIjZ+xTwjw/OufrYn+NWqzg0GXErZpNd
         jpi0BqbNCvTEvyMD0zA0+kc3Dp0wKrkpqOPEO53z6tdwdb9Ye15gXk/MMB8rPnIb8FHY
         ioOE6r+ywIRMauqPNdeG7rokoPe8SdXkGsFYRZ/QBF2powrJpXM5o+51PGzFQ4+MhrGN
         jyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=K5ruSlY1jCvxqbhtszXYEzO5axSbMBdWGm1jX5xAIDI=;
        b=LnsF0rmB57zTYzQm7X+VPJEnK3Aqnbm1979nZ+P0/zxEREgrem2zAkeqgQ1gI9tlwU
         HkRt35dBy7wdgf3kW2xikZ/lJa2uKZXrmIokRsck+w8WFKj8w/NHw+N5U9hu3i3O11xB
         5RHsAcG5SQSUSHdtqbUxUUI6y9Q49y6s1VzzpmDXQXeewQDH0bpuVLrSqeJWb/T19xzL
         KIwHHVMVm+5v8++2CwheUBxfw+UPPSyWK/V5/p90LaCf4K3GqgAcAf6LvBwoHD4CAmUI
         3J9bruKCiB9/eZH7tGqwlxIqZtPc9mxQMr8VIn3mY60tLXcZgK5DTgGPAi9TAh4cbcoY
         KhAg==
X-Gm-Message-State: ACgBeo1Y7+kQVR6MNoxXquWzRWn0JzZDBPxhl8hJ1QBXemT5T2FcMyPs
	qvomD/G0hyLjsP73nRL7YRrlfQ==
X-Google-Smtp-Source: AA6agR47p7+yUpwUH50t0SfB9kxiuFa+blrP6f9OaGblbuFJRK+GbTrAG/eZi4Vsn8YmOBmdlLEnKA==
X-Received: by 2002:a05:600c:22c8:b0:3a5:c134:1f50 with SMTP id 8-20020a05600c22c800b003a5c1341f50mr11466896wmg.55.1661517992442;
        Fri, 26 Aug 2022 05:46:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id b3-20020a5d4d83000000b0020fff0ea0a3sm1768406wru.116.2022.08.26.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 05:46:31 -0700 (PDT)
Date: Fri, 26 Aug 2022 14:46:30 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Jack Wang <jinpu.wang@ionos.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 10/19] crypto: amlogic: Fix dma_map_sg error check
Message-ID: <YwjApjRZis69PI0S@Red>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
 <20220819060801.10443-11-jinpu.wang@ionos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819060801.10443-11-jinpu.wang@ionos.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_054634_209055_B5677B23 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Fri, Aug 19, 2022 at 08:07:52AM +0200, Jack Wang a =E9crit :
> dma_map_sg return 0 on error.
> =

> Cc: Corentin Labbe <clabbe@baylibre.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> =

> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =



Hello

Tested-by: Corentin Labbe <clabbe@baylibre.com>
Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
