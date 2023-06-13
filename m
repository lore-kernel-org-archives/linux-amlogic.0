Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC94FC7EE29
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3ZY2evNhzPoMrFF/TzaZQNA9YO9V+TS7zQK99z+vpg=; b=cGJla9kDHTJuli
	M9dvnQfIGkkguPqVWZ9tgPjkXln+Aoht8YSLcF/SsT+/cb4sZC5LpZH3AMWjIzA/7hQ+0Ef2fuCFU
	hvn/dCnUncPRpOGm/GsOoNMhiTazx0v2ybYLW0DNFyyD8fnF6CvCyI5vKkrLQgRHWQKmpCggyw+W0
	0IsWmILY8ir0u027DPWujAQUUe0lWX0r9rJAEpaU8r7M4KhaCx/gCQ+0OaRmvqzEG1mlvEDNKpTpc
	xyWa15E6Njgi0/mJaa3WXu/CDGtvtW0+rTspYUDstoa8g48bxiA3ZW9gxNvzh4C4B/YDglHG8R2o8
	uIJ62QwPVEfLFXjH69zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q90oO-007agJ-0R;
	Tue, 13 Jun 2023 09:59:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q90oL-007adw-1K
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 09:59:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so1932455e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686650375; x=1689242375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlUoGmD+Nfi7K2nHm0LGWuLWSwRbzH1OWwMGWxNfqrM=;
        b=OwZMBzxmZi8GYXKYUFBPh7/x5iWEMT13GxKzuI5U9ZCQOEGQweYPFbetgB/yeF2eo+
         JPjG8t8VtY4e0bz+v7fKE8y2oDOmPygXuZIj0eKQkQyCh0msrqb0VE9iElMVzjno/Od/
         U+St9XrDfAm6BCcvEfdpe1JnkpYuLLk3dDCly87ImNh45wEzNJfvaKjP8h3GgL4F2iWa
         4BpS9XmjSmz8Tlp2+h3AMgeX82VmR2Q7jUmWIE5S1GQdVJJYF7OimRsO3g4BkbjYHnna
         axAL+h31Wuxzd2cyr2wOEPfbd9eSss92evfNGp0mHoXhYI2EAYIoIHhdloEytxVaK3bC
         A0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650375; x=1689242375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlUoGmD+Nfi7K2nHm0LGWuLWSwRbzH1OWwMGWxNfqrM=;
        b=bD5su7X3MmR1dGfr+PhhpvAx7VC8wTp/pPBMMjQSZZoxZZcuF9Juk/v7gBJBCqZvd7
         7lHt7bNbPbeXcl8t2u0ADTZx1/EwT2cAOVW0smubVNYSDgIzLveaxTqcdGKSi+W7752I
         Z+E3pT7m49ErGKLQTCa+ho7LkKV03DOI2q889b4qQ7Hyq2JTP+ZQyjTxSDa4e6eq/flY
         vrg7i++bl0IJeyCQNABE3CQwZRm8WxdV/fXZrAWsEDhcftJs+StFFoK0n8K1ev6LVYC+
         SzT2C8eWscqzcWV97GzATQ1AkbBYWC+SbCqBqUSywsOLfinTcj/Ki7Qx1Uqg1PXX9Y3c
         C2mQ==
X-Gm-Message-State: AC+VfDyLLYsVio//3/kCsmQRk6YZdWlrASzrp2Cc5JB172S1cAgaLN7s
	0WtHHTUE8sH8FIJgclbDXFiVpw==
X-Google-Smtp-Source: ACHHUZ48AjkEKc9KR3ij8G3kZiakHkZ+tjQ0KaSTDHC4QnSEoudDWbftA4K3pG4bxUF8hqmHpSPFXA==
X-Received: by 2002:a1c:750a:0:b0:3f7:3634:e21b with SMTP id o10-20020a1c750a000000b003f73634e21bmr9945985wmc.2.1686650375078;
        Tue, 13 Jun 2023 02:59:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020a056000054e00b0030c2e3c7fb3sm14717409wrf.101.2023.06.13.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:59:33 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com, khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, martin.blumenstingl@googlemail.com,
	mchehab@kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Message-ID: <293fbb78-26df-4328-8a1b-047fdfc9153e@kadam.mountain>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
 <20230126153258.1558471-1-juerg.haefliger@canonical.com>
 <20230613115018.562c843f@gollum>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230613115018.562c843f@gollum>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_025937_444086_E0853563 
X-CRM114-Status: UNSURE (   7.72  )
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

On Tue, Jun 13, 2023 at 11:50:18AM +0200, Juerg Haefliger wrote:
> Ping
> 

You CC'd almost a hundred different mailing lists but you left out the
one that matters.  Resend and CC linux-media@vger.kernel.org

The linux-media maintainers work off patchwork so they'll never see this
patch as is.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
