Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871E8C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 07:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B5620850
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 07:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehMCa6JE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PtnWG1M/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B5620850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4L+ONGvIqE5djDZAWSkeZX40kZrUBxfR/zgF2c+Jv8=; b=ehMCa6JE2ioXPa
	f5LAlU+MaZHwcZF0jjRVXY6+eEkSlB/Dotcr44npfUwK8EpbcUrHArFzhTiES28Q26uRqdqHk27+g
	vrETCTpzl+FoYpIPK9sXWHyP/EPXwFTW4tO+mGS9wU0e7UGAWScWDvFKBITSHuOsSgudlqS/0AgdT
	jY1U5jcZSTRwbfW2xbutSBUdiK5801RbW5KnQAOoJs0zbNGKZ9P7YrEihkqH2h2nnZM2piBWoj0xu
	uYCupXHks67kYFqIPTrPXhnm+gPYdBtVTy5rTor7/rjdW0mXA+zmZLMcDtoDGPLmV2AbLAsTdGmk2
	R5smFHQfYSQH4rvkC1Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkOxM-000677-Gk; Fri, 18 Jan 2019 07:52:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkOxI-00066j-LK
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 07:52:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id z5so13781473wrt.11
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ECnQqu7jAPepk4pOFbQ7ppC99odVwGio7AcnWsIsiKw=;
 b=PtnWG1M/tMh05ToM5DNQCWQiX/NY/pU3z8b7WbD7A/QMgvlWt8gnKK9Gn0dpp9U0nw
 +x5LCLL3TTnXxv/6g5MXkYinYJVy3NgDCiRtC4yn+t6UmyeCIL12lEy/x0owvinRHBBa
 MMyCWlRarOOF2THULVPuBpGIlyUklQYDJ4vykAUhnstEq51uK5/eeHmpWr2sXbWP7H9b
 3dXcRWnRI1RloQVS2jcmAyFA4o6GOLbW4qXXhMoiTDYBltlpEHHP99qMSkYfkB2Zqpj/
 YoVdHBc6DShFWzo5mBhOTU8cfiwD1YwCXFAbLfJuhtfuAZzhN5FYaaeLZuUTSEzqIdDV
 i/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ECnQqu7jAPepk4pOFbQ7ppC99odVwGio7AcnWsIsiKw=;
 b=tqoyF5iwWSNPhleIWjFiRDu5fKKGdyFl9fToaZLoqIhA9abENHL4PwMf7B6s+9pDLL
 aUsgmULoQEtNd5s9og00EXWBZf9DCMhoUnWZQEWYESGWkOiW6AElf4aXVRojnz/DzAUl
 QidxZR/hToztmlJE8oGE7Ald+ojiBZVADhH/+8b4/CsMWDJ2m7ohPWWnIbMmegJ0aomZ
 kb2zVlXFL/8nSruQ/ueuD9emjSOxOyGOt4xlATkugEMQsN7eZrmqAPVhZhVlnM65mfgX
 KjcI08x5nntC5HVApC56QxW5TVldUtujXXwN8/5N+1RKo3BaT2OSNqZ0yw/RB+2cPQTD
 RHrQ==
X-Gm-Message-State: AJcUukePvboWBOa6dEUPEzf3jccrlfF1sZNV4DrRDC/da4XY/EihCy5m
 QI2y6bXLW178rG1uIXWQpb3MMg==
X-Google-Smtp-Source: ALg8bN4/pp/+yn+KUct+chKHAu1LeXSZ3FnNIgJWVWavHdpouuzhUu9gf/PUmcv+pF+tJld2H4Nwgg==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr14844244wru.226.1547797962285; 
 Thu, 17 Jan 2019 23:52:42 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 o3sm66906272wrs.30.2019.01.17.23.52.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 23:52:41 -0800 (PST)
Message-ID: <8d178ecbf885e25e0eb3e30d652934722fbc5050.camel@baylibre.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson: axg: add clk measure support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 08:52:39 +0100
In-Reply-To: <CAFBinCChyyWaiju6ghaCHBFktTXV6DbtuCgZFjEENrf3t3eOxg@mail.gmail.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
 <20190117164838.8008-4-jbrunet@baylibre.com>
 <CAFBinCChyyWaiju6ghaCHBFktTXV6DbtuCgZFjEENrf3t3eOxg@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_235244_849024_23C12A4D 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 20:57 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Thu, Jan 17, 2019 at 5:48 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Add the clock measure device to the axg SoC family
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > index 0e0abb1a03e2..94ea36a2417a 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > @@ -1611,6 +1611,11 @@
> >                                 status = "disabled";
> >                         };
> > 
> > +                       clk_msr: clock-sensor@18000 {
> in the dt-bindings specify "clock-measure@..."

That's the exemple, not a specification, AFAIK.
I'm not sure I see the problem ?

> this also applies to patch 4/4 from this series


Anyway, The node was not placed correctly in g12, I might as well rename it. I
don't really care

> 
> 
> [0] 
> https://elixir.bootlin.com/linux/v5.0-rc1/source/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
