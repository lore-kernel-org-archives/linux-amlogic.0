Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FCCC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Nov 2022 19:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mMyYIe54Qu5jJI+Lz1o0PEtVJsjDSFg9G/vRn4xZF4=; b=2eUzUDJ2R2MtMk
	eGwdi4+Yh9t7NTvlA3nOVF/oKgYox197vV4vZJV9/3ih1bn4jwjl3q9usIM1dbZlm/McT3sJkLJ3R
	y84pNvweXzYU2qaHO3gDbHXn1LnF0WekT48STgZETgnl+5unGmfkmzf9ZHiLSJCGC1OQy7NZGImBn
	Zx2LgiMkgjqjv2DohMA+ICLTQPoU89Yb3g92iKnyhyniWM+ik619+y+bcSNk2dM8QxvX4DgywLNL1
	qNJBAJw9NObBuoPpR5aT99zH2w/dBsbBHLApntp2ALjG3dIrHiiSabjYpw1fYgPAtBmfw9qWxTqZv
	OWguBQ9uPyWHP3tcs3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opwhZ-006eSv-IO; Tue, 01 Nov 2022 19:13:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opwhO-006eOd-LT; Tue, 01 Nov 2022 19:13:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id kt23so39470285ejc.7;
        Tue, 01 Nov 2022 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpizzQAXxh2i/jnBYbtei8KHpjUU+A3hSqpgrk5Ku6g=;
        b=SSYOF72FfOEw47t4SN2Iz2CS3dysppj5Zvhi9GT+/dhaW0KlnmiAfeg03UUnmhc1nh
         3uf4vEp4MaMASXhplHR4uBKTcnjpFGK8PdDaJoJ/kFL1dbxDdzV+L7+y4gXb3pBO4zdm
         hNDQux431GT6O4znDHarP/mLVCPLEHchRqkSHH1odf+3QdrtiVm2Cw2RosuCPwmUundp
         fuKf2vOy9xsDz2iDSxnaI4X/v0AqpkoO+0KnjjTS9JgvoBKHufHUiwKDTjU9z3rV0jDw
         jE+a2eL+30BDzWwFM9qGmrgBy0n8YaGS/ed+y6zN3tmsW8zsFdPYs2hQiUm3pO3yJ42E
         S4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpizzQAXxh2i/jnBYbtei8KHpjUU+A3hSqpgrk5Ku6g=;
        b=PPDXne9JEuVfwGfSeceqJFxSS0cpj2z7udfZ6q0JECkmsAO0gQ27eZYG+GdHFkfp5+
         b/lEB90+zAR5HgBTomt6vQkML1cDOyt+RC9+16jGjPxNmU2vrRB89SALnkbDtVjG3FQU
         MeoRDgDeGJnaoZEMf9omjZ1SYEcIWJ7e3DzSxBheBqQT4li59BYdfPhgtTVlb46RAyT9
         OctieDOVcnMLswOQDz1e5QQnqa1prjK8Y+ejQYIkAS7E0HPXkPj8fQ8O3sa108LGmJL6
         /6fW8+ivBh4S2fZ+x+8QI6lkPsX5AFmiZbjPhblVu0zs/ePOsi3oYur7MRvLUH00Vj+y
         I99g==
X-Gm-Message-State: ACrzQf1+QXOZnXhGD++KSpFAxDViNuq0XarqGyEUwPkUaz4ApIzAwIKy
	oNS+pL0/nkYiZETyoSbn1l1qW8vnTGm/X5VBmx8=
X-Google-Smtp-Source: AMsMyM4cbcrnEzI8IyIBJTuridAvR+HTV9wP1OMoLZ6qpd5uqq+VqkHMPZDrY/meyutGIsA2GQtg3IG91UN2xY76Sxw=
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr20539867eja.122.1667329999851; Tue, 01
 Nov 2022 12:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221027-b4-spicc-burst-delay-fix-v1-0-5a6e9a88e54c@linaro.org>
In-Reply-To: <20221027-b4-spicc-burst-delay-fix-v1-0-5a6e9a88e54c@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Nov 2022 20:13:08 +0100
Message-ID: <CAFBinCCx-8u_VNjNtjivgwp3aOc8cUppxstwzzLL1oGLtS6tZA@mail.gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: fix do_div build error on non-arm64
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_121322_730728_9C5F2E6A 
X-CRM114-Status: UNSURE (   8.81  )
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

On Thu, Oct 27, 2022 at 2:11 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> This fixes :
> error: passing argument 1 of '__div64_32' from incompatible pointer type
>
> By passing an uint64_t as first variable to do_div().
>
> Fixes: 04694e50020b ("spi: meson-spicc: move wait completion in driver to take bursts delay in account")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
and also:
Reported-by: kernel test robot <lkp@intel.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
