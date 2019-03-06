Return-Path: <SRS0=k/HH=RJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0663C43381
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E78A20657
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHKqWqAW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pXwQEKe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E78A20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIaNgMHmvxhG1+1UFjR/uRFNAsUaay6zjLkv/bYPnn8=; b=XHKqWqAWLpprIN
	lGgRXNCy8eW7nfrB2BTMgu/jAnNv9tTegBo7j2feuB/pONa0bJu5hLm28L1VItUR0Ljr8r2cwGUsP
	9dRBueaQHwgMPd68mRVS9/i0gXY3mSHBmkSkkVAAayMdqyVI+2z16+N2h0e1Dqfs9kmg8BHo9wcHu
	27Hr/tLeldz1sYXitX+mIJaX6GcHadiszVVwT+IX8vxab24dYP1Y1OZD0WWYI2tuBB2oKk9muuaoR
	cUTzIUaxXDSrywC4YG9AfDNDsTUgW6xeMxf1un0GY+HEBzZa8biwjYboX3nOVtv3WU6HvfMV+uAAm
	FEByJTRYZTRXehaMdXUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1e4n-0007ia-2B; Wed, 06 Mar 2019 21:27:45 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1e4k-0007Z0-7m; Wed, 06 Mar 2019 21:27:43 +0000
Received: by mail-oi1-x241.google.com with SMTP id j10so11124790oij.13;
 Wed, 06 Mar 2019 13:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfnQYJ9ZYPWLDmoAsuuOz4MnfdiiAyFbgZYkpIctsQw=;
 b=pXwQEKe398p9NqTp1Migh8Gljfdn5LNtRx4dXr0nuLQROc1E31OvuoXH7S07gTUeoL
 iiJTkmo2r6FJTV5x9knq/HX4z3BkKVfg0EduNWmBmUzkg2M2+GO909sxK2aRS/CJwPZl
 wGEpKv0CrC9jtmX5x9PEAT14GFelVIWCK+10HDB4UAu8/AO5d6wbQUEo8SQ3B6w3XXni
 EO3cLROVeMse8e5XWkHnvjcW2kEmqwq8dBZYxbqV0S53F3yUp0xI5Smd2nlQC0xHs8gl
 BWwzJxJL3Rl4t4Tug9OIohi3H5jm8JnCc69xxiiIN+oNLEkELvHPULwwCUmSiQfs757k
 bdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfnQYJ9ZYPWLDmoAsuuOz4MnfdiiAyFbgZYkpIctsQw=;
 b=UDNyucjo1+9vphAFpL8CkHutcxqKkBLUrV2Dk+XLMEk6l2PkcWzeMEKk051Q11lG+w
 sSJBC8s2SI3BpF5G4JMWEkQ06aFhGvFzEtaDTdXFtoSQLbTN+TRt+N0UXf4Gc+BWFTTh
 uwKEcLASWBs1gt5Agxr4T30KhPWE5IJ5SLnzvSHqqzxYtNFN36q7LUPiFhBTrR6du6Kn
 LTzKCgS4GysFaKX7JZru8KNlvv/sIEprwEwmmuKHpXDVrOadfku7HnvJXxxCKHRW3nN3
 DeTDiXkyKwgRvRPJ0GRU/zBUE2Z72tjBcw1NqHoWS5cCRkgdbfPxtvHXVrfeaApaJT8U
 P35w==
X-Gm-Message-State: APjAAAVGTaPIr2ng2gLq8KXhuY8yfaOuAeqnXZy7MHzfCPKLQiZ54NkC
 GxmRVFfId/zdV1us/ceyH/TK9Ag6wcT3cJgAg7I=
X-Google-Smtp-Source: APXvYqziQVrcMvGA65w5hFphx3ZggVpQ+FudS9uwkIC3wb4hLSrfo2bAN1wdUmKmEpX565SFbMxTHS47D8NP85XV/kM=
X-Received: by 2002:aca:c286:: with SMTP id s128mr3047723oif.39.1551907660645; 
 Wed, 06 Mar 2019 13:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-5-narmstrong@baylibre.com>
In-Reply-To: <20190304103846.2060-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 6 Mar 2019 22:27:29 +0100
Message-ID: <CAFBinCDthrw1zM8ryLOV4FDVvZecG8q8hGnNJVy8HOjTQRpFzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue
 Bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_132742_309808_DC841BDB 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: devicetree@vger.kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 hminas@synopsys.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 4, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Adds the bindings for the Amlogic G12A USB Glue HW.
>
> The Amlogic G12A SoC Family embeds 2 USB Controllers :
> - a DWC3 IP configured as Host for USB2 and USB3
> - a DWC2 IP configured as Peripheral USB2 Only
>
> A glue connects these both controllers to 2 USB2 PHYs,
> and optionnally to an USB3+PCIE Combo PHY shared with the PCIE controller.
>
> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
> routing of the OTG PHY between the DWC3 and DWC2 controllers, and
> setups the on-chip OTG mode selection for this PHY.
>
> The PHYs phandles are passed  to the Glue node since the Glue controls the
> interface with the PHY, not the DWC3 controller.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +                       dwc3: usb@ff500000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x0 0xff500000 0x0 0x100000>;
> +                               interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                               dr_mode = "host";
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,quirk-frame-length-adjustment;
> +                       };
in v1 of the patch I asked whether we should pass the PHYs which are
connected to the dwc3 controller here as well (instead of only passing
them to the USBCTRL node).
we can still do this later on, the important part is: USBCTRL
interfaces with the PHYs -> that is already part of the binding.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
