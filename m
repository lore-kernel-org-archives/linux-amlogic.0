Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC43C41514
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C173922D6D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o1ZAXglv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iB5LViSb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C173922D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lODC0O7Vry6jpY4GQ9jvVHq9zXXM/3dRJABjDoka9u8=; b=o1ZAXglvaMorop
	+HyYZkE5+LBBoziyMdKQRNjK6AxVZQaeRvd9MkQDSIanhqbjhbOKu53i/Mc4LvP3KQKXg5dZFH+da
	HV3KosePOfu5WgYCcxafhfGSxwugrr0Z9yGqofgav6oJ9blrCNTQhJQbwhcjOU3qD+MBfn+xkibrh
	aWPkKCfh+ofvBMbJOwiWCSdXBR+1mOaO9LQOOMQ7uM6hGYG9582wnX5TeH9+jF1ZMrtx8yt5IT4Sw
	xL3WfDsaEHN7g9uxH0uKib7LqL4MqwypKn//UmGYFJZlZeZuBvyu+dakXpFYgRF0GCk7LpiBP9XRL
	UgtF7A8Qhta2c+GrIZXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Adh-0000nJ-6q; Tue, 20 Aug 2019 20:21:57 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Add-0000hm-PC; Tue, 20 Aug 2019 20:21:55 +0000
Received: by mail-oi1-x242.google.com with SMTP id t24so5131602oij.13;
 Tue, 20 Aug 2019 13:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFhIFMNnaJwO0FsKXVLZvfaKji7ksglDhoULj5vQdP0=;
 b=iB5LViSb7jTNNAhbtywPQFBv6ZPrntg54tPB6pWu+y3tEHXrW7lYgsKIlNvuqpdIDY
 A6B+eG4uTHPV20yAS9qAJ00Bx+uswKRvzE/CX1VGFZz+DB9sW3fNz7Ya7HLIETaNWdUB
 1c38CQ/KAap3kDkN4BwGg/H+8YsAodptASj+i+clz3oW9we85GjL9/Pgoq71mBWzShwD
 rZTYaRflJoWKbU2harz4XQ6VMnF1r2flEb0YXRX9xxs3UPwlWHghLYqpaapbe1WqUYXO
 Qiqba40Nrkj5ijVPIt9Tro8fZm19OsNHcAPkXuoLXx8jzeGlCvI2PUHDu1eLhzz6Xjvb
 6J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFhIFMNnaJwO0FsKXVLZvfaKji7ksglDhoULj5vQdP0=;
 b=N6I3kY4zm9NgLMzCsrPPSlarxSh6+vcxvwsvIQco8rkkhIkFMendlhgC7673xOkiJF
 eMB/Rslbh49TH143VF26M2yfhFtbt2OlIPy/FuQt7se/01pS3v/Hrn/ItPSIeGluux+/
 S+uATjPatVlVJuGf1Zq9DW6/PgBVFnEaqasOTpLpx24DO7qQgx14Rwavn6QzMjjcs3qW
 h+NeeWyktfBr7Wxm9CzWKnKVD5Wq2fR3jYHZ6jKAVJBtnU5X48So60u5MeRyZkXMZqfM
 cmc3NIEfnl2F9NwuCmNqc8G7Qc3ZKxOwwB2DuwlFFwL9MnYffeHt2qM0VI3NR1P/xlCJ
 Undg==
X-Gm-Message-State: APjAAAXlDE7t4U0QB9eYJHAoTuY1AR1LtbsU/WOW89GbYbWIp7oIZYS8
 DqNAf3B0vt+4jsy9NX7Dwvp+x+hxtg6szNLkaPKFMf2z
X-Google-Smtp-Source: APXvYqzkLHh9E1pIvB0Iyz/FjsJ1I1eYHA9pMWw8yy94lIIDALmtN9giwzYeTUuWmVtTnhzpd0zUMimezCzBcmqBq20=
X-Received: by 2002:a05:6808:8e2:: with SMTP id
 d2mr1367608oic.47.1566332512616; 
 Tue, 20 Aug 2019 13:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-2-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:21:41 +0200
Message-ID: <CAFBinCA5dPztTZ6kUBWK1XgjQPDY6FVsLHytMdncThHnf4Z+8g@mail.gmail.com>
Subject: Re: [PATCH 01/14] arm64: dts: meson: fix ethernet mac reg format
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132153_837056_B18FDA2B 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:30 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-axg-s400.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
> meson-axg-s400.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
> meson-g12a-u200.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
> meson-g12a-u200.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
> meson-gxbb-nanopi-k2.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long
> meson-gxl-s805x-libretech-ac.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too lon
if you have to re-send it for whatever reason I would appreciate if
you could add:
"while here, also drop the redundant reg property from meson-gxl.dtsi
because it had the same value as meson-gx.dtsi from which it inherits"

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
