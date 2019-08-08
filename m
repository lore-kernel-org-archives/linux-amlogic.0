Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D950C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 03:02:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D15921873
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 03:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HeVgf3Vt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VMkDtAtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D15921873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QldcsaUlyBMdtGtIIiAaBbM5fCJXgIASGBwV7+NjQsQ=; b=HeVgf3Vtx7Tqnq
	b9FikU/uLaCsd1mJl7oC+jCGQZu+cn20psNlElYHmsURjaJxZXA6yD5apiP0u/WZeVkm1lv48+AlW
	cyuHUHp3KIESl3JdzShWapdHpKC//lEpHdxnQqk4M6ktQYRWI7FaiHbptj6l4Zlk8xJVTn4pIuMZb
	jUfmUNK+0M+DLWzNLQZaUKyJw/UlI7JkDBXiWAbkT0eZ77KfDOuO5bA8NFDar50haSl8D8XJtwK3r
	EgISmlmm41ksh1MsPnXBgxIhJiMCMq+UgR9NJKo0RNgSGaxykR15upevUdQj+8SONWTgqjC3wzvYG
	TyHX61nuObBKFQGkfRsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvYhL-0005mX-09; Thu, 08 Aug 2019 03:02:39 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvYhH-0005lW-Po
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 03:02:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id b13so43220797pfo.1
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2019 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/Z7L8SyshdubRcyIY95repgYfqLBFE4FKfh7eq8hsWQ=;
 b=VMkDtAtLTGvihLldZdjOKfErDSzMhon6bH5G3BdL+lkNsLL3dhRGrdijMSDj0i4/7d
 I4trJ2cPBcfQ9b3hUyrfivjLrr4sWMt8cYYyyVntaeqVNyAvZ5dxivLyOgVXVvDiPk6c
 jkqX9k20VGWNQKfp3L0eAGSlUB+86FaeW6LxVEayaRqcWTMWv0F3CGeFSxefboLbNnsR
 S1XHjj1FrqZi3qhOfdimenhnFDt052N8RMB9eb8BKX6yHcHBDlefcglRUp7sKokpTRMx
 sd9CmtD2VJcXM8d2+Wd2EqZ/6xbNLNJMIZshGNVOVfMuYEXBx85IGCNog25/90slfPuc
 dtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/Z7L8SyshdubRcyIY95repgYfqLBFE4FKfh7eq8hsWQ=;
 b=ibvBZRPbQlSjEFFXNd09VA5pz+w19jzxHsw/rYeVvZgGfgLKCK+Q5wH3xZgDjLipvn
 8yoUTlc2s/Mz+yEaAeNvpkp+cv3pOTdxN8RYIjeDxNRd4EA55YgXYLfYiofI+IDyIYma
 3ZUCIHU2pRgVlwtisHVIn2eAkutIbQ2A9rAFFkZhMniHVxyQdOZtpLF5GMLN7/DY767K
 fqnkEfTuEa76E412qiGAY7caSzf3GUK94/N13Qj98N+gcccPBVqk1bJXr/io50II//uw
 +17wInYZcJAn2Zht6PadTHgI4cYzPCLgEXUlGg5XLCtqWFvjpLEZswN57Me9ZKU2feEj
 rD9Q==
X-Gm-Message-State: APjAAAXR6b/pY1Z4dEriM4hY/sPL+lIQn2zjo5Q9lw7Ig8YWgSwNOMzX
 ipwq8fHhC727A1GgSwCUWrh15A==
X-Google-Smtp-Source: APXvYqylJQrZTaVlqLyT+6q2Nr1Mjd7x1ZREstnHaNOUKd1r3XvtkoAaiLRMfJ80fzLmRpUIRf0/6A==
X-Received: by 2002:a62:1d8f:: with SMTP id
 d137mr13114157pfd.207.1565233355043; 
 Wed, 07 Aug 2019 20:02:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 q126sm52203296pfb.56.2019.08.07.20.02.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Aug 2019 20:02:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: arm: amlogic: add bindings for G12B
 based S922X SoC
In-Reply-To: <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-3-narmstrong@baylibre.com>
 <7hblx3gua3.fsf@baylibre.com>
 <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
Date: Wed, 07 Aug 2019 20:02:33 -0700
Message-ID: <7h7e7ofjg6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_200235_841986_030A820F 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> On Mon, Aug 5, 2019 at 3:46 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>
>> > Add a specific compatible for the Amlogic G12B family based S922X SoC
>> > to differentiate with the A311D SoC from the same family.
>> >
>> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> > ---
>> >  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> > index 325c6fd3566d..3c3bc806cd23 100644
>> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> > @@ -139,6 +139,7 @@ properties:
>> >          items:
>> >            - enum:
>> >                - hardkernel,odroid-n2
>> > +          - const: amlogic,s922x
>> >            - const: amlogic,g12b
>>
>> nit: in previous binding docs, we were trying to keep these sorted
>> alphabetically.  I'll reorder the new "s922x" after "g12b" when
>> applying.
>
> No, this is not documentation ordering. It's the order compatible
> strings must be in.

Ah, thanks for clarifying,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
