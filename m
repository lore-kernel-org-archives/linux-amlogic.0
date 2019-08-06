Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F6C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92ECC20578
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4SRM59m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GTcns9Oq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92ECC20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UPqJHJVSYVb/iwqBnzZ9/H29LlkseXxdS+5h/mRaD4=; b=O4SRM59mKr4OaD
	X18uA3Ssj7dk5k1tQVHoJq6p75Vb44nm6oa3FHU3RgLZfArS0e5iGdVMFXTI1SPFuEZQiH5nBNZKj
	LFdpCHgoExHqcFRK/cm3oglLhtEH/jSTvtoGEZCLdoNgWw9xYYiaWPporAhoQ344O6REafojRWke/
	uneb1JGybXCkevDsjjRbURAEyYW6exuAKUHo/SVBiGc54Jw339EbrV3NlZjXFqwPI2TsLQDFcSXcX
	XtjGgdwCCCoubL4VvKPG0ezsKWqRDrOKJeqy2nGrsb+7klAQ7rVDKSzarR418u6x6/+n1+RQ4YVqa
	oJT8iHn0U99Wk8Jcx91A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv51n-0007GZ-TT; Tue, 06 Aug 2019 19:21:47 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv51l-0007G9-91; Tue, 06 Aug 2019 19:21:46 +0000
Received: by mail-ot1-x342.google.com with SMTP id x21so2025300otq.12;
 Tue, 06 Aug 2019 12:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SplwwiyeESrOxdFMQX+Fq9e1EkjSANi0+FEZLNzZBcw=;
 b=GTcns9OqwCG5oZbTUpNed9xNrtU/wRovnmqXkxfiThQYH6oTdEADwNbZwptfpFbeLZ
 DRNZm5fv6NGKHl+aw3DgDkUv+8Hb0+z0NurH80Hx2qzc+tmR9n1fUO2KeGBk/DsG6DMP
 BxeY4pbMONjTKI4MDrATtmZKZQjT6ce1QDOmuCFrMTvRMf4ha/Nq1mIsqBcbckoK4DYO
 if8qyn51WhvfLuv75nZfIMnI1pFwrmWS2SQIBqO7lTvuKweEjVw9Wv8pqP7dCXLvWu6O
 L3H/qgC3UbrXazxyJbW2szCYBwWEYticiaDOosYIxOj0mp1WYeXQBiQbWO/LtPjxzLnK
 oRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SplwwiyeESrOxdFMQX+Fq9e1EkjSANi0+FEZLNzZBcw=;
 b=fxjRJo1MmqceFRw6yVms8HGwMvYDm4jEF31bvly5wdiLXHfS7gs8Uuj5sFmsEyYU7B
 pF1LsqtVB4tLtVh2IeFWP4obSgzVW8jlaXEIHaZE42sbLUhug9SNm5b3GMvg5N1jE0MY
 vxQ7lZQO9N7GLHQy8b1PMR3nuy/nMLGqg8ac6TYgTq9BV3Sj39Tcq3HHSGaSm7SKf2Xc
 2XCP2NiISjBdnFV1rAyE6lmioIhITJqYmsTKNwYpPIXHjDW5DE/XUqoP+Y42tzFDdDpb
 wAUYHQdEjUI2otINR+5ka64XFldfzYB1RICiDTKtJcM5dH2MYVfXOfK0iM5EtZn9QmNc
 jRjA==
X-Gm-Message-State: APjAAAUgxQU59vdukssIpjlE22y0xCIaLGM5gTI2hFSIgkdT1buuLxIa
 Tl6G3RDqmFmfCmqVNeEagB0fcl8ZNyzKebMPErlJHagD
X-Google-Smtp-Source: APXvYqz96GEQwQHe2/BNEUUe8sw0fk/npT5MtyHckYM2U7saF9YCBqZXlcIMLhzLoWrU0hflGxn5hB7XTEVnJCAQXvM=
X-Received: by 2002:a05:6830:1e5a:: with SMTP id
 e26mr4117308otj.96.1565119303263; 
 Tue, 06 Aug 2019 12:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-7-narmstrong@baylibre.com>
In-Reply-To: <20190805120320.32282-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:21:32 +0200
Message-ID: <CAFBinCCqpSkzNUNz5pbct1G6TEsLF3AHLH=kqqXgwY2wzPCawA@mail.gmail.com>
Subject: Re: [RFCv2 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_122145_320979_44394CE7 
X-CRM114-Status: UNSURE (   8.31  )
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
Cc: kishon@ti.com, linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 2:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic G12A USB2 PHY over to a YAML schemas.
>
> While the original phy bindings specifies phy-supply as required,
> the examples and implementations makes it optional, thus phy-supply
> is not in the required list of attributes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
