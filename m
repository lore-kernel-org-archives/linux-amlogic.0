Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59495C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 15:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297102082B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 15:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkMK2I07";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HU70lnAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 297102082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pl8yIvXFjGMKnhx70NgwTNpCl1rwlRcqVKYJ2V6F9gI=; b=LkMK2I07bNjyHC
	lenkbpA1TJvM4q+l4B7TqWn9iME99fgFnP6nMn+R3QfAFCmMKN1ckMt0Bi+vhtZLFZzaYZKGiYA9g
	Bt6O2W5sVs+hq+EGa5F6qXmwvoYz5GBwFyFciproUOfmlJqwOyN7SQ9OxbVk+ltfTim8jJND7mfbE
	17ocksn1Toth9h/ZWKl7tvh/YWGkI2flUG/0VnkkJUd+5Q/9W2oWghAU9UJPm1QZB8+//5gW00geO
	iq9ap7Ydyj2ZPO/RqlIUqV+9PC4pLrK4GaZguU5TUlhcJrPBADh2F0JTLPVh5J+fi8VmXPuxJ01ae
	Ixdm2UDcKHUlKVqUcJMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUCC5-00015U-Vv; Tue, 04 Dec 2018 15:01:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUCC1-00010y-Nk
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 15:00:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id m22so9677499wml.3
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=FBLaADd8sswfEpin3P/Oq4cisopQsoVq5TfE3mJptgI=;
 b=HU70lnADugz4Kg/Z5h/C16ianYDHjOv6oG55ivmjxZd+k74qQkxxVos37qCJEgYZ8o
 5qzOmBvioE8pMV1z7171XnKbkCzsqIsfGNEbyq3NBI7LaLU4X5lv9VHEXPU246eGZ+gE
 g29BYtvhUhrq0hMBp4uaQ7kSidT+WhFwcmzG2sFwvF+2isw2uzDAADfad5xC0P4NesJ8
 EPJ+KHT5fM5AblBU3VN7ouxfBqEW/OYKMFS0LNtRbF4EeAJb2YzhvVxqX1yGmej7Zy+f
 Mt8L9w7SNz3ocL8frXL/PsitQ+XUfSQGue+mBp7OFh3uEVHdzeBWyW+brDodzrnfHF81
 zP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=FBLaADd8sswfEpin3P/Oq4cisopQsoVq5TfE3mJptgI=;
 b=E4Ec2JVsm+9tCGIhcmia68EDrnKlCdKsYOQKD693cUJMRyNEUNLTeEIm+SEL+R3eMJ
 4pBj0u7t9ZoEcQDv6kgIzyW/2TUWi4AILK6fHyrCZ6rxRIdIj2qcuRGZkS0Wof9c8whf
 cBIpwJ+G+lYToWUUg/xmY9kNseW+LeEDxBdJb6/CZ7OrLjxngFD/srJomCQV5Ss2cF8N
 FP7Au8pTqOLupZ0Kgt8SZPJGlYDFTV3o6WWfeIPqTxx7TRoTgovzFczhYOqBjJRxrOu1
 Hz2dszMiIszgtJC5DGx7KVu1K8/P+LICTshORVic4BJnFL0V+ZUQ65MjVd9JgucGvc4/
 fdwQ==
X-Gm-Message-State: AA+aEWb+ymzYMoOu9Laouu1rFZZUhfREEig5wx+aJ+/YqQkrrdeHui/f
 kVmfBQv7QFeZCAugbZN6jPpLWQ==
X-Google-Smtp-Source: AFSGD/VNr542c3cIjBtxQYiqT6fdD+9tHilEe7kPUaw8xwWAmdyI6wMjHBRLTpDd8c3mD9nrPDBALw==
X-Received: by 2002:a7b:c04e:: with SMTP id u14mr12193068wmc.113.1543935645511; 
 Tue, 04 Dec 2018 07:00:45 -0800 (PST)
Received: from broadband.bt.com ([2a00:23c4:f7a1:ce00:1581:6f5a:196:51f2])
 by smtp.gmail.com with ESMTPSA id b131sm13216791wma.21.2018.12.04.07.00.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 07:00:44 -0800 (PST)
Message-ID: <eaf25e588c5ab78c607e7168e22871464e7ec8d7.camel@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from the list
From: Carlo Caione <ccaione@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Date: Tue, 04 Dec 2018 15:00:43 +0000
In-Reply-To: <928e27de-cb7b-cf40-b8b6-2aa43a69ee39@baylibre.com>
References: <20181201151749.10932-1-ccaione@baylibre.com>
 <928e27de-cb7b-cf40-b8b6-2aa43a69ee39@baylibre.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_070057_907219_BACD155E 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2018-12-03 at 11:21 +0100, Neil Armstrong wrote:
> On 01/12/2018 16:17, Carlo Caione wrote:
> > Kevin is basically doing all the work. Remove my name as co-
> > maintainer.
> 
> Sure, but couldn't we move you as reviewer and add Martin as reviewer
> aswell since he is dedicated to the Meson8X support ?
> 
> Or maybe add a separate entry with Kevin as maintainer and Martin as
> reviewer for Meson8X ?

This. At this point I don't think I will be going to work on the
Meson8X for a while and Martin proved to be the right guy for this job.

So, let's remove my name from here first and then Martin can add a new
entry for Meson8X.

Cheers,

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
