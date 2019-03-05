Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1611AC43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D898E20652
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+++4CEC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MPR0IdkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D898E20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziTw6wUKKUbODfPQD/aCqLm1ZnL8ZOS6L6DxqYILcns=; b=G+++4CECcNyo47
	a8vmpVoj95ui88mIH1PbVOJfMDfrBItRcaxYuuEB1NAJM6COCjCLVhJKHO4u27C6klzWL1sLojmVs
	QBNwEDbR2SDu9iBrE1Nzdn2mxzVpiaowzWpvJMAx30+YBmfn/O8v/P8PGfU2IpMQWs7J/ByaxQQEd
	ClC84xdGP2NtGiSjXzJ9k9GSy8rRs5A74BF76KpbKvUd248Odcacs0MEmIWRaFdGgZLOonz5S+ziE
	Y4jgiClCssM/hzfvjq/9J19fCquu5xCQFs4njwwdt7J0Ulsp5ljomMxTviL1+4WYVvxz78+M5DuGN
	ENaADr8AAQx6mdQGKVUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1Hpu-0000tS-RS; Tue, 05 Mar 2019 21:42:54 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1Hpr-0000sP-Di; Tue, 05 Mar 2019 21:42:52 +0000
Received: by mail-oi1-x244.google.com with SMTP id j10so8081944oij.13;
 Tue, 05 Mar 2019 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOD4jyjI8RMFk80xHkOoeeVuPubtDARVBzjuJNAgK4o=;
 b=MPR0IdkGj4UN618A/kk4Ofm6oKt6cIm92w+9YkBPwuXZa4wTC8IMyFqc5VPGp1Djbs
 3HSn7GDs8RCcjspqgGIpCagtaYXUcy2ar4talSTXkCxTpIaMMjMp28QiVeMx8wY5K+dU
 m6iKCzn844MRmSZHacQv2tTyVxjlX8AGbrzxhK36UqcEtoqkoqxPuoiaD1hiAdw3tgu8
 eFkERHTFqfDA41me3AJcYLlvYhAhQqWssgiYaKET+fk7i5hEcZ20q2mBQtlgIsY/hQvD
 oVJj2QSOduixlnLnY6qxLD8kZxvDJ5tLcYwGDkwUA0OnIugmJovzhVmiB12KV4HznzhG
 DjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOD4jyjI8RMFk80xHkOoeeVuPubtDARVBzjuJNAgK4o=;
 b=MiN0Hhy/JQqUcuNldLrrTlbEyZyySgEd+vanC3tdBpiz3UaHHw4PLl4dwsOJRR0FGZ
 dAXa8KiLHU8YS93PJsez7ZZ/fPGMm2qbHGxbiFg8Qy6ZhS1zTl/1zfjgk8Lj1cxeD+nF
 bt/GwR/HCO0w/wjTS0dRZlEv8a8X8Z1dYNLmifxYtqu1415Z8Swrhvx9iOPO3Ll9KtR+
 uRCvTRNIuKk+VMOg2hEt8jnPWFqzSIZITpr3dFHBL1XoqLcPbQBji3n3Knt7y34Jx2R0
 T5serD6CdyBbxF+IFLF9KMIfi9O60j35ECu3psKn29e0JsBUSL4z4rgTUe31CLqfa8dA
 DY9w==
X-Gm-Message-State: APjAAAVn4CygGEEmATucNb3KGCMh9QWlW6VVn0ELV02165oP3wLoENLq
 LNALg4uesvDYbV6wvkJZI5+JW2VgtRYPsXUdLMA=
X-Google-Smtp-Source: APXvYqyksJ+0KlMrRx3GQbccih1Q/btUaH8LrNjn7p+luy/KhmX/NYYTT5zc0TpVuieiYusskOeMxSyLDsy/oMRuFAA=
X-Received: by 2002:aca:c286:: with SMTP id s128mr379757oif.39.1551822170308; 
 Tue, 05 Mar 2019 13:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-3-narmstrong@baylibre.com>
In-Reply-To: <20190304103846.2060-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:42:39 +0100
Message-ID: <CAFBinCCp+bME0fnWRJx0L1E5aazUh1Hw-svsP7+D_QU4dP08nw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo
 PHY Bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_134251_460824_4D9F0228 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Mar 4, 2019 at 11:38 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.
>
> This PHY can provide exclusively USB3 or PCIE support on shared I/Os.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> new file mode 100644
> index 000000000000..7cfc17e2df31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> @@ -0,0 +1,22 @@
> +* Amlogic G12A USB3 + PCIE Combo PHY binding
> +
> +Required properties:
> +- compatible:  Should be "amlogic,meson-g12a-usb3-pcie-phy"
> +- #phys-cells: must be 1. The cell number is used to select the phy mode
> +  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
> +- reg:         The base address and length of the registers
> +- clocks:      a phandle to the 100MHz reference clock of this PHY
> +- clock-names: must be "ref_clk"
> +- resets:      phandle to the reset lines for the PHY control
> +- reset-names: must be "phy"
one question on the resets:
- in v1 you had three reset lines: RESET_PCIE_CTRL_A, RESET_PCIE_PHY,
RESET_PCIE_APB
- in v2 you only have the "phy" reset line.
is this because the other two are connected to the PCIe controller
(Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt) instead
of the PHY?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
