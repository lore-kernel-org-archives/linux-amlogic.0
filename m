Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11BC2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASor3t8LJg6CZLS3J6UIbx+ii0Db50Btng1CtFsxpjU=; b=S8wnscxSRZVGU/
	tR1D37v4puRfGJSuGqjl93o85jDH10VPmmMNkTJl7reE/M8ostTdmlSDdar/L/PXMavwY4SI3O7gF
	kP7uKk4ViciSr0Lx/78RrmaDEvKgueHCiFqUAnqdYZeAsoziSJdPuH/i79dkUFQC2zjwlOHUUWY70
	m2ZUGCucaAdzP1L+oJR1AmWww/IOIojP7NcSH0V0Qhwdc5MokWegej51dDCpj2Usf01lVSnJuATCl
	lxlvzq/wd+fGdsJqvMaFtYMWXQ5QaJe7tqvsT4yMD/j459rnEsAD2f6C5a7AMqo2rasDxwmPj6Hnz
	qhiFMg59Rm+7gxf/bZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxZV-00000009sjp-20ZF;
	Wed, 03 Jul 2024 10:50:45 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxZS-00000009sj2-2lbt
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jul 2024 10:50:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so6255451e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2024 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003840; x=1720608640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=PC+tLIMjOgv5rEFa8oF1HAAkxdHxq+6KS9sHzM20wp/RVCKbjZ64aoFFsBbrsbhSmp
         DAFQH94QY5Lnwhm0XpRyWbS2VLEt3aOSYww02IMvOMclBOzRIs8s4dE6q1h0hV/xqr+d
         N3XWXQQy6d7ZXE3QAK92VxYhxXrxIWSXPj4qLzqF1hbqE50PQmKMO8tmMzsY4lXUkDZW
         PqTPBRQi53rn4q6rTa92cF+Z5EpJXCxoa86BBBAufa3e4mJg0HPE606uecnOnVpzVznb
         e6/JtY77PwX5DNYfKdbFN3rt1TkFKl6sE3KdnUAavkJcj0Xw/POwhazeE2pXiyYE0aSM
         9GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003840; x=1720608640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=YQjvc1Vw3xVDXVW5BENdoce0RMixGU5dpAVgu0Efa7p49U1K/CmRxvonl5qp3+bK+R
         r4Hwcys+2YhQo2jAgddDfgVdbDLn0oQa/ul2KYgUh9ki3KqGP0WBrbNc8XqtidxPdWW8
         RGPK1aunH4Gb3r9RbXi2+WT7nJmnr+nmF+nHHUoc1AIUhuTLbVNApmmWax8Hbvg3SHGH
         wW/Rn7xi1+0gldxJT0Sh9GAxujzs+5M42l4/ekR+YiNrwYRtkrbyz4IMvWa1XhIpawmG
         SMfhzSCQZ7wieCk6ynGP3NZIKy/Jt5K1F9R3wuG+z1XiCSdbcsM7NlYo+jb/QE3OzV2x
         SeIg==
X-Forwarded-Encrypted: i=1; AJvYcCWZx/zdSynEE8Sw9GKVAdYvx5txJ8tO6Sm5l1YSLx9sb88q1P351wOdoqh14yrgKGhJ+byQp4u3RyHjFr/sO4PRqXDDVxYrOdn8IOwvfvI/Ql4=
X-Gm-Message-State: AOJu0YzS9DYXWvs4uH8gqM2QRgBter4CtZbnNonumofFi3s16QB/oATn
	dtkiyDmBneh8dwdt6DJaQaTh0tK1W/C7BleYy4Q//wOKM//v7kE0oFWT1HFUfYY=
X-Google-Smtp-Source: AGHT+IHOOKL4YyNeD/zQtvaedknaKcTA38zEaMOgcwZsU9QXJ4gpOSNYzoc+NWDud4SlyJkddZjdUA==
X-Received: by 2002:a05:6512:39d3:b0:52e:7688:2817 with SMTP id 2adb3069b0e04-52e8266eaebmr6364231e87.17.1720003839232;
        Wed, 03 Jul 2024 03:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b7fesm2128928e87.31.2024.07.03.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:50:38 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Message-ID: <wc5hbb77tc2dalf6feg23ptdxdd7cjhshkgnbeiknalqicu7gn@jghelw744yot>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_035042_718493_B559489F 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, Jul 03, 2024 at 11:50:21AM GMT, Javier Carrasco wrote:
> `lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
> are not modified and can be declared as const to move their data to a
> read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
