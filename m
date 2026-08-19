Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFC4C5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/lIV7frGw6GPIyRtBrwpl+bgIJm3RnJI8wYZylFfdA=; b=R9DjqpKfqhs+kW
	yofEF/wXvobvJDnuT8zC3wzNbrC8+sia3KNGqMVUd6FNkTZLKen+ySh+qTRraTGHedtAc68d6+MXl
	8qR89ApIRACQc3rgLBWkyRU40X6tNn3K9J2iEhmeKGNHCv1sT68ddyR06kZdgZnkju8ydMYwOlLb9
	H9cjxKGNEZAAq88PFSEECIjJMkfLzfywcBFXY3XUBZpXbpFLT8wfccgV0fTLWqSkwE8Du1+0dxXrp
	xUJzAlR67IHyOtbV3Zlfo6oW3O0jsjfnk6wiKUJGJGrdxuLQ1nMB1/fj9L3mjN7s5efReNRqBspEf
	YMwIRSEJKObPoHJfpdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnj7-0000000AYTw-35bB;
	Wed, 19 Aug 2026 21:21:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnj5-0000000AYT2-2YEI
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 21:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
	b=L8dNnuXP5IhnrE9VWe2vk74YdnSQra+uTMzoiqaOXRBMPqb3g+goaiMrpqYhkcjluyOp8q
	fT8HwA+vdUIb2YG0ji7tcsAUuKaWbdd4CUIsgNASLCiKjs4/imRxuXp/VPIfJlHP9rfXiM
	7D9Tb3x9eZGF1t6xF6I5nLRwNNUnehQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-UxrZST9qMhekq17gLD4wlg-1; Wed, 19 Aug 2026 17:21:33 -0400
X-MC-Unique: UxrZST9qMhekq17gLD4wlg-1
X-Mimecast-MFC-AGG-ID: UxrZST9qMhekq17gLD4wlg_1787174493
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52de05de414so7448291cf.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2026 14:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174493; x=1787779293;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
        b=ha01ynWBCq2PRFg+GyrS6k7c8i+f7JtwU0bQc0mCgi8+tMI7fXVf+aiRX8bNVqGeA9
         uIYu+xQdZ9RVyhagszqHGqkUxH6wqKd1un7aZSc6qC1wTpPBmzDopq7oWchkPXhbNcTh
         8UzD1FA0n1QDs6H+4bse9hwNOzbJLVEEeEirqHQ2sCxJlJwUj7PGOW+ksKs4ir7bqvEZ
         6mkWakdsyprYiK4BQ8QUUsVMIfmzEolEQKlmGqOcqlLC5/pxpWc1H4HZCrmFKBrid0Uz
         sdiGcNIiByDvszEaF92KyAiI/J3t1+nyS7wttAU0O4YlmYOeMSPzkXXqvNMCNcd7rxsl
         Jedw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf9A7+t/VZbBicXRLAb7zGO1BI4bfv9ZhHNsXmvD5zPTLzehIYpUV6kyOFwsf0EEx+VK7S/vnJTJwOFS9k@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl/I2NCLBMO6mXuTs2qPBzzKoYR6Ghcuq4YX4ABUI1fmqXZdyq
	DL5df1f0GF9n1HtfwnogIKWf4RDUbXW2oQZVp+1DsAg8l+M8SPlk0WKbCiX86YhI/3PNdIRi4kk
	SIXU1UCKVRC8kV7btVFzOL+PlTtFPbAvR0Nr+EthS8A7erdyIhpKl3CxzNoUaMupbnUoNmESB
X-Gm-Gg: AR+sD13PFmU3CHjTz/K71EKuaJlNlI/mkwp99sq3s3ebfdlS/Pk8mjHsns1mvUgSsa7
	n2YHGELrdXfzeyKl1xlmTqfRe64yZsvmNCFWQQwrKZumJJrEn9/XSrGbEQgg+SZ2xAxc5yQYVFu
	i8lvlMCdoAiPlP+CkypShLyN+ap2fuAo+5G3bjTeY75NHEKfnK7EOg7ctKi+depGkPn2+NZ3Cby
	Rz0WOM3n8glalM3w4aJmZM++bYuN7nOjDKQWQRHTfS/Xw5EjwGWIGxqmPoRC5CKnwTDzDCYUyC+
	Vu2iKuCcO4iH8IhRUq6moKL7neGgcfVYAg8w2Kz6DcDsj3x5Wgf7/tAq4p1+wNLInu7vxMoKcIt
	FsUy+qoQx30NN/S1YieUlUaH7PwWGZKv817E=
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425501cf.40.1787174492950;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425061cf.40.1787174492580;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd8598adcsm18745871cf.9.2026.08.19.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeWR6H3q-d3yd3@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E3sUpjrdst74NUq3NwVZcxnPB9BBY0c6mfVgMcLr1Bs_1787174493
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142135_724275_B4862A90 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Aug 19, 2026 at 09:05:16PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> visconti_clk_register_gate() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: b4cbe606dc3674b2 ("clk: visconti: Add support common clock driver and reset driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
