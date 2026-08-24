Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76FDC5DF9B
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2j4uxADgquQglpIKDkhttT2T7ey5OSjTcjmD5NhsLzE=; b=xl3aGOba8SfgmJ
	PGtkCjwlWXeCPDqT46fjcTRiZyknkpmL9Xowzu30MUOjMwgDD17BefEJfwVZM6sCUkyVg4m9WodV+
	dEWe11TZazB+vI4Dc6Iv+hD0Dg0kYvZ7efi2pyAAF2zNIh7I7u9m+rw8wsdsr8QGkfSBv0NRAaRMX
	Hf0qHoJjsyLio4jZI0QgPMaDPtoPYIJQQUNesxRM6szg1quma0Ryu1wm9EyBPdHj0EB5hzfW4CQFJ
	lcZcDPlRUzWbsOjZn6Llu8rZRYGJ07nuxMRqiwfGJoh+KMVmWNlmfcwqUYOjRbvUShEEXRuVWT3Bm
	xga5SRRtyGheYgpj4iDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVf-0000000GuZX-2GLb;
	Mon, 24 Aug 2026 15:22:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVY-0000000GuXg-0fmY
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 15:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
	b=PWoTh4NCCQDh60Fb61GBo+U5yQ7YjoTH2HzOwhWHXv12sHvSm9iTt+tbJM7jw71JUbmB2P
	nM1iVum6uwdnwrAIy5zXN0dWzTd2V4Vj49MmSuVxMN+kWDsJEJT3c4/Cy8MxRty+t3eMA1
	72J7PWPVxYY9i0e73GKAKDVnpISw75U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-xXytEGAOMriOKjGd24KMoA-1; Mon, 24 Aug 2026 11:22:42 -0400
X-MC-Unique: xXytEGAOMriOKjGd24KMoA-1
X-Mimecast-MFC-AGG-ID: xXytEGAOMriOKjGd24KMoA_1787584962
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso35806506d6.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 08:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584961; x=1788189761;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
        b=gDvfXdMfzCnq0vMuVTBGGqGLQ/gMaRSH9gHJoOeufq/o8Vp9wyCYpmxxE3CyPuRJOo
         jw6kXnexOVom7j6BlVpkgWaXA/6DZ2wMKPk6JRPKOXg7BBpQ4tiEFw649YBNdwqhwuwm
         waIVU0ZGtWUGFFzDAbc0boxUPSCygYQp+rIJwbkaHqdFGC23u9rfz8KnaAy0zKIE8sWh
         gaGnmnQbURuaz5WH2mOEZqdT9oQEwnJsiB95ei9BAV9OUcvkLzbBO/eqFNVk7efwb61c
         R8d4XaEXmcj0OmtxhEMoN5aeOWKNL8Q5VnqTQFUB75BKREaUK1+VecTst3b0rB3r7St5
         G8bA==
X-Forwarded-Encrypted: i=1; AHgh+RqUuEBZ8R0QRAwfxAqPX5CJWp2ig1IijoD/3pcvnJ8Kwcj3LbBKHjIMG8jw/9qwNZWwtQOHkfyws5axgm7r@lists.infradead.org
X-Gm-Message-State: AFuF++noRjiCYNF39HKxSunPXI8jZnkSTyJB5Kg3y/rmXZnnuWW4Sg8R
	uOs6mYOxx1CxGv/waOJfcR1/TeLDWZzfr+eX4UqsYMd3VJzt7plaJJMhyWaHwQuYe58ySEQBwtC
	s/T740E7vJ/1NYhjNdOaR4GF7s0AyYMEhuARsljUf6Q/RL5rUM+sO6ZA7f4H2nSp9bViYQpIM
X-Gm-Gg: AR+sD11x02UegY64rwtKY1DxCV8jmGIT76eZk/J859DqkZaCsE07tmMe+7kBL1gcRbu
	m7aTA8VoVgMAu36Jqllv+pZrGtnhCa/hXVd752OH1KO+cesNYmRVfwH9KEYDZ2w0QWKvB2nKofc
	8PVOh5/1vPExmTWtS7A7REbsAQcOrRfH++Y6Y0/5wx+pUFA/hUo3uuVYw6GaXyjPwhb6wiJv1J+
	Sq+nwouAuMGempZaaRwy2KyrcO7RnqKMW8RrgsyGGt27+3bvjmkKOlCayiauoJ7OOBm8vEiaeZA
	o7reOuGgJuu3aVUSkCEpz0sIcVd2IMip3AJUSirtdc+hKMkkO3S9lH+UG2vAWeGvb2cbo7w9nNT
	AgNELfGCcrobEudNQzS7gz2NM1Qb8NCDWwBA=
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261568986d6.15.1787584961615;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261568266d6.15.1787584961110;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65746196d6.27.2026.08.24.08.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:22:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxhvzXB_Cn2vExX@redhat.com>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IzRP82h5-XLPSWpOCodX3FC4jfQzqsR_VmoC5WTv2DQ_1787584962
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082245_358257_04F1628D 
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

On Fri, Aug 21, 2026 at 12:06:04PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
