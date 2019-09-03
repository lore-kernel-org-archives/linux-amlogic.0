Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1A1C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307F922CF8
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbFFNFZs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HzRKecXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307F922CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjOYcSPYtasXQ9ujBdPtN2yQ5/2BewqiK3/Kn22lwBo=; b=ZbFFNFZs3CQTbm
	sSlinwHo0XYe9SkU+TKWSKgrd9MWa4sjDG+SEUUfDs+XKy4XGo3sorR7CklPF7+yLdgpP7OEkVhFW
	12Yvg4bgOMgpcbWdbEvjlaN1oa4ZIwN0UrPuj4Civ26TVhA6YB0S5GDWTvkuoYHGSfbXkoxbIMVFY
	9a6EN880BtVRd6JJOC8zI8B5qZy0Rt2jW+imVBu8tZhDlTfS7LwbUn/IyscKaFLEkIam3Kpe9plGm
	koLCsKE1ZNmfOO+hxuA6qbuO0S4FYLHu8jua5V5UYKGTGafKq1vkMe/46FrzY293xV9USUKjABiTM
	B7Xvq5KWAbcj8TLpb7ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5E5R-0001Ah-Km; Tue, 03 Sep 2019 19:03:29 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5E5D-00010E-QA; Tue, 03 Sep 2019 19:03:17 +0000
Received: by mail-oi1-x243.google.com with SMTP id w6so1138295oie.11;
 Tue, 03 Sep 2019 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+QuqQ5++lkMqKXAYS/qi7zuU0EGpIbrM4hWDE1pS1I=;
 b=HzRKecXRQc4ExW+83ZEnLKUXuhrCgR06x+QKiDNatgm0jYlBQc+fPxZhAdJJ2fbjDi
 Z1rKhL4a3zU7OAJEaiAlBLfDYxb1jd+sEqab69iiJ9hJJm27ERx8N+o5cZn6qnoej8MS
 AMvP9/ELOTmp3KfjXISKJF0L1R9C+GKMxP2G3Q6XPv35Jchy303oNe/fmRIum69ZaEPm
 CBO9fKUKGDkpU/xju9GsKxst5O489aKBQK/V63U+vT2N3fRd8mO0kOhUylXQttBJw7wk
 +jRbcG921YoSp4VgLI4JCx9iyLomJZ0NfXJHOIx1wkJ87vs6l63nXZG/sXXQsHMGMXnf
 bZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+QuqQ5++lkMqKXAYS/qi7zuU0EGpIbrM4hWDE1pS1I=;
 b=hVRvIyNOTEFWZtF8YOmggCyWzeoZaZcTIKrqC/KWkqzXfz4k9jXBrB0g/ibPdUDY+y
 OjfjAYN+qtYQgR8N1BqNlv0I3JMC7mC1iSgJIjmXhvnRYJHl4Te1vyc+RexVpNgRbIt0
 INxXbg6ENsrdY5uccKhmnpUs6giExcMVhSTbpUlF/6XavaQdffli8Sv0TjJxAe3lcdfs
 5SdvErHtb9F3FlDvX7WDtKaEm4T2lqdMp4NByX5otboKxGsxG1rq5P6/hQs6c/Jj5Fgy
 YzFc8QtsPxFy/avlQtzBnYAXnrJcEP+X9nRAbGlbIJ7FyjfpWqmvVOqsZlKTHu30sFT5
 sCSA==
X-Gm-Message-State: APjAAAX5M842pd46yIZCW2Sk4+N5fJZbvGxCF591RzwNGryXf7WelCtp
 OG/LcXdrskv8CtLvOJXy4ZlHQRwOEzFn+Y+CCoc=
X-Google-Smtp-Source: APXvYqwwUFNlfZebjM0zqVSX8dnNMtHXyb2ra3QenhJNz0G1ArgBXYzzOe9IIQBqxw3GDmpjOcvMWXXUIO6FHm0Clv4=
X-Received: by 2002:aca:574c:: with SMTP id l73mr615459oib.47.1567537394795;
 Tue, 03 Sep 2019 12:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190902085821.1263-1-linux.amoon@gmail.com>
 <20190902085821.1263-2-linux.amoon@gmail.com>
In-Reply-To: <20190902085821.1263-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Sep 2019 21:03:03 +0200
Message-ID: <CAFBinCDSbWedtH6mtdyw2Oy3ZxHU160-NUMa3nBXn4B9BJ--pg@mail.gmail.com>
Subject: Re: [PATCHv2-next 1/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to P5V0 regulator
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_120315_850240_1F8375CE 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Mon, Sep 2, 2019 at 10:58 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per schematics VDDIO_AO18, VDDIO_AO3V3/VDD3V3 DDR3_1V5/DDR_VDDC:
> fixed regulator output which is supplied by P5V0.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
one comment below, but overall this looks good:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       vddc_ddr: regulator-vddc-ddr {
> +               compatible = "regulator-fixed";
> +               regulator-name = "DDR3_1V5";
I prefer if the node name matches the regulator name, so in this case
I would write above:
  ddr3_1v5: regulator-ddr-1v5 {


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
