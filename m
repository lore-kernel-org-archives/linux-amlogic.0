Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E686C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCBB20656
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZ5By0CH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tj0pYCCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BCBB20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WFkKOChP0smm9gK5zEZaXbbjPDxn4KzOuXVd0hD6pg=; b=ZZ5By0CHnlIM3f
	c2lZEnilNDipogOmebyGAuXDlI21xhIZMVCJeirJ/zjh2VkSJ7SaIbSBg9lki/nXr4H7o5vN7+g7j
	JpjqaFdyPJEGTyzp0hiIhGB8dPEMfvCtkFWYXqYHYEO7Gt7rX7jpp4CawSH8RxKRRJorQgloy3U5L
	aBfb5/CZZelHLYT0Yl3b9D9E2IVzscugAiLl1KZEpjyaw5X9WMRE8BTUrWEX8+6U3G+PFJLzkxtTs
	nxRe5ZaLEf8fUTPjRmxYjaWut2R3lfU00NfHLAcZpGp6qiUmQB4PkqOY63Cq5V5oKPSXsYk4bJLEk
	oSEcwxfsahFEW7hvoOLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Akd-0005Ez-Cv; Tue, 20 Aug 2019 20:29:07 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Aka-0005EB-Hr; Tue, 20 Aug 2019 20:29:05 +0000
Received: by mail-oi1-x243.google.com with SMTP id o6so5159228oic.9;
 Tue, 20 Aug 2019 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6E1lyHDsgDU8DiTt3vegXCDVprFaiy8n8sbPdFHGho=;
 b=tj0pYCCsetgnZSZRPyv4P8EZfHeUJz7Oq8sYze0pLvO5MNR/8KfKlfjvm9LnjZtdMm
 0RMWONs9gPFVr72LH7qMEQaEahe0nxLAEmcZK4hT7DbaqF3ExCtLpAUcIPePe4dsVL08
 InHaq+2NNvkD1PvM3BFhNrUF6owR6q7I8EHUsxO1iMoFI0OzCfCT7MX5tOM6rtC/eaNy
 yflsKa6NMo2TrgHCdqfo6WkirtzOMWWRGc/OqEEAcfE1T1skJEklkJlH+x9BBsYITb6N
 +vj1lFUy2wLbIMeXdS3Rvx9h1lDOX20owB9/qpH7wPO6FuWYUhsE2muoOAF1Ea+xnyjd
 7HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6E1lyHDsgDU8DiTt3vegXCDVprFaiy8n8sbPdFHGho=;
 b=ApumVFvcuQy4rw+VPdWrg3n8lBPOskXXtZEVRjXv8fXz+Ngkr//YqdGWcDJxvYhI1j
 /GZjmk0ISQBTqlKwMb3kxOevP3lQeXL6OEERxPfpQCK7W7jdzQBC6WXd8IpEWOYdDIxK
 hxkpq1aXiSy33jm46fZKl2zNei2Rh56AoiYbXyNrGkB/VewXXpiBH68HsiMweMYQwGdL
 Fx8WCuFlsJavegswVtq+VL6qDhuavNOqM5nsLQZR8iFJOQD9NjjnwsBlKNA3ks0ZOQmw
 yifZFGfY0e7xMHwnT+/fy9HdpucAvRgAhe2xud6ZCS7NI6uST7BSt7VTYVd0HzJNb8Uy
 pplg==
X-Gm-Message-State: APjAAAXCx0ZVcATo57Z0LLFPw0huZg9aULURIxj+y3HzuDnFmGWSQRyt
 5HW9B8z/E0pPDXEcnjmIJ7Dt6Xxwr2+H1SGa3tg=
X-Google-Smtp-Source: APXvYqw0L67k2dTpl+TcYZzMhdPd+8VdAypm5lktacA1LHAmxmKNHY2j19AbzoOhGAoriRZFeI/NEDh66fA5zXBXjEM=
X-Received: by 2002:aca:4f17:: with SMTP id d23mr1354353oib.154.1566332943483; 
 Tue, 20 Aug 2019 13:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-3-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:28:52 +0200
Message-ID: <CAFBinCBQwsoO1dGKzzkE4Jh9VeqDhiy__m96X=CZBKSDRrHDOw@mail.gmail.com>
Subject: Re: [PATCH 02/14] arm64: dts: meson-gx: drop the vpu dmc memory cell
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132904_617482_5392AB6A 
X-CRM114-Status: UNSURE (   8.68  )
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

On Wed, Aug 14, 2019 at 4:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: Additional items are not allowed ('dmc' was unexpected)
> meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: ['vpu', 'hhi', 'dmc'] is too long
if you have to re-send it for whatever reason I would add:
"
The 'dmc' register area was replaced by the amlogic,canvas property
which was introduced in commit f1726043426c73 ("arm64: dts: meson-gx:
add dmcbus and canvas nodes.") and commit cf34287986d0b6 ("arm64: dts:
meson-gx: Add canvas provider node to the vpu")
"

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
