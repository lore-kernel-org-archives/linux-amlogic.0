Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC35AC79FA1
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu3cDrdG/Iq2yCV3HrVGzz6m8uN2cdqhS/FXQghhRco=; b=fd2WulshoYeede
	ui/adCDqHDBk5GDTFeEP7UgtaVbafAthjy5rXPH73zceu47LKbEO12EoIdEAGrG5az1HBmUMRTret
	1iEMH/RWIsJgLp1HiFT4S5JFkR9WZzIE8L9rHYTjUJhGDCeIKBz7ZxAgD9LSjlcDDWqaPmcbnpGq5
	UuT/Ypo5yvqULEDOyNNj4HhH3TMHJHRoLiLJJpnRsez05OujXJ1Nc4EvhnRgSl2FbgxShrfmsFhKW
	Q5QNQjg+cBTd2NTRhWSJmquMqcz4wf+ecZ67M9UDmOHcxNP2oWwMysf1GGAbG7qhGeYODFYWfF0Ct
	wT9o4zJ6Tak44i4ynlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bBJ-0000000790K-0qQA;
	Mon, 07 Sep 2026 15:22:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bBG-000000078zG-1f4v
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Sep 2026 15:22:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so34639255e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2026 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794564; x=1789399364; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=obEfI4C6QYvUhpDyqZLlqpVTIYOdexF/mVHStlEkhpxJFEuPjWll++7R+EPlPB0CmP
         +ixikBgr19i8C8UFqXcgEkgfgy5v4wc3PpgDJlKMQ+Nbl83H3/GnYDvLIGJScl5U+sfI
         S17izoVz2jVBMDIcela/6BRmgmPQm+oT1CTrScuc4ENYHvV2bzh5AEzfBzA8nWJ0Ds3O
         1Ry+au2TdTeqVvDZ6tPRx4xWMJlvj6i5WTcm1WexVsa9Tu57FyNIHjZ1RJt77mBW+B0L
         bKahQVyB3By+mok20OSczrQjERU7ygAClwQ6OCWFN1CTJ3wVJb74D9ryob9TSI6B/Oa0
         quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794564; x=1789399364;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=SfvWoJE2wvJuEt9+Bi/yeMx/OHV2VOMxf5fX34LZLncoF2F0kCEvCbNsZGWvbFeeHs
         +ukp32wPJDqIy5MikLcbuVZsxoGGrq6ZzBk8qJ+dZu5P+KD96V4uRHy2AyPFK7gsM/oF
         lk+cAF4ec/pajKLu5dLpNcb9lFc/EPB0PNkwpHiQ2P/g4nPfplizxAN3APUZg4TdruT/
         a3YN3+QS97x0C6wonIjIx0b2Dx6EEpWD34sfbzQSLMFKeaOWQvKXVpm2B+oa7R1DCzZj
         x/dEtfL1CuVhdxf04BLcncHU1IFTFHy81NqldSPlVijBlCVos7Yi/5r1jC2VRHmJg6qL
         YcoA==
X-Forwarded-Encrypted: i=1; AKwUvBw+DKB86mSlG4DCyGhRHVe3RDregTCUvEeTcueixVKjEQLeK+figoXf9Cta+tvFnEnE8MrhH88iNzqwVvu3@lists.infradead.org
X-Gm-Message-State: AFuF++mdMi/CWMYod8z5HAPwIBZ5BeHXqRP8/lr5bC5L3MaEN171HT6K
	QjLdnHIB0O4JF1OZ/HZNnZfK5J+5LfOyyO3M5golSZG2l+bSMQwrG00QH//G79ksSnA=
X-Gm-Gg: AYBFou24UclFErGaiOhUaCPYhn+qyYzAfAf5xFQYLdx9w9MaXCMvbCI9B9SU6Ii9S2o
	nbxsrhQH9s5UYGP84vsIH/OxVSHvdChHC6ppZZI9rih+AAWSUZSdcYVSqjSLAW0SSmUcISypQTZ
	8UyspyGgJXlKOgSj3g2dhgkDMmMxRuyhbNjEtiDrH71HEwfBqtEBXHUcNIErbHM3dVaWGhGJgWV
	0T555+E2ryySwlU3OdG8qT7UGXYoI76Iwb9YsRn3HmFXJBORSXr3LOG/Iz2NO5ctYXVAlR5dlWs
	diCKgJXACJZDDAC0MWcThPN/zpYgn/WLuNK0ReqZWofgON/KWNQ1PxmQAtamkSsEJfxJBdvshcR
	qKFCQYJmDhdNVs1P05qKkh3kTCVFtXsO3LOpfyoXtVFlzKGNsBO7PX8+hNpu+OWfNbw0bY0mO7V
	jww8ug73uV5eigUR5I4Tn4rpOYrApKx99QbgQlhfwnfXJdPvsntbWgjNPsFZkq4snLipLkjyrSw
	NzTh2QGOCs9OXKzkqiR/V0BRnC2nmJK
