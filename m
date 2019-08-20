Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE01C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7355920656
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgVknepe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fBkJ88s3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7355920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5O5lF9Ht1RwarB3U4Cj7ZnyQVsnrsCSy36A1X0kAmNg=; b=mgVknepeNgF6ee
	wQKOpnwbOLhX88SGFHiFR1+o1wcQCsNV0v9QVLAqqqLGUjWS/s6hAokAZJyrWU1Ez+GVwd+PK07VR
	eiijFtZxNLAaHND41U28aWQkDgITPuc4SoxUPEPCxfGbp+AElmQ2qLYBJx0S6bp4/Xu1o+Bg5DG7c
	ScMn0alp4u0WXKIz0yk6YvMmZBFz7HTvGzJGti4EJCtAeDsOEwC19KLBp+WENBgNujb1+3hTK4YiQ
	48Ri36Ix+yUnuCsSQ9xxpjBfsifwja2iFC8UgR7Y8uedUqeZWZmcr2HQiv3rGqVARmuQcISawljf+
	t093P4YPR2cHvftPLiqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0AhE-0003iW-5w; Tue, 20 Aug 2019 20:25:36 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AhB-0003hz-P6; Tue, 20 Aug 2019 20:25:35 +0000
Received: by mail-oi1-x241.google.com with SMTP id g7so5169134oia.8;
 Tue, 20 Aug 2019 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fc34abKerT0nPG4qWNGEOV2EVuAycG0riw7i2ox9yUk=;
 b=fBkJ88s3Sl7hR+LtD4mnyE9oZ8hFiNp+F82w7KlKpL+WVEQI7PbprE1o1IdqxF20DD
 9ethXaUt++4J/MSknm0LfoFpFz6ohOgVu5OGErdkm7ebnwY0iiKNiVRaJd+62Xb+4wKw
 h4Vp3dbaJzV61BQ1eyVK7tP8IPCzVBCg/kjrdfmcEj/1wM7wO6syhJFsabY1J7g8MaRY
 ulLhBPFe68b3qtaiGHwDPtd7eAv8ofxLidTnefTEit8njByNJyC2pl5Tgxrk+YobaC9h
 ghA9JjzIJnMpQjLai2jhM0RZK6Tt86viJDXCb4hDOEObm8oW6UpjQ5dJSW/KZ2sk+ZGA
 gBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fc34abKerT0nPG4qWNGEOV2EVuAycG0riw7i2ox9yUk=;
 b=GJH4H3WNTkPNE9xpXRxXN/AIaEWfRQl0wtpGH78QmxoNzi/n7uBIypuz4ns9IXkYRS
 8H4RfgqnCGexUz2qdI0Tx7F+46XSGqJO1uErR6AL03e928A2Kx4Eh9IRoe3MU9Epn7NO
 9wgE5hm+srbyBx8ZE5xMifCs0wxynzMfRMbOg6ghXA+QGmn4m7q+W7gLDoHNT5iXTzqi
 F2TkWgcPu2YNzjcTpxAzmDSrlqhoIFuXvc4EBCg+yX1jW6yC8Gt9/JvMNuqjkNvCGhC6
 OYCXNrFxLRtSDaWTsy2mX0FrKR+mgVm+GYd46Hfhgmvsl5VdaBB2k9cc8fIaE9HQ9OqR
 8rXg==
X-Gm-Message-State: APjAAAUW0QSlDHCmtyXuLfmGdU8jOicNYhTXo9o48OyaIzzLz/wtHM7a
 pmKHRrkglwNh8h/9s6igvDwiHrPjhxBOU6jSas0=
X-Google-Smtp-Source: APXvYqxo1sZ3HBbbN4X+uoYcquUBFmZBWM+y+N7/M8IBj5mi9mXhFK+scq1wTO0nilDocSU6lZHQGQnDlc1YSx2p0MI=
X-Received: by 2002:aca:d650:: with SMTP id n77mr1406061oig.129.1566332732940; 
 Tue, 20 Aug 2019 13:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-13-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-13-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:25:22 +0200
Message-ID: <CAFBinCCJPm+FjMTK+-Qik4x-UtLibH3FTozHG8gMet0e5Rf9bg@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing model
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132533_813633_10130BE3 
X-CRM114-Status: GOOD (  13.73  )
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

On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index c34c1c90ccb6..1a36d2bd2d21 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -10,6 +10,7 @@
>
>  / {
>         compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
> +       model = "Nanopi K2";
this should be "FriendlyARM NanoPi K2" to be consistent with other
boards (for example meson-gxbb-odroidc2.dts)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
