Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB57EC10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:36:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757FA2075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wfg1roDa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0mvzOnol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757FA2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dr7JqBNtwkUTqDU4bcsJ5DNMiQ43WFLTbWp66UF+Nw=; b=Wfg1roDamHfuE1
	JEHzi5pXv0y6h5kCBlBYR2RN3JdVaKjIxcmAl780iu+YZnOaQ8EWMu73dbFhW/Q1HE7m+EfpNbonT
	7zbkxWO+sPb60QJoz9yFmHf8sW520/Lz4nbWQ1Lg6+wEPstV7pgkPj4OL1VmrP2T6EfftS4n7pMOB
	MFneozdmbixgj0Z3VZQ2CtZ477dQmerA66H71XKW1zuVgjQZf/ivTfToX/sDlOmWmHYW6UG5wZ02w
	zKDmmpqOWvqYNAYQOl10yM6MrAugKrJhjZaYp8AWtMNnI1RHtk6snosr8pl+hG8WcUFzAsOvtZM45
	8mHxLtEzsgluYSv3sVrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGC4z-0008W5-Kg; Tue, 16 Apr 2019 00:36:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGC4w-0008VD-5d
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 00:36:03 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so9385053pll.13
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2019 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9LW9oDrDOfSGvpoZkKI/VkDuSjYcw4ys+z/+hdQ51C8=;
 b=0mvzOnol21+zhT0xk/DTynqIzdztHdwdoeBgmCTwIYNHprOhVkodmPGDrncEFr/V1l
 PaK8jnk1mfpjpFIHCbsik5pmoWuhzbMeAJMDtZt93R+Yj/Zz7IxToxjzSKticXyPmAcs
 jiG4WUiSvbz1jZjh4hEpGUvWwJnfOTL+oCz/NHFKEz9Viy0R7xJ1gGOccRH7wbmxZ6Bl
 hMaC9U7ZhET9KyaNTWumBmZb6HzxowREv1h+wNX6TEtxiW4MM/WAh7O6Nqlea+WYgJAh
 442z3K9ihjLt/BjmW57fwCeeTk+wZCYzQfbotH3264Zu0GH2ux/56l9l8XfTsmnnoTz9
 lZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9LW9oDrDOfSGvpoZkKI/VkDuSjYcw4ys+z/+hdQ51C8=;
 b=oW5c1JHs3n/EZ7OtOK39jgkMHpTdriv2j6t3uqUHkSF6idU/SdiwWaNCuccGWt9N7w
 QEl4P1EWecWTADrC4it4zWrdO4/XWxQCs+idqe9sbpMtHU2RDULuZAD35sF3SZQcpO3P
 ecB/g2r+NMMMm3/E+Ex5r0xKhbDHxtiQVPQPjTw2lsUv4//wzBrJ8lS9uCaBpwLJnQ10
 o02iKt4tpji5twbCFYy0TqgIFNkiHg9e68PNXYyf/wQ/aZrzr0+DgaAbtaEuKWjrqTlI
 p+IVZZlFXLEi4yUWw5NxPNfSBFIDUtCwUOcE/beqJpSKt0KdpJ9r3HpThZnQKslMzMXF
 wBaA==
X-Gm-Message-State: APjAAAW2fi+3bq53cf+GD7v7nqejXHWozI41C/ilcVg/i78EoDMXO91J
 eF80H6V4eLNRl4SNw+Tn7NV324C7Bd0=
X-Google-Smtp-Source: APXvYqz3RdrNaXl2jYx0J9GwKjwfWro/psp6vqDuoyxppC7ziOaydkZO/trrVZQVNSbcX589892JkQ==
X-Received: by 2002:a17:902:e391:: with SMTP id
 ch17mr80473920plb.196.1555374960387; 
 Mon, 15 Apr 2019 17:36:00 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id h4sm44827165pgv.61.2019.04.15.17.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Apr 2019 17:35:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: g12a: Add boards peripherals
In-Reply-To: <7hmuldwghj.fsf@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
 <7hmuldwghj.fsf@baylibre.com>
Date: Mon, 15 Apr 2019 17:35:58 -0700
Message-ID: <7ha7gqrdld.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_173602_353386_DD2B3F70 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> Following [1], add regulators, bluetooth and ADC keys on :
>> - meson-g12a-x96-max
>> - meson-g12a-u200
>> - meson-g12a-sei510
>>
>> Dependencies :
>> - Patch 1, 2: None
>
> Queued for v5.2 (branch v5.2/dt64)
>
>> - Patch 3: SAR ADC node at [2]
>> - Patches 4, 5, & 6: USB nodes at [3]
>
> Looks like I can queue these as soon as there's a stable clock headers
> branch I can use.

Queued for v5.2,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
