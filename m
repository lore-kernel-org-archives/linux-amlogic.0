Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA94C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 20:05:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5D820659
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 20:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YraatW/T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Cnotiy1x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC5D820659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V1q8Sjqf250YieIjdmKazmUb56yzKoEmaYFEx3VAn0Y=; b=YraatW/TDBaeZHUjTMEpPOdQE
	LcTJ7/YYnv3XDIes4F/QX4XICTTC8Hp/tOQSlDUQBEtA9Na3sTmyzE4siinfQehClTDMoaDzIYyBa
	3OwvRv5Wsbt2yCHulvB/pdOedCN8JQPU2hx5AK7S6qVixZ3vIv0JP7jCy6zhxfxKO2PkMsrbXATr6
	s2CATn5w0SgRvOlOhdCLivbRqtZ8xuIvfAAXimNtI+y3927yk/sX0Gey4yl03iiT8ONQSw2vaaWqR
	zUtuMHFj/ljluhSYo1qA/6B0k8rzdD6yTTpermHgXBy1YtPvVJT3DzZ+MXsBnuGPPmyxwg8Epsiqm
	t2sTzOQCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIHD4-0008Sc-KF; Tue, 15 Sep 2020 20:05:50 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIHD1-0008Rm-59; Tue, 15 Sep 2020 20:05:48 +0000
Received: by mail-ej1-x643.google.com with SMTP id u21so6884625eja.2;
 Tue, 15 Sep 2020 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=929GSb0jD8VArUXhfmYBsMFwZ1mStozLOcAe1ulKSRA=;
 b=Cnotiy1xwz41qBAegUiDzJAt6Hn/SdpnzDg8KiK0nPtb0LP7VV9WTQndyQJk2LCYPO
 jhWDF/vFCQFlNnQfvfijlXLmY3p1tiPae/NwnpFl6dIxroMHd92kipIiwMfXBg1+Zmcc
 2O1jEJdBiVUAgNNKGNPBnb0gLZZ3FqWDDXv+Y4cZsEv4kfsZX5H4MX48i/unEhRs6rZc
 8Kvrlp2dsxj+NDjWKu7rbrk2u/Mtd3oPseqpLW+jlIIptp8JlQdm9pj842duMe77HlvL
 t2H6Y6w8xP/gArO7pKVrm6G0Ud64EhZcC4NkyA68/Xc9GOrExMD3BeXvG4Joz7cQ0dsi
 hc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=929GSb0jD8VArUXhfmYBsMFwZ1mStozLOcAe1ulKSRA=;
 b=e1EDCjJkkjqm2b5bpFDQqgJfJi02cTAvbHNOc5Z5P6bepOGKZVQQJEdjSD9ocLHR90
 MZNSj3vTmQuIzRcmvP46yrz7xTNNy3YiFGfc+JFLTN8r+sM0mm0QHS2npCA1mvWDuak5
 8GZO8fLG96VQa6KkjiBHkyzu0B0uuUkWjaT2ps0fyC1l4GUTyscxoSPp2Nne7dV9RKm8
 Qdw3NfZdJ+CzfILMCVv2uG8dYDp3dNS5Uys6PiFv49vCml+JW/HzeguVOT2R367XWh2v
 1Zr8rUqWURRmwbzZH/qTfQd8hdgGsad/Dj3NQ3a0i2GRLkn1LXQEObIadoa0ki4TdaYt
 wDMg==
X-Gm-Message-State: AOAM533X+4cA2sYxLm74276c4ybeJfYhmJhj+i35714/WehwXMkMVvLq
 LCC0XQWTSF5KEkivZCuRM2Oz+T/Gj+1mgdCGO7TLcTPe
X-Google-Smtp-Source: ABdhPJyUqReON7GONBckbkkGKGZUOL4jUSZNjbi9MDzz1vg1tQm8PhqyWWXULUNsdNzDSnCGbg1/ooa3UWIpA9W8Q4s=
X-Received: by 2002:a17:906:4902:: with SMTP id
 b2mr21441225ejq.208.1600200345705; 
 Tue, 15 Sep 2020 13:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200909160409.8678-1-narmstrong@baylibre.com>
 <20200909160409.8678-6-narmstrong@baylibre.com>
In-Reply-To: <20200909160409.8678-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 22:05:34 +0200
Message-ID: <CAFBinCDH8sAqvaDJ=0iZ86fw30Y7Xos0vaRw6v8ECADqeJNn7Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson-axg-s400: enable USB OTG
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_160547_209844_E9DFDD2E 
X-CRM114-Status: UNSURE (   8.59  )
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
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Sep 9, 2020 at 6:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +&usb {
> +       status = "okay";
> +       dr_mode = "otg";
> +       vbus-supply = <&usb_pwr>;
> +};
> +
> +&usb2_phy1 {
> +       phy-supply = <&vcc_5v>;
out of curiosity: why do we need this phy-supply here?
isn't the usb_pwr regulator as vbus-supply above enough?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
