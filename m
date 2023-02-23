Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DF4C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iG7b7B/XVNo8GdlsWK93T86EULj1N6/m6DK3uJJOIR4=; b=smATNNdO35DtJc
	EZGAtyMFfLMH9arCAeHaIj96QXld/RZEXkrlLlfRjn39AxxzjiCGPIx20e4+z5BRF4KID9JEM0+j1
	1LNNqZ41/BJ9XzDL9z0FSFaRK33FsB1MC02Ub+E+BONgTdrfWP/hPrq1rGNwZ7CWdXn7M6i6f6ReP
	bps4HF8O+OazsYL7XwoHrI6abHVeksjWJd1jCcq/au92osGCXlekTRDYzY/amVD4kLh6eKpKDMg+Y
	ZaE66SjJBsXClnMbwiXutLj1o+jlSnAos4cVjn9OV6CB/A9hlSB+7SmzhJSVCm/Mx53KLAVLqi/ld
	dnMzmbT78wpdMl1Z3BWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHz6-000F3O-IN; Thu, 23 Feb 2023 20:14:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHz3-000F1r-5r; Thu, 23 Feb 2023 20:14:30 +0000
Received: by mail-ed1-x535.google.com with SMTP id ee7so31525664edb.2;
        Thu, 23 Feb 2023 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gXQwgZeL/74hBPgk1C6lmiCQBoirI87Yxu5xfVbpD0E=;
        b=kp4aGFtBZoyz9uLGKkaytsS+5gzhr8kJblMcm4O8bMhUdVveKduwcGDToWZdCu8C6U
         oHuVUSL9A3XeOwyooSkxHqEAPbVvTDZrtvm05NO4YYqWxlUeJ/uD44RPCyvOd/xrERnK
         M4DA2hTux8/h75fhMHSAq11A8Tw5KGpsHZx9dPnBe3rgW/DPuEGCSZZs9179fR+5eZYj
         k2XlixpKN4cSE0/eyVllpcVap3faX5SV1R+tN89zygSmUYBO+T6RxrnZT0BZwzgGWE2f
         9eFnYqn4BmHqgyZyFu/PVU2H0XkVAlF9aoUFmg6fE3JT28MBoX09iMoPkVjxyShzJDbb
         9vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXQwgZeL/74hBPgk1C6lmiCQBoirI87Yxu5xfVbpD0E=;
        b=FyWF8d23GXpkWChw10ZdrNqdNEsfLfUr8PhjOdHQOHhs3veYcv/faEoY4uhA2pA/Aq
         hgqdB4/+H71gsTne3j6mlulZ5lmH52UHPiM6H4f+S4iL94o47Dk4B6ZNw5Y/C+1XR8sT
         w+srdWy0BJO6jbeNGxnqR6lXeRky7Crj5sxjLM+wasUsIaX+cJzuaPRR27GdV2giv0Al
         HqZAhfWjbIXs+mITagEPJuHv8bsKPA/R0GayOCGeautYLks27Tobc04e2FYWc/MwmmWG
         2nUTcmEWJa3hBCOPyy3Aq+QxEWfo4lo7RZDTFCp9RA0fBrhQt1cr4izeL7G1rBeQWLMx
         ui9w==
X-Gm-Message-State: AO0yUKXS9rNam/tQDc+QIogykjA+XYwUQCPDTmJKyVPJ54lyxtKfPmm4
	U1NWtXDT5nPt1rJeAf57IMk5QnDRjiuJfUk/qOo=
X-Google-Smtp-Source: AK7set+K+d19g2bT7E4AGeiww4cIACa6p2T/f4jZGdZ4GqaW13JJLwZ8A9ecbJyX+VWi4I3RE+Lg+gFmzolWCQyCzss=
X-Received: by 2002:a50:d544:0:b0:4ad:6e3e:7da6 with SMTP id
 f4-20020a50d544000000b004ad6e3e7da6mr6163318edj.6.1677183264974; Thu, 23 Feb
 2023 12:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
 <20230222210425.626474-2-martin.blumenstingl@googlemail.com> <319cb654-51f6-6241-802b-22ee0d5b0aab@linaro.org>
In-Reply-To: <319cb654-51f6-6241-802b-22ee0d5b0aab@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 23 Feb 2023 21:14:14 +0100
Message-ID: <CAFBinCCzXb2Ty3TaZatEKQyxJmYPhHDL7SeLfF5-3PsDKBznWw@mail.gmail.com>
Subject: Re: [PATCH v1 RFC 1/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for G12A
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_121429_255888_7349A80D 
X-CRM114-Status: GOOD (  21.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On Thu, Feb 23, 2023 at 10:12 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/02/2023 22:04, Martin Blumenstingl wrote:
> > Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
> > (we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
> > Add a new compatible string for this SoC so this new bit can be managed
> > accordingly.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> > Why am I sending this as RFC? The last change in this series means
> > that the resulting .dtbs are not compatible with old kernels anymore.
> > My understanding is that this is fine and only the opposite case (using
> > old .dtbs on new kernels) has to be supported (which is still the case
> > with this series). I'd like to get some confirmation for this.
>
> The other way around is also nice to have, because DTS is used in other
> projects. You fixed here Linux kernel, but what about all other
> out-of-tree kernels, BSDs, firmwares and bootloaders? Did you fix them
> as well?
Indeed, u-boot is of concern here (as mainline u-boot does have Meson
G12A SoC support).

> The question is whether the devices can be made compatible thus keeping
> DTS working on older kernel. This commit suggests they are. Your DTS
> commit is written in different tone - something was broken and is being
> fixed.
If we keep "amlogic,meson-gx-uart" as fallback compatible string then
old kernels (or other .dtb consumers - like u-boot) would still work.
Without the new "amlogic,meson-g12a-uart" compatible string we're
unable to make use of a newly added clock divider within the UART IP
block which allows baud rates such as 1500000 to work without (a lot
of) jitter. Old kernels - with the new .dtb - would still be able to
use serial (thanks to the "amlogic,meson-gx-uart" fallback compatible
string) albeit with limited divider support (so not all baud rates can
be used).
Is this a valid plan?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
