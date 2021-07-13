Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6AFC07E96
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 14:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142B861288
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 14:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142B861288
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIwyxt/i3zAFJmVpWdtfHNzVhKsrXpxMLdHu+FDauiI=; b=jZ2MNby+Cy4t4c
	N9VZQs38VywIC+E0JiNayq8fJwOnGCC0H1ht1YJW8GMbIkAu/XmqO0bM+HIQTxSV9S13zN+wn/jI4
	u1/eicBLmrQwun7L/gGBmecKwFw+OheBNwfYJ9zvWTiOSfqtf53QQiJE6S6fOreXhacrruPP4QSwg
	tBvZrDQY1k/hJCfMDx1Dm89EoJ2pErkM/lSYjTY1PMbYZ1C/vonZhNoJaWhVy/PrzvX5chAVR33CM
	qcmQNpb7Jmq6e/p/pgXCVSa09D4pFJqoyKS3lLJ+SexwtVNABvWsj6xXse2mx4iJXy3MU9s+6y2Zf
	/rue2sl8IIO1B9sa4HQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Jnb-00Aj2L-PF; Tue, 13 Jul 2021 14:54:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3JnO-00Aj08-U4; Tue, 13 Jul 2021 14:54:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id ec55so8683162edb.1;
 Tue, 13 Jul 2021 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4EB4Sx0jgByYWBwXJvCykjKMntXAwLAnZkvJwOEWdQ=;
 b=PbpZ3Zv91l1nzaxTFRSV5RCJ0UZMnXDJxa7hn7u6BRCxqTWqxI1G5Wbm4zKEbjuE7z
 iawq7JjeMNb1OFc6OruibX/GHRxgi/g2AYwfm4zJOHYzqwu2eSJueMn8m5Uzm93nnU17
 zbZDQPLsczXsJgDb5p2GMM+nUH2P2Yevrj3e+VpaJFuv3Z3kmqACJWiwpO82DrBzOpCV
 TVqGNW7vrvNHkVFzz3CE+NnjRIEpAsM0tFH6+8SKTDQYIDbwADWNUxopOvA9bF0QDCsQ
 9rAz4uecRNQhkp4obuczNolb95cQ2dDsXpkohzV8YlJ6J5MDeIlTNzvAJsmkMk+djIUx
 Z8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4EB4Sx0jgByYWBwXJvCykjKMntXAwLAnZkvJwOEWdQ=;
 b=kfTpQfcRCYVifYbg3ipYdzW+NFN3rd+RxUKxsVals2O8G28CGynW15Mmlk5GOWj3zi
 w9NfgFw971psVWsVTDdchuvoBa+wpKLY2jMl7rc6pcMj7ImGcC6sRsaofWsZli3tsfVU
 qPYJtPWXVA1wMFo8YLzoiPNuapQImlEG7c6QAA95pcnkyEd2xivCS8QHZe9udkNpQOAT
 cjZb+XfOPXe8YO07vObHRr2IPHbf1iXsolXJhpV6AMx23OQP+9OfEXVnbKQRU+g/ZNQb
 6ug6wZbgTPNMiAIAB81jmLWgHW6pDyoKbt5VlAPIYyNWNH/Iq32q5jpNU6QiMpY3R9kz
 Qzsg==
X-Gm-Message-State: AOAM530k7uz7Fz1uUDaa6qb3sberUgzz0F6ig4c3zP5UR0AmNWFKnL6w
 +G1/Kfa9/zEqXftJBLSwPb+amtv9R0ec9ruD07o=
X-Google-Smtp-Source: ABdhPJzUeWoIkovQmYJqOXz7yl/cm5RYe1xqlUrLVUZ7bM0bvpjRJVHK5xYFlMvPgUzLU8YuBHGHvNsLzh3G+R69Sgk=
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr6327253eds.40.1626188040412; 
 Tue, 13 Jul 2021 07:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
 <20210712201732.31808-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210712201732.31808-2-viktor.prutyanov@phystech.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Jul 2021 16:53:49 +0200
Message-ID: <CAFBinCBF6BH4LCJB0EQXdwMsmFOryH+1Y+JpcRY6BzG6hX0VWw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: rc: meson-ir-tx: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_075403_045211_DE698EB0 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Viktor,

On Mon, Jul 12, 2021 at 10:17 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
[...]
> +  max-fifo-level:
> +    maxItems: 1
> +    description:
> +      Maximum IR TX FIFO fill level
From Documentation/devicetree/bindings/writing-bindings.rst:
"DO use a vendor prefix on device specific property names. Consider if
properties could be common among devices of the same class. Check
other existing bindings for similar devices."
I am not sure if there's a "common" fifo size property for IR
transmitters though.

Also in general I think it's good to write the schema for properties
in a way so the binding validation can detect issues.
For "common" properties (like clocks, interrupts, etc.) this is
inherited by default
However, for custom properties this needs to be defined manually.
For this property I would add:
  $ref: /schemas/types.yaml#/definitions/uint32
(I think this can replace maxItems)
And I would define the allowed value, from what I have seen in the
vendor driver (which I am not sure about though!) that would be:
  const: 1024


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
