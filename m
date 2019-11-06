Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE5C5DF64
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:36:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B390B217D7
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7rtNk6a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q9IIk3N0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B390B217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nON7sn9h+fl/80NLDZfwXIsKLqCYrxk5Btd3xGobRus=; b=b7rtNk6aYQqQig
	ziqVWjkG47+hpri7RlXT+YdJjl4YrIbnapmO0AISbAkdOsqOkIuQlVkPuhPe5H4fAnUXc+sjXjbXi
	4j78/pOrUC1sjRXlpgC48187zAQ2L4T0gMO8lHzJU6s+IoGC+3yHtrnLi74htGHdXILrTj2g2i/pa
	z5mTYdWKid7QA/MQQ7iX0NAX+j2uMnP7qWnTanr0IDDIxYKjWFWNXOwJd27YqFi8Ya6vsbTYl+aA8
	YHymRmRMrIMkVa+qMBwfC71CGV4aOl4i4B2cnm057der6i9wPMXtfZeJZBbsYPADhAqtA90wCQUHU
	NxILdxVIETIa4B4G4wKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSR5v-0002Je-Qj; Wed, 06 Nov 2019 19:35:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSR5t-00026Q-08
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 19:35:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so27445777wrf.9
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 11:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Svt0Prn9o6q9bRi2+Z71xLOP8eaZ+QBmItrF2aM0ga4=;
 b=q9IIk3N0mImL9Zq2/ZsglmYzRHe8LvSH4HOm2W+RTudvjNo5s5lAxnFr5bmJSNSw27
 Qw3oITHHNNjuSyYlXtyhNuzi75kFzY+upd6DMsEDo/jzMXzhf3EEDNelH3Fdi2cYhDky
 fRwv7kxmZrslp1sKm75QW/F8HM1WlNCid38gtm3uUiGtZLND5VsrEu3pzVtZQMgqbTBR
 mOyiZcWxhwz/98a3C2Mal9trGeroRzY5pqlHvOyJ+6YewtI7J/97G5MvL8CDEqUXgAKH
 v6ummHlWnV3CW56zPq85BsIA0hKvApNHdOGNV3NDDQT1VAYJyRyNS2nHbVSgmsFkkBek
 EfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Svt0Prn9o6q9bRi2+Z71xLOP8eaZ+QBmItrF2aM0ga4=;
 b=QRbyKAwwYCj8QSj2gWQ9N0NpoaaSBWWNq/5AhRw91IVO9YJyKcQIyS3eapwx52tTX2
 aLpNcdhOsC167x+kMiUcd2FDFA/JzXyr/3guU6L8SHmW4vTjhPdpM5vGcVQBK4lMhnll
 KSd2vSNpepJLvyT9yPOEZ+gNEdL5gA54E+OBFF/Aw2ZRIdp5I4vcHQYLrwmE4vnlK8S4
 6hMSEAJUMUtZAMhP+bdBZY+eiUhbFVsgzaMcQXdTxzaG1/C1fe5vWZ05YGE1rdc35Nnl
 5F/UgYNHYZNVDwqrUk6KK89p2ZAXvhvpNlZiqZsI2wyLJlU5VMA8BKSPkUMBGOhRNP7l
 7pbA==
X-Gm-Message-State: APjAAAWdtF6/XNZmepePIsyN/XkIzjK4GUInqdZaIQNdwi7c8opiePEy
 jPRfSWYxi1PqwJsP0jka6L0l8w==
X-Google-Smtp-Source: APXvYqz6zkvJvFecNHz0gOcK2N6VovMdJvan9hQM6kndetNbNVDayZPMavQNRQqFjByWobWfaToSrQ==
X-Received: by 2002:adf:97dd:: with SMTP id t29mr4070073wrb.283.1573068950319; 
 Wed, 06 Nov 2019 11:35:50 -0800 (PST)
Received: from localhost (amontpellier-652-1-71-119.w109-210.abo.wanadoo.fr.
 [109.210.54.119])
 by smtp.gmail.com with ESMTPSA id w13sm30928713wrm.8.2019.11.06.11.35.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 11:35:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: khadas-vim3: move audio nodes to
 common dtsi
In-Reply-To: <7h4kzg7rev.fsf@baylibre.com>
References: <1571416185-6449-1-git-send-email-christianshewitt@gmail.com>
 <7h4kzg7rev.fsf@baylibre.com>
Date: Wed, 06 Nov 2019 20:35:48 +0100
Message-ID: <7hk18c6bmz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_113553_060349_93DC383C 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Christian Hewitt <christianshewitt@gmail.com> writes:
>
>> Move VIM3 audio nodes to meson-khadas-vim3.dtsi to enable audio for all
>> boards in the VIM3 family including VIM3L.
>>
>> This change depends on [1] being merged/applied first.
>>
>> [1] https://patchwork.kernel.org/patch/11198535/
>>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>
> Queued for v5.5, but...
>
>> -&frddr_a {
>> -        status = "okay";
>> -};
>
> This node doesn't exist upstream...

oops, nevermind.  I see it's not upstream because it's still in my fixes
branch.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
