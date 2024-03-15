Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB56C54E69
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMP1tv8sfoGCIaT3iFf1cmbeQYDkw99bwSD6EgfOqX4=; b=qXxLB0XZFrdGvs
	PoThPIyOiBOfdDXjT5sBtjrGy7audfKpEMmNN8CUyYpdv501mU1oM4TymMUD8V2B1gDlUAkij91aJ
	jR9ZocF47FU7W8M7GRa3BR8Cjf7uKcG5gjF+gbyJYIFGrL02QxzCgIuPg4pbPQomXtqLbmfqcwi7l
	XwPiDWlgJ8MB5dHk2mnppgyjlvDZg0nwG7qlDxallsnkii0954hgQ6Rz7YX3npXrRrYZOYMoq1TMI
	CjZg3u3vgPFygAFEpp+SKitxjJjdvwRwq1UyYPlXAKd06vKy3Hd7gOWGrDQDFprQDws1XVBJtLJUj
	YVTHTsPorVzA2aEJCAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7Rp-00000000JOA-14Bq;
	Fri, 15 Mar 2024 13:18:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7Rl-00000000JMu-1ZeC
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 13:18:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-413fea12b07so6325225e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508683; x=1711113483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAvj14vJUGomBSxrVqhPVayHAwF+lgqULbYlbgwOBiU=;
        b=n2VwqmaG8U6b96wdBnTPWoNCetBRrEkkEqgOPNI5TJcmXo3M0L4Zycs+IJsZQhHDyP
         sW+wmrLj9bVBnKn4MOZv7X9fWuEYsCVNKgrX5l50pfeDRjrSYoJHd0otUFXksmfoVLOL
         5aS6GTGR/YV3FiTyOPXZ4tA13A0PLSl6CNRbxUH+9w/oAbtnNQ+2m/Fr0bJz/ql8k7T2
         PHz3YSvU5Abgj0rrh1La7bdujg8VHgX4Xj4wGeUW8EvxLrR6/XixearzlF0g+ayfzktp
         iQkdV2CgwiwkbXiCWe+ObeqzBlRnMNsUUw1cAU4CixEehvVMFb9gviA7Z++EuiThkyrt
         kgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508683; x=1711113483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAvj14vJUGomBSxrVqhPVayHAwF+lgqULbYlbgwOBiU=;
        b=p/NEWIXl6oAxxqy26txihYfHEuVXV0J55yTPyc1gXryiTL1AonraPtqtda7Xgs0XFE
         LZQH5LWCF74o9eWqQFnVKZ74TPZmsBdUP1mDR98RcR/oCm2Oxo+Yu2qdW+3teS7D/P2S
         BFk2VZ298XjubeQmiuTxdtELLOZuVlNy4tuUq2d8Nv/YJBQH0j3V+GzMzJdG49WTJfQA
         00LO8g2nTEMbDgPy596HTxy/yzRkbYCraiamFulAPRUeANTamKfMvxfHDfXY9LZYrRIh
         vD9E6isVKRg/c5YR3Xw/JfptkahTJsYRqHDAXLXEAZtI8eut40JPXgaeIlNcxBpaagkE
         ubMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7OIg+DLDFPcPbLS+WzYmShp+nFFzpj3lGCgUPN038BlqJ6OtQiHaBt9BE9w2jmiIW7V/e1aiitCQTcvoNlf89AOJY0J7e6BzDpVdHrD15D6I=
X-Gm-Message-State: AOJu0YxtVvcB4R8+7XFfGTXv94gTzON5aO3SK1j1d+s5BMRAJ7O1y6NE
	6qkHP6Apxh8Rhy/0vdpt/Cxnj7nS2nrZ/O0aKqab1HQPwqqryVfwiwtqBd/VhIQ=
X-Google-Smtp-Source: AGHT+IHlUY3Az6uwRCsdn4XHEMvaEDhhX0HkGvtTN9jqjiaiqubgf+xJXK+Mvnp/afaT+k0YwpLk1g==
X-Received: by 2002:a05:600c:4f94:b0:413:f1c0:8a5d with SMTP id n20-20020a05600c4f9400b00413f1c08a5dmr3796731wmq.26.1710508682802;
        Fri, 15 Mar 2024 06:18:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b00414013adab2sm1909935wmb.6.2024.03.15.06.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:18:02 -0700 (PDT)
Date: Fri, 15 Mar 2024 16:17:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 06/25] ASoC: meson: g12a-toacodec: fix "Lane Select" width
Message-ID: <cc26302f-fa57-41ba-bf1c-2e7ef898b4d0@moroto.mountain>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_061805_558552_86448E37 
X-CRM114-Status: GOOD (  11.03  )
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

On Fri, Mar 15, 2024 at 02:21:42AM +0300, Jan Dakinevich wrote:
> For both G12A and SM1 the width of "Lane Select" should be 2, not 3.
> Otherwise, it overlaps with "Source".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

When you resend this, could you describe how this bug might look to a
user?  If a user hits this bug and they want to see if it has been
fixed by reading the commit messages, I don't think this description
is sufficient for that.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
