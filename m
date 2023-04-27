Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C7C77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzOqJNFDMZDC51314yLjk36gUe2YKFz96vzmxCX551E=; b=A8r6+B8j3kcQxu
	gagUlV6TPoQkkg8An0eDEX/uuo4DvarGSz/JvkG9OlE1SZ9/rj7fMheFVxf96Bx5SF9wO+Wl4Y1xH
	gIceJFqGbf5ijO367RNkbMjjEpyjPPf4d9ifbvq3E1Y1RLGsIU90lkjInBTaeVA9JZ14bisk4UKsi
	EUM/yiBCDvn//TWzi/Z1j5Uqzu+QEOwcXCih+WN2LmXQfxSJfQGiNAQLhWZdE7RV49N1K+KYvKq1Y
	rjT+VpJzTsQJRqWVYr7HJuZ2oQrK9rTCJa1UWxsOgSSDAifmH10WlDeq+uN0G3Mrsh9q+/aVYVxgB
	elQpp/KrKr/GPDgxF6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps8mx-007XQo-0X;
	Thu, 27 Apr 2023 21:04:27 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps8ms-007XOt-2C;
	Thu, 27 Apr 2023 21:04:24 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-18f16a2c329so7056838fac.0;
        Thu, 27 Apr 2023 14:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682629459; x=1685221459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7iFliujUSkel6mL8gHDSSVDhGL8j5l+idukWslg6ZU=;
        b=Vro+lcxmMKfON1Tvt0P5VIZv3k+yrry/JDdMm5RKTAY6V4Tbm/1WRraODEG5WNIG5D
         fUr46zNF6CQK6KQp5uatSD9lxunqnz81vcbbwYbfAzQz9Q9l7OhvXl5kkMrrR27nCPef
         Vq5Hn2O8sw2qas6hq8c1msnqQy9dC9f7eHOOPIjwLVqDLiOWhXLYunkXvJdYbLt7+0qD
         xIN+DOO77Fmrgz/nbpbfn10C1radwBj36E+9WkuDQYDhl6yVrbqIuaR8yNlAOSpjf0V6
         4UKHvAEzhm4Fv80tO/Jnu6vYTYaUWa+DofgoJyDWr7LkRmN3FMB10Oj8xN06r/R++b5m
         kfOg==
X-Gm-Message-State: AC+VfDxYyluM+zRKHhsFxa2qE0kyfaNH1mkdNItYQJV5A1sIUrYEiWQt
	q1XKPVEbFBPpkRpPwqZxBEPHx0GEsA==
X-Google-Smtp-Source: ACHHUZ4wTFSImmRssQrZ4PnbGSQf+qWZtCP0hXDPeYZT+0kKmU67xeci9GANGGKB7AUUIraxz9LhTQ==
X-Received: by 2002:a05:6871:6b8a:b0:176:9fbe:fe02 with SMTP id zh10-20020a0568716b8a00b001769fbefe02mr1603936oab.8.1682629459102;
        Thu, 27 Apr 2023 14:04:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dy14-20020a056870c78e00b0017197629658sm8035605oab.56.2023.04.27.14.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 14:04:18 -0700 (PDT)
Received: (nullmailer pid 3518678 invoked by uid 1000);
	Thu, 27 Apr 2023 21:04:17 -0000
Date: Thu, 27 Apr 2023 16:04:17 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com, devicetree@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, martin.blumenstingl@googlemail.com, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-amlogic@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, jbrunet@baylibre.com, stefan@agner.ch, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] of: fdt: Scan /memreserve/ last
Message-ID: <168262872454.3491083.6407810340850053636.robh@kernel.org>
References: <20230424113846.46382-1-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424113846.46382-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_140422_717140_04F8051A 
X-CRM114-Status: GOOD (  21.46  )
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


On Mon, 24 Apr 2023 12:38:46 +0100, Lucas Tanure wrote:
> Change the scanning /memreserve/ and /reserved-memory node order to fix
> Kernel panic on Khadas Vim3 Board.
> 
> If /memreserve/ goes first, the memory is reserved, but nomap can't be
> applied to the region. So the memory won't be used by Linux, but it is
> still present in the linear map as normal memory, which allows
> speculation. Legitimate access to adjacent pages will cause the CPU
> to end up prefetching into them leading to Kernel panic.
> 
> So /reserved-memory node should go first, as it has a more updated
> description of the memory regions and can apply flags, like nomap.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>i
> ---
> Previous Threads:
> #regzbot link: https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/#regzbot
> #regzbot link: https://lore.kernel.org/all/CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com/

Note that this should have been a 'Link:' entry in the commit message 
for regzbot. I added it.

> 
> V1: https://lore.kernel.org/all/20230406151429.524591-1-tanure@linux.com/
> v2: https://lore.kernel.org/all/20230410120017.41664-1-tanure@linux.com/
> v3: https://lore.kernel.org/linux-mm/20230412224620.8909-1-tanure@linux.com/T/
> 
> Change from V3:
>  - Drop cover letter
>  - Add more information into the patch
> 
> Change from V2:
>  - Remove region overlap and reserved checks
> 
> Change from V1:
>  - Instead of allowing to mark nomap a region already reserved, give
> precedence to /reserved-memory node scan.
> ---
>  drivers/of/fdt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Applied, thanks!

Going to let this sit in linux-next for a bit. I also didn't tag for 
stable kernels. I want it to get some exposure in mainline at least for 
a few -rc releases rather than getting backported right away. Please 
help ensure that happens if you see stable review emails. I'm going to 
be offline most of the next month.

Rob


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
