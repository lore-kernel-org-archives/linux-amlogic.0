Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F1C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9/jS8qMWMuge+EdxsltoyLUTt1LZLZPX5bw2prKdD4=; b=E7ILU8qdwI9G33
	GK6nFhjF1iqnu+d+2hRAr/zXvXh7CNNl7sxvrxT14Qq4viwAlbWMWqCJRDCpk3izBEoFTPI5bApSn
	HkWa2A1dhBAw4wSma0r1B2dbDbsskoxFglH0ch/gOeU/sYqPxt7O3FQYOCqm9OPxiUdw3kXhCqnDV
	9Z2LjhwSJImcc5StSRueS1oNy6oavcJKNcrY1xoAw4ZJFl075xycRK5GeeW7nXHaWkNsaNmkWTRpb
	CF7i8vbCHGY9TzYEkHdiE3nFZ9wKFbGy8EkkYVNJEVGBkEv3A01BpQLUO3qADQtxnOGEKuZTOFIcx
	0T/pnLlhpFbrK0ZOSGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9iz-00CkaR-Iz; Tue, 31 May 2022 21:48:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9io-00CkYr-Co; Tue, 31 May 2022 21:48:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id d26so14747861wrb.13;
        Tue, 31 May 2022 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ybk7O8dN6b6H5xbFDEoMCkqNz4qnfNPoCfwRQJbaMWE=;
        b=Cgm6GprlcUCBuJ8R9gwHR/U6yIcGBQ1j0i9r/Y19cnMF6yfiex3zX156nHpM6PWbxZ
         /pasrG3B9WLzDjRSg3Q7QpcnySf+6cBKafEA49vxuVLkZJpRnM/3XXQsyl+P3iqrP2SR
         3M4Fa5Ey7i3i7bXM3pUJK/vKrvfXa+8U6Fhk1pVwZ9ygtYHkhjQV7qO0x04j9NMsccis
         BTO4q01NB5fIL72dqBfydVgJ4d4gy5OrvsNgU7BYnblwB5wtD/MT2SyK/pBC3OJimTUd
         8CrIKuGDEm/Ym6h5DCWj3n6hUn2ZSFdWWcm+1kdPlaOkhFqnPAyocNLGNNGYdKNwWKaC
         lXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ybk7O8dN6b6H5xbFDEoMCkqNz4qnfNPoCfwRQJbaMWE=;
        b=axbV2/F9bj6iSYnS5wRFMvxaUOncPwuvh0XG/WDdAuL8DcaQNmR8wdGNQQ66U4ZWx3
         tC5e3W/M4xfcktWKfxrNUaeVyq+fS3CxXVZhOhiN0UKXE1P0de0Jdbn3uVkmFeTkFzgN
         Hgn95K9QB1RHKUA3JPMnNxWFWpuv+vu5o+wImiPy92u+0udmo9xKcrVvIdTDEqYVt31w
         d38ok2GJZ94HR6kkOmfnQZEwybn7O2YzrMnWRU0SYFle3BDmDo2voL6OELSAjvh30Nar
         Fb1l76xaev2qVZ0luvjjTo0/0WwP0GrdKDjNG3sb4MqvKuR6V71VWjSOeZL/8DaIUa2L
         rWyg==
X-Gm-Message-State: AOAM531YQugUlrVENuQFD6TmxqkEr5pNm/t7dTgvmzdXRZExGSf4593u
	j/dqw/BYOi9TbsNwrBUA4fUSBoFrruwFBBIeZEWtXC6xLrQ=
X-Google-Smtp-Source: ABdhPJx+qwKcx7leYf5D73FowWhfAJA6/AHPi6i6vR9MWlyar+cEFQ36m84oTWlNMVbd2BNnkrqW7jTW3lQggmxgPas=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr52900857ejb.147.1654033681191; Tue, 31
 May 2022 14:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com> <20220531211842.71998-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220531211842.71998-3-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 23:47:50 +0200
Message-ID: <CAFBinCDf4UfEPFV4_Qf3m16DE-NzNUk_ZVcHZhgxVvn_pokdgw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] iio: adc: meson_saradc: Use temporary variable for
 struct device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_144814_486831_E7978AF4 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Andy,

On Tue, May 31, 2022 at 11:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
[...]
> @@ -650,11 +648,12 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>                                   void __iomem *base)
>  {
>         struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> +       struct device *idev = &indio_dev->dev;
> +       struct device *dev = dev->parent;
It looks like this should read:
    struct device *dev = idev->parent;

That said, I think this kind of typo is very easy with the current
naming schema.
It's been a while since I looked at other drivers but maybe the IIO
maintainers have some recommendations for us (which would apply to
multiple IIO drivers, not just meson_saradc).
For example: I am not sure if iio_{err,warn} functions (which take a
struct iio_dev pointer) have been proposed/discussed before. I think
they could be useful for other drivers as well.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
