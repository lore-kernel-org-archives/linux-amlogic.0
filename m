Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55FFC04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:54:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5EE20872
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POI/UxpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JfdsVdvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC5EE20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNctNRY0WthpNTblIZwfcdczo4h13H5Es8xj+oJmD5w=; b=POI/UxpQqxIGmc
	WANbxe8GUgucxSysjE4v0aZwcg4eDwVzDRtXrmig24TiI62HRlhaXCwad4Dbh1rCIElCzRLznZk8F
	CSHtSbaI+8GFLB71SnaEfns+7DKTOkZiW/Gq5Q0Ia7A8RvIkRQG1DCh+PJqG0p2qTgTLv1dR+EJj2
	Sb+Wix0skTC+8qYknBuqSi56h8geUAKsTMufL9yikSAbBKLOxO4dKR4l376NwbFwPlVZz8ltC+Om+
	hte7I2T9IVm5hE/EnuXlnak0PjERHrLKFlKhRd9uL3iK5OXiE3jpSuxUJxnOBfv+oa7e0gsQ1zW9G
	QUYqyxsCe1dJ4Z+XTkhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyTH-0006qQ-KA; Thu, 06 Jun 2019 19:54:47 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyTE-0006q6-Hu; Thu, 06 Jun 2019 19:54:45 +0000
Received: by mail-oi1-x243.google.com with SMTP id y6so2499623oix.2;
 Thu, 06 Jun 2019 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSoI84zbFfjJh+yucOPwxT6kilJj6MAJP+rtvhtzHSI=;
 b=JfdsVdvsUGgY9HlTxARM693KrJ3d3LOhodM05kVM/jqD2yctg/yUCsdNDvltCR/9o2
 bOn0L2jTGRvvPmte2dhpruXCv1vsV6NcePYUNiSH+8NbGnjxW8H+HpNz73Jss8GI7Qen
 cbhhmflFI0OToHaa1Pvq86yQY167iVJTH5audBJA9tVchznxATtih6JS7zzjNbXUffu+
 hkxsrmKCKotcHvUpUJIIUwQqn8kkfCGzpe71UDYrkFq79XBSXjZVyacCoYWvgvlxqekz
 y3TF8Nk0nTFY+cJKspYmD2v0wVA7gpGzQ6h5SgPF0ztjl4i45nc/qPvJrN13fEmGOuJK
 Ae1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSoI84zbFfjJh+yucOPwxT6kilJj6MAJP+rtvhtzHSI=;
 b=XrEDi75zcp24tFq4iMhyAOGPpnIPMwZRXQvvl6UtQ6GIfWgDsBq7DaU7u1Xp4pj2tV
 VWgbiGiYEOkD92JKStGttQ6GHsJo46faUYlq3pm9RhTby1rTNEQJXgqeN7U+0beyVJfc
 79aKzhEkNdW5xJr0ZpT9vE3+jFKWsCaBfMt9fmeHtapB7aGH7J3WQig+997HN7RZiQia
 CKMGfniphhiPcF0qVZxP+0vDQHRA38Dd5OAhtEMY16JyvCtk3a/lChE2V8WWzQkubF5W
 2U/chwhp014KJ8dOD24KDDraYLaW4nBRBz4yAxUePEGU/Thm3F1heUIRAd41l+bjcUuv
 wLsA==
X-Gm-Message-State: APjAAAVVz1JUI/4fDPM6LgCEbWvls5Zm7mAsP+AuROVRHQRxtW5wucN8
 UQscH0JNgVPundRsKyH9hSdD9XcM4v6SQuefShY=
X-Google-Smtp-Source: APXvYqyw70dr2fyJDIqlurnAqWsemlv1vzvsRBlsbzDIcPAIal/g3gva1/cOrXlnngTXqo0jEtGlY7jBnw/bVGVCAps=
X-Received: by 2002:aca:4403:: with SMTP id r3mr1320040oia.39.1559850883385;
 Thu, 06 Jun 2019 12:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190603094740.12255-1-narmstrong@baylibre.com>
 <20190603094740.12255-4-narmstrong@baylibre.com>
In-Reply-To: <20190603094740.12255-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:54:32 +0200
Message-ID: <CAFBinCA0vy2eB+LCVDokeoEkkeu0A1VQQsTFwdBJoh3a6EAyOg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson-g12a-sei510: bump bluetooth bus
 speed to 2Mbaud/s
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_125444_595840_11B16D88 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 3, 2019 at 11:48 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Setting to 2Mbaud/s is the nominal bus speed for common usages.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I tested with this speed when I updated the meson_uart driver back
then to allow higher baud rates [0]
so I don't see a reason why this shouldn't work


[0] https://patchwork.kernel.org/patch/9517907/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
