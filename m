Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B3CC05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Feb 2023 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BE0+Z8cTBGhkmwQb5g38HECR1Av7t4+0wpIuR+d1XJ4=; b=o9tVkvRsVvEG2O
	kqbbyAa+UpqVlNJNqE0YBTwPQXc0V1o15pB/dNSuwkScR/COrNLTEqbSbZtcPUtGZrleADCky8Jhk
	rPU+Z9adn4B+65kpeXA7YEwOH/Dkj7p9fABLWdRQrOhDtFaoqI0cnwfgraul0DGB//HqZYYbMm0GI
	9yXNEaEzxmHO6P5t5lpdOoGM+UKe5qhJjSsxM3dLLJLpsJYfq/ElnVHzb6IIh208zs//IFNyFUSHM
	lqrjNzFFHCfo8CHLeTc2sAYUtZy9k19y1s9r0iOj110ENdVtblrjv6A5C69YM/yLs8GqBxWl18PfI
	pNViXeGwRAbwXPRR0z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU243-003QaX-0w; Mon, 20 Feb 2023 09:02:27 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU23d-003QQJ-6q; Mon, 20 Feb 2023 09:02:04 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pU238-00DIgA-6n; Mon, 20 Feb 2023 17:01:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 20 Feb 2023 17:01:30 +0800
Date: Mon, 20 Feb 2023 17:01:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
Message-ID: <Y/M26lBXwIUCIGVc@gondor.apana.org.au>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
 <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
 <Y/L6E+7SmLha7Bp8@gondor.apana.org.au>
 <426a526b-cd55-0bd0-1ab9-623832ef7417@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <426a526b-cd55-0bd0-1ab9-623832ef7417@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_010201_579786_57EDFA80 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 20, 2023 at 08:18:18AM +0100, Heiner Kallweit wrote:
>
> OK, then let's omit patches 4 and 5.
> Patches 1-3 have a Reviewed-by, can you apply them as-is or do
> you need a resubmit of the series with patch 1-3 only?

Sure, no problems.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
