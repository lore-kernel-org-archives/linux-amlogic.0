Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7904CC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB862332A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYxO48+f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NFpxjJ+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB862332A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQT3lzVRGm9CscFFiNJOeB/jaLqxMwTEHXwKFTNuvbw=; b=rYxO48+foWzf7D
	N6vh/ANvy/xj3wW8Vg0QKNIV1L/b/+mfUvzjMfYzNM8LK/m/mQCsdBkZIC/6mTxIbtUu0Rx4Q9P+r
	0oqIc+VASSsBJnMt4v6d7IINt5hxP5j8fk1Gd96Y9sCuE3ylsCYCyxlH7e4yNOovk49Mce4bEbNzA
	7zxCPV6J/fmJRx5WK45oGjCIBAOInZ1/Zcy1ac8XjizWgAVKDcUHYHIr4jKUVa+054ken19x65Vyy
	AQFCuiB/+LawdiOvGWO+UCjr5G1Mml0NdqD3jkcKbNJwI/pmtYwZP6rBo8EYX9u+5vBkPlDwUhpjM
	08JKOWwhr6rpYE5+IvAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Aql-00049U-KQ; Tue, 20 Aug 2019 20:35:27 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Aqi-00048u-Ua; Tue, 20 Aug 2019 20:35:26 +0000
Received: by mail-oi1-x241.google.com with SMTP id p124so5184050oig.5;
 Tue, 20 Aug 2019 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shZI82Zl0a1vHkFKOP8kqC8vGCDr5oXp88gXw96LLYA=;
 b=NFpxjJ+Fr7xKPu3L0zKJ8v8AUa/bW/d1wEprP+UsRX34exWwlqD7IpKtKOqqKpQD9+
 CfCw2hunvnMRDynay6NI5pDYSfExI7YCTLtUdE1Kn9DcBZHZDAcRYq/5jySavs1ez1eC
 v38+8pNMorc+ONtthB95+DHcpErr/pfWwNbC8OV42t1NeCRxEIH2O73XEmTzXvGknZYf
 r1GcrhNJi4G1wfFgRPaL0GzTQDm8j9c6fFXIerxDaqhuMzlcJB51WTHVFXQIMX2/f98B
 25E3zfJwxlMkAE7WtjR/w2bVwPNcbDvC6rzZm04oEqhg6LF9METLL4MhipTAUBt9HM5d
 oxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shZI82Zl0a1vHkFKOP8kqC8vGCDr5oXp88gXw96LLYA=;
 b=iARRWsudtxKKzZQeuOyunZo/o/vNaRCD33wfFjLnyj6AC3i600Z8t2I+j6hfFuJW0f
 blufzoXpo/q00Bme22ZgTYYqSv9CpE/p8TnrDEVHHA/Zjhzktdj/n+4qCoDm7yO3sdLD
 N4w7wkxPxHqwlehu1ajiBRtKsQ7y4LK7t73Frv8oRLbynkmAcmU92GVGhWvnO9G+7L3F
 XPjvM7XxniqU4hAISrlAK+FTZ/cYV5v39RcqLbXaSF5qJsMj7s3Xh9r7c7c3GPpv8qoH
 T6z/HrJVYM2YpbvSC99OcezIPSJ3M6boWnd1QpWObmH6OBJypDh4T57WJWhbJ2QXlmJD
 aU7w==
X-Gm-Message-State: APjAAAVbrNywg5e55Z/PDnqjJO9OYaWkfYUFsz+MMqNWkTe+Rg5HYeK+
 ofn113T728yIsiXncom285tPw5Z6EhK38mOYTP0=
X-Google-Smtp-Source: APXvYqwF+wqaQaOhsdA099YOhLAMF4+0X9jZXZ57p3A1tskhIG+Cq5/F0EEgHWGCTE9OmycZu1wV62qbVj5Bs+q55M0=
X-Received: by 2002:a05:6808:8e2:: with SMTP id
 d2mr1400869oic.47.1566333323830; 
 Tue, 20 Aug 2019 13:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-15-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-15-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:35:12 +0200
Message-ID: <CAFBinCApsk7VhfUBB9Gs5_k1p3-q5RQgfFO_6yjij=kALh9AJg@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: meson: fix boards regulators states
 format
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_133525_013873_0AA67662 
X-CRM114-Status: UNSURE (   7.85  )
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

On Wed, Aug 14, 2019 at 4:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
> meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
> meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
> meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
> meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
> meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
> meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
> meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
> meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
> meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
> meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
> meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
> meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
> meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

note to self: NanoPi K2 and the Le Potato board .dts are already doing
it "right"

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
