Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387CCC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 17:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070002186A
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 17:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFL++rHx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="upzMdkBn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070002186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJcIeHIJks3VvLraeuF0DlHeprDNx1Qz/0naiYo3V7I=; b=nFL++rHxHEWCaU
	KEHpADmwCRySxWlpXbpOUynnfO1CDx6VWxWOBCzPRAm1zxLNZnok96VH+ASTvSWSVlUOhXywB/zEU
	QhXemoSBujTVwHu0fSaZSpk2WHvUFlrUnJbvbDubG86QAcG8W10Yp6l66jfJKwJ+07eUBWqLiy4OP
	gWqPeyF1mhDNglkieURxRFaLul0UwWcdDDprXCJj/rlSfFnGS2NeR5wF022LaiW2uE+heCUo71sCh
	s/eRtViLDryxGi3ofsu/HQtti151Q+CoYxUVQla+FBic8wsT3zcjM0c/zR0Boj+5KXm/FeiFneWdx
	ppEVeNEpcVRZ2i+EW8FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5Ci8-0004xb-6O; Sat, 16 Mar 2019 17:03:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5Ci1-0004qM-9z
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 17:03:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id w2so12641281wrt.11
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=5sBiQxs7mw52OinugVuABSDctfMF/antra9v6/jEZWU=;
 b=upzMdkBngZcSKdu0T9u3vHgRJEjrCde762PELuScejpV77aaF8FubYThBix/2ejR2d
 KartoA+ezftB8zoz0deXdyXBNjJUeusgO0MkUxkNF/xVzkmxK3EG9fqfIF5XJjz0SQbq
 1uAKQuIOhGai7yFnGw3RqxTICOW8HQct/t7zmjv3t/xYmXQ/1PdNQjt1Nlnr4uIEqZHq
 YQR+UcQcOKbYdoxnL16Db0xh4PSIgDIStZPcCxE7IzFHfSHEfKMPoKvpHZ7Wz2nXmns8
 S8eZv/HBMltGfcUgSBikpk3dc74kPjOehJvKeSNwAVlKp63gTENhjRW/nSeXC1PgUpaQ
 Ysog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=5sBiQxs7mw52OinugVuABSDctfMF/antra9v6/jEZWU=;
 b=QH+gg76IX5Eups/V8eLTqOap2Co/KaHMoCiVC9a0GZPXS66JHwdrJG58CvNAN1nl6e
 a158BxZHdYUxU8dG+Y/9D4iKFJ3vK1ESODCgsqY8fu231OgWAFZEv+8Sm7iBjV/FqAEN
 StDqZE7Odm1di7h1RMXcx0TeO3AJcvpcsPWSyLDmlPQdM6JdRl8qYsOLPXWfL9iRY0Qu
 fwxKJzvfbxKpTi/IwgIKFlmpSiagbAm+Uj50nItuutD6KFLesCeY8HPiBePA2iK6+LoW
 Qeu1sNnKXzqw+7mkqsvK930llml6hbsNm9GFxpdsb2FkRr99Rk9f+TaEqrh5o39JrYNz
 7a4A==
X-Gm-Message-State: APjAAAXPVh8uEXlmazcfDFDAtQDzlrxI2vEpXq+Cn9Ye4qFGq6wvMk1E
 qaA1ls5cQCd+/n/hmwjQHkvQfw==
X-Google-Smtp-Source: APXvYqzbA7SPteuQxvyGj163oQuyEF7+9MIsEAkEDX03l3XEOiUpGGjjowZZgLGZpdUe+hoEo4I/xQ==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr6100928wrt.210.1552755769978; 
 Sat, 16 Mar 2019 10:02:49 -0700 (PDT)
Received: from boomer.baylibre.com (uluru.liltaz.com. [163.172.81.188])
 by smtp.gmail.com with ESMTPSA id d10sm14038501wrh.83.2019.03.16.10.02.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 16 Mar 2019 10:02:49 -0700 (PDT)
Message-ID: <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 16 Mar 2019 18:02:45 +0100
In-Reply-To: <20190316025448.GD29548@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
 <20190316025448.GD29548@lunn.ch>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_100258_257657_2D1761D8 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-03-16 at 03:54 +0100, Andrew Lunn wrote:
> On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> > > +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
> 
> You would generally use the _ prefix when you have a locked and an
> unlocked version. I don't see anything like this here. So please drop
> the _ .
> 

will do

> Nice to see the generic clock framework being used. I just wonder if
> this is the correct place to have this clock code. Can it be made part
> of the SoC clock code?

the PLL is local to this particular device.

In 'Soc clock code' (driver/clk/meson in this case) we usually put clock
controllers. Those controllers feeds the different devices of the SoC but we
tends some more clock elements in the consumer device

Usually, it is just a few mux, dividers and gates (like in
drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c) but in this case, we have
a PLL. IMO, it belongs here. Do you see a problem with this ?

Jerome

> 
>     Andrew



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
