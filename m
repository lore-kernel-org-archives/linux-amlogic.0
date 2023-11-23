Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A39C5AD4C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hSrNUU9/DtoGsW3CBZ9Uc8OPdyqQOJVowxCBzYsXKU=; b=TXmMwVlYJnNiNL
	kTD6Be8/K7/AuKyN4pgYGK0fYQ5yFzzWFMEfkfwhmpMRO0ZQOzt91ho3MU6ETcrx9bQrkntecwo/L
	J+kbM6pYdbtDJdGR3dRRxiaVY1Pz1TbGm/+gPAcvf3ZLyDvhD/VH4bpQKy8oNvOLpE/ctPQS99QvV
	A0I8f4UlUIiFU7AWc/h2Ni0TqZUPFPPhlMKdVv5eKdLlxATWRrza/il9VypNkb0IWsMmKx8OkrjIX
	ZuBW6SUVyt11kGcu6pIM7SQJo35j3NqsIT+5lT/8gKhFjntBmdfGNXG7Wm479EyyXWb4Bl7unl7kW
	dW6tYKe/HeZi1G8mDesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CjN-005K4G-0N;
	Thu, 23 Nov 2023 16:39:09 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CjK-005K3A-0r
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 16:39:07 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db057de2b77so997907276.3
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Nov 2023 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700757544; x=1701362344; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ILiBl3fw2ItmQ6qveZxg3Js/iA8qtmzSnw1HvX8bqaw=;
        b=swrgKuYixMaH7FTuruZYkps1v2GZRV4Q64mm8SI2Ixk5kSL4IiGro1m41t014cFirM
         w4KghgwP3nZT4xck6eao17wTGneSfev5/COHLUnRJ1PR0f4TCtpl4Q0/GWje7aumAZwf
         dzOT1HiEB1flP9iy8pobodwCLIkT5VDUhilILkr3VVLC3NWctmVEeEwgK0v27JiI8j11
         U3AOmxPMemdFxHETFyL+GLT6J0waVwA3qdSPJXSD0RxbX78ga150Z/k0bd+TxsWzlU1g
         OwW3mSgH/SF3jUCe5r5ZxfWzJrHgDuYmTt/tJ37aUDdyv04ADI0bGg4m6FxPcCGGuY78
         Vqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700757544; x=1701362344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILiBl3fw2ItmQ6qveZxg3Js/iA8qtmzSnw1HvX8bqaw=;
        b=Mqtz85tKFcrUUvLydwZUTJxvbDlJ34z8bQ3XCzPuu603YFBo4kHMstwEu7bBD3lAu1
         MbPZ6B1HBaPcIAQVvpeNPtsjiQNOvHXuO+YurpkbbfULR69rAADDqCsREs872Ndb0LnT
         PM3ngyCsnGgDYTAFwJKbboRlTGMjKUaKrjdc1x+UltkSrzvFrfgYZV7nBxgtLnAp2C4j
         8iDWepWZLcijBdqkwhdZ9rpq/b80l6QdsD7zscaG/N9DVUVfp4uVBVBRtgjZUIZn+/Nu
         SWp8lL2BLZm5dyKgHH9UF9s5sZSTH1zBrpGEkuILWOfquLgY3ZkErkNtbWD4181rCKJ/
         4Qyw==
X-Gm-Message-State: AOJu0YybdbHc6wdjhuU1ZxgqzwJDYnDPm6i5UgXf5BXCAl0cU24icXyg
	xpn52nfgXW00l+Rz0PqejK5DLjU9IwT7ivu6YXn6SQ==
X-Google-Smtp-Source: AGHT+IHyEIVYlN4F4vyQBH9BTfFozPqgQ9H3YOtEeJFgrrYDbBBfTUFwzsGY/k+etU5uqbsqanAFeQTZObkfBoTvB+c=
X-Received: by 2002:a25:8188:0:b0:d9a:6669:68ce with SMTP id
 p8-20020a258188000000b00d9a666968cemr5853600ybk.32.1700757544266; Thu, 23 Nov
 2023 08:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
 <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org> <20dee547-8358-4af4-ba90-c5e9a7367c48@linaro.org>
In-Reply-To: <20dee547-8358-4af4-ba90-c5e9a7367c48@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Nov 2023 17:38:27 +0100
Message-ID: <CAPDyKFqcq4F_HtCOomiZK+X1me8KK1i6y9mXjn-Bzg9COzS-aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_083906_300702_1694C812 
X-CRM114-Status: GOOD (  13.09  )
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

On Thu, 23 Nov 2023 at 17:19, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 23/11/2023 17:17, Neil Armstrong wrote:
> > Add MIPI ISP power domain ID to the G12A Power domains bindings header
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >   include/dt-bindings/power/meson-g12a-power.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
> > index 44ec0c50e340..01fd0ac4dd08 100644
> > --- a/include/dt-bindings/power/meson-g12a-power.h
> > +++ b/include/dt-bindings/power/meson-g12a-power.h
> > @@ -10,5 +10,6 @@
> >   #define PWRC_G12A_VPU_ID            0
> >   #define PWRC_G12A_ETH_ID            1
> >   #define PWRC_G12A_NNA_ID            2
> > +#define PWRC_G12A_ISP_ID             3
> >
> >   #endif
> >
>
> I forgot:
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> If needed I can send a v4 with those added...

No problem, I will add the tags when applying.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
