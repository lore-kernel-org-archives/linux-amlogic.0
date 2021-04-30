Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE8FC433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:50:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CFE61420
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CFE61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CVmDjpKvjzEiUgR6uyXRlq/YOJQ48Gar5x1GT9AKb2k=; b=GYicOeLNBJw/bx4Qj0LigbOBl
	zdTiqmNplw3mUojXXG4NUNw5c5LkX8+H3cVwiW71GoQA5h3+aJBMeldSbABXLDxZeG0ETSDWMJz8n
	Bta0rqL8NdVJh1kCPS+Sd8xaHjtqkS8LQHTwE4Qikp73I5qsHe2LLLZ7Q7utOm6jzq79WVsRYOxAo
	QzB+eR/GQN4kQpVNDHP537nbMPVzIgHNxmNLKTPBlRqxaDJTAsY0xWk7NUCviubiEYVO9qeiXsu1o
	xwRdFfdAbXUG93MeZCzSV0dhnOtsC3HmfXoHgf0AT0PNX9vfr99REAZjghCs1JJaQ/hgGeWq5u/T/
	VOauEThBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcOqc-007Xdz-FQ; Fri, 30 Apr 2021 08:50:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOqM-007XZZ-HV; Fri, 30 Apr 2021 08:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6XpLFpvoM/MyCxucScV9GHbc1u0ufErrdczH8fINryA=; b=QpgddnPryhLmX90n4pUbkk9uj2
 ND7vQ1SPzBiA0NspbttjYKT8nqxZ0FhdHiH7fMPKWz8vznb6ILjPU/G6o/GcbqT0gCkKbfETQxG7B
 7db4TVap/Owkorfq6rQWvcCG0ER0f3xKzez/nXXR1CI7G1rqcPvg6cq2YppI5HSeZ2HEeYjOEobNc
 UrqHR4OLnep1DyWn8PDke/U77A4Jgd9eYExk9y7LoceyEQ84OeWsJAFwlP/3576aAxo7NxilrwGvW
 TTN31Sx+T+mNK8wHGtWFRAXCRdvgKQZlnKdgYgJnZreblx5YAwv5oEfT3WujdEouWupYGud7Hdo0z
 xq0ckVmQ==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOqK-001Foi-5L; Fri, 30 Apr 2021 08:49:49 +0000
Received: by mail-il1-x12b.google.com with SMTP id c15so8421992ilj.1;
 Fri, 30 Apr 2021 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XpLFpvoM/MyCxucScV9GHbc1u0ufErrdczH8fINryA=;
 b=XfdyiakISQV0rCr116VJNrN1pSVJBxJnhTJ36wAigGd+atH9iiXt0+lNxlH+horNLb
 ITiUPgvRVyeFfalzkClX0syUiifPxjCE6CGSGGJp/t28z5etiIkNkRO9rIrnkUu15fhf
 GIO1TP2+iIaDMYSRGGp2MyxlEKrb6aGXi9T+9uaIzTKMecoxdO77gb/cI3OjjYXfDElj
 ozBDRGBu/DhpEiRe7fJsEXyaDafnVYnU0y4y4QTe42zmjWctSLpA+9WW9KGIDPCAgNoe
 w3H/j2m9HLeM9sQcgJqcggbYuKqInYiWAIqck2rs3kHs5USyYLaW9h7KmKNfRrqPhiDV
 Bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XpLFpvoM/MyCxucScV9GHbc1u0ufErrdczH8fINryA=;
 b=uiG3k0qP+NTsGU6jdbaOB+ZkXNF6aP9Vh1y7faeq9bFta33QZCAaxRRFrSjE5ICASx
 MtQBy+wY/6yhEl6a8a4y9NSILbL0mo+argcWS4RPzeEF8YhWt/4kwgG8CHT1YZd+tBdk
 iS1CFSC8Tp9uJGdbSz5oz4K28vF6m73+FsubNK+WGwSnaGewVHtUoALAB01ls2ZcAyhX
 bfFWMwVf1vH2Q4UFI8utzw2qj5pnlqiLCWfROo1XJxsUMzvpAVjtx3bq2yXQeI1U03jx
 WGIIitCJsgwUzHsgv4IovAK8iSbZuzxVG8YQpsh+B55+bst5PWXz3sEOZ8MauX7Et++J
 hg2w==
X-Gm-Message-State: AOAM532oC0SQJRYtBxF5kj/XgRdy6y/Awu5WwGH3zavY6Ov94Aoq4oLu
 rYUAhemfIWfyNCxFWdaWa6vxd5fRCFuBReLWqbk=
X-Google-Smtp-Source: ABdhPJwq7AMNZNBViIBThuRjUDAbnJQd0R8zTalusTtudatSMQDlQfcewQ6cSi3aISJKRV4yX05N2MCV3b2pDAn5iAM=
X-Received: by 2002:a92:3203:: with SMTP id z3mr3244322ile.22.1619772586655;
 Fri, 30 Apr 2021 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
 <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
 <20210426115645.GB4590@sirena.org.uk>
In-Reply-To: <20210426115645.GB4590@sirena.org.uk>
From: Art Nikpal <email2tema@gmail.com>
Date: Fri, 30 Apr 2021 16:49:35 +0800
Message-ID: <CAKaHn9JM-KEiz3_Btsz8_fr7hcZ2Sm8B64VyLvgpvKK-NKco3w@mail.gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
To: Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, jbrunet@baylibre.com, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 nick@khadas.com, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_014948_228147_18AB99D6 
X-CRM114-Status: GOOD (  15.26  )
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

Yep! but

if i try call spi_master_put(master) or spi_unregister_controller(master);
it's made Segmentation fault for me

what's wrong - may be somebody can help me


On Mon, Apr 26, 2021 at 7:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Apr 24, 2021 at 07:57:19AM +0800, Art Nikpal wrote:
>
> > > I would expect the driver to unregister the controller at the start of
> > > the remove function, suspend doesn't really make sense here
>
> > It's strange - But without spi_master_suspend i have randomly stucks when i
> > try unload this module - as was written before
> > i was test it (load/unload module in loop) and for me suspend make sense
> > here
>
> > If anybody has another solution - or real problem not here - please write
> > to me the right way!
>
> As I said above unregister the controller at the start of the remove
> function.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
