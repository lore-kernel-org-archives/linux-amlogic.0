Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245C6C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27D9206C1
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkmwGwxF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bQDs8KX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27D9206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXZESQZSARwAC2xRMYOoH4TXouo/CSrrpT+/YEUxtkY=; b=SkmwGwxFN7LUjX
	eLMpypPYcqxPjb3CVYdqkrHMavFG7ncmFCzUHIHFmrTTWcVZ5ypdKEA7xdw0Ho2W42Dxppv7O5fQI
	sXWRM5/qsQWXxrkb5QQSHTpoidSwT8Tupon+AA5A+WHFsiOAkHUrYwLCG7oiNhIrTMobtJRskoalg
	CV5ylQYN/4qhpL1z8UCeEBlYyyiiFsppEjlDOPX0rnLvNpvPbGIcIoI/rWsss4uSBry3Qt6ngwKnv
	L7mB5St0U4g5m7NkXPTbr9jSezAx7c1XhwBV/WXBlvJVOOrjG+MSZvv8vrnske1OpYoISRrPxlK3P
	3iJJPUqaEyg2/Ets8xiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTpz-0002P0-OO; Sat, 27 Apr 2019 20:22:19 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTpx-0002Oc-5X; Sat, 27 Apr 2019 20:22:18 +0000
Received: by mail-oi1-x243.google.com with SMTP id t70so12610oif.5;
 Sat, 27 Apr 2019 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6qCTU447E+GH+ZEsRVkg8uU1ixXBH4ZBCI8kFJ0apk=;
 b=bQDs8KX83mjqeAXYeg4iUYNRuabnlNAd08eHnFUOQ4AhdGC7wAekyyuWwBABzzo7Wv
 GfluAUlBgNKirtqWSfsG9xUPGks0oUuZbwwzK5S7jB6R/0ca1/82S6kPzdbQ5UimvfzP
 ty6j0mVf7n+Dv+2En4CGjKHxvgPkPtEfcfW4Hkd2HXhAHQHrcHjK8vTx41krK95l6EEy
 M/v5QE+R71AVZxL//DA3Bx546S4gxPUuqjVJUIrabHeO92/hBRv1pLNyjCh1Rj/Ibivo
 +E4SsymcFCorizPgUDSQqpL+TfxOE3bAXAfwLUx8NiKRzpH0Dp4fcfFSV05bPOtLhEK7
 2FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6qCTU447E+GH+ZEsRVkg8uU1ixXBH4ZBCI8kFJ0apk=;
 b=aSMOw9TKeVeUwcyzQ5RpbFeF7OldirsASGa0pIwdGkjcr2v72vcujirqw7dc0krLKk
 kwAO12gqhvw3gUeAjPhsuckBxhCAPX0ktHfQaphMbmEveQj4YTAbYiBjEjsi2PB5TCzr
 Z6U8LRXuatpc3kNNyx8627YI9mbYKdDbmUubGgWokMUxW69PGj6ZTaccpTfLCTV6ympU
 Ck/ghfnzxgJPXWHHrhkeEjbi5YoGN9y4axa4z6WXi3gzKSuVKHpnRlDfP1DCivvDsXA4
 Y3p1Z5z79FJjZur+c0DpkjjieDSnSHtn6SC4tymgLOUfhuuH/VzGhTnp2Qql114uCWQ3
 3+nA==
X-Gm-Message-State: APjAAAUI9kPzsNG3GSx8Q4tHcUu/jIIjdg6/U2h3m0XNP+RIzUvEmUlc
 kIwdmuFw6BYas+Cj+E7Y38vboNO3+RyHixFKkIg=
X-Google-Smtp-Source: APXvYqxtbDt+c3ni9QrEfFfA/TGXkyJbzrtK2r6bmsseXH9+Ux/3nW9LnS5Zoy+n/Q5hAeAy2Afl98S0tgJTO28uQzw=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr10615717oib.129.1556396536284; 
 Sat, 27 Apr 2019 13:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-5-narmstrong@baylibre.com>
In-Reply-To: <20190423091503.10847-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:22:05 +0200
Message-ID: <CAFBinCA7qCmVcz_brXfJ4aiw6ZHvEJ_duhjtEH+znJ3zmL_mmg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: arm: amlogic: add G12B bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132217_209274_0CAACD6B 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add compatible for the Amlogic G12B SoC, sharing most of the
> features and architecture with the G12A SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
