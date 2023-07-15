Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00462C001DC
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTBuGnVKcgI4LPL3xt7qYoWwY4EYBur03XoDzWnwZJ8=; b=hvMTqOaY1tTX2X
	AsRTVWMIhhGK+aw4HPlYl6tcFKwmnzD/4AOzRy+HY1FxPwoCek1tNZGY1/Vo00CaBijvxN4yLQZHm
	MLHt3qDUYNrkb+2omv5o4eV+uAiAiw0fVX02+NkCwwXay0PrEkLXwJv1ZBVrQKdFXPmdh7YhkO29D
	3Uk08tRmsMaFmFPYg770KiCtrlbG7iAzxlRVTYdkjk5VRQODQ2EGJnFulkbDcTTM9C/xwaNpC2TEa
	p0e+y6W3eWE5PgJMx3sxBNifTAbpcvtW2QLl80ySsnQCehMW+HpHIv2vSesTqReAVPK/4KCRtxjIU
	CiyVWkVN91ekxpDcjQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjWC-009GS4-0V;
	Sat, 15 Jul 2023 17:57:20 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjW9-009GQJ-1Q
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Jul 2023 17:57:18 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-57012b2973eso29289217b3.2
        for <linux-amlogic@lists.infradead.org>; Sat, 15 Jul 2023 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=hXFWx/7V2ilUSpF3voEEHL3miMi68ZScjxXTYKsraLjLXai5wQQF4WPMOEwKknT73Z
         TosQJPQ0jcS9mV4PZ/Hrjat87xHfW1QZJJvKse42oBPzZB+EGbp2N3i5id7JTxjUsgtN
         WDL0fBXFgAJ7IwzYFb0eaIrxQI4wqfHa1Tk5UXF4g6QhSgtnbN6HAd5LXyrsoH093BeZ
         dnzHSgUdn7weBlTbCB7MsfNkTRHFyDdDqy3vayXALCvXkwp2xHLINAeKis0MHStT3gGB
         zSRQipZgpEoUedpY9iX8KSuraRlyBWdrTzGFZ/p6RBKPRCTekMb8kbzZG2seChNlsEGP
         QXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=kg97fTaPij6D4pt6CrXKUkZ/TMmApKA9K0TPynVVWF7zgqkpG8/zuneQW/O6gseyoH
         aCNipv7x98aZZTfvDuIEYwB6/sywD4ZomlOkKmF3EeeO/IIFZRfHFepEGRWAhHViqZvA
         j24ObDw318JuFDx+U/d7jzr9s4cN8MXBum8qnNHVnbNs33nfEQdIIACfMhaELLhMU5U0
         wPOjNn/fVbc1C39FsL3nfBlTyt3RMS5e39vNNuCFU35HknJTtupX01+6K5IjyTu0DH32
         IIsfDrr2mXNC1pdlAwRZuBckUz+atG2kcb9IaT3i6123fe4W783VSCQAj+yueVHy0m1z
         Uuzw==
X-Gm-Message-State: ABy/qLajATDHZv0AuPZ/Dc843KqP0oN1ui75l9DwrP9mkDQ0RpkVaZgx
	hgc2y3iT5FL2AvvQfttwrtIRMDeHaYu+OBScPchAuQ==
X-Google-Smtp-Source: APBJJlEOgFSlT/aTEORmFdIMvrXhSvSNS+ivT8OhWO9TBnbzSoXq3K3OfZ5ITuyPBt0YYAqSQP7aCMjSrPWQ6SLmwFM=
X-Received: by 2002:a81:4ec2:0:b0:573:cacd:3b6e with SMTP id
 c185-20020a814ec2000000b00573cacd3b6emr7407493ywb.30.1689443836031; Sat, 15
 Jul 2023 10:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174751.4060439-1-robh@kernel.org>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Jul 2023 19:57:04 +0200
Message-ID: <CACRpkdaxqeZH_SOhmuZ2rhoU73uDVNPmzGFpCEuk636Jb2qMsw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_105717_504217_5E8833BA 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo0OOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiBUaGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0
ZSBiYWNrIHRvIHRoZSBzZXBhcmF0ZQo+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBh
cyBtZXJnZWQgaW50byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4gQXMgcGFydCBvZiB0aGF0
IG1lcmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ICJ0ZW1w
b3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9k
ZXZpY2UuaAo+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBtdWNoIHJh
bmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiByZXBsYWNlIHRoZSBp
bXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8K
PiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3QgaW5jbHVkZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKVGhhbmtzIGZvciBnb2luZyBiYWNr
IGFuZCBmaXhpbmcgdXAgdGhpcyEKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
