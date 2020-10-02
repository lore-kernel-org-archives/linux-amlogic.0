Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1461C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B0020758
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIAuYbNk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Irswezj4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B0020758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqgm50KTS4l1PV8ejABGNhPxXv7tdO3Pt06g6Cy8ooY=; b=rIAuYbNkjhSGYgjNbvuA4bXS0
	NDA9Mt/6no39819S3ybTvctdOd/VZ/ojmo015OICIMfO3eH7wshYsBbOCorK7GaKUopKnrdTSgcBU
	MrHUHxo6dpDGoOtrcM7KgOFrc+v/qWl3DXom2syNn6Zk2mpDOqIZkcdinODJ5lhKilbGk7yXI68v+
	5Log2FipM5/umHC5Z3Yw1HbuBcWV6fcKQJe1/heoM6qTK5TPBEVpbYpf9cEmTE+RTCdEZva1vHnsB
	YcoRwfxmg5/PxsklOBl7QijsvTm90z1+98GF/wyqr8BE43IqBsemFzmxD9F0jIK1NgNxtecZ56k9e
	k+PN+EVgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOPim-0001o1-4i; Fri, 02 Oct 2020 18:23:56 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOPii-0001mN-38
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:23:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id h6so641858pgk.4
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dLt24jZaXpKoPfrpAQsTNoIii0wynpAMSCaMsOeaq/8=;
 b=Irswezj4+vTXLAGewGL2mUj0idT6ulXfb+ykyqeUCPq7sCA/aOBGuVzlRafWNEi1jL
 AhctfN4YLXT5o/AMzF/42Yfz0u+HXCrQXjM88bUXqvzqj1h9VeiXdpE8+bqcZhx3iPPn
 kAA4w46fJBE+Fs7Hylbxe7OcSDx7sK1aY6d1qQqcE5ytSZh7puRMFSPpeH5pIDQS1nbY
 VlTbvf49Tj53TuKeIrKX3gE3z2V8PC3f1qFbu6VtkKJUHqojbBLTWqxWmC/OFOuFKapy
 HIHpj6z5OcmWohPx20bCjgXy2dCC9WrNupkThuKx8lVmTPxHehGBSv6Dp5wpPoAT+cFQ
 5Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dLt24jZaXpKoPfrpAQsTNoIii0wynpAMSCaMsOeaq/8=;
 b=qTbXmV4sJUXaqFXA97wF23eWNaogzdkr2HZvB42kqyJbxJKs41xQwtxnB9xvFNIuPY
 jKnCf47eOs/QMTSCSbCllm2J+gYGw6Ueg6qRwZ8Rn7RiHZpiC0vkadiPv9ouewSM0NHy
 6LNE5ucw7FC4zdQudk2QY5RlaI1eWr8ozokI+iE7ABJwiAeRef6UW0Z+tNE7gF1CQomQ
 l7TXQw5yu6MgcpTimaLrMQ7yZM9ZCNcRq7SdMndSNLG4UlB9MpvRh+0e4of9Tb4gW54n
 +WP80M1E/UQ0DfFxNnz0nDoIZSQxbUEva0ZdTIJrDMYTOPZQwlSWpNh5vdzovUk4sy+l
 Z5cw==
X-Gm-Message-State: AOAM533IBZ7XeAXTQthFndC3dTHgfBUSP+v7+2k9jQ25y+ajNCc8r75L
 koQCAEDZPg4BmQ1J96vlxZDcfA==
X-Google-Smtp-Source: ABdhPJw+m163+8+A3NNIguhVHp83jAAmQeDChZRqJPzFkbCuCqkvLTCPyC93EbyZCnoE8aNRIPdUWg==
X-Received: by 2002:a63:30b:: with SMTP id 11mr1533550pgd.253.1601663027882;
 Fri, 02 Oct 2020 11:23:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e10sm2385564pgb.45.2020.10.02.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:23:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com, balbi@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400
 board
In-Reply-To: <30e2c174-c94b-f42a-1dd4-ae05c317d618@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
 <30e2c174-c94b-f42a-1dd4-ae05c317d618@baylibre.com>
Date: Fri, 02 Oct 2020 11:23:46 -0700
Message-ID: <7hpn60mqq5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_142352_241827_7EC945F9 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kevin,
>
> On 17/09/2020 08:59, Neil Armstrong wrote:
>> The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.
>> 
>> It needs the same init sequence as GXL & GXM, but it seems it doesn't need
>> the host disconnect bit.
>> 
>> The Glue driver reuses the already implemented GXL & GXM work.
>> 
>> The USB2 PHY driver needs a slight tweak to keep the OTG detection working.
>> 
>> Changes since v1 at [1]:
>> - s/close from/close to/g
>> - collected review tags
>> - added small comment about phy management in patch 3
>> - removed status = "okay" in patch 4
>> - removed invalid phy-supply of phy1 in patch 5
>> 
>> [1] http://lore.kernel.org/r/20200909160409.8678-1-narmstrong@baylibre.com
>> 
>> Neil Armstrong (5):
>>   phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
>>   dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
>>     Families USB Glue Bindings
>>   usb: dwc-meson-g12a: Add support for USB on AXG SoCs
>>   arm64: dts: meson-axg: add USB nodes
>>   arm64: dts: meson-axg-s400: enable USB OTG
>
> Can you pick the DT patches ?

Yes, queued up.

Since we're already at -rc7, this may not make it until v5.11.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