X-Received: by 2002:a05:600c:3b99:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cf81fb72amr250088355e9.1.1788794564491;
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm288319375e9.11.2026.09.07.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:22:44 +0200
Message-Id: <178879456435.2256446.2005394820666057840.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jmfCKOrsEAkeGu4GxNdLlIPtSWNSStX+SxoQ8W3mBP0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntbFBsgbKyAhkkOJh84p2SvPyoyzSRQxstw9D
 3A9Z/x836eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7WxQAKCRArRkmdfjHU
 RemCD/9wGgVpKIFJRn8V0zICx86yvsAf6Pfmw2+t+HFAw/vPmcYJU+bEl+gXhNs+6LadQTaWZgP
 Vf5un+G+NE2CloSjsUmEkSlIUP2vxAhKXYup9NC3Lq399aqtzRnP5BqTrJp2rQQ/JeX5s0fDCna
 4EdhFl0ZMgzvr32vurCm44ZywSUGEWiKuGh6t5/0ApKOt0hubBGyc5h8jB5cxAumR9ovgGQ8xUy
 a0dKoglN5NWtk5FQNyrkDOKGIGoPTv7FBx7/ejivTWfRVvmA3EszeGZZ0SGykbdPVj0a9B5vnQE
 agxxO7E1xb7Uxlc9y7Dfgspf3eNU+8j8vIitR0BGPubc+0g1M/X1nwiBLcGCdnqcG83PZgnTuhg
 lxf9rLZcSQTDlxb7016YbagASF6TYHqdoRpHvg5olFqs+3+Xi4Qzd6Y768geLSEsb0J15Xg6+9o
 ytO7ADXO155fq9rdpIZBvIDekDlvfTGW91Naur8Qb3jAAq7NHTVvAkRkUeMRPgz7R6egwCGaGoS
 NX0uBEDW1vmlya4cdM5iMGhR1Jq5javGzdX5N1mF5gxmCiFjpkCMYLG6h6KedB0wg9SRRtm+p03
 VKjXhlKgR9SKCbnjfFZFUUOlugy5dbqSGld55eFhblnv4GNTPndXjvQ49fK9A64ZuhFLSAsdBVt
 9XRe2nETnLlSo1Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_082246_467765_0EDD9055 
X-CRM114-Status: GOOD (  20.56  )
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

> The S4 PWM driver currently gets each channel clock individually with
> of_clk_get() and uses a custom cleanup action to release the clocks.
> 
> Use devm_clk_bulk_get_all() instead to retrieve all per-channel clocks
> at once. Verify that the number of clocks matches the number of PWM
> channels and assign each clock to its corresponding channel.
> 
> This also allows the per-channel clock initialization code to be shared
> by Meson PWM variants using one clock per channel.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 22cefc6d5dd0..6f151464d7cc 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -497,33 +497,25 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> -static void meson_pwm_s4_put_clk(void *data)
> -{
> -	struct clk *clk = data;
> -
> -	clk_put(clk);
> -}
> -
> -static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> +static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
>  {
>  	struct device *dev = pwmchip_parent(chip);
> -	struct device_node *np = dev->of_node;
>  	struct meson_pwm *meson = to_meson_pwm(chip);
> -	int i, ret;
> +	struct clk_bulk_data *clks;
> +	unsigned int i;
> +	int num;
>  
> -	for (i = 0; i < chip->npwm; i++) {
> -		meson->channels[i].clk = of_clk_get(np, i);
> -		if (IS_ERR(meson->channels[i].clk))
> -			return dev_err_probe(dev,
> -					     PTR_ERR(meson->channels[i].clk),
> -					     "Failed to get clk\n");
> -
> -		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> -					       meson->channels[i].clk);
> -		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to add clk_put action\n");
> -	}
> +	num = devm_clk_bulk_get_all(dev, &clks);
> +	if (num < 0)
> +		return dev_err_probe(dev, num, "Failed to get clocks\n");
> +
> +	if (num != chip->npwm)
> +		return dev_err_probe(dev, -EINVAL,
> +				"expected %u clocks, got %d\n",

Small style nit: the continuation arguments are not aligned with the open
parenthesis, whereas the dev_err_probe() just above and the rest of the driver
do align them. Can you fix it please ?

After that,
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
