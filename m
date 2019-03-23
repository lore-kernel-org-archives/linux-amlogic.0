Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F882C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A946218E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pEbKb/To";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gwWzqPth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A946218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeIdjU6hzSXyOGhzrEdRO++E2Dh4FO22xuwU2CoASoQ=; b=pEbKb/To8WGq/t
	Rf4fnTWB9/PvaoofzNqUr3uyYttiYu91rppuLrc4/y9hBSa6ApnIfNzTHBZw51xbNe70GUbz9ByIn
	yf8PkTAhTFvgxf2EV8xWI6tClKk20p9O7e2k35kFm6pxZSvsb2SEl1jqU02MgMirxEVGQyXua02Yx
	WE96dfYAuRavJsJzKNvns8kc5UaBteWRX+YqD+VS2ce40/jhEZLKWml6AHuyBlG4ZwI7W5QhqTID4
	XLo4SHH9/wp/WbziEA46r/60PXL1BGj+0DHiWyY9444T+V64vgF5c2lOJEmWsChYCWIC/tkP0Pp3U
	44Ft8SiFTcm+STyVsbqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7dMW-0000xM-1Z; Sat, 23 Mar 2019 09:54:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7dMM-0000mS-1b
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 09:54:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id d17so4810593wre.10
 for <linux-amlogic@lists.infradead.org>; Sat, 23 Mar 2019 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=LZsgGSRiHVyy8KXZJ/fdCilFLcMfaL3cQ5uUGgOqwJI=;
 b=gwWzqPthMGF5iL8VwWjX2OHhJ3Qk3PwMrb26W7wF9dTi25yk69buGl7f4n56zALRYp
 cut+Ts3UehrevT7n2uA9IaQQB6/LGuTMjU/8unRbBiHosplc5IZOfefn2JLr+g9Qy6BJ
 K6CntA23O2reHQxXjFfco2dUH7/X5pGOE3JT4AVYSL63+wBurKz6mC2BuYPiyVQs9l5I
 lHtGW4sD9GcUfmQfst/oT/GEFcNGLfT1EK7KVoQrWTnBmXhyr2D0nxwOq1BSvz8eohm7
 OTRFIWjUfM0vyTBHITL2jnwBV8S8uOslkQQpOAEGlRSjD9ZrZtYd0EZfY+630ueA51GS
 S8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=LZsgGSRiHVyy8KXZJ/fdCilFLcMfaL3cQ5uUGgOqwJI=;
 b=oWgRQ4hlTcvxxC+7U1AcZP20JkvXTAOh4UxUB/L9MkwskaFKS02tPLKZmYOgeVmgFm
 ROIc7YMvqEkenxDdct75xCjCyKFKxELm36BkD7C6Ai9xbMOmpmAlprjDTc9tlDi+Gy0d
 quHzn9FvpxaWWhmzkJ+YcE3GVDyXGONvEXOTpPAGfR4oYyrimSuYTUX/uqm3cPMWUH3/
 uSWMozFFUpLDJvrPKu/QHZk2ZtbtJfw4EgwxhoECH0RZy+Ce021ffEOuvYq6ghRJ8cS2
 TbhZKw+q6kTUcgHLCtLS9MWX4pdgibDlgjggIAPuppKwf1hZJtgQmVLkb6G9niGA6w+K
 qs+Q==
X-Gm-Message-State: APjAAAUK5xIOORc5EcIOL9PRcMaW5zeE02zn7hyrwZvjjTfQVp3vsaRc
 A9Kia66xkhStV4ecF8YKSXE8Bg==
X-Google-Smtp-Source: APXvYqzNfmI8LIiM8dY3YDPviN0ndzEyEqvMoyppacfjRNniH45/uAfKJG6xhMEfH25vkUdKxHV7VA==
X-Received: by 2002:a5d:428f:: with SMTP id k15mr10084894wrq.113.1553334876368; 
 Sat, 23 Mar 2019 02:54:36 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id w9sm5704710wmi.0.2019.03.23.02.54.35
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 23 Mar 2019 02:54:35 -0700 (PDT)
Message-ID: <5C96025A.1010005@baylibre.com>
Date: Sat, 23 Mar 2019 10:54:34 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
 <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
 <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
 <7hmulmzcsi.fsf@baylibre.com>
In-Reply-To: <7hmulmzcsi.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_025438_084712_FBA2BC25 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 23/03/2019 00:53, Kevin Hilman a =E9crit :
> Neil Armstrong <narmstrong@baylibre.com> writes:
> =

>> On 19/03/2019 22:41, Martin Blumenstingl wrote:
>>> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
>>> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
>>> was fixed by adding a new (typo-free) #define CLKID_APB in
>>> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
>>> definition").
>>> Now that the new #define is used by the driver we can remove the old
>>> one (because the old one is not used anywhere).
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> ---
>>>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bind=
ings/clock/meson8b-clkc.h
>>> index 8067077a62ca..cd11628f50f8 100644
>>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>>> @@ -103,7 +103,6 @@
>>>  #define CLKID_MPLL1		94
>>>  #define CLKID_MPLL2		95
>>>  #define CLKID_NAND_CLK		112
>>> -#define CLKID_ABP		124
>>>  #define CLKID_APB		124
>>>  #define CLKID_PERIPH		126
>>>  #define CLKID_AXI		128
>>>
>>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> =

> Neil / Jerome, I'm assuming you will queue this via the clk-meson tree?

Yes,

Neil

> =

> Kevin
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
