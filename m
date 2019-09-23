Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E39C49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 08:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747F12064A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 08:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dx+xOEJO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IghFe3Y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747F12064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed6lsQ1vDED1kHIPm9B54XmuOwrF9leda5TNy3IJHC4=; b=Dx+xOEJOv0ZZsY
	QQE0FTUmFCwPzFpNN/WjIavdIN7sXplXYq1fZQLHeQzn87mwrt2I3CqpyXu7GHTIR0o2K/XdZFDT8
	yA4QwCkEDR62UnA/H5g03Qkb6CmngkSXf3uV1uQgcgjH73xudZCvrUnVAMt3gLJLc3JJ/ESGc0BLP
	/xrsrC9v7UN/DWNNB9YWAkmgRcexu3crBydl4mbFcqHL5iHQMMECZmrdURT728JQDi4aViFwsQKAX
	SOUu6VMI+rTXc9LNsV1SJeiTJvEGTXHDt2TRYuxYAqR3njwgp+SXqfDHCp6+D0fMo+EY7m1DAvOVP
	tNiF4+k2siqGV5kBIkeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCJs6-0001CA-4j; Mon, 23 Sep 2019 08:39:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJs3-0001BU-0q
 for linux-amlogic@lists.infradead.org; Mon, 23 Sep 2019 08:39:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id y19so12918206wrd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Sep 2019 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nwiGQiE38HtZcmw6CWeBg4qfY5GYbo0p333nLt6wTfk=;
 b=IghFe3Y9bi1OIf+T0BVbUqifsHRXMu4xWRUWvzexMuhJ4MorveaatsE5c2GnCI+84a
 Bqx0FzIXkolcI77UhylFeOKxmtwpKe9AUMcjHExUAVS+hF6+GX11MENc6c6CKLisbkhU
 b9Ts9JV5TR8s7v3h7HczUFMlV75yIvoSso+xPxb2dWoJGiNJCOVjR0+SvNXGapK7ocsa
 HGGW4pVQf7UAT44HCNRvqfwXb1IWJyD1YzR9fLdLsLMHoEzNFWJy5uxlqyzsmbeJ7NPI
 foBJjIBuJRCnK//2IKw8qaIOokqj5JUovfoGEVLI+AkqSB2yHohlwvIpAIpd4546nJUR
 Q80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nwiGQiE38HtZcmw6CWeBg4qfY5GYbo0p333nLt6wTfk=;
 b=fYmYbi5ETefDhDfyNizrcD7Vs94kFDKkky844Doi2f6yYFDLgTZz7Hhzea0jG67YCF
 oKUo3rAxArnTyn/AAvSqmRmPBIQRk2e2irvgq+pAiXW6WyScIhTYxC+6vsKxMuFVNDNe
 zRG+VrYdGPKrq38t9DKyxPp+shmpKQmhO2rlLzWJ4n2xdczm6sRqopKp6QagvpTWhpT9
 MnfGxMkZ5AebfaupSlpoWkkN7wMUmZn7KY+DgTpiAYIY/mN0uX5PHtv2h2syHtuFuda8
 GU5bgb+iXDAZv6xJ5JicfHDSaywE6rjIgsXRnjJiXThIsNosaNHLnySH6v4bFBlpLwqi
 MirQ==
X-Gm-Message-State: APjAAAVw5yNv4rHZEtX56JLpUrUFEvp0He68ve4mRvPqSNAtdDvekqnC
 fMsC5G1RKDY4t5vmFRge6iPsrA==
X-Google-Smtp-Source: APXvYqw3ZqNhDs1DwDmXDjeQ+UCFX7R57TXtgHP+2m5w6ijcpVvYw+PpPwVSLBebaiNyvUoQipm8bA==
X-Received: by 2002:a05:6000:45:: with SMTP id
 k5mr20259104wrx.259.1569227937789; 
 Mon, 23 Sep 2019 01:38:57 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n7sm10988940wrt.59.2019.09.23.01.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 01:38:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] clk: meson: gxbb: let sar_adc_clk_div set the parent
 clock rate
In-Reply-To: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
References: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 10:38:56 +0200
Message-ID: <1j4l13tnj3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_013859_062519_5CAB5006 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat 21 Sep 2019 at 17:04, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The meson-saradc driver manually sets the input clock for
> sar_adc_clk_sel. Update the GXBB clock driver (which is used on GXBB,
> GXL and GXM) so the rate settings on sar_adc_clk_div are propagated up
> to sar_adc_clk_sel which will let the common clock framework select the
> best matching parent clock if we want that.
>
> This makes sar_adc_clk_div consistent with the axg-aoclk and g12a-aoclk
> drivers, which both also specify CLK_SET_RATE_PARENT.
>
> Fixes: 33d0fcdfe0e870 ("clk: gxbb: add the SAR ADC clocks and expose them")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Looks good. I'll apply it once rc1 is tagged
Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
