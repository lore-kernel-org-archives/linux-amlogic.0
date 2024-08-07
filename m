Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5338FC52D71
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgqTY38ed+lQCBzVIs5qTp+4zB970OnwKeAtKGhLY4k=; b=SLfjwP/4aOPmGg
	GMLzx7d0CFnkkLjuHltF+0LZtwKs1fl+u3gvRRntOB9ZTHwV9UOTY9Zzveviy+E5rbx+kDmXI2g+k
	kYhGtwsTUVuXJenStJnPg5xsuFrwoVpTmrDxhzcGl/y5HHBULTlaKfBLe/Rhl9kDY5bXuKp443fK2
	U9mbv5llgn78U/1P2HvTuklLh9nyHF+4sWnzaOB4vohjYPj8A+VmqQKvd6OXIgSiLl6xSORhljrs1
	oHnvWuLq3NQjV77uTnKLYwqZ4MmjbTc8sZAosbwmraNZ21zjUUMtlGJZjZ6oSBgoUQ2dZOQWeNFto
	dmdUyvSqJnSYbydkH+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhRH-00000005Hyl-0HT5;
	Wed, 07 Aug 2024 14:14:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhQV-00000005HjM-2VAJ
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 14:14:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso17730305e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723040045; x=1723644845; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=i8E0GZkgTM71fE9hLOqUxCUeYZW3Hm/RxhTcOwtp3Q8I1lgn0/by/1JsodkPwSb9lk
         OHN0YHiknJjMj7KCqVv+kL1AW619X8OJ3vzH0aaY620ph5HwvmJKhsm9C9PNMsdzW/Pd
         tcHwZA1UNC+hIQBT6+QYpaqxyEGspXGAV7ruJT1cuySthduQVEWfL6jInnPRTEMxmAcP
         0lBPvWicnaa9tln9JlW4zLhQ+hEF1gdh4cBX5GeTJeUQl24+fWf0Ne0n4r+ssTixhW6Y
         o5dWhVSWjYNt6VbZzxR8BYBqIMaPZS/pU5oq+vUGqKrsuU7YKrYg9sP/guVR9yIytynE
         fYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723040045; x=1723644845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=B9WfnxaeC5DswdTa+045lAYFDJp/l98ZseoV8oMWD+E6nPExCDnHIjCOwmyAQMukoD
         Tl/HdCTqmR/K4obuQ0lYaYX7Garx3vji6mDYw+ulcjLhqTua6Cn0JXtUwF+9AeKE9wwI
         bHLu/y8mpFnIBFafRXiFnoVkZcMup+r1JXADthN5K009ANo+6Uki+dRzGngKAtQI18Le
         Mkvw8gT0Z85Act9Yvp6s7rA55WGkrBsqJGQ6bSuT9UDAWJs+zrf1/q20QnOjo8EhW//M
         9blc8mqx8PW5/+nFPVcmmK2BCOmB6ZjoSA6crp6KJ/goYT/CeES7r/9jwcr+ehQXwZRX
         RHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQWjgbw7UBBWlK4u4r1u5bOpWJU0xFWti+FUtj0zznAjv5o6TVKVy+9sjaVXGSJEJ62Vqm/W0BF8oSgg2WZfVZPrQOhxmK4xBddf3B0QO1GaA=
X-Gm-Message-State: AOJu0YzbYz+pqIWUxaUXime7wTe1DkVgYKi02amBFUPpaFAOG/TsJJl5
	clt3zvdWqFm3FTrSbzXCDpZLuy5gNj8mSRic424ih7+9LibpecAULBdQHFyI9l4=
X-Google-Smtp-Source: AGHT+IHFS+8FxIsgPDMxXI2119/zXQ32Pp05XpEgQOQyCV3S6/MHUfyYDHMpWs/M91Kr6YsvZoGl1g==
X-Received: by 2002:a05:600c:4853:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-428f06c44cemr111691625e9.36.1723040045344;
        Wed, 07 Aug 2024 07:14:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm32100245e9.14.2024.08.07.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:14:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org,  neil.armstrong@linaro.org,
  khilman@baylibre.com,  martin.blumenstingl@googlemail.com,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
In-Reply-To: <cover.1723022467.git.christophe.jaillet@wanadoo.fr> (Christophe
	JAILLET's message of "Wed, 7 Aug 2024 11:30:54 +0200")
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
Date: Wed, 07 Aug 2024 16:14:04 +0200
Message-ID: <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_071407_664215_280BE4F9 
X-CRM114-Status: GOOD (  10.87  )
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

On Wed 07 Aug 2024 at 11:30, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> These 3 patches constify some structures in order to move some data to a
> read-only section, so increase overall security.
>
> It is splitted in 3 to ease review.

I'm not entirely sure it eases review in this case.
If a v2 is necessary, I think a single patch would be better.

> Patch 1: struct meson_pmx_group and meson_pmx_func
> patch 2: struct meson_bank
> patch 3: struct meson_pmx_bank

Is there any reason for leaving out 'struct meson_pinctrl_data' and
'struct meson_axg_pmx_data' ? I don't think they get modified but maybe
I missed it.

>
> All patches are only compile tested.

Looks good anyway
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
