Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4289C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B412820881
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pqloE9vI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DUEXK7Q1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B412820881
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLBDMEYkbqm3RmzunFGTypZ6VNJpjZt3rQoUWOSWzEw=; b=pqloE9vIwo8jgp
	bkSY6mykySUVDqDRhaqO7mCHdIbc03vvWGQEdwBT2P3kOtavCXQ/984uM7+7eDjSlNPCPb+lhjznN
	QC3je5OQvJAGe3TiCeVdB3N0MEkFJJhszh0sDT4tnU3FvCEHROXF3gq4xbgCaLRwhcF752wuMMCv4
	/fyVrcebG5840MX9B6IVwkh9KKet7qXc1/PYp/wzSrjP6uTnLn4MbGkmSyiuHsydnPOBmO7MsLaBn
	xJfXnbLKPKKrvS1m4xSmlrtVNhvHu1cHuS5RPmqh7UsT8nUbf+SqA2mHBX8q9fPp+xXD6gtnx7OeN
	qUvF43Ci74bzKRLmfhiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTts-0004EL-Q2; Sat, 27 Apr 2019 20:26:20 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTtp-0004DT-U3; Sat, 27 Apr 2019 20:26:19 +0000
Received: by mail-ot1-x341.google.com with SMTP id g24so926046otq.2;
 Sat, 27 Apr 2019 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htGG/QDITTjzI/SpL8tXuy05dilvstyb85gN9ZixiaM=;
 b=DUEXK7Q1EaNC1WOySNY36v2tkh4NaIc6y5v06HAKPUIrT0i60BJTQwEANyDsDBNZ/D
 0uYytnFZywbCHcB8zoPk4F02v2VVoyyjd/6Et6dLFP5/CytPJsWhL30rbQ9yjWCx3+US
 6Uop/c97LkIF6Hnng42NP78Vl7xXYmBy1x5TJU15obE03d0Odl84XocrDDyEuGlf+W/D
 s7be9A4shhvdcd77Lph1LMf/ee6Qt4DHvUZXiGznxOOpmWXfuNM7Ig8ppp8zOpzamJPn
 EPkIt1LjLaNQK1hBHqfmXEGVzgzQsun32VM5UhriL9RBENJMGD2ku0jY5g3kAbrPQW3S
 UMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htGG/QDITTjzI/SpL8tXuy05dilvstyb85gN9ZixiaM=;
 b=iXL2JP3gF0u8QRqfKO4QPehCZGXLRzNZ9khTw9+u/UYK/5HKBO6/j9xzIVCo27h+4r
 7Ot8OjuJcIVnyuO0x+mVBpzlvmmaw3YJJVWXofVgpUGp2Pfmm0tUzQe9fziGUS+A5uax
 TKzE/Ob9RaWQFA4RnjcR0i4NkW+elIcxTFvCpuhdtN/jUFMGbSnyCJh2aqm5fq7m/BNb
 xXOut6bbAhFthGDiKKEj8lWLTrVg5Is9QX7w/W/yhYbVeFAo2wDwlMPNJyPXOI0q4A2U
 RLdMlIL6OlObw94Gbg+r9L6e0P+HbLMw15LKbaLLmJ73QqOcZS1UN4o4F/mAT2imCnNe
 zpxA==
X-Gm-Message-State: APjAAAWwfzn2/0WCnFdfETxeR4AsIC8tGOUVl8C071y0Bwc3i+WZMxbd
 grUXLZzW/K2r7Kp4hi4Sn5luhKu/G0m6x/LxygFHmxY3
X-Google-Smtp-Source: APXvYqxmZcAARJYmMBlSpzioTQi4gzrDkaGUC1GBOoR5pfyicYYBOKt8NRkZbxw9KIJJSVZ+KbPlUYWCLTDkToss26A=
X-Received: by 2002:a9d:76d5:: with SMTP id p21mr31514726otl.308.1556396775956; 
 Sat, 27 Apr 2019 13:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-7-narmstrong@baylibre.com>
In-Reply-To: <20190423091503.10847-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:26:05 +0200
Message-ID: <CAFBinCDOGyP5pwcmV_4ZjhY4hiBaTesrgfEMyQ6yfx+T0Uo1hg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: meson: Add minimal support for
 Odroid-N2
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132617_995315_95B34E4C 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Apr 23, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds basic support for :
> - Amlogic G12B, which is very similar to G12A
> - The HardKernel Odroid-N2 based on the S922X SoC
>
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture, but with these differences :
> - The first CPU cluster only has 2xCortex-A53 instead of 4
> - G12B has a second cluster of 4xCortex-A73
> - Both cluster can achieve 2GHz instead of 1,8GHz for G12A
> - CPU Clock architecture is difference, thus needing a different
>   compatible to handle this slight difference
> - Supports a MIPI CSI input
> - Embeds a Mali-G52 instead of a Mali-G31, but integration is the same
>
> Actual support is done in the same way as for the GXM support, including
> the G12A dtsi and redefining the CPU clusters.
> Unlike GXM, the first cluster is different, thus needing to remove
> the last 2 cpu nodes of the first cluster.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I don't have the board myself so I can't test it. However, apart from
one comment below this is looking good so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +&usb {
> +       status = "okay";
> +};
> +
> +&usb2_phy0 {
> +       phy-supply = <&usb_pwr_en>;
> +};
is usb_pwr_en really the phy-supply or is it the vbus-supply of the
USB top control block (&usb node)?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
