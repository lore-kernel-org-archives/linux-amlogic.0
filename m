Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3D5C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 11:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C605922CAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 11:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/pPACyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C605922CAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gm6kv1dpjCM6ElWBT4TQG8M5Kn//AVBVzqUpZtKD7bo=; b=V/pPACyF7Z4YnBFXlzD7gaOGJ
	TirowwaS5xMcsqCP1LYXqIMNNFi8NqG6w2xZQ+wBJfjhAxnw2aywLrVzETLOsLqI/2SxDsZLKLcP2
	BdmjRnizxzTnOnIB7VWWdbqxeTLJVttNTGeXxFkqG9cU1t2WGs08AzdrxnUnz79CZbNhKQwwtvi9P
	x8RrMj8CQbAVqnN2cZWmpfaAD/6MdWNUTb4dCCflj/aSqBlIYIU20Mg0hXLvu0x4fSByQdtlGBXbV
	dkNnLZc80IBTLzSuEFIObNNgmZGNUjW/jw1l/cmzSCakk7+pOJq97WWm+8Vs/u0/YhGGH6EYr0SJw
	JMFT3djQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBG5c-0006UU-Ew; Thu, 27 Aug 2020 11:29:08 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBG5Y-0006TL-AA; Thu, 27 Aug 2020 11:29:05 +0000
Received: by mail-ej1-f65.google.com with SMTP id a26so7177580ejc.2;
 Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iXm+BK1XseUH+QiQCNWCtflu2oIe/pb8DPKprrM24Fk=;
 b=F0fxSFMfHFHUr69RHk2JpJNN9p6+MzTlM8FWMOlSx2B7K7bwXiwFb9oUdO1C0F04Gp
 69zyt6I/+DuB8nHXYQiiZjFhKuwMQPcgeLKT1TbxQYnQpqmrYllIc2+eeexBZDO4ZyuF
 ghQfM8Y3FDXxVxw6I1XE+FqTf1pvgbYW8qQxM36JHZVAi0u8pQzun3xwAOZTVTmS/uiG
 bpurgsrcTK8kXZWYbw90yGm0gJW/ZpK2V+dXgeouBXWFM8tPxvEsZvw21/6EnztyTug/
 UGpJUFHGsTnu3VkH8H8aSfMLKNgqq4PZlR3EyDMJ3OjifWNeaRgwjTJ4Bc2XrMzwlzgA
 oXJA==
X-Gm-Message-State: AOAM530QUeoFE6P0W72NR6wXEKGy/XTmr9P4paxm1JZ3mvcSu0lZOjKq
 rM3SBLwnD1L192EVdbDgHk4=
X-Google-Smtp-Source: ABdhPJyEwtZ0NCeIt0EbDqNivfcPk1e08kNJdKFzd3GWd/Lf1IHJnIxd+vov5vkjwPfN2ooxo9kx2A==
X-Received: by 2002:a17:906:8d8:: with SMTP id
 o24mr19868792eje.384.1598527743036; 
 Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id o8sm1631358eji.34.2020.08.27.04.29.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Aug 2020 04:29:02 -0700 (PDT)
Date: Thu, 27 Aug 2020 13:28:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 01/16] iio: accel: bma180: Simplify with dev_err_probe()
Message-ID: <20200827112859.GA11849@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200827122605.0000770f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827122605.0000770f@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_072904_363390_D2A9833F 
X-CRM114-Status: GOOD (  13.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 12:26:05PM +0100, Jonathan Cameron wrote:
> On Wed, 26 Aug 2020 16:51:38 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Please make sure to send v2 to linux-iio@vger.kernel.org

Sure, my bad.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
