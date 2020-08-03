Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94E4C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 10:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7B12076B
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 10:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuaAp+8N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="Tmf5bk3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB7B12076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KbnVQ4U4R9N8Eo1MaGiYOxEwfXvSI/0V0R7W4mlDviw=; b=TuaAp+8NMja/6bbtVl0jBvfk4
	mAmEiz2i1yw0TcAwRgkk2eib+0wEOkBKPGbn3UhWy1iIPxI8F6RqilxGcxbjmqVw0+2lV5Zlp0ofP
	PG3Lva9YbHVLAC3B4WKBSvk67Tm9dwZfTXKFg5kF+OHbQ2jtV1We+aqL1rD/bMz4jSD+oc1DGHNmL
	hPWu9/J/Q/d9k4YqefO1+2uv4D9Qkd4AbFYhtGDCMt5lT65xEfYJmI+c4bKGzcvH7REjsjbFM38K9
	Z6URjdwymRcPrBq83kG/OQdnl4dbPihrVrXuNBTiSBF9FoA1jtpkkOSb/HkMaB8y8PiOuFXhxI9tX
	Pjb/BdFWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Xov-0001ZT-22; Mon, 03 Aug 2020 10:35:53 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Xor-0001Yw-WD
 for linux-amlogic@lists.infradead.org; Mon, 03 Aug 2020 10:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596450944;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=t1ANuzu9hbGFzPXIEXz8SJSfuIqBra8EUQdOPeq1B3w=;
 b=Tmf5bk3g145hC1a+NLLVN5ocZm3mOn6G95wMck0IdOMdQ6ruKfAo4KvMIA8QuoEcSo
 KU5oPcwefr9ksS59V5mem4AnWusDhJk/jngWFyyhw1wf2k01Gvbhu8iacTlzxQv981IX
 yl0hpdNdfLNEU9YTfeEJaB6+qOZPGu1/ZbFseCNYWgo7PTwKSK65uubfXJ5OY1ZDzTxr
 c34PuEQH6ESql7qvJXj6II9/lb0+g2LjVfDKjG2xusqQnZvHP5B87yUUowFZRhSS5sK2
 cxdI2mHZ0W8nIgtahVe/0b+JRqBziyIRIEPaLpKwd9no5AyOkqtiASy8NH9lf7zGbWZc
 atUQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcrHBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew73AZgyYI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 12:35:42 +0200 (CEST)
Date: Mon, 3 Aug 2020 12:35:37 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Message-ID: <20200803103537.GA903@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
 <1j5za02hlr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1j5za02hlr.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_063550_470570_11013F20 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 03, 2020 at 11:39:44AM +0200, Jerome Brunet wrote:
> When you send multiple patches like that, you should a cover-letter
> describing the overall purpose of the patchset, then the patches
> 
> If you look around on the mailing list this cover is usually starting
> with the subject "[PATCH 0/X]"
> 
> Apart from this, the change looks good to me
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Thanks! I usually do that but I thought in this case the first patch is
descriptive enough for the whole series. I would have just repeated the
same in the cover letter.

Stephan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
