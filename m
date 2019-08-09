Return-Path: <SRS0=7uPT=WF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BFBC433FF
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 19:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC58220C01
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 19:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHLHnBrF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rjZGNhdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC58220C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZX2bIv6MDXeVcD0LoPEfSstXavebEf6oWzSRemjzRCM=; b=jHLHnBrFgthL51
	ZStCpfoVA0tm6Df8Pw0BPizG7jiz/l2hY4bNjS8QF5wGGmJqA7aByHDuq92xbLH3BmDi/a/z60o1j
	5514Z5UbgRxpgs/GvY6YPShpNk/LiJxi9OlDOR2KMCXgWLVKFr/PBZk0NxHjroFS4M9n3WzGmpUfY
	gr7ule2xZuBgzB5BKaTzIBWHqdu9AmKXT+/onWbVl4QSoQBO8WSRtCTltfb6ACPtJ4Wts2VtCABZK
	2OEMrdo31A2qQL+WorrV2LlMHSl4mpFO3O4gRdK9+2b3vh0lBdNZZ6SN+jRNdV+mW7hZSeCPPgF7K
	UjWlFKPr+nExRpmXYfpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwAz4-0004Ax-JX; Fri, 09 Aug 2019 19:55:30 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwAz2-00047K-Fv; Fri, 09 Aug 2019 19:55:29 +0000
Received: by mail-ot1-x341.google.com with SMTP id j11so36663634otp.10;
 Fri, 09 Aug 2019 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5RgM5PeUcKR496STO6AkWGhAtd5KnNhCs3hLEyVgLQ=;
 b=rjZGNhdd53P41uJeFy3L2aPLCgR6nvP9AnIBelUUQRi55U2lWW6Xgm1msUkSq6KmrM
 TIadEb+dQfS0abbyV8Qec3FB+S8dJpxcVosOMAkKXgUO7Ke4VPogM8mO5XNNEd3wyLoc
 7eok6qlXt++ohA0BtGignLByuihuqYPGgO48DOvafX01tQr3h9Rlrs07oYSjjEviq89y
 +5MA9Ym7HnBdec4ZdTwhWmi9sResZd/J+17sqhHN5ejPv9J0AU/eu8CW/LwWhzC+aDm0
 axod406VA2x7QEKiWJ1hi3oGKqtHfvY8lsv5TR3ByYgSsxNEWeGEqnhET9S1qrovVPzd
 rUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5RgM5PeUcKR496STO6AkWGhAtd5KnNhCs3hLEyVgLQ=;
 b=LT9iVoAICd4H5ptoM0ecUVZIOvbaK4zUXzJGaw2o9KLrtP1CJ7dBkPTTPXN9Zwk1IR
 GSM4lYGUUbe+1VSFgPOa0ICOpXPMytUmFsbq8gOhxGWNv32oy+gNEZaMWd3M/uOop0Sg
 E/QzI+vG07g1iLG1UfBsyJHJWrFlyCkFPT2B3sknlu7V8sfOEd6cB1vyRFSmZbSf9l4x
 jbnFfQVa4rgmm/S3R8JrlOKRm1B/kJTpsqK6teKZAxnTCGzmjuFgP5kO4ZbV4g+EsUiU
 kN7/6tThBkp4HPfElaokwzp1z7cDI3MHSbnAoN1FCGeNdowaA1OkpeuIWixcs/pGoDan
 UTFw==
X-Gm-Message-State: APjAAAU0shpEeN4MrPNsX1mFUB2l7ZwGWtsxY9nT3H51+K4hiW1A52PH
 2lKgIJFCekvRwWnQZOOAK/cJPQmguzl6RfMFJSw=
X-Google-Smtp-Source: APXvYqz2iUAE9lCz16hjXHExEjubfeLPLLx1yZx3utlS02+GZFq4P0Z52FDXChVD4BmHWDdSnjhIg33whcusluo+pCI=
X-Received: by 2002:aca:5c55:: with SMTP id q82mr7646834oib.15.1565380526824; 
 Fri, 09 Aug 2019 12:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085139.21438-1-narmstrong@baylibre.com>
 <20190808085139.21438-8-narmstrong@baylibre.com>
 <CAFBinCBnVdTxWgqmnrPo-5uZ5gxy7p68w0PUa=_42fYxhVrDXQ@mail.gmail.com>
 <2e6ade0e-175c-e77c-e767-28f4bbfbe575@baylibre.com>
In-Reply-To: <2e6ade0e-175c-e77c-e767-28f4bbfbe575@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Aug 2019 21:55:16 +0200
Message-ID: <CAFBinCC7UGG014D6xt97SZ-WjR=rTLvag7F+DXG6byxaOEFHJg@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_125528_556072_18B03FF1 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, kishon@ti.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 9, 2019 at 9:00 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 08/08/2019 21:50, Martin Blumenstingl wrote:
> > On Thu, Aug 8, 2019 at 10:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Now that we have the DT validation in place, let's convert the device tree
> >> bindings for the Amlogic G12A USB3 + PCIE Combo PHY over to a YAML schemas.
> >>
> >> While the original phy bindings specifies phy-supply as required,
> >> the examples and implementations makes it optional, thus phy-supply
> >> is not present in the properties and required lists.
> > nit-pick: the original bindings didn't mention the phy-supply property at all
> > I'm not sure if you have to re-send it, maybe this can be fixed up
> > while applying?
>
> It didn't, but the phy.txt made it mandatory, but was optional in all examples
> and implementation, thus rob asked me to precise it in the commit log.
sorry, I missed that
my Reviewed-by still stands - thanks for pointing it out (again)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
