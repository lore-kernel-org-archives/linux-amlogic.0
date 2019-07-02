Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B30FC5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA2B2085A
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GKHt8j65";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hQ/EHaWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA2B2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyqyjtX+w3HJree45lrCbaakYvO1UZd/VkTANQG7vjE=; b=GKHt8j65gPdX7q
	qQVvmMGyGv5EvQoEhuGpk9IHgEuIlfuVagr9fVO0qCqsv/MYppueBkmK/7N23tDodAVPWJAQIMewd
	HDM5eiwK1s1EKBtn6TztCW71SDj0h0m702hAmhyaDdXkO+wn/EczlJ5YHUOrCMY3OvviSt1ljJS5I
	+A6BUPyfbokipBMp6ikdSEUAXlyI1pimtyRzlO6cvRwNk5c3j4LFSfQ4rcqpn+wAbr+LVVgk/2Ysm
	ZoLYJXSmf6aTAp3NzSWlcXlnJ75fd0E5y7BMGW1q2+pEhTy6pW1j/7jQfj1tIHB0r41KucBIpNRcp
	rCiiz2H44+kssb2TlPSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiSVO-0005Ik-Gr; Tue, 02 Jul 2019 23:48:10 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiSVA-00057v-Pp; Tue, 02 Jul 2019 23:47:58 +0000
Received: by mail-ot1-x344.google.com with SMTP id l15so357657otn.9;
 Tue, 02 Jul 2019 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GdscGqh/egdkRhC/e2+dFv4bjbb+RawTDhOEItQGZY=;
 b=hQ/EHaWPZ7DY6zXD5ep3cjow9hECIwRyxvYLhtRiOBnmmGgc07CsbysXJM7KQ5D0kq
 v7RpavAzYWdsV4rP9goQoZVFa28nRw40Jrew9a5It5qe8BzaiDMBDkEvcRMbP/rnM/yt
 NZg2liIbBRDRGNSdUzeTiAmOfB2N4a2x1UM/lMkbWbIeDy0smc0cZyYT7PdOhFXCONj3
 QxE8EmaexpOpMJalIOkz8PdnU6PT3tYXOMbkI3wmqDBaV+YFYgMWfMUCQzUaku9zuh/J
 QQAJYqYW7hQ67WWIWtA3APhoa8Az1S4OShZIEyNLDXDFS9VXYk1w+EmP0cQyyLCIpKn4
 N73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GdscGqh/egdkRhC/e2+dFv4bjbb+RawTDhOEItQGZY=;
 b=P3wBKVpZc3bXDutKUCaEg4xIBchYqQaCFKQ5mUziuA8c4faKnw4y8QUtUOnxo1S3te
 ELQMjj9OwE+8nmneFLttd4HD9CPAAmQzYJQIVvJxXiWnNtnMd5dN3WdFOAYuIhLgs9Wh
 eCsBRJox0JPC6yl8Rli7TXCh4TQ62TbJ29OM+hmnh1vb2hMeawjqA5YniroxIlVocChN
 N2h4vP/s/KuwtXud+scvaVU3duUN4q21oVCNmjxMy/7pHcBLrLuWR+nVg9w+bPTdRAhv
 56LSsRZb8tvUQITggLk1DfXE7CEj/uUPwPX3bo1uSNqmQizkE9bv+yHXFU9UoWgTZHyq
 V49g==
X-Gm-Message-State: APjAAAVVCFuyq3zvXhBRmTt/3N1D4vr/wBN5GamNwn1/YrCoIwy1K9AR
 BYC6XXQorxr/V6fV8oOdjx831Zun51fSBz2nUSTslw==
X-Google-Smtp-Source: APXvYqxsQ6td77BH829BNXfHoHJ00hWmFYkW/r/LgoW6R6eBpVJaBoDXXEdJFK4UmadzhQd7n8KvCbYnxfBy39BYuX8=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr25378901ota.42.1562111275781; 
 Tue, 02 Jul 2019 16:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-12-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-12-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:47:44 +0200
Message-ID: <CAFBinCBg57gh1x3CKs-YrCvTD0WR2s5zVGWtycb=RGqMiQ-VgA@mail.gmail.com>
Subject: Re: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_164756_835736_F4CB6079 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the OPP table taken from the vendor u200 and u211 DTS.
>
> The Amlogic G12A SoC seems to available in 3 types :
> - low-speed: up to 1,8GHz
> - mid-speed: up to 1,908GHz
> - high-speed: up to 2.1GHz
>
> And the S905X2 opp voltages are slightly higher than the S905D2
> OPP voltages for the low-speed table.
>
> This adds the conservative OPP table with the S905X2 higher voltages
> and the maximum low-speed OPP frequency.
have you considered all three as separate voltage tables?
you're other patches are assigning the OPP table to the CPU in the
board.dts anyways, so it's easy to use different OPP tables for
different boards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
