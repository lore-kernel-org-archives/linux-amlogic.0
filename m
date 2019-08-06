Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F18C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB8C205C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVvLt7lD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FWZMw5rM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB8C205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iO4dNExXi6l7dSriPJEY6gI4Zi+3l3P+OuB6lFqBPHM=; b=uVvLt7lD5wt9qB
	RGyoTNGDIeu9fWhhjfIBGQnv7ehjdlrzdO4X1EbUYNaRgMybxbYjGOgPdljvm/EzjspdZfrWzvhQn
	NgiXzECt8MZ8bzD0pnprfJNrcdw5U9dnIHulq6dpfQdgyU2Fs90Pg6F3KJT/nGGNpTcFSP9bnOn06
	qgXpS+tYEG/q3ddjagaAObHsr0pOL3VufdxnzfNMqDH4DdriimEktRZwi6bjBIsB+IDFDDSePGXA0
	iFQeU7fTbz/SIveUlqH+XCvyrj4EPmWd83VCpfn926FYVNaVXpDG86bw6RS6uupz4Egof6rNfRSFp
	jTCxBuvkE2TkBb3dmeww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv4rr-0003WJ-7D; Tue, 06 Aug 2019 19:11:31 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv4ro-0003VU-FA; Tue, 06 Aug 2019 19:11:29 +0000
Received: by mail-ot1-x344.google.com with SMTP id j11so37941471otp.10;
 Tue, 06 Aug 2019 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csIIqB/IrDwLxPl2lYtUj9WD1Dt8I4kBPcjCQJ1GYDk=;
 b=FWZMw5rM9Sew425w6LoMV3JWYdZyFv45J6PeYPnLCESmUr1QSJ/KR+lmQdvj/ptwJE
 sGELprR/Q+lDFpDt5J8rRhPinv219RUzLN0fZ3YwLVZDSaLeVZjDam/znyeMBKqhDAq0
 IukAZZtnHks9qtfY0F9F9K+IqHL/j2xFQJdjg5z+oIOT2DHrXwPxeco1KLXMmnP8s4NV
 MXMUKdhOZ/addouKfHxBqR3/sbEWBUEflVVYRukqnLtVU5Ecjwp12d2QMoWAK5D6wsXi
 XNBnILgzzY1Rcln3VdrWhNhmpIikpvYE604u7ni6rgELv1JSA+fiWLHQL3dk4yYXsce0
 hjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csIIqB/IrDwLxPl2lYtUj9WD1Dt8I4kBPcjCQJ1GYDk=;
 b=Qwc2FUglkZvp7facnSkSdUqKlvHuVoQJnYxgTdQ0fvf6CfqeYusQ2pyRi9zerGbCnN
 7qcbzjaZqih0wQoy5rmZEN5qY9NvwPD0WxK5EgIKzttinrGvTD4HU2Yy+ghbWW2Q4KFn
 pNI3kCsMb5hgrQz8iJi3W3ISVA90IzPyKzzEdjb3wTCLhsIyTz8N8Cinpht61vRLf+73
 qox5T/VK0TxvK3QXmkYatlPAQF7CwBAfHAU5zIq7BUstRQ33STk1kxTFUaDuyTpGfBzq
 PBXnRHuM+/reGjzteKEKg6+VFIz02ehc+Q4zKq3V4cpdrhqmFIchFVgF0+7IYNVpq1VE
 cNjg==
X-Gm-Message-State: APjAAAUYqSQV+ioWAy6mjABfVz3YY+k+m3CwZv2LxG5mjRaBgqMvGbUA
 KaWUfsWdIsQNMhf4qbtcB3LGpn+UCmw9TW94jrE=
X-Google-Smtp-Source: APXvYqwoRzmwN8s0WXpLys3Q35DBxnwW1evWctYoRF/gKNCVFoMTOKHWiSrEdkwTXUkFaAgXbhANT451Z5mIAbm1IxY=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr4093932ota.42.1565118686396; 
 Tue, 06 Aug 2019 12:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190806125041.16105-1-narmstrong@baylibre.com>
 <20190806125041.16105-3-narmstrong@baylibre.com>
In-Reply-To: <20190806125041.16105-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:11:15 +0200
Message-ID: <CAFBinCCw8sZnmWcHMtEGBrEGqok=3N0qBEaPBZ7_ixLFFtGnGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: meson-dwmac: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_121128_530119_18E8032E 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 2:50 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
thank you for taking care of this conversion!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +        amlogic,tx-delay-ns:
> +          $ref: /schemas/types.yaml#definitions/uint32
> +          description:
> +            The internal RGMII TX clock delay (provided by this driver) in
> +            nanoseconds. Allowed values are 0ns, 2ns, 4ns, 6ns.
once I have more time I will try to see whether we can define an enum
with these values, then invalid values will yield a warning/error when
building the .dtb (which seems to be a good idea)
this comment shouldn't prevent this patch from being applied as the
initial conversion will already make life a lot easier


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
