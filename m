Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82A8C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B8E2077B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bw2FM98U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HwsHKR6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B8E2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55ugUnPxok43T5YVimOcd1yDoGe89TydJBJJ4QTTqT4=; b=bw2FM98Uxx4d+r
	nGX3iD8u2N246KorgffkmPFDwAoE4pqlyqsEB6kPfip+Sp/IrylaKtSDLQ4FHtkdJVrh8LkVVqkko
	tucolhXk8iNG1jRqcyrtXqjGeOlePKOyLTrLtmP0yVXb1b4kLj+OUBOObHvljSFL71W+CNdsApvFb
	mWjjf1sGWuokdf1m4W3o5+yWhbkXwPy0llj1pLFnIMxFjUSbnor5ylP57kVhDKPPvjfALh//plo+p
	wElMmkCqQ7srCorpVZxEG7tFg4/HVknklAmfP5x3Oj7fnj7Aiysv8ZoYQ+lJP8YRZArTUNiRZTK02
	tYCyrGTRO18jQJs3aqIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKToo-00022b-SQ; Sat, 27 Apr 2019 20:21:06 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTol-00022B-SO; Sat, 27 Apr 2019 20:21:05 +0000
Received: by mail-ot1-x343.google.com with SMTP id g24so920710otq.2;
 Sat, 27 Apr 2019 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n8Sb3tDJVImkB0zIvqUNX/1u9RCQM+Iqq9MF+QaVX+o=;
 b=HwsHKR6O7oYk6gzDrFLWDWr00L+GargDSoGdxBfjtZOR8CBR3KidRbmiylzrgQHwxm
 MJ/Xnr45lPAcbOQj6p/l1s7U55IPUx5uCo+gRTp9nF41i2vlxKoRreX7EShpj7z8XdfT
 34nursl4YBNh16tgdb34l83xRQUqmbdHPQNWUT6KkR2dUApVNTTpDTyWyJWOgOY8iEYy
 ervKIWZ3WRu3RlaPDfOmm9PSmP8uLy/r2PGgoX59NyeuVL9o3pHSknvkeinla7xsj9HH
 PMHwMEfIrc/s1zTmgDbsr0gCJKnFHRb25iDYU0rdM4zutJgNNYX3J94RY87mHWKdSCb7
 7zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8Sb3tDJVImkB0zIvqUNX/1u9RCQM+Iqq9MF+QaVX+o=;
 b=NlaoVfYsn2oazhXjAsG7adAIWXR0gpFbnZEgXTshNhsHc/6M6eFkzUeuolrzxp/0EQ
 dwsJaZcFx6SCUPcYeP0187fAV/MOGyjm1/Zkys+d1w1YoznI/z913EEJiam+EC5pP+EC
 GuoCC12UQ0e21yFT6N18qflkUI3w4qQkkEabSY8cRa38EhWtTmPGtRfE0Y7HvRbS+vPy
 HoA7rOmff8pTRO9qzMiGHIspO4BymHUxoWFGI2+LYQs9IiHfCBXfNedT5kct83+Aywfy
 m6fNxgaOw7m798YAEvQMDiX6buR8ezhTGwv3iukfOTjc87um/N8El9An0eaXbhjryYYC
 B86A==
X-Gm-Message-State: APjAAAVxCPPhTNi7lymrk0Z7jvXj9blrD/BazwsOXSr3dBo88A2CZOBn
 owuzZev2hHmQYKmd4ZWXVm1gcZTcyZp9C+taTHVM+6fX
X-Google-Smtp-Source: APXvYqywHHIypHdHq0I41rAZEA+6VJ9TxGQ+E16M1jSVmeWMFHtvuuU+DN61Bjd+1sPF5MYTnsCJUcorqrRMGVgg0i0=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr31076242otl.86.1556396462982; 
 Sat, 27 Apr 2019 13:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-3-narmstrong@baylibre.com>
In-Reply-To: <20190423091503.10847-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:20:52 +0200
Message-ID: <CAFBinCBHDf8N7J5C7SkCF44k+-H686EYbK9zm6TOg_oUWJ+vTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: meson: g12a: Add support for G12B CPUB clocks
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132103_918902_0002D560 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch support for the specific Amlogic G12B clocks.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
>
> Here only the cpu clock tree is handled.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

while reviewing I used the public S922X datasheet from hardkernel to
verify the implementation.
I noticed that HHI_SYS_PLL_CNTL1  and HHI_SYS1_PLL_CNTL1 seem to have
a 19-bit fractional part for the sys_pll and sys1_pll clocks.
Neil, do you know more about the fractional parts on these clocks?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
