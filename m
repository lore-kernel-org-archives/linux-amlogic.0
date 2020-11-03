Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937B0C388F7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 05:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF142227F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 05:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwBw0kEA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pEKAMK9h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF142227F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oXyS5YzXkdXSUJfDjxmb6KSADTEx+UEKfERSclTO3Mo=; b=CwBw0kEAxC/XMY+NVVTbI0rlo
	EkPJWK9aqpD9J5Yav5qTtlb13CCgsHaczFKgauvMyPInd8K0L2hRsdERltqs9jYYZP4Dg6+pW4k2j
	l7xLxFQuFpltOluBbEssr5G0A144DIf8VAc9XoeRuE4r70j3AF+2Hhk7aHU11yYw05WwXUNwRsriw
	V/gOjvDrnXN5gqFaqgq+kCnjqxyA/zV1ZR9qAtldAJjgFl4FVO5cLetCgD5YrNHNI5MHzqL4+f0Aj
	64W+B9HwE/+2CobBLC/OmLPDthx/E0bU+BIpYh27O9aHFcbtv4xLOsYXuaByndWb7Zz/lLwD4C0vZ
	otCdkCZ0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZpGC-0001P5-Ha; Tue, 03 Nov 2020 05:53:36 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZpG8-0001NH-0a; Tue, 03 Nov 2020 05:53:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id b9so6794636edu.10;
 Mon, 02 Nov 2020 21:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbxSfoSmP856zGHTji+nbwksNv1J/cgE4QrDKUz3wMU=;
 b=pEKAMK9h4oND5JtBLHzwr/fUGb2DM09YmSHv3ArjvKMG9vaS0nm2LuK1Zob+ogPTyM
 C3V+TPBbmwtFHLfHM6/qTxkkMN4bXr210KplfSXPAIDr1MtJPlvj0FHAPPmTl4M/ml6n
 fTlLOYI9Kbx3H0V9JnADqFQcVo556nLvo517cWhoBWc88B/cLRTPPkQeBdiaX0vgBPse
 pz5uA1zkrGuYtVyZn0kMhScGoRYI4GYLo03trae98B+R2p25XqtfwXGywMGGhjnGqbHq
 YwuuL2ihpcy8FXxQjOe8md3UZqBVc4dVV8E8FTtbPXcCeglAIvY2zq0S/pAlJJoQ7mZc
 fh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbxSfoSmP856zGHTji+nbwksNv1J/cgE4QrDKUz3wMU=;
 b=RtImkkb0iEMuu0At2+YRmMsoUvU1rgxf5F1/oBRrzqELCkE2T7mc2Yw8ANNTxM5bxD
 HZRQV6bDSu5htmk55pxLU28fQXGzTaRYvg+qZozWDuzNDvOfhPYPNtLwGdTJqJ+dyKMK
 OmCKQQ8XCgM+UXmpPQY+tGbU2Gs1HvM5jr/SX14+2qgLoNZCigvMlNxo9bMUCFr7Mwkw
 gV3oSH8WVP0jMFLDcAVWfS/4jcj5qCa9Z8M1gcv0Apk9MutghzpDDlVoRpFUfvujclPg
 wqb+wZI2eazwEfku/tPGO8Jtf4Q3WwyEoAmaLeoRUMrnDoFnQ/fBm6eQzsHZkH3pva9W
 fXog==
X-Gm-Message-State: AOAM530TC5LUbliAF0h3J0D7Q0i2nl5sktMsR4n+x8DSpb6Xq4zp21Pi
 Qrqw8KevVBghT2/+RhVtTcXaYBaQY4K5qxrv3Tg=
X-Google-Smtp-Source: ABdhPJy5sXxaVPqPLCAlm8CNwM3kf6fo5mZgVh3EF7GepdVE9byq/HTWl0sU+0PF/k7PfOQLgL/x4TJgK1+G2QcJEkA=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr16272969edt.338.1604382808165; 
 Mon, 02 Nov 2020 21:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20201103012007.183429-1-sashal@kernel.org>
 <20201103012007.183429-5-sashal@kernel.org>
In-Reply-To: <20201103012007.183429-5-sashal@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Nov 2020 06:53:17 +0100
Message-ID: <CAFBinCCZiO9Xe1WKT8MZ-90c7m1u_m1Mt-OXf=Pyuo0vukQQ5g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 05/24] arm64: dts: amlogic: meson-g12: use the
 G12A specific dwmac compatible
To: Sasha Levin <sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_005332_161541_8313502B 
X-CRM114-Status: GOOD (  12.97  )
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
 stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Sasha,

On Tue, Nov 3, 2020 at 2:20 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> [ Upstream commit 1fdc97ae450ede2b4911d6737a57e6fca63b5f4a ]
>
> We have a dedicated "amlogic,meson-g12a-dwmac" compatible string for the
> Ethernet controller since commit 3efdb92426bf4 ("dt-bindings: net:
> dwmac-meson: Add a compatible string for G12A onwards").
> Using the AXG compatible string worked fine so far because the
> dwmac-meson8b driver doesn't handle the newly introduced register bits
> for G12A. However, once that changes the driver must be probed with the
> correct compatible string to manage these new register bits.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> Link: https://lore.kernel.org/r/20200925211743.537496-1-martin.blumenstingl@googlemail.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
if this patch will be included in 5.4-stable then please also backport
the following two commits:
- 3efdb92426bf4 ("dt-bindings: net: dwmac-meson: Add a compatible
string for G12A onwards")
- a4f63342d03d2d ("net: stmmac: dwmac-meson8b: add a compatible string
for G12A SoCs")

Without these above two commits we'll lose Ethernet connectivity
because there's no G12A compatible string in 5.4 yet

The quick solution would be to not backport this patch because the
driver in question doesn't do anything with the new compatible string
yet.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
