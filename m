Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3F7FA373D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKkNyfS8Z/QxiWun42hbOJU8mw1Ux5t9c0JEZlTbiI8=; b=e/ZdzsZpnvxOmF
	Scq862rT/Q/9UM42POa+rJbcHJ/yhur6zpb2wzI30Wjh6uLBKQscTt0dDw7ICkTZcfA2GIuGK+8BA
	xfG5P2ofKd6ZRk6TCV36TYL2mF1dYkko/28hDjDn9z3eqFA6VPXb5O00RB8wNAHPTq8raOVTz2huQ
	Vi8wY7GS6+MUoLVbB3vyZQx4JBodmms1uu34SkMbZGPTfIUucS6uqkPsV6O2CguFs9cfpi8A1PNWv
	us0J69dLdNdeudXb7x3HN1Fqp3Fz56RuA8yTJko3XZbcWCLb6WDmlDsezQwTLJQEZ3EUwCEwSf4jJ
	7aZkC6fCaCk19yTEPjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvjV-009AaG-Hc; Fri, 21 Oct 2022 17:22:57 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvjT-009AYy-4y; Fri, 21 Oct 2022 17:22:56 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13aeccf12fbso4318711fac.11;
        Fri, 21 Oct 2022 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlHj7n3i5o3yXLa4ETHRTpxvwrBu3YafH8lL3TZQo7c=;
        b=mfKFX0fSUZxTyWGet7HLjN5KSNIIKvyVtQYoZsLLgdG68Yakqkgp2WJCOVzeO5GHCh
         yANi9hjw5ikEB67N8ZxxJKlfSvDFlB1pwODfttxygGfSi0EpBEzaL4U+q9EnKkXB8zM4
         Kpy3knTJtufMaIDXCnTxfQ5ityhf0XE//ULX0EfgX5moVheH0+IlYH7rFaVYlw7h1IZC
         f3hvRzN3Is7mdZ6SjqQK+HqlYEc7b/vJJi/DHEaOZ5SLMYgzInSE2cZqQCd6vFovU8W+
         GC/OSC40v6iY2wHSha8o+Px7g7bYjOTCm+V4YkcfWMW6rmsOzqVXzjwkL/eK9USq23tn
         RQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlHj7n3i5o3yXLa4ETHRTpxvwrBu3YafH8lL3TZQo7c=;
        b=ElqVWWrCrxR2aAc53vrBTvS1mFnFSwEa1MngyneLOofs6PqRkYl3n5Ss28uRiHQBmM
         ZYos5/cD0BSFchb7vk13PubsT7PRxYYDV5TlGFgx7DTGcdjUcMyj5gY3YxymWAbfQ6K+
         QmjHEFLUCGIRVgJvi3asV8ARWv+MTTC9yty1Gqw+1EX+vVjUZI4ucNqhvjbItTIxiRi8
         9dSHmCbomGW/gmmSQ6ksSkevIJk73wp7Rd0fUB8SWoUS9z9OScF+AYygqvfYMF12mG4R
         6to0m07OvS3gE5+TFLLgvY33Ir1OJZZkpwjJBJz8bm+m7KVDxJXt0t0LReTNgL1XrHxl
         EbrA==
X-Gm-Message-State: ACrzQf3c7gbrKwsCKfwyTKn0zhKJLn4b6D/lbJ4ITHhAcd4hUvylEnuP
	5QVy4hct3YC5dPNVqaSzS2I=
X-Google-Smtp-Source: AMsMyM6Gt5PNxUQH7m5Kz7f+QJp+blLH3aodobQDZ0VnhqQZBBrggpcw5I5WICKa7m1ONsnecjhzHg==
X-Received: by 2002:a05:6870:2427:b0:13b:1f89:ab27 with SMTP id n39-20020a056870242700b0013b1f89ab27mr3799543oap.20.1666372973425;
        Fri, 21 Oct 2022 10:22:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id em40-20020a0568705ba800b001226d2100f2sm10482749oab.33.2022.10.21.10.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 10:22:52 -0700 (PDT)
Date: Fri, 21 Oct 2022 10:22:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: adm1177: simplify using
 devm_regulator_get_enable()
Message-ID: <20221021172251.GA1891003@roeck-us.net>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <7773541795f280db31dd981ffc21df8a630b794a.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7773541795f280db31dd981ffc21df8a630b794a.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_102255_206911_1440E2B6 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri, Oct 21, 2022 at 04:19:04PM +0300, Matti Vaittinen wrote:
> Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
> add_action_or_reset(regulator_disable)' and use the
> devm_regulator_get_enable() and drop the pointer to the regulator.
> This simplifies code and makes it less tempting to add manual control
> for the regulator which is also controlled by devm.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to hwmon-next.

Thanks,
Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
