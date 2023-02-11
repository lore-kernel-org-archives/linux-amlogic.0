Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E0C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYfgi4oTyMkPTnjktEPjBn/kv6wUY03MDVxPqO6P87U=; b=rqETEIQ9AER/pm
	1n9C4Z3rXu6cXfO6crglbL/aa0ogLBtsd0FPRBcDS2sG5kxqdkL2pfpuQcPpuumy3eB8WQvD8MLiy
	IIoN6foZ2MK/k3e8fZTXvBcbrfoAfgmN/ycs+/Q1nhml2jvb73v/9W6xiiUnwImCn1fYAmhxh54lx
	Wfk+9gs+xoCHSHXkyDkmDQgwcyn3sjWeUNFP9eHfSKapUbs6O/FGy01kuBKtgFuVko8dMewFvyHsJ
	wkCxhpP+tedhS/h78OJmlOTqMd4A67pwyhu1bLBfmGSLsFGU62Sl9r21XADpjErgIEPgaITq4lz4n
	0T6dgC2DmYd5HhmU/+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8h-00AGJF-JS; Sat, 11 Feb 2023 20:06:27 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8K-00AG3d-97; Sat, 11 Feb 2023 20:06:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id p26so23276419ejx.13;
        Sat, 11 Feb 2023 12:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vaNbpINT2Xmkn9BcHjtJ02zq/IlpYiq1cxdo5OW1ad4=;
        b=k6op3JKzRxsftji1LbveTFIAS5CatKMw4aoTuTC+ba/knIJ9Tic2KjwinicvmuLr9j
         mUFv2/su61jVqGAXHO1iBy28NRoM6m9dOCjbmobZoC+8tgfcTFHaiwSTkOm1HWVfbKNI
         KQfEU+9LUcCwdL6bXPTRKr71+pCXNt8iMnZ16QtsKR9uIFJCb5lIiKOje0qp8hEWchMj
         D1xvt/U8RRgyRV+UlnestoFeklytyjJ1VPDakzHR10jeLax1TMaM8KomrsoyP/FdFC/R
         sPuKSl4fR1WQJvwyLXGfrZFIyBQi1CVIkroUka5s7nzxWZajbkUej7WyYb9kwfYwmypb
         kohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaNbpINT2Xmkn9BcHjtJ02zq/IlpYiq1cxdo5OW1ad4=;
        b=HEbyQb5BLCFQsnIsmRpWSKRanAz/7mwNv/FgNI0BrUaceobJzL18oKzx9anO9UgAdM
         VPd1QCfScPaCGN/Neh/LC3BLQXE6CCgfoz5UsrL3wiKCL0e5c4Tmhl8fwBpa6k/td4PA
         Bv7jfs+T0D8+NQEU4qo3nly4sRvk1zkRhncmvPXSYPShjiqXhpcTThdVookZC+OvOrAg
         tmw+qfNprqNhurvqXTCBZXFFLiP6oLDcvzlJIqmy7nqf3UU5WaZNAQxBVI/wlp2Y/VqQ
         OzflAOybOiNxBbNRDEEu0kbEk9iX+d7a9DwbSkJv0gOnfLuJ2SsJeUgrl9DMge6uClR9
         aPxw==
X-Gm-Message-State: AO0yUKXgGYZvM3Gl6aHfKbPgyuX5CtWOyhPzrOtEKQaPv8yd9SGZQInO
	Ew7dF44Ow0Z4tbcWizf56Mle0uFdThJ7UXCAcrg=
X-Google-Smtp-Source: AK7set+ooeXlh1YIDkOcBMPjkcIHlqurC5sma2WWEDW4q11b1xsSXdCafR8YQhXjeTPZholKQbiqX3EhtEIiF8xmqg8=
X-Received: by 2002:a17:906:c44e:b0:8af:341c:1f82 with SMTP id
 ck14-20020a170906c44e00b008af341c1f82mr2608701ejb.4.1676145962006; Sat, 11
 Feb 2023 12:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-8-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-8-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:05:51 +0100
Message-ID: <CAFBinCAJCOU1ihXxGxN3X3UQAMBDFpCkkMewY2z0KT9WnP5c0Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: amlogic: meson-gxm-s912-libretech-pc:
 remove unused pinctrl-names from phy node
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120604_353039_95A62A0E 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Fixes the following bindings check error:
> phy@78000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
