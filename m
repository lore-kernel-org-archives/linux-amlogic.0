Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4B1CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFvS9qEJoGF8g9IQCS5fjInZCZn2YGzvLMosv1KWTCQ=; b=Frah1en2yzTW1q
	snCejHRGwgkXqpcVec1mbV6p6TUHEvZHau5Wb49phgr/XsFU2XcfK8o4i9dwptuFvuWAbYLWCHIdC
	ZV09AzBXypXOQxZjDz0Lbax+DbAj8SNExfFgX1zJDakUklPRBqFQLUPH+Zr3JJWL3zBXVjg10ugid
	1DIcMMzdXe39eAZcbN9UmZT+9wLB+En3HKL3DV4GgeZQ+jQjwVLwRmxRmsEnh5IQrWLJNM2kdfjn4
	3aCh0SS/PgMtjXngI4yXgQf0ymLSCyjA7A1gFMN2Jthie2w8wOvZUP4psVfW/S7eVsIAofFwRmJo6
	IMCBDKcp1qEDIz/6DVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlQy-0000000GrTN-0kn5;
	Wed, 17 Jun 2026 08:15:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlQw-0000000GrSf-1cmP
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:15:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423efd76c8so3852117b3a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684137; x=1782288937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=KL7dKk8a3JwkJBVdAGEEg1Ki+zfel651l4/9CiK5fC6dPeuqy36ZcFqgD0oJGmuhjK
         UbUYCP9vcOYLqBcCzVkMs+aOtJwJpn/Y0B1Tfk5/2OPgOeESdc4prhZkhko1rPCWmA94
         0xwIBq1iTLQEpvcCpAvwuD96nb7nDZcmCcaj0xEvtoIsDu9BWZ8Ho0fkxXp8w3Zk53gM
         J6CSOsBM/5y/r1n1l6/fjr+cGsqggvfujbXRgnpnweGd2CqTpqZrwIEteAAl+iGFr5A1
         1MuvajiXooLvsdDDrliOa5jQjuYDy+JuzV8+sHKdVFncglgssqEl57FWbvTu/gIYD4F7
         1dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684137; x=1782288937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=exDWfHAw70Q5RS+T4wXLBafGn9k2HhRBQ7Z+pLYB4xJ/g8PYiZcMgtxaME4tndMXKI
         LS5E+axJ3YSSmHSsBjpXBxS7gKFDlIrX1YTcoAhG3RwiKWozSwNU2u3oL8QKJwozLJfK
         LOgRlDV2pxt+b4sa0fhOuRXSgRP66EECo+Pbl+oBbCxabjKxKDPLVMEj/1reqb1Nlsnw
         wOh6iBL75hegk8m45P/soZYLVhizw8kCo3kilAfaW0K6DjrLDuEWpa5FNZ09wWZ3EJ4X
         lXGFcj3nMYC+XyMqYiCPMuzE2DRc/hNhZKajp9qL5MG9pwA1DWWrU50zKgSLwx0+bBrZ
         /Kwg==
X-Forwarded-Encrypted: i=1; AFNElJ9+CuI+iOGEcofzkTfkHjLd5+o/ZZ2+lVyFy0pXchc9FJfBW+93hm5aRNemD8WjBbVxW6srU2KDhVK0XKXe@lists.infradead.org
X-Gm-Message-State: AOJu0YzJrR29Mg7gwbWHVtsjHWiyAxelxAQqsPEQuou0ynYb0zBmBaDw
	IdDHgOD7g52hvEcgC2Z0Zl9PCnFI9bXb23kvCDlcz6E7ZdQIsRR6BwfI
X-Gm-Gg: Acq92OHsXY9wev7FOEboDSejZCHW9WBHf/ku83RHRtKawTZSBu09wtBXqvVe8qk50BT
	AD2X2Uz+6VwhDPJsaD06rk4EGKwiKzRfHtKIMzSOY7kQjsPP3R6jANn9+tVitbW1zc/gD6ROm3A
	Z2ij+qD9euGI/aWUQSNMdOxSezxDio3TXUlMKYUWhWkpYZZl/OLo517Wfu+JuEV7bXbK6ppfwPk
	XcRuWf6noJew0sQ87cRqB5yqtoXr/XAHcZYisugbzCV11ll03No5bpa46k21CUP+mEUjzHkdtXj
	s7MVR0fazjEmKoM16OpLpnRsHhc9BN4nAx1kzGJ/7Xh/bLQ+D+qsMbATrN/F30/Smo8pHupLWqL
	1VN0dNfS24mRrvtg2vEWBcsNuBgxqUEiiTTEQtGg6Jds4SrAa/REMm8l5vq8m4UdGPXvgfR71j5
	PQTV8VsON7bw==
X-Received: by 2002:a05:6a00:99e:b0:842:6ec3:2352 with SMTP id d2e1a72fcca58-84524484febmr2781503b3a.18.1781684137489;
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c474sm14054459b3a.2.2026.06.17.01.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: neil.armstrong@linaro.org
Cc: avkrasnov@salutedevices.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	jerrysteve1101@gmail.com,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martin.blumenstingl@googlemail.com,
	robh@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Wed, 17 Jun 2026 16:15:31 +0800
Message-ID: <20260617081531.644109-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
References: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_011538_429791_0540D93D 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> > The meson-axg dtsi now disables pcie_phy by default, so enable it
> > for the s400 board to support PCIe functionality.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > index 285c6ac1dd61..7ba249cc3d56 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > @@ -448,6 +448,10 @@ &pcieB {
> >   	status = "okay";
> >   };
> >   
> > +&pcie_phy {
> > +	status = "okay";
> > +};
> > +
> >   &pwm_ab {
> >   	status = "okay";
> >   	pinctrl-0 = <&pwm_a_x20_pins>;
> 
> Please squash this one with the previous patch

Sure, will squash with the prior patch in v3

> 
> Thanks,
> Neil
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
