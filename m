Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D96C3A59D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA9D22D6D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3qwCQBe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="P2NLC74e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA9D22D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9C8HDwFT058hhq5R5dTZoUwEcHr9tfj22SBPwSGiuk=; b=j3qwCQBeIlUXxr
	LHqzm6qFdxtVtsXiySY/1XQPNwNVuC0poiv3EjG8SyGp4XTTumi8xsYxz3zzqjvWzJoeIDNXDBVQu
	pkiaXXkUSTZGv8UJCVkIz3F2rZBJ0TqjSMRczL+DHTVxWDjrm6F7FxUIaP983aWY01Nd/IqPkzmwd
	iRe898t27kb3BaEA0xsnO2yVx2pnLhB74W6j9NkJFW7zqEPfi1adI3Ja6lbKRoMKYA98tU8KLu5qW
	q/LmwQ8ddEkCQlTsQer1egfBwJ5OEgJoh52JjcK4KbxJsiJx/cagS9wFQFn+xYSR8xA2tHmyZXRGd
	8Dk9xNyNvV+YhUaq33Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Aa2-0007UD-Uu; Tue, 20 Aug 2019 20:18:10 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AZs-0007IV-V1; Tue, 20 Aug 2019 20:18:02 +0000
Received: by mail-oi1-x244.google.com with SMTP id q10so5144269oij.0;
 Tue, 20 Aug 2019 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Do7rgk/e6SkhLJFZ//u+bS6ASixL3x/VgaGx7XQsINQ=;
 b=P2NLC74e2Xs4De0rALlzIE89sgPJa7ppZiJEI9MWLGs0qL2LH2HICwhHdHB3ZKksYB
 rB6zdVMTZjDHASjONz8yzVN77nDdxdKc68tT0WSOQFhMIuG2OB2yUqpPpz+QNIuAdSLl
 ZW3vPXRtqZMk2lcw3bykA/IjHi/b1+p78uzKpcFWqHMXLEz+JiumEsaUigTCdHzW6mZY
 qo557pm2wEkp3Cc/LqJpTnXLEFXbAv186VF1dX+wtWCOh+QjUTdZ41a5jsY9JttG/NdV
 1HJs7dGhKckeqyro77ZmRwnT3C911pJxRwMUir9fM1+tFMWjaoOhXStFjjuh6RkVduln
 JN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Do7rgk/e6SkhLJFZ//u+bS6ASixL3x/VgaGx7XQsINQ=;
 b=Q9EY49ng1SKrswymuMfmYWIKD4mTNsWU1OXf6/RIwPH9NNJouT/fNw84XlHkaR51FI
 YRl3zNMTwlH62/E8cIoiLfInBlvt50ATABKi0MHFwpmDIAnydIEjGDiNPvW5odAZvXp3
 G9BIz6kQusuj/WDt6xhOQ9e/jkFsanZGKJNakEppkci2gy7K+OdClW9/7hKJmSSATFMT
 dTqcbBOQh0DS5YzsvxqPT4yckz84VykEU+XFZdbVj4hZ6RvhD/668LL0ice2tAlDH7Pb
 jSdChfvibvWDnmiBUgRAWLujpTazhTxdA8RczkwKKHQJypBqa8mXQRGXX2kdYj150SHs
 dWyw==
X-Gm-Message-State: APjAAAXVrHLGM6e6rkgbpDCrORap+ngRDb9BpuD57lAWkvHH5CIhafnn
 xDpzJJ6ap1IYhnObXOYhruCjYQn/cf8jXxjGVGw=
X-Google-Smtp-Source: APXvYqz8QBrUZytquR+jcvW5t0XCKEchKH1yCSzPctu/Wl30VX0pR70g4FhY1GPwzBppfd5C5vdN/whftMemITke8kg=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr1332830oij.15.1566332279621; 
 Tue, 20 Aug 2019 13:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190820075742.14857-1-narmstrong@baylibre.com>
 <20190820075742.14857-2-narmstrong@baylibre.com>
In-Reply-To: <20190820075742.14857-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:17:48 +0200
Message-ID: <CAFBinCDP898fhoqh8wApfrsqAuv1dEQSoxy0yDA2hHKxoFsr+g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: snps, dwmac: update reg
 minItems maxItems
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_131801_039483_A01F5921 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 9:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
> glue registers, thus update the reg minItems/maxItems to allow more
> than a single reg cell.
>
> Also update the allwinner,sun7i-a20-gmac.yaml derivative schema to specify
> maxItems to 1.
this looks good to me because:
- allwinner,sun7i-a20-gmac.yaml now restricts reg to maxItems 1
- allwinner,sun8i-a83t-emac.yaml already restricts reg to maxItems 1
- amlogic,meson-dwmac.yaml (introduced in patch 2 from this series)
will need maxItems 2
- (these are all yaml based schemas for DWMAC IP)

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
