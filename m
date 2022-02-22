Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4803FC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 21:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kD1eCsb8qwiMT5TOOObLrHGvEn66VbCb7VcQ9p3FA3U=; b=ra2YEZK1FBs7K5
	ESq/HoU2sKug7eWwNXjq7BLZv9/N8MEAQLKKLlUdr74XwKKQ8yHiwK7BJ2ImdtGa8BDvZpPZgfRjg
	V2x7golY8BLl2DjU9d+yeEBaXbLM2Y5jXiOFh1xt3n8QKD3/9dVgiHM2FUtb10wYXuCVeBvcIfNeS
	8dTLfEbcqJXMjOJDFwVQsYNuT/5LVKFDQcnld7VOWPJVOr50R+NWkK7HGJ+AojP9OtmVSumsmWpMF
	tQw8VSin9SFC7/WSK/123R8Uv2Dn06FyZ+1d52rlQel5wXWplD8gfwXDvehcjl9f5iWJogDgm59Nk
	q2UPhN9Ish1S2TJyBSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMcTI-00Bcwy-5g; Tue, 22 Feb 2022 21:13:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMcTF-00Bcv5-KZ
 for linux-amlogic@lists.infradead.org; Tue, 22 Feb 2022 21:13:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id hw13so46517385ejc.9
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Feb 2022 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=/UVTg6ym+wu9jzepT3cb2O8j6NvUXuijL57PItWBk50=;
 b=jWNA1H4Y5JPtGs5FQVFSQQnNnNe0bepg2GhVIf6TiRlbjYrQUIXrPMJQJcP2vlrkfx
 Vhfyx02oWb5T7ePQvSPm99OF7uEBhka/A45e0VXjLT/F3UVKDfXqdEwn2MoYO1GPESSY
 UT/UWhWwbCDayXZ+oi6aga0sOJ1HA8nURknw9z3rynOvjwSSewJX+pdP32nQgaVPJHYE
 jE7Kw8cGUCCPJeubNe19W+V5p/zwENLj9Q/dFRi2X0bECum3hs9M0d3yIg0rsBsBdlAq
 83Cw25JpiWVeD8R4r1tnkAPJZAVeIs5bDrI+t33tihRpeh+P6MAcFKlcH+41hw+AaQmA
 O94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=/UVTg6ym+wu9jzepT3cb2O8j6NvUXuijL57PItWBk50=;
 b=0AbV615ZkvMtwGYE49qCPeqtoNlwuY7DWtF9RY9HYnmLnhuHvrfSoVEEdOoPEWEnoV
 +WDa+h/oBnEWZKekdTVT31Sg5vtnutblrZ7v+v5XauXOgdZkzpBW0WAm9C2VOBBnG8jJ
 PszbIahv3v8gRUKcRRUj7+u1a+Zz2lG41WaTgwiVaV9gMWhYGL3Y7+tUpcTCYmUobMio
 gPT6GuE57s4fdi/JaPdEwQkRjvSKs72xNWSn1Tu1mKtT52bLEDOz2x70IUKZfyuLfxdO
 kfllt0aH41uNspe6luNw6KdaDabjlAcI01vQQzvqDhLTdFuOTrRgOW5tx5naV01d3YNH
 ku/w==
X-Gm-Message-State: AOAM530rJwAHqABPTToj31YrZKBxxuLz3wypajYGv8UyN1/Ak9aAakik
 v3v1ORJlUIagH9Dh+1SOwWo=
X-Google-Smtp-Source: ABdhPJwWnObm5G5mw2T9O0rJUldeQMy+wlLaEVluu4o/tBWF7Vd1JjaCM5HpfHQD67SbZqbvLt0HSg==
X-Received: by 2002:a17:906:a1d3:b0:6d0:80ea:2fde with SMTP id
 bx19-20020a170906a1d300b006d080ea2fdemr18300975ejb.344.1645564394493; 
 Tue, 22 Feb 2022 13:13:14 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:9cef:d49f:b9d:efeb?
 (p200300ea8f4d2b009cefd49f0b9defeb.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:9cef:d49f:b9d:efeb])
 by smtp.googlemail.com with ESMTPSA id
 kq17sm6662098ejb.205.2022.02.22.13.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:13:14 -0800 (PST)
Message-ID: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
Date: Tue, 22 Feb 2022 22:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: core: improve handling of hubs with no ports
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_131317_730572_F9C66419 
X-CRM114-Status: GOOD (  12.81  )
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

I get the "hub doesn't have any ports" error message on a system with
Amlogic S905W SoC. Seems the SoC has internal USB 3.0 supports but
is crippled with regard to USB 3.0 ports.
Maybe we shouldn't consider this scenario an error. So let's change
the message to info level, but otherwise keep the handling of the
scenario as it is today. With the patch it looks like this on my
system.

dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
xhci-hcd xhci-hcd.0.auto: irq 49, io mem 0xc9000000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
hub 2-0:1.0: USB hub found
hub 2-0:1.0: hub has no ports, exiting

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/core/hub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 83b5aff25..e3f40d1f4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
 		ret = -ENODEV;
 		goto fail;
 	} else if (hub->descriptor->bNbrPorts == 0) {
-		message = "hub doesn't have any ports!";
-		ret = -ENODEV;
-		goto fail;
+		dev_info(hub_dev, "hub has no ports, exiting\n");
+		return -ENODEV;
 	}
 
 	/*
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
