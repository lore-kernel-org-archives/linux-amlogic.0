Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC4C3ABD8
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY3ps6LpdnSdkmhh04Ov0vhrhLnw9itl1dWRgV9G6hQ=; b=4P2OcJlHckTXO+
	6HKIAmhaql/ghfn9oR6rgZyhbVlmje90nE/N8DQoYlf9vzdu/qnNaHAOHCNXpmk6qBDFFLE9ilnol
	VRtKa3tjY7qkIRDs6cfjzklozL3+EjPOSV2toiUk3EAC3Vwt2LnrIegdXWI4POjwSpKAcu3bRMe2B
	VOnZSb/9pp0NXPi3V3Ms1q8x7RY9odfOBA6cDPNcYXnOIKd6ARO4AD5bvDhii/EI+lom+4rIlikOH
	mQNWFC8GhZQGA4BZFygmGc0HaU4VAF5IHlD+YmufZU90kZb2wD+TS3UfJUYXlytib5+QuFLhRKFhS
	aBGRcviPQlTKCr9yD3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkQu-0000000Bh1l-0Nem;
	Tue, 13 May 2025 07:52:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkMZ-0000000BgDP-3vsi
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 07:47:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so33670775e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747122462; x=1747727262; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=gGG8YzfwuAuDNbaZ2ue/m71ha5RuNZdkCPCMtSAyxiEUjkYtovRjKwZHS6wxt3r0Yi
         7QSBfrh7c9nk4aFqR8Hca0OmfHOdUUymGo+Oa5hWwfEl5sJxBvmEch7601YKxkHul7gL
         w2k6S52Zzei/GmunGJegOyM15BWU64D9NU5akPPwqO7osbLlDb+lSAx32UlxdrdGy9np
         ctWIpZlFIHOhhAHLdHopd/FEqT8Wx4i7EDLY0xTP6A4u03idzsAMAZJdgXqDgvKpTM1z
         qL8lYNHRBhnLmyETL7QNxpKaBa1zCpc+SEIHGnZDVc1fMHyeOmweTJCR01veN8wcjE/e
         hfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122462; x=1747727262;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=tI8feBUof0wf6pbkEenKov30AZXSoOBxIYdHlvRgKE9g/RrJI0w/WJ8Ztopozibzij
         b+rWMalj5sQ1G4AyLiCEZZgzkc/LQIpU1Oscy7BEA7RJtIuD+ZJ+ySPI/GW4zcUQul3N
         6JXFbQla6k1vVfSgeuejX//PNSUWWxDhkFrp943HX+oTpLtqEQu/MWkv/7v32ZVljy3+
         XbFlBO5hsY6b5LBuYTLixZJ+OqxvTVoncLjDSr0qf00+54NJltWq2GduSd2oKqx0Lo55
         ymDW0b0QryiHuyiEj6GKTBDh0OKPF0jcPF8k/b+/Am/PA8KyVrAHiAOFGrEUfmlAVaYP
         VRzg==
X-Forwarded-Encrypted: i=1; AJvYcCUozwBrqr0jT5YgX2CS37sPOacggxJeAGDSbx+gFtXmUDc/gEc181QirGwljpkQN6CAMdRiEwh1q+pniEzs@lists.infradead.org
X-Gm-Message-State: AOJu0YxSofPaYwnwE4cZGHZiJx1wDBoOx6sb2CFXA1RHpli0ivm6xyV3
	i7Alc/LyQzY4IsvuD4PgKOn7T05OvXfEWX6HuT/uavTAVTbAID2lmFrCHZDSQuYJ/q6Veg8qvfG
	l
X-Gm-Gg: ASbGncs9RaAEe4vAFzKAaGwfLiP+q9mYsP+04rYHt085oWWk4ATXK6Uobr4uIQTV1w9
	lGhTQ0ylsrjQjA3lx8w7UE3gQkIiMHJOQhBuPc2XTcMzFOH1+Zx524wHi65j0mnWqpYVjichOE7
	YL2gwXV8Td4ZMivOPknoa7E+3TGT9eH1lj35683IA0ZfjZYHBcDZpjLIOX/LvEAC/ltRR1qw58W
	cswlQ/wSwhX5ul7TnDncL9xT9BVociALJ+gLFd8Vb95LkM5qtbfDbBkLyR8lYYtw6for9b1MZyY
	d5LE2aZKfnfr5DDzcUTW0rxayjxgy04hcKOBjbU5oRMjd060WmY=
X-Google-Smtp-Source: AGHT+IFAnCZ6nPY5UPyadmr7YhyYRo5ZU39JgB3mmEwc8mv+oARHGq0H1ti0jbO/TdUIglDMyD/fWQ==
X-Received: by 2002:a05:600c:5d6:b0:442:e27c:48da with SMTP id 5b1f17b1804b1-442eacabc61mr13471135e9.8.1747122461595;
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:780d:7cd3:15cf:b5d6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2d30asm15070456f8f.76.2025.05.13.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  stable@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
In-Reply-To: <20250512142617.2175291-1-da@libre.computer> (Da Xue's message of
	"Mon, 12 May 2025 10:26:16 -0400")
References: <20250512142617.2175291-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 May 2025 09:47:40 +0200
Message-ID: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_004744_237668_C4247F65 
X-CRM114-Status: GOOD (  17.32  )
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

On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:

> SPICC is missing fclk_div2 which causes the spicc module to output sclk at
> 2.5x the expected rate. Adding the missing fclk_div2 resolves this.

I had to re-read that a few times to get the what the actual problem is.
If you don't mind, I'll amend the commit message with

'''
SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
are wrong on this clock. This causes the spicc module to output sclk at
2.5x the expected rate when clock index 3 is picked.

Adding the missing fclk_div2 resolves this.
'''

Is that OK with you Da ?

>
> Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changelog:
>
> v2 -> v3: remove gp0
> v1 -> v2: add Fixes as an older version of the patch was sent as v1
> ---
>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..b72eebd0fa474 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
>  	{ .hw = &g12a_clk81.hw },
>  	{ .hw = &g12a_fclk_div4.hw },
>  	{ .hw = &g12a_fclk_div3.hw },
> +	{ .hw = &g12a_fclk_div2.hw },
>  	{ .hw = &g12a_fclk_div5.hw },
>  	{ .hw = &g12a_fclk_div7.hw },
>  };

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
