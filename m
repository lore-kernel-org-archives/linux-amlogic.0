Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF22C43334
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 21:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hqcxdePjZhiOW+Lrt2qIymohDeQt1jQGTIQ8ezN7uM=; b=YG2ZgSaq5JRLd9
	DD2A5RRPhq1C2fnnSuL9Q6Yeo6Z7u3I1qtKVy0VnNdHQxUA8ltBL06Xeg9Yb+CDQ2R5Q7zFnUHavi
	mW4YpXH8yJnrP50OWGWRMjRO+pK7qvdw5abuWyD5n0myacNnK21GmeGAcQLShcsBA56/xIO0NyAMk
	7GbfTTvVhSpG2mRFdkog/jvFzYBapZhwkPtNKpda8AkjStz6XqYz98QBggxKSxN/c2rvOSDYnkbwp
	DTlpVF38lPdGJrO6ecRWQY510beXFBrOA4DQpBvNrxHqLLIhBEkFK/0IdjogaHVchAQ/0dKVEQPOx
	Z91QcagdWXoprEd7ypEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyCi-00FThy-7H; Sun, 05 Jun 2022 21:54:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyCX-00FTeP-Pr; Sun, 05 Jun 2022 21:54:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id kq6so12602403ejb.11;
        Sun, 05 Jun 2022 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ABebLwqo263XImxv15WLBOgTgljqLTOZQ9qLhJbfj4M=;
        b=gE3MrqpbpVRDsTV5MMCGyHCk5v+WbI4w44tUaDP68sCLA4ijYy+H4hxOLT4zHW6vO+
         9NXxieOl498QxZ15MCs5QFWZS9fQ2MUwGCz1Q3st36F0+Xti+r/syURpUBb/1bmTwkys
         w4Ic4cl5AR+/X6uzpPyzhBsBlSQ9plqzZ9YXJISTn3UEtyaDKpgVtzKTp+LdSDwgpSGw
         XUaxudt3OQFq6PgeCpIZb8niuIMSovpMDw9eblBnTOE3L5tWzGAjir5ewMc5fWSgl/DK
         v8528A+sqE1VIYQV+ICdzkQfrAEkSz+5Q6xkBDH/Wq6VyJeFaLr+9DQFaHIJIXh0vCND
         56YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ABebLwqo263XImxv15WLBOgTgljqLTOZQ9qLhJbfj4M=;
        b=svXB9Jgd5bT3kKc2IfitPFWHQDj7mf6pFnlYT9pvx91FD+UNrCT7RiNR8lLF1W1utk
         nrDsWc1QiklWA8n50dg/Mh2P1ALuo/xIr910xsb74JE08pSj4AhIjPevTUIM0MKuXJHs
         dIwN3+JqL0SyD5DEefHBp3iqcGEM3r6qHwnM2lTld+rp1Oq+17D7dwqgcAA+LUo2/9OD
         6FQ8MVybpqKB5JT83LP0dI6ROcm82fnQDKiJucWaU0SNJCmy0770zdPQIqi1NoD8/P3o
         qA6GnOPplrraq6IaiOVLScuAuz2ZHngaCNxbVkZH0kFgqJLD+DEMBGipy7tViJYS0kCO
         m81w==
X-Gm-Message-State: AOAM531du5Y36+TzL66qfOKbr44jk0wJWgZdYPxUJzatAR3lUZ6/Rhrd
	9sDQBU1ASYRXTGHPY070JgnAyypXBdW3xSpq028=
X-Google-Smtp-Source: ABdhPJzSDwXWfpMZTQJxufLLyVm7/xbOttKxhZwowPd123orPtSasKAoePIaRSV3YyoLklNCG+aJWvY/jht4PcwEIlc=
X-Received: by 2002:a17:906:acb:b0:709:d274:611b with SMTP id
 z11-20020a1709060acb00b00709d274611bmr18721865ejf.147.1654466062611; Sun, 05
 Jun 2022 14:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com> <20220603100004.70336-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220603100004.70336-5-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jun 2022 23:54:11 +0200
Message-ID: <CAFBinCCAVZzhtX2WicBPkLe93jhCM1Pci-kGZztLiFG5zoUjxQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] iio: adc: meson_saradc: Use temporary variable for
 struct device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_145425_938906_4F2CC78E 
X-CRM114-Status: UNSURE (   6.24  )
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

On Fri, Jun 3, 2022 at 12:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use temporary variable for struct device to make code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
