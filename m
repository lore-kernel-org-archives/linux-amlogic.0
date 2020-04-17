Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79738C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AE72220A
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o09JF+M4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LH7a15W7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AE72220A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fALoux0sEHWD3Y+XNWTgBDNp5WsKDB4lF5ooiAAR7R4=; b=o09JF+M41lTUuY
	vAYSxqBT0LSQXJmHMK6TNKoG1mAI0WVG0GJ7IU7Km4L83uVc3HmdgiDg9E6qE7HIPDl4Zpr5Pv4kU
	CT4gFdroqS6atUfPkkbPf/WkhBxrXdFFi16dFU+gpgY+Rimt5g/O9uyfByU95s/Xu3ZBcTwHWvNyk
	tPd5c7wQbeJWbav25fzW5RSyCDzrzXwg2cqHpheoz4tusojwB0h91NjjUX9iRJmyPFdhXW3Q7Dg6C
	2iRH+Puxat5gNCgWaETaZ1BbjqgTOmgfDZB6AjATYeJoji32RfNrs66ROAHnEq3NfRF8xvWr4ZeD/
	n+E34a+8CgJ9jkF0dfZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWAj-0002jf-Mf; Fri, 17 Apr 2020 18:57:05 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWAh-0002io-6l; Fri, 17 Apr 2020 18:57:04 +0000
Received: by mail-ej1-x642.google.com with SMTP id re23so2334442ejb.4;
 Fri, 17 Apr 2020 11:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+2CABe3J87oGmGpGl7GwWQxi2qTyg12kyqBFsNfaKsE=;
 b=LH7a15W7hJM2SMiwrvKUtxmpOmy5YZ8zKeTytb3wlCIWmdcsBsacigCzJOC50Y3R2X
 wZxyzg6tBnruIJvdlkxMBP24IsBy7vRnEs6tcFsI0MjiENUQpk6Hr1ufNCdeUMI4CHJ2
 dKKH1+J1HjX/VURqfWfTUXmlvvQHgxhCXF4gjYAY4Iidu9sRZPFs1kslw/Lvfp7vsIFo
 ZS5YQDztSa8osx/j0GI340HqZ89y5ympFULCZlVSB0azc8wUhyPAlv5KrtFI8seJ7B3f
 UOLmDiSCTUl+9WCLuV2l6MG5WzmG8Y1AcuyX3Y40rS8PYfi+22u8GUCifnYAiGOxS6xH
 qSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2CABe3J87oGmGpGl7GwWQxi2qTyg12kyqBFsNfaKsE=;
 b=dXmXIEJbvRR9cuN0Zd3ib5Gc5gQjDIOuQ4yqJbVMIuyZ45/KvBR1dwaZwsjmAqdI4o
 nzjwyXA0VRE+Gaow5ihUJkWsm4ytbxiBZUs8BexKNwK+uKC0X2/fR5IefwPTVyQK8szn
 3noc3YlXbrDvS77d9oDVUYzIWQ3ZrL1dezT1emEKT+FpaAKkjMtY+Rxm1e3IZWlJ9L1v
 euw8ORijULgLAdyBR44yKeiX7vm8hZd56mCEmGfSZ9M/3q32Z280MWPhe1Kf0Rm16zJJ
 pdjv5O6fR0iBvvg4NC7Tz0GPpviOhCZvo08brPS5p2KP+DdfHzxpqAFXhCcYKjD9cEuZ
 dBOg==
X-Gm-Message-State: AGi0Puau4nrSrZ0MqmcMNWUoX4io0xKlxWGx8wlJ0KQjfgZ1jHbmVdxX
 PuCEqHO3OxyrjeoFPTJRzkozvuhOQd/AneXrPFM=
X-Google-Smtp-Source: APiQypKzHWfnTx/hkbe2s0PfVHV5SSdTQJcOehGIUm+PYQs+05JqmtPuZ9jbqfFYl2MaC68tKOT+e3S/nyKHvhp9R6I=
X-Received: by 2002:a17:906:1199:: with SMTP id
 n25mr4615915eja.30.1587149821543; 
 Fri, 17 Apr 2020 11:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200416121910.12723-1-narmstrong@baylibre.com>
 <20200416121910.12723-2-narmstrong@baylibre.com>
In-Reply-To: <20200416121910.12723-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 17 Apr 2020 20:56:50 +0200
Message-ID: <CAFBinCDoM0d-5czQ4-FOTMPFN7r2FSSsfn9QCxF73GrEUsC7LA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] usb: dwc3: meson-g12a: refactor usb init
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_115703_243102_77C4506B 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:19 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Refactor the USB init code patch to handle the Amlogic GXL/GXM needing
> to initialize the OTG port as Peripheral mode for the DWC2 IP to probe
> correctly.
>
> A secondary, post_init callback is added to setup the OTG PHY mode after
> powering up the PHYs and before probing the DWC2 and DWC3 controllers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
