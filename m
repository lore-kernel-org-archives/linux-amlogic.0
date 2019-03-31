Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B45BC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 07:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390AB2183F
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 07:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJ5q4Kui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tBO/I5yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390AB2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAiCcbruQwirPENq4mWDTmORvwN2qVQYtahZVMYPFtY=; b=iJ5q4Kuik+ZhZO
	zI+vP1wpGT72/KLs+Gae22N5Bm4G5fLFz6TkEEvIDbHFh2tmKlsaX0fNgfXSbMeTlrRnV55T01Oaj
	uOvTot2y2S8S6/C2FvrMV1kALIxeKkZu0IUtl9D0Z+heQU6Rie2VtLz4Rr2LZrg/LYBejKXfkrwMI
	GjQml4zQR8h7Q4BAuCnklVejjP6G4QVm2+DwDVpRHwS7DOODB3Oshl1Cj4tCZ8c1UQc3raZIZeC0X
	+sqpsrFX7kqoHtMZrEELJu49ROr7TzgtLAA4eFpcLnxisAA1FQW/gI30PdQoQ8B5Xx7P4Rk27ZkSW
	7R5JwDh7Kh4XzO5ZgpEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUVr-0001Pq-KX; Sun, 31 Mar 2019 07:04:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUVo-0001Ow-Jl
 for linux-amlogic@lists.infradead.org; Sun, 31 Mar 2019 07:04:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id o10so12881369wmc.1
 for <linux-amlogic@lists.infradead.org>; Sun, 31 Mar 2019 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=sJmXGYZIR5w+oPY+YEjpX1bcjRyIcWNvy+pqs0iNf88=;
 b=tBO/I5yubzj5k1eSiTFHhfTtJaSswf2naiXfD/hMWsFnvOuqERd4hr1WWS6mlyyRjW
 ASDKSesJjIjxvVquIMfnlLUcTZwoyMViZDZPrR2O9Dc62beNez0nt7a0BkCkjat3Gi3i
 i0J2kQjO2hK9Lty2+WfQkG8iYgRNjA3TuXnUu+uwUvb/LGstIFGpmgEVv7nnpre8E8tg
 C4EkiinVnNh3zFJYNPmVnl0/LNV07tCpceZBtdlw8WQu5i0xaf9skh1beLZ1apVzvj8y
 OFVXw3Iruk9MbxmbOawknW5G34IxIHf9dXK8QucfmGnp5EfbuNO1nT1HlryW6hyfaY1S
 +9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=sJmXGYZIR5w+oPY+YEjpX1bcjRyIcWNvy+pqs0iNf88=;
 b=e9hBI6VDTdnLIODovjjKhO4GZ/8FlZnEoU3V1UmIuIhZnnTIzVoFf2h37gKXma9GP7
 lTnZmsrOjpZ946ONIkPLOZMntiv4dSb979lNAAA9QUaytl1Xm4ky1hIqFOwVeIYvsqoa
 ssH7DvCLMXTGqQWwUTI+t8mMfyc47M1lE2mG6EuxUFw0+K2ouBLQ1qjuRtmHcl12y4VG
 2jYn7eYzoSBUFtWI+tp+9usQHSNfvn+K+tppbuyK0ENXQMjrjA2j3Ky5qX1Wiot0SK8J
 VY1lBTBHFmyHwpVCwc08JqPwIw3XGYWo9cNAGSaoFNhYD3bw1dxPS96zbgrIXq/qQF3J
 htQQ==
X-Gm-Message-State: APjAAAX7tPT/IDE0wegt8OcyJ36afNz+oMfG5G7t2QJNxGRqipBxsdsC
 DZ4LdbWAFdRYkL7vt80D/ygwOg==
X-Google-Smtp-Source: APXvYqxd8udKADMK3DFmPsFOGWd+2yq7EPuJRXBfvhHbD9wh7lyZlzVTp8K07ALh1fGdK4X6qhSXyw==
X-Received: by 2002:a1c:cb0e:: with SMTP id b14mr8626505wmg.149.1554015850615; 
 Sun, 31 Mar 2019 00:04:10 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id g12sm5236162wrw.40.2019.03.31.00.04.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 31 Mar 2019 00:04:09 -0700 (PDT)
Message-ID: <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength
 property
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Date: Sun, 31 Mar 2019 09:04:08 +0200
In-Reply-To: <20190330212830.GA28281@bogus>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
 <20190314163725.7918-2-jbrunet@baylibre.com> <20190330212830.GA28281@bogus>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_000412_784850_8BE6E1D3 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-03-31 at 01:40 -0500, Rob Herring wrote:
> On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> > From: Guillaume La Roque <glaroque@baylibre.com>
> > 
> > Add optional drive-strength property
> > 
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > index a47dd990a8d3..4e3d5a27c91c 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
> >  "bias-pull-up" and "bias-pull-down", described in file
> >  pinctrl-bindings.txt
> >  
> > +Optional properties :
> > + - drive-strength: Drive strength for the specified pins in uA.
> 
> The standard definition says this is in mA.

Yes, the problem we have and the solutions we are thinking about are explained
in detail in the cover letter of this patchset. Could you share your opinion
on it ?

Thx

> 
> > +
> >  === Example ===
> >  
> >  	pinctrl: pinctrl@c1109880 {
> > -- 
> > 2.20.1
> > 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
