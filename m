Return-Path: <SRS0=06Fz=QH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7052C169C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88092218EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrzHgM1r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R8tCoaNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88092218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puULLCBldiR+bFrDvMwvgleTkAznu/LmU4W0GwhGirI=; b=MrzHgM1rnKIAv+
	3U/pgFhZLovcXWVJ6oHo5w7w4glKmj2gcC8FXPlmm58Ezo9+6n4GU8Q6EC7W7wXDiMZKhVRO7BM6Q
	i/0t2fTtrZyserlcvjfTV/r0ssE74djTQ+eWG5tvJIBPBOOT6LUFqH5oiClJrJvgz+tfAJRAU/kuE
	yFR7H71dJLBFbONknfbKalwPiVzZuGfdbpyAV+cJ+5W7J0LnGLkIR6owKR+S+ob8+UrbsrEae5S50
	c4lOVutkc73foDEsvczlaX+8XdFO5WGl1kllRxP6A4ObXc70gFU2yUBmU+b3Ul3flNZbqvmACQYLc
	cWuCfvuJoRY8HzUcRxmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpFW8-00060X-DQ; Thu, 31 Jan 2019 16:48:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpFW5-0005ze-2X
 for linux-amlogic@lists.infradead.org; Thu, 31 Jan 2019 16:48:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id x10so4064683wrs.8
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Jan 2019 08:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=w6FVcV3nFK2dlvJ3W01cGC+s0mLeqhU73MKDw/PbrDQ=;
 b=R8tCoaNaEqJlGEUK2sMKEwXnw1Hp/uxgb/2CCh/dMgM7L0JfarUyS1359PnhrXwRzp
 1PsxPbRlcXbf4A8rtg0KKo5HzptkKPn50q3ferNNX5doGsWlQFcSD1RJ7UNjNRbDoHJb
 C/wfKML90yShH8ToUFsWlTWgi97XGqsZ3TgUzxJNJgLlBHmS3hu/xwwHs1SHfN1ory8Z
 V6Jq73YbdF0LCU9xYwREXb9c6O6jZQOTCV+ytw6Ls4TrOgc+8JSKv30A69iPZNlwBdHG
 58SbaF6J7FK5GOEfrAoolBOOlkzhgUu2GESQLugDYb33hbGN48EdFgjvGPGUBdtl213+
 PXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=w6FVcV3nFK2dlvJ3W01cGC+s0mLeqhU73MKDw/PbrDQ=;
 b=D6q1ttqMCv5sXAcTfn3jA1BIcbi7pRQ0Sfdyq2+Fc7Q6lhAQhO42YLTakVxFIa3u+1
 wUrX+SZogifP4uMNRI868jXfq5VFYGPJvEsLG82BcY55M7h4wYKarWbXyCNQo4D2t3kX
 TKK45BeOk6yX6+lDxWxHxQxRhoOjulC1qPoGK+LQE6pr5N5iXIUilzgbZJ2R1VIyxE3Y
 1XHRd2nVCzpXL8nFSQk5jr6qznDN/tk4HbUze2H/ZW1rMEylne1UbD//TMcn6blzaE+E
 U1ixalUgAAJzl/Zq+o8D90stGMu09UkdTnWXzAGFhyFIsTaEwAKOQusFdb1ILKbXAXhR
 TyXQ==
X-Gm-Message-State: AJcUukdlM39PnHNSy4xEssenbwkuWcs8+Q4kVIkyl3vGZghrM23NvqMQ
 RwcNakCcdQshOlGrc50HtaqNCQ==
X-Google-Smtp-Source: ALg8bN5KZu9Unk/gMbjGpk2J3Tm9U+D5nyRtA8d/1on2RpmNFFcpzoGzVFEzamN1x3cmga3WWEvxhQ==
X-Received: by 2002:adf:d243:: with SMTP id o3mr36351558wri.66.1548953319074; 
 Thu, 31 Jan 2019 08:48:39 -0800 (PST)
Received: from localhost (aputeaux-684-1-8-223.w90-86.abo.wanadoo.fr.
 [90.86.125.223])
 by smtp.googlemail.com with ESMTPSA id g188sm6229880wmf.32.2019.01.31.08.48.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Jan 2019 08:48:38 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add g12a x96 max board
In-Reply-To: <4d1ae3a6-874a-f032-a873-a715a67a3992@baylibre.com>
References: <20181219233519.35287-1-khilman@baylibre.com>
 <20181219233519.35287-2-khilman@baylibre.com>
 <4d1ae3a6-874a-f032-a873-a715a67a3992@baylibre.com>
Date: Thu, 31 Jan 2019 17:48:37 +0100
Message-ID: <7h36p8hixm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_084841_114435_07115069 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kevin,
>
> On 20/12/2018 00:35, Kevin Hilman wrote:
>> Add the G12a (S905X2) based X96 Max board[1].
>> 
>> There is no branding for the manufacturer anywhere on the product, so it
>> took some digging to find the manufacturer.  But since there's nothing
>> about the maker on the product I've left it out of the DT name because
>> 1) nobody will know that name and 2) keeps the DT filename shorter.
>> 
>> [1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
>> 
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
>
> Just found out you forgot to update the Makefile !!

D'oh, fixing for v3.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
