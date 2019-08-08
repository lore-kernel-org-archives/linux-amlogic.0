Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B823C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 19:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A6821882
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 19:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WgmYPnhg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="t/7RSpYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A6821882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSFHC6gaDT7H5NBjUZak4FJ/7zDsdArJd2BGMo7KHWk=; b=WgmYPnhgQNLGW9
	QLW1LwSybSD2V8AFsZEUBcgWlDshCvL1dsi1ZCtpN9hcwb+d6mH2GskE69JrnPaKXpTmiRuFeLphm
	kd2pqVNdh1Jy0od+lf86CLee/oNdjKSDLXGsuowoNatek/ZmFQ6I2Gptt1EP5Wikg1/TlPaC0Tl9k
	EiYCI5XPNutyOqIZr9m7dJgrQOHqP1YQGA8ROPaXDU9ZXElR+QQzymEei/wtCrrXQ8g2Lrz8tx0Y0
	wM4LH6HD5Zws81iBmR50rR4+FslR3BWv0EQtVMMq0NmsmJumvOqwdlvVGlWCFcDJqCnB1/aJFLgB5
	kNsN0ZyPSczaG9EKc6mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvoR4-0004ih-Ii; Thu, 08 Aug 2019 19:50:54 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvoR1-0004iH-II; Thu, 08 Aug 2019 19:50:52 +0000
Received: by mail-ot1-x344.google.com with SMTP id q20so123341165otl.0;
 Thu, 08 Aug 2019 12:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emp4LKrOwlvn9H3QmUc01UuAWl5tSDoRJbMuuvNlrME=;
 b=t/7RSpYR2HGgbRiGdk0CajkHX9bGeXcBLovq8VvOSE6x2wgw73SYyiwvEKrgbTG7z5
 yBSDk5KRn+FWG5gWjSL+sV1xWHF01X/SII/V8sVog7DexMmFSYavR5WB76ud8vP+U4sq
 RHTTMXYKn0eW2/Lm/T73ZDd+XEN/1aUdFri497UIsjuM73EAtAATTFRqS05IVSTfjdi/
 FBdjAeI/ZwrZPRZD+t6XTbOtu7T9uQBGeZPAHhkBg8vp6PcBrzY3UypzqNGTD0OC4iHh
 q4mCA2vZ9f06FgWkCStM3wzI/1kb2bobpfhVus0MZM+eyngDpYVvaHgv+VTuZOZ0J9j3
 HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emp4LKrOwlvn9H3QmUc01UuAWl5tSDoRJbMuuvNlrME=;
 b=a6glOoxolvYXbomHhVex9RZ9vzqvbMxjCl2/L3q9+qowas9Y/dybRDxXAq1+lHhuls
 2yRhiHP7hzJUpm905qdYzPBcVsjbeacb1F1oiqCTBNWi/jj16rHrSQpaqPQIe8DB1mx8
 as2uZ92OXZxb7G8avBNCGT8fBkZ1tRQnrGdnIJQ5v91bltzr++AKAKstth6bAZmEkj5T
 Wz2T8LwJ9W7qFlzz6po3P4rKyjDmsTd4n3YjQ/hBeGva6ZTRw5BGA+RvuSCSUiOgNPIl
 CgfU691maDzQm8Ou9/nx/YEnoNEKTcZWDkYDYl82lhkqQEiFpflQc198C1PqveFyPwpz
 hH5A==
X-Gm-Message-State: APjAAAWdiBAI1dccyNG6jb6U3r+PLV36o6ws4hE5SDzJS0Rn3Wh080qf
 6CbLmzaMXC2EnezLPioIhMdVsJIc4XOlhI2XjbE=
X-Google-Smtp-Source: APXvYqwtQSZ14JChR+aroTklLVqzb1JzZPf4gpdcL4naxp+vaCBOQQTVtOAg7FG9u126l+w1dFP3b3tumbn2rLG+u7c=
X-Received: by 2002:aca:4ad2:: with SMTP id x201mr3968281oia.129.1565293850466; 
 Thu, 08 Aug 2019 12:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085139.21438-1-narmstrong@baylibre.com>
 <20190808085139.21438-8-narmstrong@baylibre.com>
In-Reply-To: <20190808085139.21438-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Aug 2019 21:50:39 +0200
Message-ID: <CAFBinCBnVdTxWgqmnrPo-5uZ5gxy7p68w0PUa=_42fYxhVrDXQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_125051_602543_E2E97ECC 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, kishon@ti.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 8, 2019 at 10:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic G12A USB3 + PCIE Combo PHY over to a YAML schemas.
>
> While the original phy bindings specifies phy-supply as required,
> the examples and implementations makes it optional, thus phy-supply
> is not present in the properties and required lists.
nit-pick: the original bindings didn't mention the phy-supply property at all
I'm not sure if you have to re-send it, maybe this can be fixed up
while applying?

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
