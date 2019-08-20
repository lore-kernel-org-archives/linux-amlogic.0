Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12CCC3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838EC230F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kergYgt1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qtPpAFID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838EC230F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPRIR9sOwC7zcqiNXhPnPjueJJ6ZSuTT2B+PiOkCuR8=; b=kergYgt1rvLIx8
	wmqmd8KuDrOEnlv/MdhD2rtXeHC8cJ32SkjYE89R48p6JxHOcJ+ltJL1IeJEa/AiBzOJdzOS0jdgr
	AvLZCxyqXCWSMDjoL0xv8tp8rSicldDjwk8YlP+RSn1sbEvz6l4ps7pZVXOa4ZAM5TdHQW+jHf9vV
	MBUDNaMvX4chKlKAkOlYn1NvAcTWj6jmCQRxH2xbLstJWQGPjiXjgssHReiYqEhkAUbxwMH66fTUb
	Cz72Z5z3O9LncvGgrVerHJvxaQKYJ1GRtQYhcp2vcP1OBq76uIXvs1YJZoiLLrxE6WXLvU1dYNrlZ
	jJ4OQMgoMpdc0p65SLyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Ahp-00043B-UQ; Tue, 20 Aug 2019 20:26:13 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Ahm-00042G-Np; Tue, 20 Aug 2019 20:26:11 +0000
Received: by mail-ot1-x344.google.com with SMTP id m24so6274509otp.12;
 Tue, 20 Aug 2019 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twYIezSLU/OVYsbr2IHsXTRqkIzdrg1CxaCIxhHJ0W4=;
 b=qtPpAFID3Om/7WrfwGpqo+WusqVG/L/xldtmFXjwmBDBEZmr07SFzZG7VMV4hPPY6T
 AxUYmYp0rbp6n5GApnTmNJegIPzAS061q30gKP+GRDtLijQfhcVO8K+S0nySmiU4tjyl
 M6wDQKrNRDFX5zV/OV77sPPTnGTk/EKR4uELvVJKK8/ydHprAq88WRHkxwLehgBYHIcK
 cvUVCbxPC0kwklPJMCtLc51yga3WnVaBWY2AyFu92kffq0ue7XFUU3RHIcJJjxfaVbWo
 BlLLRxucvDLhYEeU2WIq8WFRiXTLQGcTjjcUpErPK+TJUyMACc9oNF1udZkLzkXBaq7x
 BU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twYIezSLU/OVYsbr2IHsXTRqkIzdrg1CxaCIxhHJ0W4=;
 b=uGLBtgpGmn3PtRCbOW2/cyErbtt8JDIuuARg2QyKFYYHd0wM/qPs8LFZxgJJREF8ME
 6ZetnX1UYAFVbeqL50O6Y3KuFCikYiIFSR8Eoqv3ZCociMvlSFCk6kvB/gUYl2TbVaFv
 KX7+7Zep3Mv8O9IsJ93dMBh7iwMeqwSUMm7waMOK+Ri9DqXZ1EB0m5ut1V4HJGFVb5Uc
 ufjWYmyj9loQNOWcknESeHi9hexToDHV1c4UOpzqVTOjOIQpngvw4rSKNCEJQsjCCROp
 Q2pKRNFr+4vqKuR0qyh7NmkyboBrybNfKCjc3iqvemQ1m2Pk0wTfRrMusFsyInw5ZRT2
 kcfw==
X-Gm-Message-State: APjAAAWmgetBW4FrlLLpNWgNa8usQTTQ/r+DcgJ93bbJaTkzNphrCQKo
 W7LSbFeD4WQkFuXhiJu3rScvSXGPqU46z0NKWaY=
X-Google-Smtp-Source: APXvYqyerGVLGtwIyjcFiVjLmf45wgZ9hv1MOkh77AdzGvP0Bvu52F28OTfLpnlxRkTfP6wDOTfvooN+in+Ddu5+EGQ=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr22577236otq.6.1566332769966; 
 Tue, 20 Aug 2019 13:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-8-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:25:59 +0200
Message-ID: <CAFBinCC9LS+-tM80d8EeyhwUJhV65h11e-M8J6UVy1iE1aD9Kg@mail.gmail.com>
Subject: Re: [PATCH 07/14] arm64: dts: meson-gx: fix periphs bus node name
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132610_772775_08F4B730 
X-CRM114-Status: UNSURE (   7.54  )
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

On Wed, Aug 14, 2019 at 4:32 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-nanopi-k2.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> meson-gxl-s805x-libretech-ac.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
