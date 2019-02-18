Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7F9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 14:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6B821901
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 14:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMyk4nCT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DNzyc+qY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6B821901
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ppnPq+Sq0vGMCbG/OD+jfyK2+YdhG2eWzrdj/5+cllw=; b=SMyk4nCTWeh13B23czt9gji8uD
	CArD8/A116HcBWLstpSzpmPgrWaZtn6A7zlmiyw7Uj4PoUKqJj2PxVGs0MPZTieOEZfRdfjybDQrE
	vtpPf4wnTo41XTfuJDvL9ylEtGOYqW41TN3IWRUXPNTzHRDK4JZ9htAouMUSekTPYaKc/2QBtEU9Z
	yP//95ACfNhxMezH99jG0LFXa5TKqK//490WfAmT8n7C2FS71tSRvGyWKMXFOaYnvLraFfKh/sXil
	Nn2kRoLZ9H70SVRlA03pabjp+sMnh+yGN3sgYXNlv3I3j10bSIJGZPFWUIgWzeRjSje+W/JlXGGGB
	9x5Tja2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvjbK-0001Vd-LC; Mon, 18 Feb 2019 14:08:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvjb9-0001Jx-Fv
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 14:08:46 +0000
Received: by mail-ed1-x541.google.com with SMTP id d9so13885801edh.12
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Feb 2019 06:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=gFO8LwK33ywbW9SIa15Cb2gHG5oozM6OBAvVIPZVXeQ=;
 b=DNzyc+qYAb0NALeJg8RzVLqy5pj2aOWYWpkgh1UJ75D0mESwiTMtROi3ixJjqTPXgs
 VeRsa5L7avUdKK1tal1QfU61H8ifm6m51boKWdKoYDnEWmNsloICO2Vpm86J0eiGCUeY
 n9Mi2RwB6INJ/TVB8wv+hhPNizbA/eIruGJErj4amKoHGCpc3U97kMAlix7KAtYnzBwB
 gsC1NP5118CAiIHviDvpcjV0a2F4XvP1bkctr+D9jejS9NZjliNxCAqgBiNDZXsVtxIh
 W4CRh6NlpS4djp47IcObWOS/rfu28g2TO3oBZHS3PzN1yah0rakfKdtOSaN5qSeshENr
 O6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=gFO8LwK33ywbW9SIa15Cb2gHG5oozM6OBAvVIPZVXeQ=;
 b=MotsnwTP52PmEgTzs6CV6ya5CcNKeIEyVfnB2aWrCH5hwn/xADQ8b2sqkPmi/MWXb1
 0gNYUMSMoEM5RCtEn6Ljj93A7eQU6ij8dXxHm5T8uXRdK2VJ/9sZQuti1JUs5fLS2CP6
 njEJWWjxNL2PaCM2MBvFKsP80kxjRYirNqUTa/YzIMatmwqHZI7qSYeesBnFNl3HHi1W
 zBbiKvQu0J0bi9UeT82Ng8FvIreRLLWIElxQi9voheUmEPFomp/UDZ9fHdPJ2A/7i+J6
 6pLxDB1CzeOZqOVkAAwqeGFRKh17FY09gCRZyISScqqrWBVN0oqKsbsi7e1dcgapf91v
 mtJw==
X-Gm-Message-State: AHQUAubk/4MS6Dqf+BOdwj9NsbdnlBM+ENp5z15JfzALyNiLFl8Jrtno
 M1k9JuC54E9Y/YKsJ86kP5q6gA==
X-Google-Smtp-Source: AHgI3IZ7ok34FpI0tRYpAXVimkuavzpjqGgMrAfeBtgkLwiOqtsdEYxrS6H+LQDmdFWUDrZAitMD6A==
X-Received: by 2002:a50:9927:: with SMTP id k36mr19279800edb.31.1550498921640; 
 Mon, 18 Feb 2019 06:08:41 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:3053])
 by smtp.gmail.com with ESMTPSA id k4sm3094441ejj.32.2019.02.18.06.08.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Feb 2019 06:08:40 -0800 (PST)
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
 <20190215160457.GO28278@localhost>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <20190215160457.GO28278@localhost>
Date: Mon, 18 Feb 2019 15:08:38 +0100
Message-ID: <86k1hxur2x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_060843_584379_04789454 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 15 Feb 2019 at 16:04, Johan Hovold <johan@kernel.org> wrote:

> On Wed, Feb 13, 2019 at 04:09:27PM +0100, Loys Ollivier wrote:
>> Add binding for Mediatek-based GNSS receivers.
>> 
>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> ---
>> v4:
>> Use standard names for reset-gpios and gnss-fix-gpios
>> s/an/a UART
>> 
>> v3:
>> Removed the I2C and SPI interfaces references.
>> Removed the "mediatek,mt3339" compatible line.
>> Added the optional propertied (reset, fix)
>> Added the pin names for the optional properties.
>> 
>> v2:
>> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> Moved current-speed as an optional propertie.
>> Removed the status line in the example.
>> Added "mediatek,mt3339" compatible.
>> 
>>  .../devicetree/bindings/gnss/mediatek.txt          | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> new file mode 100644
>> index 000000000000..12283d429baa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> @@ -0,0 +1,37 @@
>> +Mediatek-based GNSS Receiver DT binding
>> +
>> +Mediatek chipsets are used in GNSS-receiver modules produced by several
>> +vendors and can use a UART interface.
>> +
>> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
>> +properties.
>> +
>> +Required properties:
>> +
>> +- compatible	: Must be
>> +
>> +			"globaltop,pa6h"
>> +
>> +- vcc-supply	: Main voltage regulator (pin name: VCC)
>> +
>> +Optional properties:
>> +
>> +- current-speed		: Default UART baud rate
>> +- gnss-fix-gpios	: GPIO used to determine device position fix state
>> +			  (pin name: FIX, 3D_FIX)
>> +- reset-gpios		: GPIO used to reset the device
>> +  		  	  (pin name: RESET, NRESET)
>> +- timepulse-gpios	: Time pulse GPIO (pin name: PPS1, 1PPS)
>> +- v-bckp-supply		: Backup voltage regulator
>> +  			  (pin name: VBAT, VBACKUP)
>
> As we discussed, I changed this to "vbackup-supply" (here and in the
> driver) before applying.
>
> Note that git reported some whitespace errors above too (spaces before
> tabs) that I fixed up. Not sure why checkpatch doesn't complain.
>
Oops, thanks for fixing it. I ran checkpatch again and it did not
complain. Apprently it's not checking for spaces before tabs in "txt"
files.
I'll add a step in my flow to apply the patches I create before sending
them to the list so that won't happen again ;)

> All now applied.
>
Yay ! Thanks !
Loys


> Thanks,
> Johan


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
