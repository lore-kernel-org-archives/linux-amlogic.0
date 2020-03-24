Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5B3C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A014020788
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2XR7dlG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DMw1BKgt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A014020788
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xj4O44uHZGfCgDIJJSvVe26X3Dd1ov0vmdBXgXL9TX8=; b=U2XR7dlGdurp2I
	34cdZhs60GIhoQw7ZbqMnFb2CiCu9UDQF38EaX6Udhi680EL8YUa/lq8SpsGz5tJ4GahqkQhbya5P
	75N4usMqz0kAsa4n772RhmzaMcsZpWB8G1SQv69bhY/jm/hzgzY9oMdTJt4rTbs0uvAyqVaz/AfRk
	vvRAC2fNB79nnGUYIoJtNYwbzIT3m5iTiVzqJKQ7Gs+oIlpsVWpZXoZLGUEf7E9dEsfOfj4kgKvsk
	WaTM4e/mTgELEsodzpSIds5IdBmhSj3gVB2dZWh/MPYh/UPtDMlAhx2I5IMhBgUYI6G5IGNAwB+sG
	iL2yCw5pxVp/6w04gE3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkOh-00059Z-AI; Tue, 24 Mar 2020 14:19:15 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkOe-000592-Vm; Tue, 24 Mar 2020 14:19:14 +0000
Received: by mail-ed1-x542.google.com with SMTP id u59so20819555edc.12;
 Tue, 24 Mar 2020 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ehoOnX7cANRVwJFsnMxVRh4r6y5ZhsDcj+HsQoBA7+k=;
 b=DMw1BKgt0azEVcvVYUMM1IkV7V4vJbbF4AiQjha6peh3TlOebMmfm3ZPhdRYb8grnF
 CZzf0+AGl+SprOwNMoeDLN9U4c7Uz1aFz99MhqCPezI+SnIH6QankzBqanoEDdD8SKK6
 AnIcnrIn+joXS+F83m5TdbQhZpZ77Cs1WBoJCdZ0JXlg04f90b0SFshmAwhx5ompDdVE
 F7gm9WQVGNdvhE4qTCtU6wRRaQ53ZRWr4FEqpeMaqzuUcYHKoQ9/qHd+7UCsMXsDXcjN
 QMCgzI8IPVA/dhA4/7kVk2i331h9ORzUSCavNwrSWZMmYbhJ2IKONWu8xYsvNbBLWx7Q
 ZQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehoOnX7cANRVwJFsnMxVRh4r6y5ZhsDcj+HsQoBA7+k=;
 b=m+IN7+qCSSlqHizQg3fsqcNEiYeFuDEHwi6bNY2JKZR6b/5Nn/KO1qbZKV8P0w/iSa
 EZuvN0758xIoZqYr5O9W4HjYl231nRVMo7USHk/caDlseC23d96UWZq3LBKOKu7+MgyK
 aLOfRk2QFP3RaETTwwqprKh8fmq3aIsu/jZVSQuB8MZwEU6M+RzN+rOubcclffW5yh8j
 eGpC1X2YH/EwxXtYnxatLK3aj+cslZRPXgO6/8pn7BPvUso4SdbCq2yRkeMUrL1rXIQe
 Q9pux6STJrYrE5DelM6n21PTRYK5skelHDCXMYdONwoXO8iNAdkXC2HGzG3psSl1Lnpb
 8n8w==
X-Gm-Message-State: ANhLgQ2vSf1aLUMBMboLYUy+8WGJMmCj5q4pUHdTmSmm22xWK4XNsnrT
 a/Zl0sXTv1wAFX9Kaa5xCeaWMejVbmhEZgcXHEI=
X-Google-Smtp-Source: ADFU+vt31prwEca7GwsYh+geJS6aapO+qLf6iqX1sFmVz6WP6dYHwK3JRoZpOYFXuRR1Je8lCqAgLKZWE4TAor0WPYU=
X-Received: by 2002:aa7:c910:: with SMTP id b16mr7488409edt.13.1585059551514; 
 Tue, 24 Mar 2020 07:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-3-narmstrong@baylibre.com>
 <CAFBinCA9rQKWx47F2-dT4ZrCwSKW+LiwAH2VdzPKr-9ymRxkSw@mail.gmail.com>
 <a7020606-57be-81de-da2d-73d399853217@baylibre.com>
In-Reply-To: <a7020606-57be-81de-da2d-73d399853217@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Mar 2020 15:19:00 +0100
Message-ID: <CAFBinCDOrhXAEwPf4L8-5XoCGqDT89=L2CX2Qsr2J-1pQp6N5Q@mail.gmail.com>
Subject: Re: [PATCH 02/13] usb: dwc3: meson-g12a: specify phy names in soc data
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_071913_030599_214B594C 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: balbi@kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Mar 24, 2020 at 3:17 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 24/03/2020 15:13, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Tue, Mar 24, 2020 at 11:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > [...]
> >> +static const char *meson_a1_phy_names[] = {
> >> +       "usb2-phy0", "usb2-phy1"
> >> +};
> > my understanding is that the A1 SoC only has usb2-phy1.
> > +Cc Hanjie Lin to confirm this
>
> I forgot a comment here, it only has a single PHY, but still the 2 U2 PHY
> controls slots... it would need a large amount of code to handle this
> tweak, and leaving 2 PHYs keeps the behavior before the patchset.
I just reviewed patch #3 and I now understand that it would require a
large code-change
I'm fine with a comment


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
