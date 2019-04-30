Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C6EC43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3611E2087B
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fJTJwzeT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tYmHnixE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3611E2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad6MYYhpTL6HkCc5U5dciOhpy/qi6apcziQw7l/ocEw=; b=fJTJwzeT6kWCTU
	BTJ8dFBCdYzQYW7pLH9nKC04rZaBrGW5s5UNeuco5aWHKzKPXcze8Ik3hSaq9GnGDv0zEH0vCTest
	IkmNzc2d/8rZh8gj0lF6h15Kwcgb/CVERmq70MUM7azCe3iLvkhFup9sOlC7UyR5FtLrASrZg48zK
	yRrQHIlLENbp5DhJl1C7R7u7utplC8HErnPNnCB6ma65mWd8sCjoKNlmUso3TOYjc87qPWaHPxcGL
	UIX8SmNkBcz71ZugLjKoEyWL46kcNcQgxbwvR+yeDquIT/H7HQxUdhBQplzfFlgbOZTkXCH48zpgV
	IGMjyq5xZ1VX7OeL2/Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLZMk-0002PI-2I; Tue, 30 Apr 2019 20:28:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLZMg-0002Nj-LG
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 20:28:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so2768965wrr.13
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Apr 2019 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=6BX6/WUNOoSiFLmAFQqGnF6/PRbz+EhjmT+iJ67/mUY=;
 b=tYmHnixEDXEt2SAOXn0QJ2Vj/azLQQUXwgXGIkZmZNXwc0/pdtI/uQl2yIUyLmh94g
 1NR4t88UJ5eNIR58MgE8GCkz4Nkf4+F8vSMhl5t/ePlHWPTxEmeDrz5LzTyPnFPOGwbI
 fn3HB0SlYx2JPz/gcR+/lxXMP6XAE67l5/sPgAmDCS5Cx/JT8rDzInP37Ay7rfK8o8nL
 8vCnP3C/8PAY3BhSAMyyLCXVDFXH5YQUII8ULcpyo89oUOiEHag/FhFBUIOVqkK42Job
 Mq+DeFKSFStprkJWPSDyOXehOIeanq9S5z8s7sCM6T4Ik286C0qudiAxbMEBRwU61Cg4
 AHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6BX6/WUNOoSiFLmAFQqGnF6/PRbz+EhjmT+iJ67/mUY=;
 b=OlRM0AQk9xhwuObJttSerV9nqRrHqFuCrEi4+NudaBrQsSksHLhHSzTH1JBbvHIgN1
 637dkEsMmGoJPurF/ZWixcKydZ8cpj8VqWituFTE9A7dfoMfNFldwJq0QB+N4XMLcjp+
 m1Qq4KXyz/yZO3Sx8bm5uQsULvlIHavNNpCl2kF4Nq0IR8ci8vB776rZvZMORcL1gYaS
 C/rHrLlwY4x6bMR8T50jNMfNgqE2V1X3jIAEJ8fCdUEk9pujEF9N/WP4Do4bGZ2Ca8TK
 NgPPTZ+HlaYhqoxTlIQTFKolbTWuEMORwsn5CRpaM28SxXibljgpeuExgoe5zQ6bxxDJ
 OTbA==
X-Gm-Message-State: APjAAAVy3Jm5BP/jbMEi9dHfux4ChQjUWrBCgUsijYKoudli3K1sTlyr
 XZ/JUPytzk4Jf2ZxE40l/UupWw==
X-Google-Smtp-Source: APXvYqz2S/xfszL0oWRG5GwXUJqfH6R2Vhb5FSkaVEgWr59FELVaoP/P20oTjWxy+aom60m3VdZUeg==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr7146640wrx.193.1556656112020; 
 Tue, 30 Apr 2019 13:28:32 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id o5sm3076191wmc.16.2019.04.30.13.28.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Apr 2019 13:28:31 -0700 (PDT)
Message-ID: <0bd1e9c25ab11112c9f2913c2cb3483e8802099d.camel@baylibre.com>
Subject: Re: [PATCH v2 4/7] mmc: meson-gx: disable HS400
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 Apr 2019 22:28:27 +0200
In-Reply-To: <CAFBinCBpujeLJHr0x9DxqLtRiLt0WLkkOoKcJuh3baWeg_bFeA@mail.gmail.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-5-jbrunet@baylibre.com>
 <CAFBinCCf8fkBPR5aoPMensjhYKpan_UzG+HCEB5yNaYs+mB8OA@mail.gmail.com>
 <17c5978419c8778eb1f2c2a6e2aee66e864ac53d.camel@baylibre.com>
 <CAFBinCCus5T7LvH7aTMYmc5gKoFkZFR-MCMGK8bSV_eAsu9Svw@mail.gmail.com>
 <936229765eac2bcdacf9a53925bb17c38ea18e3a.camel@baylibre.com>
 <CAFBinCBpujeLJHr0x9DxqLtRiLt0WLkkOoKcJuh3baWeg_bFeA@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_132834_791953_59617438 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-04-30 at 22:02 +0200, Martin Blumenstingl wrote:
> > Thanks for effort but all this just maintain the blur around HS400 on amlogic.
> > 
> > Let me rephrase it:
> > Tuning (phase or resampling) is meant to compensate the clock round trip in UHS
> > and HS200 modes. In HS400, this should be taken care of by the data strobe.
> > But we have not been to enable this reliably enable this on amlogic chipset ...
> I wasn't aware of this: so far I assumed that we're not setting the
> phase correctly, end of the story.
> thank you again for taking your time to explain this!

No worries. There is the MMC in general, I think I understand it a bit now but 
I might still be mistaken about some stuff. Then there is the HW we have and the
related black magic.

I doubt this is the last update in this driver ...

> 
> > ... and I believe we are back to the original commit message.
> no need to update the description just to explain how HS400 works in
> general, so feel free to use my:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
