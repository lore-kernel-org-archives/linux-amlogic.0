Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34B9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF5D20685
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RPXTHvei";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lQE2W46i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF5D20685
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuVVdwwo+oc8QAboAXF3bLm6DAHE/mqYBykQ9aWIc3M=; b=RPXTHveilVLnnj
	w+BvWnxCCg1ZW5nSDBxUB3xyK9o8G3VmLvAKAo7J20R70pl6B1KB8N9W2NZqHgWuP2btqYvtJHHiu
	0N/pn9c+Xaz1CqDGZprN027a2JN7KagFurO2yzFKVxYAIkQ9O8BD31SdGAeOlh7bshZcxIN7M/Qyh
	bZ/xjIq4Mkjs5m9FxURqVWZK6P4pfbf2vY+SaeeTxc8++UwUv3dHusIrDPgE1yPkp9pbvkL+2TXRP
	eCpcsw99hW1PsR7mBa8n8mzQMNcMukhMAtx7v/mVCjYYJx0HiVZsgEGffutJCunvfMkVOAWfLuguX
	JoL1ubWJj1o/QXaiyqkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5y9Q-0007G9-Hw; Mon, 18 Mar 2019 19:42:24 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5y8s-0006V2-MM; Mon, 18 Mar 2019 19:42:21 +0000
Received: by mail-oi1-x244.google.com with SMTP id k11so14068469oic.7;
 Mon, 18 Mar 2019 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M139LBtlkNrQR6u9V/xwOU9GjCtoAeXlSSkK8+ntcTE=;
 b=lQE2W46iJf0QnJmPvkcAeS0bcn8HU/eQoU1uYCSye2F1xkagCnvS/qmLd1nUPmUjx1
 f28ns82LbDnNl8T/l/tw/UbWhHr0oSQpfTGjFm5CZvUWt9mkvpYIvFSDsxPBO8ug82jl
 4f9+C7uMOawkm4xGdgyjgDF8ZAUlA+vRRpGPz52n7+/CbmWQPCEJvnaxsA7MbfpeuHFk
 2+mDVMA6ugFYOGrxcF0jWmKz5h2MkD4Nif1zdoB79reTVDvfIEGYnCCP45M+rySGSvXI
 qAMOH7V6imNTVxhjJj9vHtin+jMWEVeh/Z90FcxfIY8GbTA8Q2GA7L2rcJktZ8uVn/Kd
 Uh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M139LBtlkNrQR6u9V/xwOU9GjCtoAeXlSSkK8+ntcTE=;
 b=eltZlzHuHBlMt3kWtRZt1eZwtyAwnFJOUXMxVD6JUkjSvKQ4UenrRZPu4sF50B3L5l
 3rxoqtgik6Vj4al+LNCSFz9fmCIH5S5UPAKujJcUoEGmV0W3VCrIbASxDlfFjR8Je6On
 FzodVyn6UYWFrIkbGak4rZyXO90lSFdUtNP890DAkqFtxdAyqu2qtWX/k8jP3E4OYgwv
 JPH+TCSMlc2npUAryOPnTDcahh7CrvZjMEp5mxWcBovJJsIC1yijTQIEuf5JEtmaplGc
 taqYDGAMSBiDFfWTeCgOTYLUxuw51kQHzn3GQTLgTESGVCpNxuVh4sX0GyFHeonJAzp4
 qF3Q==
X-Gm-Message-State: APjAAAWIycQJuS2jja3jqA4fFmXc1ASqec6X3W1psaNgml6Xgm7UkMDm
 3P3zLdM5ZDvmNlwujFBiF97qxCA0G1JqOBRWtQQ=
X-Google-Smtp-Source: APXvYqzPsZ08jUobF4l6lHBcenCpjNvX5aFGpPo6j6bHgO/RsRvZ7GknFMisfezHgYoA2gNtyKtHGyoGo5PQ9cl5U9g=
X-Received: by 2002:aca:a9ce:: with SMTP id s197mr361423oie.129.1552938108945; 
 Mon, 18 Mar 2019 12:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190318101153.7531-1-narmstrong@baylibre.com>
 <bb77c909-c19c-00e5-c5e1-25215b5a4c3a@baylibre.com>
In-Reply-To: <bb77c909-c19c-00e5-c5e1-25215b5a4c3a@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 20:41:38 +0100
Message-ID: <CAFBinCB-pLk+U1EWJ0PpdJTRteHQvrRVDpNY+QZ+2N72kKVKGg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] arm64: meson: Add support for USB on Amlogic G12A
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_124151_224186_E74BC01B 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 18, 2019 at 2:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 18/03/2019 11:11, Neil Armstrong wrote:
> > This patchset adds support for USB on Amlogic G12A SoCs.
> >
> > This patchset is composed with :
> > - bindings of the PHYs
> > - bindings of the USB Control Glue
> > - PHY Drivers
> > - USB Control Glue driver
> >
> > Device Tree nodes will be added in a separate patchset.
> >
> > The Amlogic G12A USB Complex is composed of :
> > - 2 USB Controllers :
> >  * DWC3 for USB2 and USB3 Host functionality
> >  * DWC2 for USB2 Peripheral functionality
> > - 2 USB2 OTG PHYs, only a single one will be routed to either DWC2 to DWC3
> > - 1 USB3 PHY shared with PCIE funcionnality
> > - A Glue to control PHY routing, setup and OTG detection
> >
> > The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
> > routing of the OTG PHY between the DWC3 and DWC2 controllers, and
> > setups the on-chip OTG mode selection for this PHY.
> >
> > This drivers supports the on-probe setup of the OTG mode, and manually
> > via the USB Role interface. The IRQ mode change detect is yet to be added
> > in a future patchset, mainly due to lack of hardware to validate on.
> >
>
> Resent with USB2 PHY registers documented
awesome, thank you very much for this!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
